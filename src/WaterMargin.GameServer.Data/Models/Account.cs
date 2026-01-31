using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace WaterMargin.GameServer.Data.Models
{
    public class Account : EntityBase
    {

        [Column("user_id")]
        public Guid UserId { get; set; }
        public List<PlayerCharacter> PlayerCharacters { get; set;  }


        [Column("last_login_timestamp")]
        public DateTime? LastLoginTimestamp { get; set; }

        [Column("last_logout_timestamp")]
        public DateTime? LastLogoutTimestamp { get; set; }

        [Column("creation_timestamp")]
        public DateTime CreationTimestamp { get; set; } = DateTime.Now;

        [Column("game_master_level")]
        public int GameMasterLevel { get; set; }

        [Column("total_play_time")]
        public long TotalPlayTime { get; set; }


        [Column("ban_date")]
        public DateTime? BanDate { get; set; } // server level ban? 

        [Column("max_number_of_characters")]
        public int MaxNumberOfCharacters { get; set; }

        public List<LoginTrackingItem> LoginTrackingItems { get; set; }

    }
}
