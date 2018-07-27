CREATE TABLE Location (
    LocationID      INT(20)         IDENTITY(1,1)   NOT NULL,
    Exposure        VARCHAR(20)     NOT NULL,
    SunlightPercent DECIMAL(1,2)    NOT NULL,
    Moisture        DECIMAL(1,2)    NOT NULL,
    PRIMARY KEY(LocationID)

);

CREATE TABLE Technician (
    TechnicianID    INT(20)         IDENTITY(1,1)   NOT NULL,
    TechName        VARCHAR(40)     NOT NULL,

    PRIMARY KEY(TechnicianID)
);

CREATE TABLE Crop (
    CropID          INT(20)         IDENTITY(1,1)   NOT NULL,
    CropName        VARCHAR(40)     NOT NULL,
    SunPercent      DECIMAL(1,2)    NOT NULL,
    Moisture        DECIMAL(1,2)    NOT NULL,
    HarvestWeight   DECIMAL(1,2)    NOT NULL,

    PRIMARY KEY(CropID)
);




