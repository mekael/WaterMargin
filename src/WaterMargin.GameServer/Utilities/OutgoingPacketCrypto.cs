using System.Security.Cryptography;
using WaterMargin.Shared;

namespace WaterMargin.GameServer.Utilities
{
    // Encrypts the outgoing packet. 
    // split from the original generated code. 
    public class OutgoingPacketCrypto : IDisposable
    {
        private const int BlockSize = 16;
        private const int HeaderSize = 16;

        private readonly byte[] _key;
        private readonly Aes _aes;


        public OutgoingPacketCrypto()
        {
            byte[] key = new byte[] { 0x01, 0x03, 0x05, 0x07, 0x09, 0x0B, 0x0D, 0x0F, 0x02, 0x04, 0x06, 0x08, 0x0A, 0x0C, 0x0E, 0x10 };
            if (key == null || key.Length != 16)
                throw new ArgumentException("AES-128 requires a 16-byte key", nameof(key));

            _key = (byte[])key.Clone();

            _aes = Aes.Create();
            _aes.Key = _key;
            _aes.Mode = CipherMode.ECB;
            _aes.Padding = PaddingMode.None;
        }

        /// <summary>
        /// Initializes a new instance of the OutgoingPacketCrypto class.
        /// </summary>
        /// <param name="key">16-byte AES-128 key</param>
        public OutgoingPacketCrypto(byte[] key)
        {
            if (key == null || key.Length != 16)
                throw new ArgumentException("AES-128 requires a 16-byte key", nameof(key));

            _key = (byte[])key.Clone();

            _aes = Aes.Create();
            _aes.Key = _key;
            _aes.Mode = CipherMode.ECB;
            _aes.Padding = PaddingMode.None;
        }

  
        private static byte[] PadToBlock(byte[] data)
        {
            int remainder = data.Length % BlockSize;
            if (remainder == 0)
                return data;

            int paddingNeeded = BlockSize - remainder;
            byte[] padded = new byte[data.Length + paddingNeeded];
            Array.Copy(data, padded, data.Length);
            return padded;
        }


        /// <summary>
        /// Encrypts a packet for transmission.
        /// </summary>
        /// <param name="data">The command-specific payload data (can be null)</param>
        /// <returns>Encrypted packet bytes</returns>
        public byte[] Encrypt(byte[] data)
        {
            data = data ?? Array.Empty<byte>();
 
            byte[] padded = PadToBlock(data);

            using (var encryptor = _aes.CreateEncryptor())
            {
                return encryptor.TransformFinalBlock(padded, 0, padded.Length);
            }
        }


        /// <summary>
        /// Encrypts a packet for transmission and adds the EC header
        /// </summary>
        /// <param name="data">The command-specific payload data (can be null)</param>
        /// <returns>Encrypted packet bytes</returns>
        public byte[] EncryptWithHeader(byte[] data)
        {
            return Utils.AddHeader(this.Encrypt(data));    
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

        ~OutgoingPacketCrypto()
        {
            Dispose(false);
        }

        #endregion
    }



}
