using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Instruments
    {
        public Instruments()
        {
            Classes = new HashSet<Classes>();
            InstrumentHire = new HashSet<InstrumentHire>();
            InstrumentTutors = new HashSet<InstrumentTutors>();
            MusicInstruments = new HashSet<MusicInstruments>();
            PayScales = new HashSet<PayScales>();
        }

        public int InstrumentId { get; set; }
        public int HeadTutorId { get; set; }
        public int MaxClassSize { get; set; }
        public int InventoryNumber { get; set; }
        public decimal? OpenFee { get; set; }
        public decimal? StudentFee { get; set; }
        public decimal? HireFee { get; set; }

        public Tutors HeadTutor { get; set; }
        public ICollection<Classes> Classes { get; set; }
        public ICollection<InstrumentHire> InstrumentHire { get; set; }
        public ICollection<InstrumentTutors> InstrumentTutors { get; set; }
        public ICollection<MusicInstruments> MusicInstruments { get; set; }
        public ICollection<PayScales> PayScales { get; set; }
    }
}
