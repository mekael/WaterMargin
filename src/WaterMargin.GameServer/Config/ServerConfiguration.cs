
namespace WaterMargin.GameServer.Config
{
    public class ServerConfiguration
    {
        byte[] DefaultKey = new byte[] { 0x01, 0x03, 0x05, 0x07, 0x09, 0x0B, 0x0D, 0x0F, 0x02, 0x04, 0x06, 0x08, 0x0A, 0x0C, 0x0E, 0x10 };

        public string GroupId { get; set; }
        public string ServerId { get; set; }
        public string GroupName { get; set; }
        public string ServerName { get; set; }
        public string HostIpAddress { get; set; }
        public short Port { get; set; }
        public short MaxLoading { get; set; }

        public bool WriteDecryptedPacketsToConsole { get; set;  }

    }
}
