using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class Mission
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int NameStringId { get; set; }
        public int LevelDesignGroupId { get; set; }
        public string TaskName { get; set; }
        public int MissionGroupPresetId { get; set; }
        public int MissionGroupIndex { get; set; }
        public string CityLevel { get; set; }
        public string TaskType { get; set; }
        public int NumberOfPlayersType { get; set; }
        public string Retake { get; set; }
        public int MissionLV { get; set; }
        public int MissionDifficultyLevel_Maybe { get; set; }
        public int UIDisplayType { get; set; }
        public int CanReDoThisMission { get; set; }
        public int RegularMissonPresetId { get; set; }
        public string ChildrenMissionPresetId1 { get; set; }
        public string ChildrenMissionPresetId2 { get; set; }
        public string ChildrenMissionPresetId3 { get; set; }
        public string ChildrenMissionPresetId4 { get; set; }
        public string LevelDesignID { get; set; }
        public int MainID { get; set; }
        public int SubID { get; set; }
        public string StartMissionScript { get; set; }
        public string EndMissionScript { get; set; }
        public string BelongToMissionId { get; set; }
        public string MissionItemIdOnAcceptMission1 { get; set; }
        public string MissionItemCountOnAcceptMission1 { get; set; }
        public string MissionItemIdOnAcceptMission2 { get; set; }
        public string MissionItemCountOnAcceptMission2 { get; set; }
        public string MissionItemIdOnAcceptMission3 { get; set; }
        public string MissionItemCountOnAcceptMission3 { get; set; }
        public string MissionItemIdOnAcceptMission4 { get; set; }
        public string MissionItemCountOnAcceptMission4 { get; set; }
        public string AcceptMissionNPCID { get; set; }
        public string Unknown1 { get; set; }
        public string AcceptMissionLevelDesignId { get; set; }
        public string Unknown2 { get; set; }
        public string ReturnMissionNPCID { get; set; }
        public string ReturnMissionPosition { get; set; }
        public string Unknown3 { get; set; }
        public string ReturnMissionLevelDesignId { get; set; }
        public string Unknown4 { get; set; }
        public string CompleteMissionCausalityStringStartId { get; set; }
        public string CompleteMissionCausalityStringEndId { get; set; }
        public string MissionTargetStringId { get; set; }
        public string MissionTargetLevelDesignId { get; set; }
        public string MissionTargetPosition { get; set; }
        public string MissionDescStringID { get; set; }
        public string AcceptConversationID { get; set; }
        public string UnFinishMissionAcceptID { get; set; }
        public string UnFinishMissionReturnID { get; set; }
        public string ReturnConversationID { get; set; }
        public string RewardExp { get; set; }
        public string PreviousRewardExpCorrection { get; set; }
        public string QuestTypeNotes { get; set; }
        public string RewardGP { get; set; }
        public string RewardPrestige { get; set; }
        public string RewardSkillId { get; set; }
        public string RewardLimit { get; set; }
        public string RewardID1 { get; set; }
        public string RewardCount1 { get; set; }
        public string RewardRate1 { get; set; }
        public string RewardID2 { get; set; }
        public string RewardCount2 { get; set; }
        public string RewardRate2 { get; set; }
        public string RewardID3 { get; set; }
        public string RewardCount3 { get; set; }
        public string RewardRate3 { get; set; }
        public string RewardID4 { get; set; }
        public string RewardCount4 { get; set; }
        public string RewardRate4 { get; set; }
        public string RewardID5 { get; set; }
        public string RewardCount5 { get; set; }
        public string RewardRate5 { get; set; }
        public string Visible { get; set; }
        public string GfxId { get; set; }
        public string AutoShare { get; set; }
        public string bMainMission { get; set; }
        public string QuestTimeRequiredSeconds { get; set; }
        public string TargetMonsterEXP { get; set; }
        public string NumberOfMonstersKilled { get; set; }
        public string NumberOfStagesRequiredtoKillEnoughMonsters { get; set; }
        public string SingleLevelGPReference { get; set; }
        public string RewardGPCalculation { get; set; }
        public string OriginalSort { get; set; }
    }
}
