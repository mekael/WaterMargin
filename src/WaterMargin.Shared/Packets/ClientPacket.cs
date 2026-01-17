
using WaterMargin.Shared.Crypto;

namespace WaterMargin.Shared.Packets
{
    public class ClientPacket
    {
        public byte[] Data;
        public int PacketType;
        public bool IsValidPacket;
        public float PacketVersion;
        public int LengthOfDataSection;
        public ClientPacket(byte[] incomingData, bool writeDecryptedPacketToConsole = false)
        {
            Console.WriteLine($"Encrypted Incoming Packet : {Utils.GetDataAsPrettyHex(incomingData)}");
            if (incomingData[0] == 0xEC)
            {
                this.LengthOfDataSection = BitConverter.ToInt32(incomingData[0..4], 0) >> 8;
                this.PacketVersion = 1.5f;
            }
            else if (incomingData[0] != 0xCD)
            {
                this.LengthOfDataSection = BitConverter.ToInt32(incomingData[0..4], 0) >> 16;
                this.PacketVersion = 1.3f;
            }

            Console.WriteLine($"Length Of Incoming Packet : {this.LengthOfDataSection}");

            byte[] decryptedPacket = CryptoHelperUtil.Decrypt(incomingData[4..]);
            this.PacketType = decryptedPacket[0];
            this.IsValidPacket = ChecksumHelperUtil.VerifyChecksum(decryptedPacket);
            this.Data = decryptedPacket;
            if (writeDecryptedPacketToConsole)
            {
                Console.WriteLine($"Decrypted Incoming Packet : {Utils.GetDataAsPrettyHex(this.Data)}");
            }

        }
    }
}
