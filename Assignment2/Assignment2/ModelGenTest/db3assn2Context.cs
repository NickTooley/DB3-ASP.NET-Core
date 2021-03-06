﻿using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Assignment2.ModelGenTest
{
    public partial class db3assn2Context : DbContext
    {
        public db3assn2Context()
        {
        }

        public db3assn2Context(DbContextOptions<db3assn2Context> options)
            : base(options)
        {
        }

        public virtual DbSet<AspNetRoleClaims> AspNetRoleClaims { get; set; }
        public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUserRoles> AspNetUserRoles { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<AspNetUserTokens> AspNetUserTokens { get; set; }
        public virtual DbSet<Classes> Classes { get; set; }
        public virtual DbSet<ClassList> ClassList { get; set; }
        public virtual DbSet<Enrollment> Enrollment { get; set; }
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
        public virtual DbSet<StudentGuardians> StudentGuardians { get; set; }
        public virtual DbSet<Students> Students { get; set; }
        public virtual DbSet<Tutors> Tutors { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=192.168.0.149;Initial Catalog=db3assn2;User ID=SA;Password=P@ssw0rd;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AspNetRoleClaims>(entity =>
            {
                entity.HasIndex(e => e.RoleId);

                entity.Property(e => e.RoleId).IsRequired();

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetRoleClaims)
                    .HasForeignKey(d => d.RoleId);
            });

            modelBuilder.Entity<AspNetRoles>(entity =>
            {
                entity.HasIndex(e => e.NormalizedName)
                    .HasName("RoleNameIndex")
                    .IsUnique()
                    .HasFilter("([NormalizedName] IS NOT NULL)");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Name).HasMaxLength(256);

                entity.Property(e => e.NormalizedName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetUserClaims>(entity =>
            {
                entity.HasIndex(e => e.UserId);

                entity.Property(e => e.UserId).IsRequired();

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserClaims)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserLogins>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

                entity.HasIndex(e => e.UserId);

                entity.Property(e => e.UserId).IsRequired();

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserLogins)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserRoles>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.RoleId });

                entity.HasIndex(e => e.RoleId);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetUserRoles)
                    .HasForeignKey(d => d.RoleId);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserRoles)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUsers>(entity =>
            {
                entity.HasIndex(e => e.NormalizedEmail)
                    .HasName("EmailIndex");

                entity.HasIndex(e => e.NormalizedUserName)
                    .HasName("UserNameIndex")
                    .IsUnique()
                    .HasFilter("([NormalizedUserName] IS NOT NULL)");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Email).HasMaxLength(256);

                entity.Property(e => e.NormalizedEmail).HasMaxLength(256);

                entity.Property(e => e.NormalizedUserName).HasMaxLength(256);

                entity.Property(e => e.UserName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetUserTokens>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserTokens)
                    .HasForeignKey(d => d.UserId);
            });

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

            modelBuilder.Entity<Enrollment>(entity =>
            {
                entity.HasKey(e => new { e.StudentId, e.InstrumentId });

                entity.Property(e => e.StudentId).HasColumnName("studentID");

                entity.Property(e => e.InstrumentId).HasColumnName("instrumentID");

                entity.Property(e => e.LessonLevel).HasColumnName("lessonLevel");

                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.Enrollment)
                    .HasForeignKey(d => d.InstrumentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Enrollment_Instrument_FK");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.Enrollment)
                    .HasForeignKey(d => d.StudentId)
                    .HasConstraintName("Enrollment_Student_FK");
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

                entity.Property(e => e.InstrumentName)
                    .IsRequired()
                    .HasColumnName("instrumentName")
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.InventoryNumber).HasColumnName("inventoryNumber");

                entity.Property(e => e.MaxClassSize)
                    .HasColumnName("maxClassSize")
                    .HasDefaultValueSql("((8))");

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

                entity.Property(e => e.MusicName)
                    .IsRequired()
                    .HasColumnName("musicName")
                    .HasMaxLength(30)
                    .IsUnicode(false);
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
                entity.HasIndex(e => e.Email)
                    .HasName("Person_Email")
                    .IsUnique();

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

            modelBuilder.Entity<StudentGuardians>(entity =>
            {
                entity.HasKey(e => e.StudentId);

                entity.Property(e => e.StudentId)
                    .HasColumnName("studentID")
                    .ValueGeneratedNever();

                entity.Property(e => e.ContactPhone)
                    .IsRequired()
                    .HasColumnName("contactPhone")
                    .HasMaxLength(20)
                    .IsUnicode(false);

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

                entity.HasOne(d => d.Student)
                    .WithOne(p => p.StudentGuardians)
                    .HasForeignKey<StudentGuardians>(d => d.StudentId)
                    .HasConstraintName("Student_Guardians_FK");
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
