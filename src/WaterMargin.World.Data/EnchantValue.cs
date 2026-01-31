using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class EnchantValue
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int Level { get; set; }
        public int GroupId { get; set; }
        public string EquipmentTypeTier { get; set; }
        public int CorrespondingReferenceLevel { get; set; }
        public int MaxHP { get; set; }
        public int MaxMP { get; set; }
        public int RestoreHP { get; set; }
        public int RestoreMP { get; set; }
        public int Strength { get; set; }
        public int Dexterity { get; set; }
        public int Constitution { get; set; }
        public int Intelligence { get; set; }
        public int CriticalPower { get; set; }
        public int CriticalHitRate { get; set; }
        public int LuckyValue { get; set; }
        public int Attack { get; set; }
        public int Defence { get; set; }
        public int GroundAttack { get; set; }
        public int WaterAttack { get; set; }
        public int FireAttack { get; set; }
        public int WindAttack { get; set; }
        public int GroundDefense { get; set; }
        public int WaterDefense { get; set; }
        public int FireDefense { get; set; }
        public int WindDefense { get; set; }
    }
}
