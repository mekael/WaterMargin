using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class LevelDesign
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int NameStringId { get; set; }
        public int EnterGameRoomImgId { get; set; }
        public int LevelDesignGroupId { get; set; }
        public int CanPK { get; set; }
        public int DeadPenalty { get; set; }
        public int LoseExpWhenDead { get; set; }
        public int PKProtectionPlayerLevel { get; set; }
        public int ChannelSize { get; set; }
        public string Remarks_CorrespondingArea { get; set; }
        public string Remarks_LevelName { get; set; }
        public int Remarks_MapId { get; set; }
        public int Remarks_PCLevelRestriction { get; set; }
        public string Remarks_MOBLevel { get; set; }
        public int StageMapGfxId { get; set; }
        public int BossPictureGfxId { get; set; }
        public int StageLevel { get; set; }
        public int StageNameGfxId { get; set; }
        public int StagePurposeStrId { get; set; }
        public int VictoryWordStrId { get; set; }
        public int LoseWordStrId { get; set; }
        public int DescStringId { get; set; }
        public string FilePath { get; set; }
        public int RespawnLevelDesignId { get; set; }
        public int MiniMapPicPresetId { get; set; }
        public int LimitTimeBySecond { get; set; }
        public int InitMusicId { get; set; }
        public int MapPresetId { get; set; }
        public int OpenGameRoom { get; set; }
        public int Announce { get; set; }
        public int MoneyOfCoffer { get; set; }
        public int InterestOfCoffer { get; set; }
        public int Type { get; set; }
        public int FloorOnCondition { get; set; }
        public int RoofOnCondition { get; set; }
        public int RewardEXP { get; set; }
        public int Prestige { get; set; }
        public int RewardGP { get; set; }
        public int MVPMin { get; set; }
        public int MVPEXP { get; set; }
        public int MVPGP { get; set; }
        public int StageKillerMin { get; set; }
        public int KillerEXP { get; set; }
        public int KillerGP { get; set; }
    }
}
