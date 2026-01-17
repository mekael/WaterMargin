
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;

namespace WaterMargin.LoginServer.Data.Models
{
    public class ApplicationUser : IdentityUser<Guid>
    {
        // DisplayName and UserName are separate as we would like to be able to 
        // give players the ability to change it. though we may randomly assign the name
        // as avoiding horrible things in a children's game is a good idea. 
        [Column("display_name")]
        public string DisplayName { get; set; }

        public List<LoginTrackingItem> LoginTrackingItems { get; set; }
        public List<PlayerBan> PlayerBans { get; set; }

        [Column("is_currently_banned")]
        public bool IsCurrentlyBanned { get; set; }
        [Column("ban_start_date")]
        public DateTime? BanStartDate { get; set; }

        [Column("ban_end_date")]
        public DateTime? BanEndDate { get; set; }
    }
}