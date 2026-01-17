using System.ComponentModel.DataAnnotations.Schema;
using WaterMargin.LoginServer.Data.Enums;

namespace WaterMargin.LoginServer.Data.Models;

[Table("player_ban")]
public class PlayerBan : EntityBase
{
    [Column("banned_user_id")]
    public Guid? BannedUserId { get; set; }
    public ApplicationUser BannedUser { get; set; }

    [Column("group_id")]
    public string GroupId { get; set; }

    [Column("ip_address")]
    public string IpAddress { get; set; }

    [Column("ban_start_date")]
    public DateTime BanStartDate { get; set; }

    [Column("ban_end_date")]
    public DateTime BanEndDate { get; set; }

    [Column("ban_type", TypeName = "Text")]
    public BanType BanType { get; set; }
}