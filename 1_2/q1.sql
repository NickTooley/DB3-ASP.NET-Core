#Question 1
CREATE TABLE Location (
    LocationID      INT         IDENTITY(0,1)   NOT NULL PRIMARY KEY,
    Exposure        VARCHAR(20)     NOT NULL,
    SunlightPercent DECIMAL(3,2)    NOT NULL,
    Moisture        DECIMAL(3,2)    NOT NULL
);

CREATE TABLE Technician (
    TechnicianID    INT         IDENTITY(0,1)   NOT NULL PRIMARY KEY,
    TechName        VARCHAR(40)     NOT NULL,
);

CREATE TABLE Crop (
    CropID          INT         IDENTITY(0,1)   NOT NULL PRIMARY KEY,
    CropName        VARCHAR(40)     NOT NULL,
    SunPercent      DECIMAL(3,2)    NOT NULL,
    Moisture        DECIMAL(3,2)    NOT NULL,
    HarvestWeight   DECIMAL(3,2)    NOT NULL
);

CREATE TABLE Sowing (
    CropID          INT         NOT NULL,
    TechnicianID    INT         NOT NULL,
    LocationID      INT         NOT NULL,
    SowingDate      DATE        NOT NULL,
    SeedCount       INT         NOT NULL,

    CONSTRAINT Sowing_PK PRIMARY KEY (CropID, TechnicianID, LocationID, SowingDate),
    CONSTRAINT Sowing_FK_Crop FOREIGN KEY (CropID) REFERENCES Crop(CropID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Sowing_FK_Technician FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Sowing_FK_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE Harvest (
    CropID          INT             NOT NULL,
    TechnicianID    INT             NOT NULL,
    LocationID      INT             NOT NULL,
    HarvestDate     DATE            NOT NULL,
    HarvestUnits    INT             NOT NULL,
    HarvestWeight   DECIMAL(7,2)    NOT NULL,

    CONSTRAINT Harvest_PK PRIMARY KEY (CropID, TechnicianID, LocationID, HarvestDate),
    CONSTRAINT Harvest_FK_Crop FOREIGN KEY (CropID) REFERENCES Crop(CropID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Harvest_FK_Technician FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Harvest_FK_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE CASCADE ON UPDATE CASCADE

);

#Question 2
INSERT INTO Location(Exposure, SunlightPercent, Moisture)
VALUES('East', 0.28, 0.80),('North', 0.17, 0.84),('West', 0.38, 0.48),('South', 0.45, 0.66);

INSERT INTO Technician(TechName)
VALUES('Winograd'), ('Turing'), ('Savitch'), ('Wright');

INSERT INTO Crop(CropName, SunPercent,Moisture,HarvestWeight)
VALUES('Carrot',0.26,0.82,0.08),('Beet',0.44,0.80,0.04),('Corn',0.44,0.76,0.26),('Tomato',0.42,0.80,0.16),('Radish',0.28,0.84,0.02);

INSERT INTO Sowing(CropID, TechnicianID, LocationID, SowingDate, SeedCount)
VALUES(0,0,0,'20050418',28),(0,1,1,'20050414',14),(1,0,2,'20050418',36),(2,1,3,'20050414',20),(2,2,2,'20050419',12),(3,3,3,'20050425',38),(4,2,0,'20050430',30);

INSERT INTO Harvest(CropID, TechnicianID, LocationID, HarvestDate, HarvestUnits, HarvestWeight)
VALUES(0,2,0,'20050818',28, 2.32),(0,3,1,'20050816',12, 1.02),(2,1,3,'20050822',52,12.96),(2,2,2,'20050828',18,4.58),(3,3,3,'20050822',15,3.84),(4,2,0,'20050716',23,0.52);


#Question 3
INSERT INTO Crop(CropName, SunPercent, Moisture, HarvestWeight)
VALUES('Onion', 0.45,0.74,0.19);


#Question 4
INSERT INTO Sowing(CropID, TechnicianID, LocationID, SowingDate, SeedCount)
VALUES(5,1,1,'20050430',32);


#Question 5
SELECT Crop.CropName AS [Crop], Technician.TechName AS [Technician], Location.Exposure AS [Location], Sowing.SowingDate AS [Date], Sowing.SeedCount AS [Seed Count] 
FROM Sowing 
JOIN Crop ON Sowing.CropID = Crop.CropID 
JOIN Location ON Sowing.LocationID = Location.LocationID 
JOIN Technician ON Sowing.TechnicianID = Technician.TechnicianID
WHERE Crop.CropName = 'Carrot';


#Question 6
SELECT SUM(Harvest.HarvestUnits) AS [Total Corn Count], SUM(Harvest.HarvestWeight) AS [Total Corn Weight]
FROM Harvest
JOIN Crop ON Harvest.CropID = Crop.CropID
WHERE Crop.CropName = 'Corn';


#Question 7
SELECT Crop.CropName AS [Crop], SUM(Harvest.HarvestWeight) * 2.2 AS [Weight in lbs]
FROM Harvest
JOIN Crop ON Harvest.CropID = Crop.CropID
GROUP BY Crop.CropName;


#Question 8
SELECT Technician.TechName AS [Technician], Crop.CropName, Harvest.HarvestDate AS [Harvest Date], Harvest.HarvestUnits AS [Harvest Count]
FROM Harvest
JOIN Crop ON Harvest.CropID = Crop.CropID
JOIN Technician ON Harvest.TechnicianID = Technician.TechnicianID
WHERE Technician.TechName = 'Savitch'
ORDER BY Harvest.HarvestDate;


#Question 9
SELECT Crop.CropName AS [Crop], Location.Exposure AS [Location], Crop.Moisture AS [Water Needed], Location.Moisture AS [Water Available], Location.Moisture - Crop.Moisture AS [Difference]
FROM Crop, Location
WHERE Crop.CropName = 'Carrot';


#Question 10
SELECT Crop.CropName AS [Crop], Sowing.SowingDate AS [Sowing Date], Harvest.HarvestDate AS [Harvest Date], DATEDIFF(day, Sowing.SowingDate, Harvest.HarvestDate) AS [Difference]
FROM Crop 
JOIN Sowing ON Crop.CropID = Sowing.CropID
JOIN Harvest ON Crop.CropID = Harvest.CropID
WHERE Crop.CropName = 'Tomato' OR Crop.CropName = 'Radish';


#Question 11

#i) 
#Already implemented cascade

#ii)
DELETE FROM Crop WHERE CropName = 'Beet';

#iii)
SELECT COUNT(*) AS [Mentions of Beets]
FROM Crop
JOIN Sowing ON Sowing.CropID = Crop.CropID 
JOIN Harvest ON Crop.CropID = Harvest.CropID
WHERE Crop.CropName = 'Beet';