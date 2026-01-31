using System;
using System.Collections.Generic;
using System.Text;

namespace WaterMargin.World.Data
{
    public class MusicDefinition
    {
        public int Id { get; set; }
        public int ClassId { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public string Scenario { get; set; }
        public int DescStringId { get; set; }
        public int IsLanguageDependent { get; set; }
        public string PreviousFileName { get; set; }
        public string FilePath { get; set; }

    }
}
