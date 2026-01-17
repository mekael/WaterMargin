
using System.Text;

namespace WaterMargin.Shared.Crypto
{
    // This class is depressingly AI generated based off of the reverse engineered code from ghidra. 
    // I don't like myself for using it, but i'm not clever enough to do it myself. 

    /// <summary>
    /// Hero108 TEA (Tiny Encryption Algorithm) implementation.
    /// 
    /// The game uses a modified TEA cipher with:
    /// - Delta constant: 0x9E3779B9 (golden ratio)
    /// - Variable rounds: 2^((size & 3) + 1) = 2, 4, 8, or 16 rounds
    /// - 128-bit key (4 x 32-bit words)
    /// - 64-bit block size (8 bytes)
    /// </summary>
    public class CryptoHelperUtil
    {
        public static uint Delta = 0x9E3779B9;

        public Dictionary<float, uint[]> keys = new Dictionary<float, uint[]>()
        {
            {1.3f, [0xC410CDFE, 0x2DB15839, 0x365B9E69, 0x5354B781]},
            {1.5f, [0xD358EE7E, 0x238B50BD, 0x365B9E69, 0x5354B781]}
        };

        //1.5 key
        public static uint[] DefaultKey = [0xD358EE7E, 0x238B50BD, 0x365B9E69, 0x5354B781];
        //1.3 key
        // public static uint[] _key = [0xC410CDFE, 0x2DB15839, 0x365B9E69, 0x5354B781];

        public static uint[] DeriveConnectionKey(uint[] globalKey, string version, string username)
        {
            string seed = version + username;
            byte[] seedBytes = Encoding.ASCII.GetBytes(seed);

            byte[] data = new byte[16];
            for (int i = 0; i < 16; i++)
            {
                data[i] = 0xCD;
            }

            int copyLength = Math.Min(seedBytes.Length, 16);
            Array.Copy(seedBytes, 0, data, 0, copyLength);

            byte[] encryptedBytes = Encrypt(data, globalKey);

            uint[] result = new uint[4];
            for (int i = 0; i < 4; i++)
            {
                result[i] = BitConverter.ToUInt32(encryptedBytes, i * 4);
            }
            return result;
        }

        /// <summary>
        /// Encrypt data in-place using TEA.
        /// </summary>
        /// <param name="data">Data to encrypt (modified in place)</param>
        /// <returns>Encrypted data (same array as input)</returns>
        public static byte[] Encrypt(byte[] data, uint[] sessionKey = null)
        {

            uint[] currentKey = sessionKey != null ? sessionKey : DefaultKey;
            if (data == null || data.Length == 0)
            {
                return data;

            }
            int size = data.Length;
            int rounds = 1 << ((size & 3) + 1);

            int numBlocks = size >> 3; // size / 8
            int offset = 0;

            for (int block = 0; block < numBlocks; block++)
            {
                uint v0 = BitConverter.ToUInt32(data, offset);
                uint v1 = BitConverter.ToUInt32(data, offset + 4);

                uint sum = 0;
                for (int i = 0; i < rounds; i++)
                {
                    sum += Delta;
                    v0 += ((v1 << 4) + currentKey[0]) ^ ((v1 >> 5) + currentKey[1]) ^ (sum + v1);
                    v1 += ((v0 >> 5) + currentKey[3]) ^ ((v0 << 4) + currentKey[2]) ^ (sum + v0);
                }

                WriteUInt32(data, offset, v0);
                WriteUInt32(data, offset + 4, v1);
                offset += 8;
            }

            int remaining = size - offset;
            if (remaining >= 4)
            {
                uint val = BitConverter.ToUInt32(data, offset);
                val ^= currentKey[0];
                WriteUInt32(data, offset, val);
            }

            return data;
        }

        /// <summary>
        /// Decrypt data in-place using TEA.
        /// </summary>
        /// <param name="data">Data to decrypt (modified in place)</param>
        /// <returns>Decrypted data (same array as input)</returns>
        public static byte[] Decrypt(byte[] data, uint[] sessionKey = null)
        {

            uint[] currentKey = sessionKey != null ? sessionKey : DefaultKey;

            if (data == null || data.Length == 0)
            {
                return data;
            }

            int size = data.Length;

            int rounds = 1 << ((size & 3) + 1);

            int numBlocks = size >> 3;
            int offset = 0;

            for (int block = 0; block < numBlocks; block++)
            {
                uint v0 = BitConverter.ToUInt32(data, offset);
                uint v1 = BitConverter.ToUInt32(data, offset + 4);

                uint sum = (uint)(Delta * rounds);

                for (int i = 0; i < rounds; i++)
                {
                    v1 -= ((v0 >> 5) + currentKey[3]) ^ ((v0 << 4) + currentKey[2]) ^ (sum + v0);
                    v0 -= ((v1 << 4) + currentKey[0]) ^ ((v1 >> 5) + currentKey[1]) ^ (sum + v1);
                    sum -= Delta;
                }

                WriteUInt32(data, offset, v0);
                WriteUInt32(data, offset + 4, v1);
                offset += 8;
            }

            int remaining = size - offset;
            if (remaining >= 4)
            {
                uint val = BitConverter.ToUInt32(data, offset);
                val ^= currentKey[0];
                WriteUInt32(data, offset, val);
            }
            return data;
        }

        private static void WriteUInt32(byte[] data, int offset, uint value)
        {
            data[offset] = (byte)value;
            data[offset + 1] = (byte)(value >> 8);
            data[offset + 2] = (byte)(value >> 16);
            data[offset + 3] = (byte)(value >> 24);
        }
    }
}

