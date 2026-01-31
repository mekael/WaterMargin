using System.ComponentModel.DataAnnotations.Schema;

namespace WaterMargin.GameServer.Data.Models
{
    public class EntityBase
    {
        [Column("id")]
        public int Id { get; set; }

        [Column("creation_timestamp")]
        public DateTimeOffset CreationTimestamp { get; set; } = DateTimeOffset.Now;

        [Column("last_modification_timestamp")]
        public DateTimeOffset LastModificationTimestamp { get; set; } = DateTimeOffset.Now;

    }
}