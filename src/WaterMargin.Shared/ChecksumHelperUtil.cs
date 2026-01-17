namespace WaterMargin.Shared
{

    public static class ChecksumHelperUtil
    {
        private const int InitialValueSigned = -0x54325433;  

        public static uint Calculate(byte[] data)
        {
            if (data == null || data.Length < 3)
                return 0;

            uint dataLength = (uint)data.Length;
            uint index = 0;
            int checksum = InitialValueSigned; 

            if (dataLength > 0)
            {
                do
                {
                    if (index > 0x1f) 
                        break;

                    sbyte signedByte = (sbyte)data[index];
                    int shift = (int)(index & 0x1f);
                    checksum = checksum + (signedByte << shift);
                    index++;
                } while (index < dataLength);
            }

            return (uint)checksum;
        }

        public static bool VerifyChecksum(byte[] data)
        {
            if (data == null || data.Length < 4)
                return false;

            byte[] payload = new byte[data.Length - 4];
            Buffer.BlockCopy(data, 0, payload, 0, payload.Length);

            uint storedChecksum = BitConverter.ToUInt32(data, data.Length - 4);
            uint calculatedChecksum = Calculate(payload);

            return storedChecksum == calculatedChecksum;
        }


        public static byte[] AppendChecksum(byte[] data)
        {
            if (data == null)
                throw new ArgumentNullException(nameof(data));

            uint checksum = Calculate(data);
            byte[] result = new byte[data.Length + 4];

            Buffer.BlockCopy(data, 0, result, 0, data.Length);

            result[data.Length] = (byte)(checksum & 0xFF);
            result[data.Length + 1] = (byte)((checksum >> 8) & 0xFF);
            result[data.Length + 2] = (byte)((checksum >> 16) & 0xFF);
            result[data.Length + 3] = (byte)((checksum >> 24) & 0xFF);

            return result;
        }

    }
}