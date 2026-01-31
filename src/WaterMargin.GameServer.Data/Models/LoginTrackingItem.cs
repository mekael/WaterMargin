using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace WaterMargin.GameServer.Data.Models
{
    public class LoginTrackingItem : EntityBase
    {

        [Column("account_id")]
        public int AccountId { get; set;  }
        public Account Account { get; set; }

        [Column("login_timestamp")]
        public DateTime LoginTimestamp { get; set; }

        [Column("logout_timestamp")]
        public DateTime? LogoutTimestamp { get; set; }
        [Column("reason_for_logout")]
        public string ReasonForLogout { get; set;  }

        [Column("elapsed_time_in_seconds")]
        public long ElapsedTimeInSeconds { get; set;  }

        [Column("character_id")]
        public int CharacterId { get; set;  }
        public PlayerCharacter Character { get; set; }
    }
}
