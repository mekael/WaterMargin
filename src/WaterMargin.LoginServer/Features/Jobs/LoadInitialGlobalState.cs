using Coravel.Invocable;
using Microsoft.Extensions.Logging;
using WaterMargin.LoginServer.Config;
using WaterMargin.LoginServer.Sys;

namespace WaterMargin.LoginServer.Features.Jobs
{
    internal class LoadInitialGlobalStateHandler : IInvocable
    {

        private readonly ILogger<LoadInitialGlobalStateHandler> _logger;
        private readonly GlobalLoginServerState _globalLoginServerState;
        private readonly LoginServerConfiguration _loginServerConfiguration;
        public LoadInitialGlobalStateHandler(ILogger<LoadInitialGlobalStateHandler> logger,
             GlobalLoginServerState globalLoginServerState, LoginServerConfiguration loginServerConfiguration)
        {
            this._logger = logger;
            this._globalLoginServerState = globalLoginServerState;
            this._loginServerConfiguration = loginServerConfiguration;
        }


        public Task Invoke()
        {

            // 



            throw new NotImplementedException();
        }
    }
}
