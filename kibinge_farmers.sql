CREATE DATABASE kibinge_farmers;

USE kibinge_farmers;
DESC kibinge_farmers

CREATE TABLE farmers(
    farmerID INT(10)PRIMARY KEY,
    name VARCHAR(250),
    address VARCHAR(250),
    contact VARCHAR(255));

INSERT INTO farmers(farmerID,name,address,contact) VALUES(1,'John Kyambade','kibinge Village','+256700111111');
INSERT INTO farmers(farmerID,name,address,contact) VALUES(2,'Sarah Nambi','kiwangala Town','+2567002222222');
INSERT INTO farmers(farmerID,name,address,contact) VALUES(3, 'Paul Okello','Lwengo District','+256700333333');
SELECT*FROM farmers;
DESC farmers;

CREATE TABLE crop(
    cropID INT(10) PRIMARY KEY,
    cropName VARCHAR(255),
    type VARCHAR(255),
    season VARCHAR(255)
);

INSERT INTO crop(cropID,cropName,type,season ) VALUES(101,'coffee','cash crop','rainy');
INSERT INTO crop(cropID,cropName,type,season ) VALUES(102,'maize','food crop','dry');
INSERT INTO crop(cropID,cropName,type,season ) VALUES(103,'beans','food crop','rainy');

SELECT * FROM crop

CREATE TABLE farmer_crop(
    farmerCropID INT(10) PRIMARY KEY,
    farmerID INT(10),
    cropID INT(10) ,
    areaCultivated VARCHAR(255),
    yeild VARCHAR(255),
    FOREIGN KEY (farmerID) REFERENCES farmers(farmerID),
    FOREIGN KEY (cropID) REFERENCES crop(cropID)
);


INSERT INTO farmer_crop(farmerCropID,farmerID,cropID,areaCultivated,yeild) VALUES(1,1,101,5,100);
INSERT INTO farmer_crop(farmerCropID,farmerID,cropID,areaCultivated,yeild) VALUES(2,1,102,3.5,700);
INSERT INTO farmer_crop(farmerCropID,farmerID,cropID,areaCultivated,yeild) VALUES(3,3,103,2,400);
SELECT*FROM farmer_crop;

CREATE TABLE market(
    marketID INT(10) PRIMARY KEY,
    marketName VARCHAR(255),
    location VARCHAR(255)
);

INSERT INTO market(marketID,marketName,location) VALUES(201,'kibinge market','kibinge');
INSERT INTO market(marketID,marketName,location) VALUES(202,'masaka central market','masaka');
INSERT INTO market(marketID,marketName,location) VALUES(203,'lwengo farmers market','lwengo');
SELECT* FROM market

CREATE VIEW 2b AS SELECT* FROM crop WHERE type='food crop'

SELECT* FROM 2b

CREATE TABLE transactionSales(
    transactionID INT(10) PRIMARY KEY,
    farmerCropID INT(10),
    marketID INT(10),
    date VARCHAR(255),
    quantitySold INT(10),
    unitPrice DECIMAL(10),
    totalamount INT(20),
    FOREIGN KEY(farmerCropID) REFERENCES farmer_crop(farmerCropID),
    FOREIGN KEY(marketID) REFERENCES market(marketID)
);