using Microsoft.Extensions.Logging;
using SuperSocket.ProtoBase;
using System.Buffers;
using System.Text;
using WaterMargin.GameServer.Config;
using WaterMargin.GameServer.Utilities;

namespace WaterMargin.GameServer.SuperSocket
{
    public class WaterMarginGameServerKeyedPackageDecoder : IPackageDecoder<WaterMarginGameServerKeyedPackage>
    {
        private readonly ServerConfiguration _serverConfiguration;
        private readonly ILogger<WaterMarginGameServerKeyedPackage> _logger;
        public WaterMarginGameServerKeyedPackageDecoder(ServerConfiguration serverConfiguration, ILogger<WaterMarginGameServerKeyedPackage> logger)
        {
            this._serverConfiguration = serverConfiguration;
            this._logger = logger;
        }
        public WaterMarginGameServerKeyedPackage Decode(ref ReadOnlySequence<byte> buffer, object context)
        {

            //TODO: Determine if there is a ever another key exchange.
            byte[] DefaultKey = new byte[] { 0x01, 0x03, 0x05, 0x07, 0x09, 0x0B, 0x0D, 0x0F, 0x02, 0x04, 0x06, 0x08, 0x0A, 0x0C, 0x0E, 0x10 };

            var WaterMarginGameServerKeyedPackage = new IncomingPacketCrypto(DefaultKey).DecryptWithNetworkHeader(buffer.ToArray());

            Console.WriteLine(Encoding.UTF8.GetString(WaterMarginGameServerKeyedPackage.Payload));

            return WaterMarginGameServerKeyedPackage;
        }
    }
}