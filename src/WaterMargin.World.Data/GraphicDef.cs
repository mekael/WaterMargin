using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class GraphicDef
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public string Subject { get; set; }
        public string Category { get; set; }
        public string Role { get; set; }
        public string Level { get; set; }
        public string Item { get; set; }
        public int Column { get; set; }
        public int Row { get; set; }
        public int ImageListPresetId { get; set; }
        public int AnmFrameCount { get; set; }
        public int AnmFPS { get; set; }
        public int AnmRepeatCount { get; set; }
    }
}
