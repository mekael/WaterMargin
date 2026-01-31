using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public  class Character
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int NameStringId { get; set; }
        public int ClassStringId { get; set; }
        public int ElementStringId { get; set; }
        public int AbilityType { get; set; }
        public string Name { get; set; }
        public int MainStatusGfxId { get; set; }
        public int DescStringStartId { get; set; }
        public int DescStringEndId { get; set; }
        public int AbilityStringStartId { get; set; }
        public int AbilityStringEndId { get; set; }
        public int StoryStringStartId { get; set; }
        public int StoryStringEndId { get; set; }
        public int Scale { get; set; }
        public int PC_NPCShowType { get; set; }
        public int RaceId { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public int Length { get; set; }
        public int Radius { get; set; }
        public int UseBBox { get; set; }
        public int MoveSoundId { get; set; }
        public int DeadSoundId { get; set; }
        public int BeHitSoundId { get; set; }
        public int JumpUpSoundId { get; set; }
        public int JumpDownSoundId { get; set; }
        public int RushSoundId { get; set; }
        public int VictorySoundId { get; set; }
        public int DefeatSoundId { get; set; }
        public int WeaponId { get; set; }
        public int MoveSpeed { get; set; }
        public float JumpSpeedXZFactor { get; set; }
        public int JumpSpeedY { get; set; }
        public int ChargeMoveSpeedFactor { get; set; }
        public int RushSpeed { get; set; }
        public int RushTimeMilliseconds { get; set; }
        public int RushCoolDownTimeMilliseconds { get; set; }
        public string RushEffectTemplateName { get; set; }
        public int ComboSkillId1 { get; set; }
        public int ComboSkillLevel1 { get; set; }
        public int ComboSkillId2 { get; set; }
        public int ComboSkillLevel2 { get; set; }
        public int ComboSkillId3 { get; set; }
        public int ComboSkillLevel3 { get; set; }
        public int ComboSkillId4 { get; set; }
        public int ComboSkillLevel4 { get; set; }
        public int ComboSkillId5 { get; set; }
        public int ComboSkillLevel5 { get; set; }
        public int ComboSkillId6 { get; set; }
        public int ComboSkillLevel6 { get; set; }
        public int ComboSkillId7 { get; set; }
        public int ComboSkillLevel7 { get; set; }
        public int SkillIdList1 { get; set; }
        public int SkillIdList2 { get; set; }
        public int SkillIdList3 { get; set; }
        public int SkillIdList4 { get; set; }
        public int DefaultEquipments1 { get; set; }
        public int DefaultEquipments2 { get; set; }
        public int DefaultEquipments3 { get; set; }
        public int DefaultEquipments4 { get; set; }
        public int DefaultEquipments5 { get; set; }
        public string HurtEffectTemplateName { get; set; }
        public string DieEffectTemplateName { get; set; }
        public string DiedEffectTemplateName { get; set; }
        public int OnClientRushScript { get; set; }
        public int HurtSkillKind { get; set; }
        public int HurtSkillID { get; set; }
        public int NewbieEquipments1 { get; set; }
        public int NewbieEquipments2 { get; set; }
        public int NewbieEquipments3 { get; set; }
        public int NewbieEquipments4 { get; set; }
        public int GuardianOffset_X { get; set; }
        public int GuardianOffset_Y { get; set; }
        public int GuardianOffset_Z { get; set; }
    }
}
