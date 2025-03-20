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