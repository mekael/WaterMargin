using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class EnchantItem
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int GroupId { get; set; }
        public string ScrollType { get; set; }
        public int ScrollTier { get; set; }
        public int OriginalLevel { get; set; }
        public string EnchantmentLevel { get; set; }
        public int LevelChange1 { get; set; }
        public int SelectedRate1 { get; set; }
        public int LevelChange2 { get; set; }
        public int SelectedRate2 { get; set; }
        public int LevelChange3 { get; set; }
        public int SelectedRate3 { get; set; }
        public int LevelChange4 { get; set; }
        public int SelectedRate4 { get; set; }
    }
}
