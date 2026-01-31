using Coravel;
using FastEndpoints;
using FastEndpoints.Swagger;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Serilog;
using Serilog.Filters;
using SuperSocket.Command;
using SuperSocket.Server;
using SuperSocket.Server.Abstractions.Session;
using SuperSocket.Server.Host;
using WaterMargin.GameServer.Config;
using WaterMargin.GameServer.Data;
using WaterMargin.GameServer.Features.AccountArchive;
using WaterMargin.GameServer.SuperSocket;
using WaterMargin.GameServer.Sys;


var builder = WebApplication.CreateBuilder(args);

var loggerConfig = new LoggerConfiguration();

loggerConfig.WriteTo.Console();

loggerConfig.Filter.ByExcluding(Matching.FromSource("Microsoft.EntityFrameworkCore.Database.Command"));

if (builder.Configuration.GetValue<bool>("LogToDisk"))
{
    loggerConfig.WriteTo.File("./logs/GameServer.log", rollOnFileSizeLimit: true, rollingInterval: RollingInterval.Day);
}


builder.Host.AsSuperSocketHostBuilder<WaterMarginGameServerKeyedPackage, WaterMarginGameServerKeyedPipelineFilter>()
    .UseCommand(commands => {
        commands.AddCommand<GetAccountArchiveHandler>();
    })
    .UsePackageDecoder<WaterMarginGameServerKeyedPackageDecoder>()
    .UseInProcSessionContainer()
    .AsMinimalApiHostBuilder()
    .ConfigureHostBuilder();

builder.Host.UseSerilog();
builder.Host.ConfigureServices((hostContext, services) =>
{
    //string connectionString = hostContext.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found."); ;
    //services.AddDbContext<GameServerDbContext>(options => options.UseSqlite(connectionString));


    var serverConfiguration = hostContext.Configuration.GetSection("ServerConfiguration").Get<ServerConfiguration>();
    services.AddSingleton<ServerConfiguration>(serverConfiguration);
    services.AddSingleton<ServerState>();

    services.AddLogging();
    services.AddSerilog();
    services.AddFastEndpoints().SwaggerDocument();



});



var app = builder.Build();
/*app.Services.UseScheduler(
    scheduler =>
    {
        
    });
*/
app.MapGet("api/session", ([FromServices] ISessionContainer sessions) => Microsoft.AspNetCore.Http.Results.Json(sessions.GetSessions()));
app.UseFastEndpoints().UseSwaggerGen();
await app.RunAsync();