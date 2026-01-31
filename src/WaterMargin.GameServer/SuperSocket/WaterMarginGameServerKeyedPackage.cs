using SuperSocket.ProtoBase;

namespace WaterMargin.GameServer.SuperSocket
{
    public class WaterMarginGameServerKeyedPackage : IKeyedPackageInfo<int>
    {

        public int Channel { get; set;  }
        public int Key { get; set; } // command type
        public int AckResponse { get; set; }
        public byte[] Payload { get; set; }
        public ulong SequenceNumber { get; set; }
        public uint Timestamp { get; set; }
        public uint PayloadLength { get; set; }

    }
}