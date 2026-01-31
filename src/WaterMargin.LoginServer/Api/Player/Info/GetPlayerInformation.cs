using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.LoginServer.Api.Player.Info
{
    internal class GetPlayerInformation
    {
        public string UserName { get; set;  }
        public int Nonce { get; set;  }
        public string GroupId { get;set;  }
        public string SessionId { get; set;  }
    }
}
