
using System.Security.Cryptography;
using WaterMargin.GameServer.SuperSocket;
using static System.Runtime.InteropServices.JavaScript.JSType;

// Also  a depressingly AI generated piece of code
// but it saved a large amount of reverse engineering time. 
namespace WaterMargin.GameServer.Utilities
{

    /// <summary>
    /// Handles encryption and decryption of game packets.
    /// 
    /// Based on reverse engineering analysis of FUN_00843820 and related functions.
    /// Uses AES-128-ECB mode with the following structure:
    /// 
    /// Encrypted Packet Structure (before encryption):
    /// ┌─────────────────────────────────────────────────┐
    /// │ Header (16 bytes)                               │
    /// │   [0-3]   Sequence Low (randomized counter)     │
    /// │   [4-7]   Sequence High                         │
    /// │   [8-11]  Timestamp (from FILETIME)             │
    /// │   [12-15] Payload Length                        │
    /// ├─────────────────────────────────────────────────┤
    /// │ Payload                                         │
    /// │   [0]     Command (1 byte)                      │
    /// │   [1+]    Command-specific data                 │
    /// └─────────────────────────────────────────────────┘
    /// 
    /// The entire structure is padded to 16-byte boundary and encrypted with AES-128-ECB.
    /// Network transmission adds a 4-byte header: 0xEC | (size &lt;&lt; 8)
    /// </summary>
    public class IncomingPacketCrypto : IDisposable
    {
        private const int BlockSize = 16;
        private const int HeaderSize = 16;
        private const byte NetworkMagicByte = 0xEC;

        private readonly byte[] _key;
        private readonly Aes _aes;
  
        /// <summary>
        /// Initializes a new instance of the PacketCrypto class.
        /// </summary>
        /// <param name="key">16-byte AES-128 key</param>
        public IncomingPacketCrypto(byte[] key)
        {
            if (key == null || key.Length != 16)
                throw new ArgumentException("AES-128 requires a 16-byte key", nameof(key));

            _key = (byte[])key.Clone();
 

            _aes = Aes.Create();
            _aes.Key = _key;
            _aes.Mode = CipherMode.ECB;
            _aes.Padding = PaddingMode.None;
         }



        /// <summary>
        /// Decrypts a received packet.
        /// </summary>
        /// <param name="encryptedData">The encrypted packet bytes</param>
        /// <returns>Decrypted WaterMarginGameServerKeyedPackage object</returns>
        public WaterMarginGameServerKeyedPackage Decrypt(byte[] encryptedData)
        {
            if (encryptedData == null || encryptedData.Length < BlockSize)
                throw new ArgumentException($"Encrypted data too short: {encryptedData?.Length ?? 0} bytes");

            if (encryptedData.Length % BlockSize != 0)
                throw new ArgumentException($"Encrypted data must be multiple of {BlockSize} bytes");

            byte[] plaintext;
            using (var decryptor = _aes.CreateDecryptor())
            {
                plaintext = decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
            }
            WaterMarginGameServerKeyedPackage waterMarginGameServerKeyedPackage = new WaterMarginGameServerKeyedPackage
            {
                SequenceNumber = ((ulong)BitConverter.ToUInt32(plaintext, 0) << 32) | BitConverter.ToUInt32(plaintext, 4),
                Timestamp = BitConverter.ToUInt32(plaintext, 8),
                PayloadLength = BitConverter.ToUInt32(plaintext, 12)
            };

            int payloadEnd = HeaderSize + (int)waterMarginGameServerKeyedPackage.PayloadLength;
            if (payloadEnd > plaintext.Length)
            {
                throw new ArgumentException($"Payload length {waterMarginGameServerKeyedPackage.PayloadLength} exceeds decrypted data");
            }

            if (waterMarginGameServerKeyedPackage.PayloadLength < 1)
            {
                throw new ArgumentException("Payload must contain at least 1 byte (command)");
            }

            waterMarginGameServerKeyedPackage.Channel = plaintext[HeaderSize];
            waterMarginGameServerKeyedPackage.Key = plaintext[HeaderSize + 1];
            waterMarginGameServerKeyedPackage.AckResponse = plaintext[HeaderSize + 2];

            waterMarginGameServerKeyedPackage.Payload = new byte[waterMarginGameServerKeyedPackage.PayloadLength - 3];
            if (waterMarginGameServerKeyedPackage.Payload.Length > 0)
            {
                Array.Copy(plaintext, HeaderSize + 3, waterMarginGameServerKeyedPackage.Payload, 0, waterMarginGameServerKeyedPackage.Payload.Length);
            }
            return waterMarginGameServerKeyedPackage;
        }

        /// <summary>
        /// Decrypts a packet that includes the network header.
        /// </summary>
        public WaterMarginGameServerKeyedPackage DecryptWithNetworkHeader(byte[] data)
        {
            if (data == null || data.Length < 4)
                throw new ArgumentException("Data too short for network header");

            uint headerValue = BitConverter.ToUInt32(data, 0);
            byte magic = (byte)(headerValue & 0xFF);
            int size = (int)(headerValue >> 8);

            if (magic != NetworkMagicByte)
                throw new ArgumentException($"Invalid magic byte: 0x{magic:X2}, expected 0x{NetworkMagicByte:X2}");

            if (data.Length < 4 + size)
                throw new ArgumentException($"Incomplete packet: expected {size} bytes, got {data.Length - 4}");

            byte[] encryptedData = new byte[size];
            Array.Copy(data, 4, encryptedData, 0, size);

            return Decrypt(encryptedData);
        }

        #region IDisposable

        private bool _disposed = false;

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    _aes?.Dispose();
                }
                if (_key != null)
                    Array.Clear(_key, 0, _key.Length);
                _disposed = true;
            }
        }

        ~IncomingPacketCrypto()
        {
            Dispose(false);
        }

        #endregion
    }
}