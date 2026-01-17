namespace WaterMargin.Shared.Packets
{
    public class PacketReader : BinaryReader
    {
        public PacketReader(byte[] data) : base(new MemoryStream(data)) { }

        public PacketReader(Stream input) : base(input) { }

        public string ReadNullTerminatedString()
        {
            string retString = "";

            while (true)
            {
                char currentChar = this.ReadChar();
                if (currentChar == 0x00)
                {
                    break;
                }
                retString += currentChar;
            }
            return retString;   
        }
    }
}