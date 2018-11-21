IF OBJECT_ID('Person') IS NOT NULL DROP TABLE Person
IF OBJECT_ID('Students') IS NOT NULL DROP TABLE Students
IF OBJECT_ID('Tutors') IS NOT NULL DROP TABLE Tutors
IF OBJECT_ID('StudentGuardians') IS NOT NULL DROP TABLE StudentGuardians
IF OBJECT_ID('InstrumentHire') IS NOT NULL DROP TABLE InstrumentHire
IF OBJECT_ID('ClassList') IS NOT NULL DROP TABLE ClassList
IF OBJECT_ID('Classes') IS NOT NULL DROP TABLE Classes
IF OBJECT_ID('PayScales') IS NOT NULL DROP TABLE PayScales
IF OBJECT_ID('Seniority') IS NOT NULL DROP TABLE Seniority
-- IF OBJECT_ID('Fees') IS NOT NULL DROP TABLE Fees
-- IF OBJECT_ID('feeType') IS NOT NULL DROP TABLE feeType
IF OBJECT_ID('Instruments') IS NOT NULL DROP TABLE Instruments
IF OBJECT_ID('MusicInstruments') IS NOT NULL DROP TABLE MusicInstruments
IF OBJECT_ID('Music') IS NOT NULL DROP TABLE Music
IF OBJECT_ID('Performances') IS NOT NULL DROP TABLE Performances
IF OBJECT_ID('PerformanceMusic') IS NOT NULL DROP TABLE PerformanceMusic
IF OBJECT_ID('Locations') IS NOT NULL DROP TABLE Locations

CREATE TABLE Person 
(
    personID            INT             IDENTITY(0,1) PRIMARY KEY,
    email               VARCHAR(60)     NOT NULL,
    firstName           VARCHAR(20)     NOT NULL,
    lastName            VARCHAR(30)     NOT NULL,
    password            VARCHAR(150)    ,
    DOB                 DATE            NOT NULL,
                          
)

CREATE TABLE Ensembles
(
    ensembleID          INT             IDENTITY(0,1) PRIMARY KEY,
	ensembleName		VARCHAR(30)	    NOT NULL,

)

