
using System.Security.Cryptography;
using System.Text;
using WaterMargin.Auth.Data.Models;

namespace WaterMargin.LoginServer.Sys
{
    public class AuthorizedSession
    {

        public ApplicationUser ApplicationUser { get; set;  }
        public Guid ApplicationUserId { get; set; }
        public string UserName {get;set;}
        public string HashedPassword {get;set;}
        public DateTime LoginTimestamp { get; set; }
        public string ClientVersion { get; set; }
        public string ClientIpAddress { get; set; }
        public int Nonce { get; set; }
        public string ConnectedToGameServerId { get; set; }




        public AuthorizedSession(ApplicationUser applicationUser, string clientVersion,
                                 string clientIpAddress, string password, int nonce)
        {
                this.ApplicationUser= applicationUser;
                this.ClientIpAddress = clientIpAddress;
                this.ClientVersion = clientVersion;
                this.HashedPassword =Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(password)));
                this.Nonce = nonce;
        }


    }
}
