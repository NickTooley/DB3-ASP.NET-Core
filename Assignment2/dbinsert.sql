--Ensembles(name)
INSERT INTO Ensembles VALUES('Training Orchestra') --0
INSERT INTO Ensembles VALUES('Junior Sinfonia') --1
INSERT INTO Ensembles VALUES('Community Orchestra') --2

--Persons(email,firstName,lastName,password,DOB)
INSERT INTO Person VALUES('a@a.com','Sam','Hildreth', 'password', '2006-12-20') --1
INSERT INTO Person VALUES('b@b.com','Olivia','Finer', 'password', '2006-2-27') --2
INSERT INTO Person VALUES('c@c.com','Taylor','Johnston', 'password', '2012-8-10') --3
INSERT INTO Person VALUES('d@d.com','Rohil','Singh', 'password', '2009-5-20') --4
INSERT INTO Person VALUES('e@e.com','Dylan','Hall', 'password', '1978-4-18') --5
INSERT INTO Person VALUES('f@f.com','Mitch','Keenan', 'password', '1980-1-22') --6
INSERT INTO Person VALUES('g@g.com','Liam','Driver', 'password', '2005-9-23') --7
INSERT INTO Person VALUES('h@h.com','Victoria','Wilson', 'password', '1996-11-20') --8
INSERT INTO Person VALUES('i@i.com','Rosie','Wilson', 'password', '1996-10-2') --9
INSERT INTO Person VALUES('j@j.com','James','Ladanyi', 'password', '2002-12-10') --10

--Students(PersonID)
INSERT INTO Students VALUES(1) --1
INSERT INTO Students VALUES(2) --2
INSERT INTO Students VALUES(3) --3
INSERT INTO Students VALUES(4) --4
INSERT INTO Students VALUES(5) --5
INSERT INTO Students VALUES(7) --6
INSERT INTO Students VALUES(10) --7

--StudentGuardians(studentID, firstName, lastName, contactPhone, email)
INSERT INTO StudentGuardians VALUES(1,'Mama', 'Hildreth', '021453723', 'abc@abc.com')
INSERT INTO StudentGuardians VALUES(1,'Papa', 'Hildreth', '021452323', 'def@abc.com')
INSERT INTO StudentGuardians VALUES(2,'Jo', 'Finer', '021453244', 'jofiner@fonterra.com')
INSERT INTO StudentGuardians VALUES(3,'Michael', 'Johnston', '022453233', 'anz@anz.com')
INSERT INTO StudentGuardians VALUES(4,'Rohilla', 'Singh', '02712234564', 'bnz@bnz.com')
INSERT INTO StudentGuardians VALUES(5,'Dylan', 'Hall', '021454353', 'e@e.com')
INSERT INTO StudentGuardians VALUES(6,'Screw', 'Driver', '0214212393', 'asd@plumbing.com')
INSERT INTO StudentGuardians VALUES(0,'London', 'Ladanyi', '0234324723', 'london@england.co.uk')

--Tutors(personID)
INSERT INTO Tutors VALUES(6) --0
INSERT INTO Tutors VALUES(8) --1
INSERT INTO Tutors VALUES(9) --2

--Instruments(headTutorID, maxClassSize(default(8)), inventoryNumber, openFee, studentFee, hireFee, instrumentName)
INSERT INTO Instruments VALUES(2, 16, 10, 40, NULL, NULL, 'Recorder') --0
INSERT INTO Instruments VALUES(2, 8, 10, 50, 210, 40, 'Violin') --1
INSERT INTO Instruments VALUES(2, 8, 10, 50, 210, 40, 'Viola') --2
INSERT INTO Instruments VALUES(2, 8, 10, 50, 240, 80, 'Cello') --3
INSERT INTO Instruments VALUES(2, 8, 10, 50, 240, 80, 'Double Bass') --4
INSERT INTO Instruments VALUES(2, 8, 10, 50, 210, 40, 'Flute') --5
INSERT INTO Instruments VALUES(2, 8, 10, 50, 210, 40, 'Clarinet') --6
INSERT INTO Instruments VALUES(2, 8, 10, 50, 300, 80, 'Oboe') --7
INSERT INTO Instruments VALUES(2, 8, 10, 50, 300, 80, 'Bassoon') --8
INSERT INTO Instruments VALUES(2, 8, 10, 80, 300, 80, 'Other woodwind') --9
INSERT INTO Instruments VALUES(2, 8, 10, 50, 210, 40, 'Trumpet') --10
INSERT INTO Instruments VALUES(2, 8, 10, 50, 240, 40, 'Trombone') --11
INSERT INTO Instruments VALUES(2, 8, 10, 50, 240, 80, 'French Horn') --12
INSERT INTO Instruments VALUES(2, 8, 10, 50, 280, 80, 'Tuba') --13
INSERT INTO Instruments VALUES(2, 8,10, 80, 300, 80, 'Other Brass') --14
INSERT INTO Instruments VALUES(2, 8,10, 50, 280, NULL, 'Percussion') --15
INSERT INTO Instruments VALUES(2, 8,10, 80, 300, NULL, 'Vocal Technique') --16
INSERT INTO Instruments VALUES(2, 8,10, 80, 300, NULL, 'Music Theory') --17

