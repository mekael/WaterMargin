using System.Buffers;
using System.Text;
using SuperSocket.ProtoBase;

namespace WaterMargin.Shared.SuperSocket
{
    public class WaterMarginKeyedPackageDecoder : IPackageDecoder<WaterMarginKeyedPackage>
    {
        public WaterMarginKeyedPackage Decode(ref ReadOnlySequence<byte> buffer, object context)
        {

         

            return new WaterMarginKeyedPackage(buffer.ToArray());
        }
    }
}