using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class MovieDefinition
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public string Name { get; set; }
        public string LevelDesign { get; set; }
        public bool IsLanguageDependent { get; set; }
        public string FilePath { get; set; }

    }
}
