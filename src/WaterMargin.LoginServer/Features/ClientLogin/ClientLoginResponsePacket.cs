using WaterMargin.LoginServer.Logic;
using WaterMargin.LoginServer.Utilities;
using WaterMargin.Shared;
using WaterMargin.Shared.Packets;

namespace WaterMargin.LoginServer.Features.ClientLogin
{
    public class ClientLoginResponsePacket
    {
        public bool IsValidPacket { get; set; }
        public int SessionId { get; set; } = -1;
        public List<GameServerInformation> Servers { get; set; }

        public static ClientLoginResponsePacket GetDefaultInvalidPacket()
        {
            return new ClientLoginResponsePacket(-1, null);
        }

        public ClientLoginResponsePacket() { }

        public ClientLoginResponsePacket(int sessionId, List<GameServerInformation> servers)
        {
            this.SessionId = sessionId;
            this.Servers = servers;
            this.IsValidPacket = sessionId != -1 && servers != null;
        }

        public void Update(int sessionId, List<GameServerInformation> servers)
        {
            this.SessionId = sessionId;
            this.Servers = servers;
            this.IsValidPacket = this.SessionId != -1 && this.Servers != null;
        }

        public byte[] BuildPacket()
        {
            var packet = new byte[80000];
            var offset = 0;

            PacketBitWriter packetBitWriter = new PacketBitWriter(packet, ref offset);
            packetBitWriter.WriteByte(0x01);
            packetBitWriter.WriteInt32(this.SessionId);
            if (this.IsValidPacket)
            {
                packetBitWriter.WriteInt32(this.Servers.Count);
                foreach (var server in this.Servers)
                {
                    packetBitWriter.WriteByte(0x07);// number of fields being sent
                    packetBitWriter.WriteByte(0x00);
                    packetBitWriter.WriteNullTerminatedString2(server.ServerName);
                    packetBitWriter.WriteByte(0x01);
                    packetBitWriter.WriteNullTerminatedString2(server.GroupName);
                    packetBitWriter.WriteByte(0x02);
                    packetBitWriter.WriteInt32(IPAddressUtil.Loopback);
                    packetBitWriter.WriteByte(0x03);
                    packetBitWriter.WriteInt16(server.Port);
                    packetBitWriter.WriteByte(0x04);
                    packetBitWriter.WriteInt16(server.Concurrent);
                    packetBitWriter.WriteByte(0x05);
                    packetBitWriter.WriteInt16(server.MaxLoading);
                    packetBitWriter.WriteByte(0x01);
                    packetBitWriter.WriteByte(0x02);
                }
            }
            // We don't encrypt the packet here as we 
            return ChecksumHelperUtil.AppendChecksum(packetBitWriter.GetData());
        }
    }
}