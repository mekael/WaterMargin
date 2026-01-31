using SuperSocket.Server;

namespace WaterMargin.GameServer.SuperSocket
{
    public class WaterMarginPlayerSession : AppSession
    {
        public Guid PlayerId { get;set;  }
        public int Nonce { get; set;  }
        public string Username { get; set;  }

    }
}
