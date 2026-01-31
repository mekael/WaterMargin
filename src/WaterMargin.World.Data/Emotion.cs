using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class Emotion
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int GfxPresetId { get; set; }
        public string Description { get; set; }
        public int NameStringId { get; set; }
        public int AutoDisappearTimeMilliseconds { get; set; }
        public int FadeOutTimeMilliseconds { get; set; }
        public int DisplayWidth { get; set; }
        public int DisplayHeight { get; set; }

    }
}
