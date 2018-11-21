using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class MusicInstruments
    {
        public int MusicId { get; set; }
        public int InstrumentId { get; set; }

        public Instruments Instrument { get; set; }
        public Music Music { get; set; }
    }
}
