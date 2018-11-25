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
    email               VARCHAR(60)     NOT NULL UNIQUE,
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
    studentID           INT             NOT NULL PRIMARY KEY,
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
    maxClassSize        INT             NOT NULL DEFAULT(8),
    inventoryNumber     INT             NOT NULL,
    studentFee          SMALLMONEY      ,
    openFee             SMALLMONEY      ,
    hireFee             SMALLMONEY      ,
    instrumentName      VARCHAR(30)     ,
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
    musicName           VARCHAR(30)     NOT NULL

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

CREATE TABLE Enrollment
(
    studentID           INT             NOT NULL,
    instrumentID        INT             NOT NULL,
    lessonLevel         INT             NOT NULL,

    PRIMARY KEY (studentID, instrumentID),
    Constraint Enrollment_Student_FK FOREIGN KEY (studentID) REFERENCES Students(studentID) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint Enrollment_Instrument_FK FOREIGN KEY (instrumentID) REFERENCES Instruments(instrumentID) ON DELETE NO ACTION ON UPDATE NO ACTION
)
