using SuperSocket.ProtoBase;
using WaterMargin.Shared.Crypto;

namespace WaterMargin.Shared.SuperSocket
{
    public class WaterMarginKeyedPackage : IKeyedPackageInfo<int>
    {
  
        public byte[] Body {get;set;}
        public int Key {get;set;}
        public bool IsValidPacket {get;set;}
        public float PacketVersion {get;set;}
        public int LengthOfDataSection {get;set;}
        public string ClientAddress {get;set;}
        public WaterMarginKeyedPackage(byte[] incomingData, bool writeDecryptedPacketToConsole = false)
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
            this.Key = decryptedPacket[0];
            this.IsValidPacket = ChecksumHelperUtil.VerifyChecksum(decryptedPacket);
            this.Body = decryptedPacket;
            if (writeDecryptedPacketToConsole)
            {
                Console.WriteLine($"Decrypted Incoming Packet : {Utils.GetDataAsPrettyHex(this.Body)}");
            }
        }


    }

}