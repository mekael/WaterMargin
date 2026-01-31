using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class EquipmentItem
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public string Name { get; set; }
        public int ReferenceStrengthLevel { get; set; }
        public int CharacterRestriction { get; set; }
        public string Location { get; set; }
        public string RarityTier { get; set; }
        public string Element { get; set; }
        public string EquipmentBonusAttributes { get; set; }
        public string ItemReferenceSource { get; set; }
        public int EquipmentBasePrice { get; set; }
        public int ShopNPCRecyclingPrice { get; set; }
        public int Position { get; set; }
        public int DollShapeNPCPresetId { get; set; }
        public string DollPartName { get; set; }
        public int DeformNPCPresetId { get; set; }
        public int ScaleAbility { get; set; }
        public int MoveRate { get; set; }
        public int Attack { get; set; }
        public int Defence { get; set; }
        public int Strength { get; set; }
        public int Dexterity { get; set; }
        public int Constitution { get; set; }
        public int Intelligence { get; set; }
        public int CriticalPower { get; set; }
        public int CriticalHitRate { get; set; }
        public int LuckyValue { get; set; }
        public int Guardian { get; set; }
        public int GroundHarm { get; set; }
        public int WaterHarm { get; set; }
        public int FireHarm { get; set; }
        public int WindHarm { get; set; }
        public int Unground { get; set; }
        public int Unwater { get; set; }
        public int Unfire { get; set; }
        public int Unwind { get; set; }
        public int MaxHP { get; set; }
        public int MaxMP { get; set; }
        public int RestoreHP { get; set; }
        public int RestoreMP { get; set; }
        public int DeBufferDefenceRate { get; set; }
        public int ReflectionAttackRate { get; set; }
        public int AbsoluteDamage { get; set; }
        public int AbsoluteDefence { get; set; }
        public int AbsoluteDamageRate { get; set; }
        public int AbsoluteDefenceRate { get; set; }
        public string SpecificEnhancementAttribute { get; set; }
        public int EnchantAbilityBits { get; set; }
        public int EnchantAbilityRandomPresetId { get; set; }
        public int EnchantAbilityLimit { get; set; }
        public int EnchantValueGroupId { get; set; }
        public int MaxDurability { get; set; }
        public float FixDurableCost { get; set; }
        public int FullRepairCost { get; set; }
        public float NumberOfUpgradesAndRepairs { get; set; }
    }
}
