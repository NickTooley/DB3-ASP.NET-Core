IF OBJECT_ID('Enrollments') IS NOT NULL DROP TABLE Enrollments
IF OBJECT_ID('OpenDivision') IS NOT NULL DROP TABLE OpenDivision
IF OBJECT_ID('Under18') IS NOT NULL DROP TABLE Under18
IF OBJECT_ID('Performances') IS NOT NULL DROP TABLE Performances
IF OBJECT_ID('SheetMusic') IS NOT NULL DROP TABLE SheetMusic
IF OBJECT_ID('InstrumentHires') IS NOT NULL DROP TABLE InstrumentHires
IF OBJECT_ID('Instruments') IS NOT NULL DROP TABLE Instruments
IF OBJECT_ID('ContactInformation') IS NOT NULL DROP TABLE ContactInformation
IF OBJECT_ID('LessonSchedule') IS NOT NULL DROP TABLE LessonSchedule
IF OBJECT_ID('Lessons') IS NOT NULL DROP TABLE Lessons
IF OBJECT_ID('Students') IS NOT NULL DROP TABLE Students
IF OBJECT_ID('Tutors') IS NOT NULL DROP TABLE Tutors
IF OBJECT_ID('Administrators') IS NOT NULL DROP TABLE Administrators
IF OBJECT_ID('Persons') IS NOT NULL DROP TABLE Persons
IF OBJECT_ID('Ensembles') IS NOT NULL DROP TABLE Ensembles

CREATE TABLE Ensembles
(
	EnsembleName						VARCHAR(30)	    NOT NULL,

	Constraint PK_Enembles PRIMARY KEY(EnsembleName),
)

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