using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class Camera
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int Distance { get; set; }
        public int AngleX { get; set; }
        public int AngleY { get; set; }
        public int LookAtOffsetY { get; set; }
        public int ScreenCenterAreaWidthPercent { get; set; }
        public int ScreenCenterAreaHeightPercent { get; set; }
        public string Description { get; set; }
        public int BaseLabel_OffsetY { get; set; }
        public int HPLabel_OffsetY { get; set; }
        public int RankLabel_OffsetY { get; set; }
        public int NameLabel_OffsetY { get; set; }
        public int MoodLabel_OffsetY { get; set; }
        public int EmotionLabel_OffsetY { get; set; }
        public int GuildMemberTitleLabel_OffsetY { get; set; }
        public int GuildLabel_OffsetY { get; set; }
        public int StageClearMasterTitleLabel_OffsetY { get; set; }
        public int MissionOverheadMarkLabel_OffsetY { get; set; }
        public int ObjectIdLabel_OffsetY { get; set; }

    }
}
