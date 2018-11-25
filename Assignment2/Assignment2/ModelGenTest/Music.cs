using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Music
    {
        public Music()
        {
            MusicInstruments = new HashSet<MusicInstruments>();
            PerformanceMusic = new HashSet<PerformanceMusic>();
        }

        public int MusicId { get; set; }
        public int Level { get; set; }
        public string MusicName { get; set; }

        public ICollection<MusicInstruments> MusicInstruments { get; set; }
        public ICollection<PerformanceMusic> PerformanceMusic { get; set; }
    }
}
