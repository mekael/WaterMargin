using Microsoft.Extensions.Hosting;
using SuperSocket.Server.Host;
using Microsoft.Extensions.Logging;
using SuperSocket.Server.Abstractions.Host;
using SuperSocket.Server;
using SuperSocket.Command;
using WaterMargin.Shared.SuperSocket;
using WaterMargin.LoginServer.Logic.ClientLogin;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using WaterMargin.LoginServer.Data;
using Microsoft.Extensions.Configuration;
using WaterMargin.LoginServer.Data.Models;
using WaterMargin.LoginServer.Logic.Network;
using Microsoft.AspNetCore.Identity;


ISuperSocketHostBuilder<WaterMarginKeyedPackage> builder = SuperSocketHostBuilder.Create<WaterMarginKeyedPackage, WaterMarginKeyedPipelineFilter>();
builder.UseCommand(commands =>
{
    commands.AddCommand<ClientLoginHandler>();
});
builder.UsePackageDecoder<WaterMarginKeyedPackageDecoder>();
builder.ConfigureLogging((hostCtx, loggingBuilder) =>
{
    loggingBuilder.AddConsole();
});

 
builder.ConfigureServices( (hostContext, services)=>
{
    string connectionString = hostContext.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");;
    services.AddDbContext<AuthDbContext>(options => options.UseSqlite(connectionString));
    services.AddIdentityCore<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = true) 
    .AddEntityFrameworkStores<AuthDbContext>() ;
    services.AddSingleton<GlobalLoginServerState>();
    services.AddTransient<PasswordHasher<ApplicationUser>>();

});





IHost host = builder.Build();

await host.RunAsync();
