using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class Attribute
    {
        public int Id { get; set; }
        public int ClassNumber { get; set; }
        public string CharacterName { get; set; }
        public int CharacterId { get; set; }
        public int Level { get; set; }
        public string ElementalAttribute { get; set; }
        public int ExperienceRequiredtoReachtheNextLevel { get; set; }
        public float ZoomInOut { get; set; }
        public int MaxHP { get; set; }
        public int MaxMP { get; set; }
        public string EstimatedTotalHP_PC { get; set; }
        public string EstimatedTotalMP_PC { get; set; }
        public int HPRecoveryPoints { get; set; }
        public int MPRecoveryPoints { get; set; }
        public int AttackPower { get; set; }
        public int DefensePower { get; set; }
        public int Strength { get; set; }
        public int Agility { get; set; }
        public int Stamina { get; set; }
        public int Intelligence { get; set; }
        public int BurstPower { get; set; }
        public int CriticalHitRate { get; set; }
        public int Luck { get; set; }
        public int GuardianValue { get; set; }
        public int EarthAttributeDamage { get; set; }
        public int WaterAttributeDamage { get; set; }
        public int FireAttributeDamage { get; set; }
        public int WindAttributeDamage { get; set; }
        public int EarthAttributeProtection { get; set; }
        public int WaterAttributeProtection { get; set; }
        public int FireAttributeProtection { get; set; }
        public int WindAttributeProtection { get; set; }
        public int BasicDashCount { get; set; }
        public int DeBufferResistance { get; set; }
        public int AttackReflectionRate { get; set; }
        public int AbsoluteDamageValue { get; set; }
        public int AbsoluteDefenseValue { get; set; }
        public int AbsoluteDamageMultiplier { get; set; }
        public int AbsoluteDefenseMultiplier { get; set; }
        public int MaxHPBackup { get; set; }
        public int MaxMPBackup { get; set; }
        public int OldHPRecoveryPoints { get; set; }
        public int OldMPRecoveryPoints { get; set; }
        public int LevelUpEXPBackup { get; set; }

    }
}
