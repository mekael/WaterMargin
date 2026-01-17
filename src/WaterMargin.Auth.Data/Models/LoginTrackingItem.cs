using System.ComponentModel.DataAnnotations.Schema;

namespace WaterMargin.LoginServer.Data.Models
{
    public class LoginTrackingItem : EntityBase
    {

        public LoginTrackingItem(Guid applicationUserId, string clientVersion, string clientIpAddress, int nonce)
        {
            this.ApplicationUserId = applicationUserId;
            this.ClientVersion = clientVersion;
            this.ClientIpAddress = clientIpAddress;
            this.Nonce = nonce;

        }
        [Column("application_user_id")]
        public Guid ApplicationUserId { get; set; }
        public ApplicationUser ApplicationUser { get; set; }

        [Column("login_timestamp")]
        public DateTime LoginTimestamp { get; set; } = DateTime.Now;

        [Column("logout_timestamp")]
        public DateTime? LogoutTimestamp { get; set; }

        [Column("client_version")]
        public string ClientVersion { get; set; }

        [Column("client_ip_address")]
        public string ClientIpAddress { get; set; }

        [Column("nonce")]
        public int Nonce { get; set; }

        [Column("connected_to_game_server_id")]
        public string ConnectedToGameServerId { get; set; }
    }
}