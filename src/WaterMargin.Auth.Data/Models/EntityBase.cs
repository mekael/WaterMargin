using System.ComponentModel.DataAnnotations.Schema;

namespace WaterMargin.Auth.Data
{
    public class EntityBase
    {
        [Column("id")]
        public Guid Id { get; set; }

        [Column("creation_timestamp")]
        public DateTimeOffset CreationTimestamp { get; set; } = DateTimeOffset.Now;

        [Column("last_modification_timestamp")]
        public DateTimeOffset LastModificationTimestamp { get; set; } = DateTimeOffset.Now;

        [Column("created_by_user_id")]
        public Guid CreatedByUser { get; set; } = Guid.Empty;

        [Column("last_modified_by_user_id")]
        public Guid LastModifiedByUserId { get; set; }  = Guid.Empty;
    }
}