--InstrumentHire(studentID, instrumentID)
INSERT INTO InstrumentHire VALUES(1, 10)
INSERT INTO InstrumentHire VALUES(2, 10)
INSERT INTO InstrumentHire VALUES(3, 10)
INSERT INTO InstrumentHire VALUES(5, 13)
INSERT INTO InstrumentHire VALUES(0, 7)

--Classes(instrumentID, tutorID, lessonLevel)
INSERT INTO Classes VALUES(10, 1, 4) --0
INSERT INTO Classes VALUES(13, 0, 2) --1
INSERT INTO Classes VALUES(7, 2, 6) --2


INSERT INTO Classes VALUES(0, 1, 4) --0
INSERT INTO Classes VALUES(1, 0, 2) --1
INSERT INTO Classes VALUES(2, 2, 6) --2
INSERT INTO Classes VALUES(3, 1, 4) --0
INSERT INTO Classes VALUES(4, 0, 2) --1
INSERT INTO Classes VALUES(5, 2, 6) --2
INSERT INTO Classes VALUES(6, 1, 4) --0
INSERT INTO Classes VALUES(8, 0, 2) --1
INSERT INTO Classes VALUES(9, 2, 6) --2
INSERT INTO Classes VALUES(11, 1, 4) --0
INSERT INTO Classes VALUES(12, 0, 2) --1
INSERT INTO Classes VALUES(14, 2, 6) --2
INSERT INTO Classes VALUES(15, 1, 4) --0
INSERT INTO Classes VALUES(16, 0, 2) --1
INSERT INTO Classes VALUES(17, 2, 6) --2

--ClassList(classID, studentID)
INSERT INTO ClassList VALUES(0, 1)
INSERT INTO ClassList VALUES(0, 2)
INSERT INTO ClassList VALUES(0, 3)
INSERT INTO ClassList VALUES(1, 5)
INSERT INTO ClassList VALUES(1, 4)
INSERT INTO ClassList VALUES(2, 0)
INSERT INTO ClassList VALUES(1, 6)



--Seniority(seniorityName)
INSERT INTO Seniority VALUES('Junior') --0
INSERT INTO Seniority VALUES('Senior') --1
INSERT INTO Seniority VALUES('Head') --2

--InstrumentTutors(tutorID, instrumentID, seniorityID)
INSERT INTO InstrumentTutors VALUES(1, 10, 1)
INSERT INTO InstrumentTutors VALUES(0, 13, 0)
INSERT INTO InstrumentTutors VALUES(2, 7, 2)

--Locations(address, name)
INSERT INTO Locations VALUES('1 Main Way', 'The Perfomance Center') --0
INSERT INTO Locations VALUES('730 Great King Street', 'The Baaa Bar') --1
INSERT INTO Locations VALUES('62 Best Street', 'Practice Hall') --2
INSERT INTO Locations VALUES('8 Music Way', 'The Hub') --3

--Performances(locationID)
INSERT INTO Performances VALUES(0)
INSERT INTO Performances VALUES(1)
INSERT INTO Performances VALUES(3)

--Music(level, musicName)
-- INSERT INTO Music VALUES(4, 'Music 1') --0
-- INSERT INTO Music VALUES(1, 'Music 2') --1
INSERT INTO Music VALUES(2, 'Music 3') --2
INSERT INTO Music VALUES(3, 'Music 4') --3
INSERT INTO Music VALUES(8, 'Music 5') --4
INSERT INTO Music VALUES(7, 'Music 6') --5

--MusicInstruments(musicID, instrumentID)
INSERT INTO MusicInstruments VALUES(0, 10)
INSERT INTO MusicInstruments VALUES(0, 13)
INSERT INTO MusicInstruments VALUES(0, 11)
INSERT INTO MusicInstruments VALUES(0, 7)
INSERT INTO MusicInstruments VALUES(0, 1)
INSERT INTO MusicInstruments VALUES(0, 9)
INSERT INTO MusicInstruments VALUES(1, 10)
INSERT INTO MusicInstruments VALUES(1, 13)
INSERT INTO MusicInstruments VALUES(1, 11)
INSERT INTO MusicInstruments VALUES(1, 7)
INSERT INTO MusicInstruments VALUES(2, 1)
INSERT INTO MusicInstruments VALUES(2, 9)
INSERT INTO MusicInstruments VALUES(2, 10)
INSERT INTO MusicInstruments VALUES(3, 10)
INSERT INTO MusicInstruments VALUES(3, 1)
INSERT INTO MusicInstruments VALUES(3, 9)
INSERT INTO MusicInstruments VALUES(3, 2)
INSERT INTO MusicInstruments VALUES(4, 2)
INSERT INTO MusicInstruments VALUES(5, 2)
INSERT INTO MusicInstruments VALUES(5, 3)
INSERT INTO MusicInstruments VALUES(5, 4)
INSERT INTO MusicInstruments VALUES(5, 5)
INSERT INTO MusicInstruments VALUES(5, 6)
INSERT INTO MusicInstruments VALUES(5, 7)

