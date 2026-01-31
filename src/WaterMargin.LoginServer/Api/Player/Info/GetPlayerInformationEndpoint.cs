using FastEndpoints;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.Build.Framework;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;
using WaterMargin.Auth.Data;
using WaterMargin.LoginServer.Logic;
using WaterMargin.LoginServer.Sys;

namespace WaterMargin.LoginServer.Api.Player.Info
{
    internal class GetPlayerInformationEndpoint : Endpoint<GetPlayerInformation, GetPlayerInformationResult>
    {
        private readonly ILogger<GetPlayerInformationEndpoint> _logger;
        private readonly GlobalLoginServerState _globalLoginServerState;
        private readonly AuthDbContext _authDbContext;


        public GetPlayerInformationEndpoint(ILogger<GetPlayerInformationEndpoint> logger, GlobalLoginServerState globalLoginServerState,
             AuthDbContext authDbContext)
        {
            this._globalLoginServerState = globalLoginServerState;
            this._logger = logger;
            this._authDbContext = authDbContext;
        }
        public override void Configure()
        {
            Get("/api/player/info");
        }

        public override async Task HandleAsync(GetPlayerInformation req, CancellationToken ct)
        {

            if (string.IsNullOrWhiteSpace(req.UserName) || req.Nonce < 1)
            {
                await Send.StatusCodeAsync(400);
            }


            this._globalLoginServerState.AuthorizedSessions.TryGetValue(req.Nonce, out var session);
            if (session == null) 
            {
                await Send.NotFoundAsync();
            }

            GetPlayerInformationResult getPlayerInformationResult = new GetPlayerInformationResult()
            {
                 AccountCreationDate = session.ApplicationUser.CreationTimestamp, 
                  LastLoginTimestamp = session.LoginTimestamp,
                   BanDate = session.ApplicationUser.BanEndDate,
                    DisplayName = session.ApplicationUser.DisplayName,
                      Nonce = session.Nonce,
                       UserId = session.ApplicationUserId,
            };



        }
    }
}
