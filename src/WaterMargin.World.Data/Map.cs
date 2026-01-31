using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class Map
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public int NameStringId { get; set; }
        public string NoteSceneLocation { get; set; }
        public string FilePath { get; set; }
        public int CameraPresetId { get; set; }

    }
}