--PerformanceMusic(performanceID, musicID, ensembleID)
INSERT INTO PerformanceMusic VALUES(0,1,0)
INSERT INTO PerformanceMusic VALUES(0,1,1)
INSERT INTO PerformanceMusic VALUES(0,1,2)
INSERT INTO PerformanceMusic VALUES(1,1,0)
INSERT INTO PerformanceMusic VALUES(1,1,0)
INSERT INTO PerformanceMusic VALUES(2,1,0)

--EnsembleMusicians(ensembleID, personID)
INSERT INTO EnsembleMusicians VALUES(0,4)
INSERT INTO EnsembleMusicians VALUES(0,5)
INSERT INTO EnsembleMusicians VALUES(0,7)
INSERT INTO EnsembleMusicians VALUES(1,1)
INSERT INTO EnsembleMusicians VALUES(1,2)
INSERT INTO EnsembleMusicians VALUES(1,3)
INSERT INTO EnsembleMusicians VALUES(1,10)

--PayScales(seniorityID, instrumentID, pay)
INSERT INTO PayScales VALUES(0,0,50)
INSERT INTO PayScales VALUES(0,1,50)
INSERT INTO PayScales VALUES(0,2,50)
INSERT INTO PayScales VALUES(0,3,50)
INSERT INTO PayScales VALUES(0,4,50)
INSERT INTO PayScales VALUES(0,5,50)
INSERT INTO PayScales VALUES(0,6,50)
INSERT INTO PayScales VALUES(0,7,50)
INSERT INTO PayScales VALUES(0,8,50)
INSERT INTO PayScales VALUES(0,9,50)
INSERT INTO PayScales VALUES(0,10,50)
INSERT INTO PayScales VALUES(0,11,50)
INSERT INTO PayScales VALUES(0,12,50)
INSERT INTO PayScales VALUES(0,13,50)
INSERT INTO PayScales VALUES(0,14,50)
INSERT INTO PayScales VALUES(0,15,50)
INSERT INTO PayScales VALUES(0,16,50)
INSERT INTO PayScales VALUES(0,17,50)
INSERT INTO PayScales VALUES(1,0,80)
INSERT INTO PayScales VALUES(1,1,80)
INSERT INTO PayScales VALUES(1,2,80)
INSERT INTO PayScales VALUES(1,3,80)
INSERT INTO PayScales VALUES(1,4,80)
INSERT INTO PayScales VALUES(1,5,80)
INSERT INTO PayScales VALUES(1,6,80)
INSERT INTO PayScales VALUES(1,7,80)
INSERT INTO PayScales VALUES(1,8,80)
INSERT INTO PayScales VALUES(1,9,80)
INSERT INTO PayScales VALUES(1,10,80)
INSERT INTO PayScales VALUES(1,11,80)
INSERT INTO PayScales VALUES(1,12,80)
INSERT INTO PayScales VALUES(1,13,80)
INSERT INTO PayScales VALUES(1,14,80)
INSERT INTO PayScales VALUES(1,15,80)
INSERT INTO PayScales VALUES(1,16,80)
INSERT INTO PayScales VALUES(1,17,80)
INSERT INTO PayScales VALUES(2,0,100)
INSERT INTO PayScales VALUES(2,1,100)
INSERT INTO PayScales VALUES(2,2,100)
INSERT INTO PayScales VALUES(2,3,100)
INSERT INTO PayScales VALUES(2,4,100)
INSERT INTO PayScales VALUES(2,5,100)
INSERT INTO PayScales VALUES(2,6,100)
INSERT INTO PayScales VALUES(2,7,100)
INSERT INTO PayScales VALUES(2,8,100)
INSERT INTO PayScales VALUES(2,9,100)
INSERT INTO PayScales VALUES(2,10,100)
INSERT INTO PayScales VALUES(2,11,100)
INSERT INTO PayScales VALUES(2,12,100)
INSERT INTO PayScales VALUES(2,13,100)
INSERT INTO PayScales VALUES(2,14,100)
INSERT INTO PayScales VALUES(2,15,100)
INSERT INTO PayScales VALUES(2,16,100)
INSERT INTO PayScales VALUES(2,17,100)