CREATE TABLE EnsembleMusicians
(
    ensembleID          INT             NOT NULL,
    personID            INT             NOT NULL,
	
	PRIMARY KEY (ensembleID,personID),
    Constraint Ensemble_Musician_FK FOREIGN KEY (ensembleID) REFERENCES Ensembles(ensembleID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Person_Ensemble_FK FOREIGN KEY (personID) REFERENCES Person(personID) ON DELETE CASCADE ON UPDATE CASCADE 
)

CREATE TABLE Students
(
    studentID           INT             IDENTITY(0,1) PRIMARY KEY,
    personID            INT             NOT NULL,

    Constraint Student_Person_FK FOREIGN KEY (personID) REFERENCES Person(personID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Tutors
(
    tutorID             INT             IDENTITY(0,1) PRIMARY KEY,
    personID            INT             NOT NULL,

    Constraint Tutor_Person_FK FOREIGN KEY (personID) REFERENCES Person(personID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE StudentGuardians
(
    studentID           INT             NOT NULL,
    firstName           VARCHAR(20)     NOT NULL,
    lastName            VARCHAR(30)     NOT NULL,
    contactPhone        VARCHAR(20)     NOT NULL,
    email               VARCHAR(60)     NOT NULL,

    Constraint Student_Guardians_FK FOREIGN KEY (studentID) REFERENCES Students(studentID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Instruments
(
    instrumentID        INT             IDENTITY(0,1) PRIMARY KEY,
    headTutorID         INT             NOT NULL,
    maxClassSize        INT             NOT NULL,
    inventoryNumber     INT             NOT NULL,
    openFee             SMALLMONEY      ,
    studentFee          SMALLMONEY      ,
    hireFee             SMALLMONEY      ,

    Constraint Instrument_Head_Tutor_FK FOREIGN KEY (headTutorID) REFERENCES Tutors(tutorID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE InstrumentHire
(
    studentID           INT             NOT NULL,
    instrumentID        INT             NOT NULL,

	PRIMARY KEY(studentID, instrumentID),
    Constraint Instrument_Hire_Student_FK FOREIGN KEY (studentID) REFERENCES Students(studentID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    Constraint Instrument_Hire_Instrument_FK FOREIGN KEY (instrumentID) REFERENCES Instruments(instrumentID) ON DELETE CASCADE ON UPDATE CASCADE 
)

CREATE TABLE Seniority
(
    seniorityID         INT             IDENTITY(0,1) PRIMARY KEY,
    seniorityName       VARCHAR(20)     NOT NULL,

)

CREATE TABLE PayScales
(
    seniorityID         INT             NOT NULL,
    instrumentID        INT             NOT NULL,
    pay                 SMALLMONEY      NOT NULL,
	
	PRIMARY KEY (seniorityID,instrumentID),
    Constraint Payscales_Seniority_FK FOREIGN KEY (seniorityID) REFERENCES Seniority(seniorityID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Payscales_Instrument_FK FOREIGN KEY (instrumentID) REFERENCES Instruments(instrumentID) ON DELETE CASCADE ON UPDATE CASCADE 
)

CREATE TABLE InstrumentTutors
(
    tutorID             INT             NOT NULL,
    instrumentID        INT             NOT NULL,
    seniorityID         INT             NOT NULL,

	PRIMARY KEY (tutorID,instrumentID, seniorityID),
    Constraint Instrument_Tutors_Tutor_FK FOREIGN KEY (tutorID) REFERENCES Tutors(tutorID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Instrument_Tutors_Instrument_FK FOREIGN KEY (instrumentID) REFERENCES Instruments(instrumentID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    Constraint Instrument_Tutors_Seniority_FK FOREIGN KEY (seniorityID) REFERENCES Seniority(seniorityID) ON DELETE CASCADE ON UPDATE CASCADE 
)

CREATE TABLE Classes
(
    classID             INT             IDENTITY(0,1) PRIMARY KEY,
    instrumentID        INT             NOT NULL,
    tutorID             INT             NOT NULL,
    lessonLevel         INT             NOT NULL,

    Constraint Classes_Instrument_FK FOREIGN KEY (instrumentID) REFERENCES Instruments(instrumentID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Classes_Tutor_FK FOREIGN KEY (tutorID) REFERENCES Tutors(tutorID) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE ClassList
(
    classID             INT             NOT NULL,
    studentID           INT             NOT NULL,

	PRIMARY KEY (classID,studentID),
    Constraint Classlist_Class_FK FOREIGN KEY (classID) REFERENCES Classes(classID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Classlist_Student_FK FOREIGN KEY (studentID) REFERENCES Students(studentID) ON DELETE NO ACTION ON UPDATE NO ACTION 
)

CREATE TABLE Music
(
    musicID             INT             IDENTITY(0,1) PRIMARY KEY,
    level               INT             NOT NULL,

)

CREATE TABLE MusicInstruments
(
    musicID             INT             NOT NULL,
    instrumentID        INT             NOT NULL,

	PRIMARY KEY (musicID,instrumentID),
    Constraint MusicInstruments_Music_FK FOREIGN KEY (musicID) REFERENCES Music(musicID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint MusicInstruments_Instrument_FK FOREIGN KEY (instrumentID) REFERENCES Instruments(instrumentID) ON DELETE CASCADE ON UPDATE CASCADE 
)

CREATE TABLE Locations
(
    locationID          INT             IDENTITY(0,1) PRIMARY KEY,
    address             VARCHAR(80)     NOT NULL,
    name                VARCHAR(50)     NOT NULL,

)

CREATE TABLE Performances
(
    performanceID       INT             IDENTITY(0,1) PRIMARY KEY,
    locationID          INT             NOT NULL,

    Constraint Performances_Location_FK FOREIGN KEY (locationID) REFERENCES Locations(locationID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE PerformanceMusic
(
    performanceID       INT             NOT NULL,
    musicID             INT             NOT NULL,
    ensembleID          INT             NOT NULL,

	PRIMARY KEY (performanceID,musicID, ensembleID),
    Constraint PerformanceMusic_Performance_FK FOREIGN KEY (performanceID) REFERENCES Performances(performanceID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint PerformanceMusic_Music_FK FOREIGN KEY (musicID) REFERENCES Music(musicID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint PerformanceMusic_Ensemble_FK FOREIGN KEY (ensembleID) REFERENCES Ensembles(ensembleID) ON DELETE CASCADE ON UPDATE CASCADE
)


--dsjbsakjdbsakjdbaskjbdsajk

CREATE TABLE Persons
(
	ID									INT				IDENTITY(0,1),
	FirstName						    VARCHAR(15)		NOT NULL,
	LastName			                VARCHAR(15)	    NOT NULL,
	DateOfBirth							DATE	        NOT NULL,
	Ensemble			                VARCHAR(30)	    ,

	Constraint PK_Persons PRIMARY KEY(ID),
	FOREIGN KEY (Ensemble) REFERENCES Ensembles(EnsembleName),
)

CREATE TABLE ContactInformation
(
	PersonID							INT				NOT NULL,
	PhoneNumber							VARCHAR(15)		NOT NULL,
	EmailAddress						VARCHAR(30)	    NOT NULL,
	HomeAddress							VARCHAR(30)		NOT NULL,

	Constraint PK_ContactInformation PRIMARY KEY(PersonID),
	FOREIGN KEY (PersonID) REFERENCES Persons(ID),
)

CREATE TABLE Administrators
(
	PersonID							INT				NOT NULL,

	Constraint PK_Administrators PRIMARY KEY(PersonID),
	FOREIGN KEY (PersonID) REFERENCES Persons(ID) ON DELETE CASCADE,
)

CREATE TABLE Students
(
	PersonID							INT				NOT NULL,

	Constraint PK_Students PRIMARY KEY(PersonID),
	FOREIGN KEY (PersonID) REFERENCES Persons(ID) ON DELETE CASCADE,
)

CREATE TABLE Tutors
(
	PersonID							INT				NOT NULL,
	ATCL								BIT				NOT NULL,			
	Seniority							VARCHAR(10)		NOT NULL,

	Constraint PK_Tutors PRIMARY KEY(PersonID),
	FOREIGN KEY (PersonID) REFERENCES Persons(ID) ON DELETE CASCADE,
)

CREATE TABLE Enrollments
(
	PersonID							INT				NOT NULL,
	DateOfEnrollment					DATE	        NOT NULL,
	Ensemble			                VARCHAR(30)	    NOT NULL,

	Constraint PK_Enrollments PRIMARY KEY(PersonID),
	FOREIGN KEY (PersonID) REFERENCES Persons(ID) ON DELETE CASCADE,
	FOREIGN KEY (Ensemble) REFERENCES Ensembles(EnsembleName),
)

CREATE TABLE OpenDivision
(
	PersonID							INT				NOT NULL,

	Constraint PK_OpenDivision PRIMARY KEY(PersonID),
	FOREIGN KEY (PersonID) REFERENCES Persons(ID) ON DELETE CASCADE,
)

CREATE TABLE Under18
(
	PersonID							INT				NOT NULL,

	Constraint PK_Under18 PRIMARY KEY(PersonID),
	FOREIGN KEY (PersonID) REFERENCES Persons(ID) ON DELETE CASCADE,
)

CREATE TABLE Instruments
(
	InstrumentName						VARCHAR(30)	    NOT NULL,

	Constraint PK_Instruments PRIMARY KEY(InstrumentName),
)

CREATE TABLE InstrumentHires
(
	StudentID							INT				NOT NULL,
	InstrumentName						VARCHAR(30)		NOT NULL,

	Constraint PK_InstrumentHires PRIMARY KEY(StudentID),
	FOREIGN KEY (StudentID) REFERENCES Students(PersonID) ON DELETE CASCADE,
	FOREIGN KEY (InstrumentName) REFERENCES Instruments(InstrumentName) ON DELETE CASCADE,
)

CREATE TABLE Lessons
(
	LessonName							VARCHAR(30)		NOT NULL,

	Constraint PK_Lessons PRIMARY KEY(LessonName),
)

CREATE TABLE LessonSchedule
(
	LessonName							VARCHAR(30)		NOT NULL,
	LessonTime							TIME			NOT NULL,
	GroupSize							INT				,
	LessonLevel							INT				NOT NULL,
	TutorID								INT				NOT NULL,

	CONSTRAINT PK_LessonSchedule PRIMARY KEY (LessonName,LessonTime),
	FOREIGN KEY (LessonName) REFERENCES Lessons(LessonName),
	FOREIGN KEY (TutorID) REFERENCES Tutors(PersonID),
)

CREATE TABLE SheetMusic
(
	PieceName							VARCHAR(30)		NOT NULL,
	NumberOfCopies						INT				NOT NULL,
	InstrumentName						VARCHAR(30)		NOT NULL,
	Orchestral							BIT				NOT NULL,

	CONSTRAINT PK_SheetMusic PRIMARY KEY (PieceName,InstrumentName),
	FOREIGN KEY (InstrumentName) REFERENCES Instruments(InstrumentName),
)

CREATE TABLE Performances
(
	PerformanceLocation					VARCHAR(30)		NOT NULL,
	DateOfPerformance					DATE	        NOT NULL,
	TimeOfPerformance					TIME			NOT NULL,
	PlayedRecord						VARCHAR(30)		NOT NULL,

	CONSTRAINT PK_Performances PRIMARY KEY (PerformanceLocation,DateOfPerformance),
)

--(NAME)
INSERT INTO Ensembles VALUES('Training Orchestra')
INSERT INTO Ensembles VALUES('Junior Sinfonia')
INSERT INTO Ensembles VALUES('Community Orchestra')

--(FirstName,LastName,DoB,Ensemble)
INSERT INTO Persons VALUES('Admin','1','1998-01-25', NULL)
INSERT INTO Persons VALUES('Student','1','1998-01-25', 'Community Orchestra')
INSERT INTO Persons VALUES('Student','2','2000-01-25', 'Junior Sinfonia')
INSERT INTO Persons VALUES('U18','1','2010-01-25', 'Training Orchestra')
INSERT INTO Persons VALUES('Enroller','1','2008-01-25', NULL)
INSERT INTO Persons VALUES('Enroller','2','2008-01-25', NULL)
INSERT INTO Persons VALUES('Tutor','1','1998-01-25', NULL)
INSERT INTO Persons VALUES('Tutor','2','1998-01-25', NULL)
INSERT INTO Persons VALUES('Tutor','3','1998-01-25', NULL)

--(PersonID,PhoneNumber,EmailAddress,HomeAddress)
INSERT INTO ContactInformation VALUES (0, '01234567', 'email@email.com','01 Admin Street')
INSERT INTO ContactInformation VALUES (1, '01234567', 'email@email.com','01 Student Street')
INSERT INTO ContactInformation VALUES (2, '01234567', 'email@email.com','02 Student Street')
INSERT INTO ContactInformation VALUES (3, '01234567', 'email@email.com','01 U18 Street')
INSERT INTO ContactInformation VALUES (4, '01234567', 'email@email.com','01 Enroller Street')
INSERT INTO ContactInformation VALUES (5, '01234567', 'email@email.com','02 Enroller Street')
INSERT INTO ContactInformation VALUES (6, '01234567', 'email@email.com','01 Tutor Street')
INSERT INTO ContactInformation VALUES (7, '01234567', 'email@email.com','02 Tutor Street')
INSERT INTO ContactInformation VALUES (8, '01234567', 'email@email.com','03 Tutor Street')

--(PersonID)
INSERT INTO Students VALUES(1)
INSERT INTO Students VALUES(2)
INSERT INTO Students VALUES(3)

--(PersonID,ATCLQualification(0 False, 1 True),Seniority)
INSERT INTO Tutors VALUES(6,0,'Junior')
INSERT INTO Tutors VALUES(7,1,'Senior')
INSERT INTO Tutors VALUES(8,2,'Head')

--(PersonID,DateOfEnrollment,EnsembleEnrollingIn)
INSERT INTO Enrollments VALUES(4,'2018-01-25','Junior Sinfonia')
INSERT INTO Enrollments VALUES(5,'2018-01-25','Training Orchestra')

--(PersonID)
INSERT INTO OpenDivision VALUES(1)
INSERT INTO OpenDivision VALUES(2)

--(PersonID)
INSERT INTO Under18 VALUES (3)

--(PersonID)
INSERT INTO Administrators VALUES(0)

--(InstrumentName)
INSERT INTO Instruments VALUES('Recorder')
INSERT INTO Instruments VALUES('Violin')
INSERT INTO Instruments VALUES('Viola')
INSERT INTO Instruments VALUES('Cello')
INSERT INTO Instruments VALUES('Double Bass')
INSERT INTO Instruments VALUES('Flute')
INSERT INTO Instruments VALUES('Clarinet')
INSERT INTO Instruments VALUES('Oboe')
INSERT INTO Instruments VALUES('Bassoon')
INSERT INTO Instruments VALUES('Other woodwind')
INSERT INTO Instruments VALUES('Trumpet')
INSERT INTO Instruments VALUES('Trumbone')
INSERT INTO Instruments VALUES('French Horn')
INSERT INTO Instruments VALUES('Tuba')
INSERT INTO Instruments VALUES('Other Brass')
INSERT INTO Instruments VALUES('Percussion')

--(PersonID,IntrumentName)
INSERT INTO InstrumentHires VALUES(1,'Tuba')
INSERT INTO InstrumentHires VALUES(2,'Oboe')

--(LessonName)
INSERT INTO Lessons VALUES('Recorder')
INSERT INTO Lessons VALUES('Violin')
INSERT INTO Lessons VALUES('Viola')
INSERT INTO Lessons VALUES('Cello')
INSERT INTO Lessons VALUES('Double Bass')
INSERT INTO Lessons VALUES('Flute')
INSERT INTO Lessons VALUES('Clarinet')
INSERT INTO Lessons VALUES('Oboe')
INSERT INTO Lessons VALUES('Bassoon')
INSERT INTO Lessons VALUES('Other woodwind')
INSERT INTO Lessons VALUES('Trumpet')
INSERT INTO Lessons VALUES('Trumbone')
INSERT INTO Lessons VALUES('French Horn')
INSERT INTO Lessons VALUES('Tuba')
INSERT INTO Lessons VALUES('Other Brass')
INSERT INTO Lessons VALUES('Percussion')
INSERT INTO Lessons VALUES('Vocal Technique')
INSERT INTO Lessons VALUES('Music Theory')

--(LessonName,LessonTime,GroupSize,LessonLevel,TutorID)
INSERT INTO LessonSchedule VALUES('Music Theory', '08:30:00',0,0,6)
INSERT INTO LessonSchedule VALUES('Vocal Technique', '14:30:00',0,7,8)

--(PieceName,NumberOfCopies,IntrumentName,Orchestral(0 False, 1 True))
INSERT INTO SheetMusic VALUES('Piece1',20,'Oboe',0)
INSERT INTO SheetMusic VALUES('Piece2',20,'Tuba',1)
INSERT INTO SheetMusic VALUES('Piece2',30,'Trumpet',1)
INSERT INTO SheetMusic VALUES('Piece2',30,'Violin',1)

--(PerformanceLocation,PerformanceDate,PerformanceTime,PlayedRecord)
INSERT INTO Performances VALUES('STREET','2018-12-25','15:30:00','SomethingPlayed')
INSERT INTO Performances VALUES('ALLEYWAY','2018-12-25','16:30:00','SomeOtherThingPlayed')

SELECT * FROM Ensembles
SELECT * FROM Persons
SELECT * FROM ContactInformation
SELECT * FROM Administrators
SELECT * FROM Students
SELECT * FROM Enrollments
SELECT * FROM Instruments
SELECT * FROM InstrumentHires
SELECT * FROM Tutors
SELECT * FROM Lessons
SELECT * FROM LessonSchedule
SELECT * FROM SheetMusic
SELECT * FROM Performances