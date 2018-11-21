using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Assignment2.ModelGenTest
{
    public partial class modelgentestContext : DbContext
    {
        public modelgentestContext()
        {
        }

        public modelgentestContext(DbContextOptions<modelgentestContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Classes> Classes { get; set; }
        public virtual DbSet<ClassList> ClassList { get; set; }
        public virtual DbSet<EnsembleMusicians> EnsembleMusicians { get; set; }
        public virtual DbSet<Ensembles> Ensembles { get; set; }
        public virtual DbSet<InstrumentHire> InstrumentHire { get; set; }
        public virtual DbSet<Instruments> Instruments { get; set; }
        public virtual DbSet<InstrumentTutors> InstrumentTutors { get; set; }
        public virtual DbSet<Locations> Locations { get; set; }
        public virtual DbSet<Music> Music { get; set; }
        public virtual DbSet<MusicInstruments> MusicInstruments { get; set; }
        public virtual DbSet<PayScales> PayScales { get; set; }
        public virtual DbSet<PerformanceMusic> PerformanceMusic { get; set; }
        public virtual DbSet<Performances> Performances { get; set; }
        public virtual DbSet<Person> Person { get; set; }
        public virtual DbSet<Seniority> Seniority { get; set; }
        public virtual DbSet<Students> Students { get; set; }
        public virtual DbSet<Tutors> Tutors { get; set; }

        // Unable to generate entity type for table 'dbo.StudentGuardians'. Please see the warning messages.

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=192.168.0.149;Initial Catalog=modelgentest;User ID=SA;Password=P@ssw0rd;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Classes>(entity =>
            {
                entity.HasKey(e => e.ClassId);

                entity.Property(e => e.ClassId).HasColumnName("classID");

                entity.Property(e => e.InstrumentId).HasColumnName("instrumentID");

                entity.Property(e => e.LessonLevel).HasColumnName("lessonLevel");

                entity.Property(e => e.TutorId).HasColumnName("tutorID");

                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.Classes)
                    .HasForeignKey(d => d.InstrumentId)
                    .HasConstraintName("Classes_Instrument_FK");

                entity.HasOne(d => d.Tutor)
                    .WithMany(p => p.Classes)
                    .HasForeignKey(d => d.TutorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Classes_Tutor_FK");
            });

            modelBuilder.Entity<ClassList>(entity =>
            {
                entity.HasKey(e => new { e.ClassId, e.StudentId });

                entity.Property(e => e.ClassId).HasColumnName("classID");

                entity.Property(e => e.StudentId).HasColumnName("studentID");

                entity.HasOne(d => d.Class)
                    .WithMany(p => p.ClassList)
                    .HasForeignKey(d => d.ClassId)
                    .HasConstraintName("Classlist_Class_FK");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.ClassList)
                    .HasForeignKey(d => d.StudentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Classlist_Student_FK");
            });

            modelBuilder.Entity<EnsembleMusicians>(entity =>
            {
                entity.HasKey(e => new { e.EnsembleId, e.PersonId });

                entity.Property(e => e.EnsembleId).HasColumnName("ensembleID");

                entity.Property(e => e.PersonId).HasColumnName("personID");

                entity.HasOne(d => d.Ensemble)
                    .WithMany(p => p.EnsembleMusicians)
                    .HasForeignKey(d => d.EnsembleId)
                    .HasConstraintName("Ensemble_Musician_FK");

                entity.HasOne(d => d.Person)
                    .WithMany(p => p.EnsembleMusicians)
                    .HasForeignKey(d => d.PersonId)
                    .HasConstraintName("Person_Ensemble_FK");
            });

            modelBuilder.Entity<Ensembles>(entity =>
            {
                entity.HasKey(e => e.EnsembleId);

                entity.Property(e => e.EnsembleId).HasColumnName("ensembleID");

                entity.Property(e => e.EnsembleName)
                    .IsRequired()
                    .HasColumnName("ensembleName")
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<InstrumentHire>(entity =>
            {
                entity.HasKey(e => new { e.StudentId, e.InstrumentId });

                entity.Property(e => e.StudentId).HasColumnName("studentID");

                entity.Property(e => e.InstrumentId).HasColumnName("instrumentID");

                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.InstrumentHire)
                    .HasForeignKey(d => d.InstrumentId)
                    .HasConstraintName("Instrument_Hire_Instrument_FK");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.InstrumentHire)
                    .HasForeignKey(d => d.StudentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Instrument_Hire_Student_FK");
            });

            modelBuilder.Entity<Instruments>(entity =>
            {
                entity.HasKey(e => e.InstrumentId);

                entity.Property(e => e.InstrumentId).HasColumnName("instrumentID");

                entity.Property(e => e.HeadTutorId).HasColumnName("headTutorID");

                entity.Property(e => e.HireFee)
                    .HasColumnName("hireFee")
                    .HasColumnType("smallmoney");

                entity.Property(e => e.InventoryNumber).HasColumnName("inventoryNumber");

                entity.Property(e => e.MaxClassSize).HasColumnName("maxClassSize");

                entity.Property(e => e.OpenFee)
                    .HasColumnName("openFee")
                    .HasColumnType("smallmoney");

                entity.Property(e => e.StudentFee)
                    .HasColumnName("studentFee")
                    .HasColumnType("smallmoney");

                entity.HasOne(d => d.HeadTutor)
                    .WithMany(p => p.Instruments)
                    .HasForeignKey(d => d.HeadTutorId)
                    .HasConstraintName("Instrument_Head_Tutor_FK");
            });

            modelBuilder.Entity<InstrumentTutors>(entity =>
            {
                entity.HasKey(e => new { e.TutorId, e.InstrumentId, e.SeniorityId });

                entity.Property(e => e.TutorId).HasColumnName("tutorID");

                entity.Property(e => e.InstrumentId).HasColumnName("instrumentID");

                entity.Property(e => e.SeniorityId).HasColumnName("seniorityID");

                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.InstrumentTutors)
                    .HasForeignKey(d => d.InstrumentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Instrument_Tutors_Instrument_FK");

                entity.HasOne(d => d.Seniority)
                    .WithMany(p => p.InstrumentTutors)
                    .HasForeignKey(d => d.SeniorityId)
                    .HasConstraintName("Instrument_Tutors_Seniority_FK");

                entity.HasOne(d => d.Tutor)
                    .WithMany(p => p.InstrumentTutors)
                    .HasForeignKey(d => d.TutorId)
                    .HasConstraintName("Instrument_Tutors_Tutor_FK");
            });

            modelBuilder.Entity<Locations>(entity =>
            {
                entity.HasKey(e => e.LocationId);

                entity.Property(e => e.LocationId).HasColumnName("locationID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasColumnName("address")
                    .HasMaxLength(80)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Music>(entity =>
            {
                entity.Property(e => e.MusicId).HasColumnName("musicID");

                entity.Property(e => e.Level).HasColumnName("level");
            });

            modelBuilder.Entity<MusicInstruments>(entity =>
            {
                entity.HasKey(e => new { e.MusicId, e.InstrumentId });

                entity.Property(e => e.MusicId).HasColumnName("musicID");

                entity.Property(e => e.InstrumentId).HasColumnName("instrumentID");

                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.MusicInstruments)
                    .HasForeignKey(d => d.InstrumentId)
                    .HasConstraintName("MusicInstruments_Instrument_FK");

                entity.HasOne(d => d.Music)
                    .WithMany(p => p.MusicInstruments)
                    .HasForeignKey(d => d.MusicId)
                    .HasConstraintName("MusicInstruments_Music_FK");
            });

            modelBuilder.Entity<PayScales>(entity =>
            {
                entity.HasKey(e => new { e.SeniorityId, e.InstrumentId });

                entity.Property(e => e.SeniorityId).HasColumnName("seniorityID");

                entity.Property(e => e.InstrumentId).HasColumnName("instrumentID");

                entity.Property(e => e.Pay)
                    .HasColumnName("pay")
                    .HasColumnType("smallmoney");

                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.PayScales)
                    .HasForeignKey(d => d.InstrumentId)
                    .HasConstraintName("Payscales_Instrument_FK");

                entity.HasOne(d => d.Seniority)
                    .WithMany(p => p.PayScales)
                    .HasForeignKey(d => d.SeniorityId)
                    .HasConstraintName("Payscales_Seniority_FK");
            });

            modelBuilder.Entity<PerformanceMusic>(entity =>
            {
                entity.HasKey(e => new { e.PerformanceId, e.MusicId, e.EnsembleId });

                entity.Property(e => e.PerformanceId).HasColumnName("performanceID");

                entity.Property(e => e.MusicId).HasColumnName("musicID");

                entity.Property(e => e.EnsembleId).HasColumnName("ensembleID");

                entity.HasOne(d => d.Ensemble)
                    .WithMany(p => p.PerformanceMusic)
                    .HasForeignKey(d => d.EnsembleId)
                    .HasConstraintName("PerformanceMusic_Ensemble_FK");

                entity.HasOne(d => d.Music)
                    .WithMany(p => p.PerformanceMusic)
                    .HasForeignKey(d => d.MusicId)
                    .HasConstraintName("PerformanceMusic_Music_FK");

                entity.HasOne(d => d.Performance)
                    .WithMany(p => p.PerformanceMusic)
                    .HasForeignKey(d => d.PerformanceId)
                    .HasConstraintName("PerformanceMusic_Performance_FK");
            });

            modelBuilder.Entity<Performances>(entity =>
            {
                entity.HasKey(e => e.PerformanceId);

                entity.Property(e => e.PerformanceId).HasColumnName("performanceID");

                entity.Property(e => e.LocationId).HasColumnName("locationID");

                entity.HasOne(d => d.Location)
                    .WithMany(p => p.Performances)
                    .HasForeignKey(d => d.LocationId)
                    .HasConstraintName("Performances_Location_FK");
            });

            modelBuilder.Entity<Person>(entity =>
            {
                entity.Property(e => e.PersonId).HasColumnName("personID");

                entity.Property(e => e.Dob)
                    .HasColumnName("DOB")
                    .HasColumnType("date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnName("email")
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasColumnName("firstName")
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasColumnName("lastName")
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .HasColumnName("password")
                    .HasMaxLength(150)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Seniority>(entity =>
            {
                entity.Property(e => e.SeniorityId).HasColumnName("seniorityID");

                entity.Property(e => e.SeniorityName)
                    .IsRequired()
                    .HasColumnName("seniorityName")
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Students>(entity =>
            {
                entity.HasKey(e => e.StudentId);

                entity.Property(e => e.StudentId).HasColumnName("studentID");

                entity.Property(e => e.PersonId).HasColumnName("personID");

                entity.HasOne(d => d.Person)
                    .WithMany(p => p.Students)
                    .HasForeignKey(d => d.PersonId)
                    .HasConstraintName("Student_Person_FK");
            });

            modelBuilder.Entity<Tutors>(entity =>
            {
                entity.HasKey(e => e.TutorId);

                entity.Property(e => e.TutorId).HasColumnName("tutorID");

                entity.Property(e => e.PersonId).HasColumnName("personID");

                entity.HasOne(d => d.Person)
                    .WithMany(p => p.Tutors)
                    .HasForeignKey(d => d.PersonId)
                    .HasConstraintName("Tutor_Person_FK");
            });
        }
    }
}
