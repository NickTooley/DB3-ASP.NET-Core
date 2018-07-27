CREATE TABLE LightningStrikes 
(
    ID              INT(20)         NOT NULL AUTO_INCREMENT,
    Date            DATE            NOT NULL,
    Time            TIME            NOT NULL,
    Latitude        FLOAT(3,2)      NOT NULL,
    Longitude       FLOAT(3,2)      NOT NULL,
    Intensity       INT(10)         NOT NULL,

    PRIMARY KEY(ID)      
);


CREATE TABLE Fires
(
    ID              INT(20)         NOT NULL AUTO_INCREMENT,
    Date            DATE            NOT NULL,
    Latitude        FLOAT(3,2)      NOT NULL,
    Longitude       FLOAT(3,2)      NOT NULL,
    Area            FLOAT(5,2)      NOT NULL,

    PRIMARY KEY(ID)           
);

CREATE TABLE Pictures
(
    ID              INT(20)         NOT NULL AUTO_INCREMENT,
    StrikeID        INT(20)         NOT NULL,
    Date            DATE            NOT NULL,
    Filename        VARCHAR(255)    NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(StrikeID) REFERENCES LightningStrikes(ID) ON DELETE CASCADE ON UPDATE CASCADE
);