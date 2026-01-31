using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class EnchantTexture
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public string CharacterName { get; set; }
        public int CharacterPresetId { get; set; }
        public string EquipmentPositionName { get; set; }
        public int EquipmentPositionId { get; set; }
        public int EnchantLevel { get; set; }
        public int ImageListPresetId { get; set; }
        public float UOffset { get; set; }
        public float VOffset { get; set; }

    }
}
