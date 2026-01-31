using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.LoginServer.Api.Player.Info
{
    public class GetPlayerInformationResult
    {
        public Guid UserId { get; set; }
        public int Nonce { get; set; }
        public string DisplayName { get; set; }
        public DateTime AccountCreationDate { get; set; }
        public DateTime LastLoginTimestamp { get; set; }
        public DateTime? LastLogoutTimestamp { get; set; }
        public long TotalOnlineTime { get; set;  }
        public DateTime? BanDate { get; set;  } 
    }
}
