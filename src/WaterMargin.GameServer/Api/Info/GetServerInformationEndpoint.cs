using FastEndpoints;
using System;
using System.Collections.Generic;
using System.Text;
using WaterMargin.GameServer.Config;
using WaterMargin.GameServer.Sys;
using WaterMargin.LoginServer.Logic;

namespace WaterMargin.GameServer.Api.Info
{
    internal class GetServerInformationEndpoint : Endpoint<GetServerInformation, GameServerInformation>
    {
        private readonly ServerState _serverState;
        private readonly ServerConfiguration _serverConfiguration;

        public GetServerInformationEndpoint(ServerState serverState, ServerConfiguration serverConfiguration)
        {
            this._serverState = serverState;
            this._serverConfiguration = serverConfiguration;
        }

        public override void Configure()
        {
            Get("/api/server/info");
        }

        public override async Task HandleAsync(GetServerInformation req, CancellationToken ct)
        {
            GameServerInformation gameServerInformation = new GameServerInformation()
            {
                CurrentState = 0x01,
                ApiURI = "",
                Concurrent = (short)this._serverState.SessionCount,
                GroupId = this._serverConfiguration.GroupId,
                GroupName = this._serverConfiguration.GroupName,
                HostIpAddress = this._serverConfiguration.HostIpAddress,
                MaxLoading = this._serverConfiguration.MaxLoading,
                Port = this._serverConfiguration.Port,
                ServerId = this._serverConfiguration.ServerId,
                ServerName = this._serverConfiguration.ServerName
            };
            await Send.OkAsync(gameServerInformation);
        }
    }
}
