--Ensembles(name)
INSERT INTO Ensembles VALUES('Training Orchestra')
INSERT INTO Ensembles VALUES('Junior Sinfonia')
INSERT INTO Ensembles VALUES('Community Orchestra')

--Persons(email,firstName,lastName,password,DOB)
INSERT INTO Persons VALUES('a@a.com','Sam','Hildreth', "password", TO_DATE("20/12/2006", "DD/MM/YYYY")) --1
INSERT INTO Persons VALUES('b@b.com','Olivia','Finer', "password", TO_DATE("20/12/2006", "DD/MM/YYYY")) --2
INSERT INTO Persons VALUES('c@c.com','Taylor','Johnston', "password", TO_DATE("20/12/2012", "DD/MM/YYYY")) --3
INSERT INTO Persons VALUES('d@d.com','Rohil','Singh', "password", TO_DATE("20/12/2009", "DD/MM/YYYY")) --4
INSERT INTO Persons VALUES('e@e.com','Dylan','Hall', "password", TO_DATE("20/12/1978", "DD/MM/YYYY")) --5
INSERT INTO Persons VALUES('f@f.com','Mitch','Keenan', "password", TO_DATE("20/12/1980", "DD/MM/YYYY")) --6
INSERT INTO Persons VALUES('g@g.com','Liam','Driver', "password", TO_DATE("20/12/2005", "DD/MM/YYYY")) --7
INSERT INTO Persons VALUES('h@h.com','Victoria','Wilson', "password", TO_DATE("20/12/1996", "DD/MM/YYYY")) --8
INSERT INTO Persons VALUES('i@i.com','Rosie','Wilson', "password", TO_DATE("20/12/1996", "DD/MM/YYYY")) --9
INSERT INTO Persons VALUES('j@j.com','James','Ladanyi', "password", TO_DATE("20/12/2002", "DD/MM/YYYY")) --10

--Students(PersonID)
INSERT INTO Students VALUES(1)
INSERT INTO Students VALUES(2)
INSERT INTO Students VALUES(3)
INSERT INTO Students VALUES(4)
INSERT INTO Students VALUES(5)
INSERT INTO Students VALUES(7)
INSERT INTO Students VALUES(10)

--StudentGuardians(studentID, firstName, lastName, contactPhone, email)
INSERT INTO StudentGuardians VALUES(1,"Mama", "Hildreth", "021453723", "abc@abc.com")
INSERT INTO StudentGuardians VALUES(1,"Papa", "Hildreth", "021452323", "def@abc.com")
INSERT INTO StudentGuardians VALUES(2,"Jo", "Finer", "021453244", "jofiner@fonterra.com")
INSERT INTO StudentGuardians VALUES(3,"Michael", "Johnston", "022453233", "anz@anz.com")
INSERT INTO StudentGuardians VALUES(4,"Rohilla", "Singh", "02712234564", "bnz@bnz.com")
INSERT INTO StudentGuardians VALUES(5,"Dylan", "Hall", "021454353", "e@e.com")
INSERT INTO StudentGuardians VALUES(7,"Screw", "Driver", "0214212393", "asd@plumbing.com")
INSERT INTO StudentGuardians VALUES(10,"London", "Ladanyi", "0234324723", "london@england.co.uk")

--Tutors(personID)
INSERT INTO Tutors VALUES(6) --0
INSERT INTO Tutors VALUES(8) --1
INSERT INTO Tutors VALUES(9) --2

--Instruments(instrumentID, headTutorID, maxClassSize(default(8)), inventoryNumber, openFee, studentFee, hireFee)
INSERT INTO Instruments VALUES('Recorder', 9, 16, 10, 40, NULL, NULL) --0
INSERT INTO Instruments VALUES('Violin', 9, 10, 50, 210, 40) --1
INSERT INTO Instruments VALUES('Viola', 9, 10, 50, 210, 40) --2
INSERT INTO Instruments VALUES('Cello', 9, 10, 50, 240, 80) --3
INSERT INTO Instruments VALUES('Double Bass', 9, 10, 50, 240, 80) --4
INSERT INTO Instruments VALUES('Flute', 9, 10, 50, 210, 40) --5
INSERT INTO Instruments VALUES('Clarinet', 9, 10, 50, 210, 40) --6
INSERT INTO Instruments VALUES('Oboe', 9, 10, 50, 300, 80) --7
INSERT INTO Instruments VALUES('Bassoon', 9, 10, 50, 300, 80) --8
INSERT INTO Instruments VALUES('Other woodwind', 9, 10, 80, 300, 80) --9
INSERT INTO Instruments VALUES('Trumpet', 9, 10, 50, 210, 40) --10
INSERT INTO Instruments VALUES('Trombone', 9, 10, 50, 240, 40) --11
INSERT INTO Instruments VALUES('French Horn', 9, 10, 50, 240, 80) --12
INSERT INTO Instruments VALUES('Tuba', 9, 10, 50, 280, 80) --13
INSERT INTO Instruments VALUES('Other Brass', 9, 10, 80, 300, 80) --14
INSERT INTO Instruments VALUES('Percussion', 9, 10, 50, 280, NULL) --15
INSERT INTO Instruments VALUES('Vocal Technique', 9, 10, 80, 300, NULL) --16
INSERT INTO Instruments VALUES('Music Theory', 9, 10, 80, 300, NULL) --17

--InstrumentHire(studentID, instrumentID)



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