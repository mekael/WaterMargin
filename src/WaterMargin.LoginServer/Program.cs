
using Coravel;
using FastEndpoints;
using FastEndpoints.Swagger;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Serilog;
using Serilog.Filters;
using SuperSocket.Command;
using SuperSocket.Server;
using SuperSocket.Server.Abstractions.Session;
using SuperSocket.Server.Host;
using WaterMargin.Auth.Data;
using WaterMargin.Auth.Data.Models;
using WaterMargin.LoginServer.Features.ClientLogin;
using WaterMargin.LoginServer.Sys;
using WaterMargin.Shared.SuperSocket;


var builder = WebApplication.CreateBuilder(args);

var loggerConfig = new LoggerConfiguration();

loggerConfig.WriteTo.Console();

loggerConfig.Filter.ByExcluding(Matching.FromSource("Microsoft.EntityFrameworkCore.Database.Command"));

if (builder.Configuration.GetValue<bool>("LogToDisk"))
{
    loggerConfig.WriteTo.File("./logs/GameServer.log", rollOnFileSizeLimit: true, rollingInterval: RollingInterval.Day);
}


builder.Host.AsSuperSocketHostBuilder<WaterMarginKeyedPackage, WaterMarginKeyedPipelineFilter>()
    .UseCommand(commands =>
    {
        commands.AddCommand<ClientLoginHandler>();
    })
    .UsePackageDecoder<WaterMarginKeyedPackageDecoder>()
    .UseInProcSessionContainer()
    .AsMinimalApiHostBuilder()
    .ConfigureHostBuilder();
builder.Logging.AddSerilog();
builder.Host.UseSerilog();
builder.Host.ConfigureServices((hostContext, services) =>
{
    string connectionString = hostContext.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found."); ;
    services.AddDbContext<AuthDbContext>(options => options.UseSqlite(connectionString));
    services.AddIdentityCore<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<AuthDbContext>();

    GlobalLoginServerState globalLoginServerState = new GlobalLoginServerState()
    {
        GameServers = new List<WaterMargin.LoginServer.Logic.GameServerInformation>()
         {
              new WaterMargin.LoginServer.Logic.GameServerInformation()
              {
                    HostIpAddress ="localhost",
                    Port = 4321,
                    Concurrent =100,
                    CurrentState = 0x01,
                    GroupId = Guid.NewGuid().ToString(),
                    ServerId = Guid.NewGuid().ToString(),
                    GroupName = "Classic",
                    ServerName ="Classic-GS1",
                    MaxLoading = 1000
              }
         }
    };
    services.AddSingleton<GlobalLoginServerState>(globalLoginServerState);
    services.AddTransient<PasswordHasher<ApplicationUser>>();
    services.AddFastEndpoints(opts => { });
});



var app = builder.Build();
/*
app.Services.UseScheduler(
    scheduler =>
    {

    });

*/
app.UseFastEndpoints().UseSwaggerGen();
await app.RunAsync();

