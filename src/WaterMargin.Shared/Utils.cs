
namespace WaterMargin.Shared
{
    public class Utils
    {
        public static byte[] AddHeader(byte[] data,  byte headerVal = 0xEC)
        {
            byte[] header = BitConverter.GetBytes(((uint)data.Length << 8) | headerVal);
            byte[] result = new byte[data.Length + 4];
            Array.Copy(header, 0, result, 0, 4);
            Array.Copy(data, 0, result, 4, data.Length);
            return result;
        }

        public static string GetDataAsPrettyHex(byte[] data)
        {
            return string.Join(" ", data.Select(s => $"0x{s:X2}" ));
        }
    }
}
