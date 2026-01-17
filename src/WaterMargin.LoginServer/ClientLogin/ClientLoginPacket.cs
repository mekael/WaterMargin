using WaterMargin.Shared.Packets;
using WaterMargin.Shared.SuperSocket;

namespace WaterMargin.LoginServer.Logic.ClientLogin
{
    public class ClientLoginPacket
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool ValidPacket { get; set; }
        public string ClientIpAddress { get; set; }
        public ClientLoginPacket(ClientPacket clientPacket, string clientIpAddress)
        {
            this.ClientIpAddress = clientIpAddress;
            PacketReader packetReader = new PacketReader(clientPacket.Data);
            packetReader.ReadByte(); // ignore the first byte as it is the packet type
            this.Username = packetReader.ReadNullTerminatedString();
            this.Password = packetReader.ReadNullTerminatedString();
            packetReader.Dispose();

            this.ValidPacket = !string.IsNullOrWhiteSpace(this.Username) && !string.IsNullOrWhiteSpace(this.Password);
        }

        public ClientLoginPacket(WaterMarginKeyedPackage clientPacket, string clientIpAddress)
        {
            this.ClientIpAddress = clientIpAddress;
            PacketReader packetReader = new PacketReader(clientPacket.Body);
            packetReader.ReadByte(); // ignore the first byte as it is the packet type
            this.Username = packetReader.ReadNullTerminatedString();
            this.Password = packetReader.ReadNullTerminatedString();
            packetReader.Dispose();

            this.ValidPacket = !string.IsNullOrWhiteSpace(this.Username) && !string.IsNullOrWhiteSpace(this.Password);
        }

    }
}
