using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class GuildLevelDefinition
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int LeaderLevelLimit { get; set; }
        public int LeaderRankLimit { get; set; }
        public int LeaderGPLimit { get; set; }
        public int MemberSize { get; set; }
        public int PKQuitPlayerLevel { get; set; }
        public float ExpBonus1 { get; set; }
        public float ExpBonus2 { get; set; }
        public float ExpBonus3 { get; set; }
        public float ExpBonus4 { get; set; }
    }
}
