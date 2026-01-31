using Microsoft.Extensions.Logging;
using SuperSocket.Command;
using SuperSocket.Server.Abstractions.Session;
using System.Net.Sockets;
using WaterMargin.GameServer.SuperSocket;
using WaterMargin.GameServer.Utilities;
using WaterMargin.Shared;
using WaterMargin.Shared.Packets;

namespace WaterMargin.GameServer.Features.AccountArchive
{
    [Command(Key = 0)]
    public class GetAccountArchiveHandler : IAsyncCommand<WaterMarginGameServerKeyedPackage>
    {

        private readonly ILogger<GetAccountArchiveHandler> _logger;

        public GetAccountArchiveHandler(ILogger<GetAccountArchiveHandler> logger)
        {
            this._logger = logger;
        }
        public ValueTask ExecuteAsync(IAppSession session, WaterMarginGameServerKeyedPackage package, CancellationToken cancellationToken)
        {
            OutgoingPacketCrypto outgoingPacketCrypto = new OutgoingPacketCrypto();

            // username
            // nonce 
            using PacketReader packetReader = new PacketReader(package.Payload);
            string username = packetReader.ReadNullTerminatedString();
            int nonce = packetReader.ReadInt32();


            byte[] cat = new byte[8000];
            int offset = 0;
            PacketBitWriter packetBitWriter = new PacketBitWriter(cat, ref offset);
            packetBitWriter.WriteByte((byte)0x00);
            packetBitWriter.WriteByte((byte)0x04);
            packetBitWriter.WriteByte((byte)package.AckResponse);
            byte[] data = packetBitWriter.GetData();
            byte[] encryptedLoginResponse = Utils.AddHeader(outgoingPacketCrypto.Encrypt(data));
               session.SendAsync(encryptedLoginResponse);

      

            byte[] cat2 = new byte[8000];
            int offset2 = 0;
            PacketBitWriter packetBitWriter2 = new PacketBitWriter(cat2, ref offset2);
            packetBitWriter2.WriteByte((byte)0x08);
            packetBitWriter2.WriteByte((byte)0x0a);
            packetBitWriter2.WriteByte((byte)0x00);
            packetBitWriter2.WriteByte(0x0a); // field count
            packetBitWriter2.WriteByte(0x00);  //account id
            packetBitWriter2.WriteInt32(nonce);
            packetBitWriter2.WriteByte(0x01); // name
            packetBitWriter2.WriteNullTerminatedString("mekael");
            packetBitWriter2.WriteByte(0x02); // create time
            packetBitWriter2.WriteInt64(DateTime.Now.Ticks);
            packetBitWriter2.WriteByte(0x03); // latest login time
            packetBitWriter2.WriteInt64(DateTime.Now.Ticks);
            packetBitWriter2.WriteByte(0x04); // latest logout time 
            packetBitWriter2.WriteInt64(DateTime.Now.Ticks);
            packetBitWriter2.WriteByte(0x05); // accumulated online time
            packetBitWriter2.WriteInt64(12123);
            packetBitWriter2.WriteByte(0x06); // accumulated offline time
            packetBitWriter2.WriteInt64(1231);
            packetBitWriter2.WriteByte(0x07); // max slot count
            packetBitWriter2.WriteInt32(10);
            packetBitWriter2.WriteByte(0x08); // ban time
            packetBitWriter2.WriteInt64(0);
            packetBitWriter2.WriteByte(0x09); // gm level
            packetBitWriter2.WriteInt32(1);
            byte[] data2 = packetBitWriter2.GetData();
            byte[] encryptedLoginResponse2 = Utils.AddHeader(outgoingPacketCrypto.Encrypt(data2));

         return   session.SendAsync(encryptedLoginResponse2);
 /*
            byte[] cat3 = new byte[8000];
            int offset3 = 0;
            PacketBitWriter packetBitWriter3 = new PacketBitWriter(cat3, ref offset3);
            packetBitWriter3.WriteByte((byte)0x00);
            packetBitWriter3.WriteByte((byte)0x01);
            packetBitWriter3.WriteByte((byte)0x00);
            packetBitWriter3.WriteInt32(1);
            byte[] data3 = packetBitWriter3.GetData();
            byte[] encryptedLoginResponse3 = Utils.AddHeader(outgoingPacketCrypto.Encrypt(data3));




            return session.SendAsync(encryptedLoginResponse3); ;
          */

            /*
             
  AccountId int => nonce
  Name chararr => display name
  CreateTime int64
  LatestLoginTime int64
  LatestLogoutTime int64
  AccumulatedOnlineTime int64
  AccumulatedOfflineTime int64
  MaxSlotCount int => game server
  BanTime int64 
  GMLevel int => game server

             
             */






            // throw new NotImplementedException();
        }




    }
}
