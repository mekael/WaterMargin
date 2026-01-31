using FastEndpoints;
using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.LoginServer.Api.Player.Logout
{
    internal class LogoutPlayerEndpoint : Endpoint<LogoutPlayer, LogoutPlayerResult>
    {
        public override void Configure()
        {
            Post("/api/player/logout");
        }

        public override Task HandleAsync(LogoutPlayer req, CancellationToken ct)
        {
            return base.HandleAsync(req, ct);
        }
    }
}
