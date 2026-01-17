
using System.Security.Cryptography;
using System.Text;

namespace WaterMargin.LoginServer.Logic.Network
{
    public class AuthorizedSession
    {
        public Guid ApplicationUserId { get; set; }
        public string UserName {get;set;}
        public string HashedPassword {get;set;}
        public DateTime LoginTimestamp { get; set; }
        public string ClientVersion { get; set; }
        public string ClientIpAddress { get; set; }
        public int Nonce { get; set; }
        public string ConnectedToGameServerId { get; set; }

        public AuthorizedSession(Guid userId, string userName, string clientVersion, string clientIpAddress, string password, int nonce)
        {
                this.ApplicationUserId = userId;
                this.UserName = userName;
                this.ClientIpAddress = clientIpAddress;
                this.ClientVersion = clientVersion;
                this.HashedPassword =Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(password)));
                this.Nonce = nonce;
        }
    }
}
