CREATE DATABASE kshop;
show databases;
use kshop;
CREATE TABLE product(
    pdtID INT(11) PRIMARY KEY,
    productname VARCHAR(20),
    price INT(20),
    stockQty VARCHAR(20)
);
SHOW TABLES;
DESC product;
CREATE TABLE customer(
    CustomerID INT PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(30),
    telephonenumber INT(10),
    Email VARCHAR(100),
    pdtID int,
    FOREIGN KEY (pdtID) REFERENCES product(pdtID)
);
SHOW TABLES;
DESC customer;
INSERT INTO product(pdtID,productname,price,stockQty)
VALUES(1,'sugar',8000,2),(2,'salt',3000,4),(3,'toothpaste',6000,4);

INSERT INTO product(pdtID,productname,price,stockQty)
VALUES(4,'pencils',1000,10);
SELECT * FROM product;

INSERT INTO customer(CustomerID,fname,lname,telephonenumber,Email,pdtID)
VALUES(1,'Tonny','Kato',0788456367,'TKato@gmail.com',4),
(2,'Joseph','Kizito',0788456364,'japh@gmail.com',4),(3,'Joel','Bekam',0788456362,'rol@gmail.com',3);
SELECT * FROM customer;

UPDATE customer SET pdtID=2 WHERE fname='Tonny';
SELECT * FROM customer WHERE fname='Tonny';

UPDATE customer SET pdtID=2 WHERE fname='Tony';

SELECT * FROM customer WHERE fname='Tony';

SELECT fname,lname FROM customer;

UPDATE customer SET lname='MAtovu' WHERE CustomerID=1;

INSERT INTO customer(CustomerID,fname,lname,telephonenumber,Email,pdtID)
VALUES(4,'Lynnet','Keine',0788845633,'lynn@gmail.com',1);

UPDATE customer SET fname='Jacqueline',lname='Ainebyoona' WHERE CustomerID=4;

ALTER TABLE  product ADD COLUMN payment_date DATE DEFAULT '2025-02-26';

ALTER  TABLE customer ADD COLUMN Age INT CHECK(Age>=18);

UPDATE customer SET Age=19 WHERE CustomerID=1;

UPDATE customer SET Age= 21 WHERE CustomerID=2;
UPDATE customer SET Age= 20 WHERE CustomerID=3;
UPDATE customer SET Age= 22 WHERE CustomerID=4;
--Changing a column name
ALTER TABLE customer CHANGE telephonenumber Contacts INT(10);

-- Inserting a row
INSERT INTO product(pdtID,productname,price,stockQty) 
VALUES(5,'water_bottle',1200,12);

UPDATE product SET price=1400 WHERE PdtID=5;

ALTER TABLE product ADD COLUMN payment_mode VARCHAR(20);
UPDATE product SET payment_mode='not null' WHERE pdtID=5;
--Deleting a value within a table
DELETE FROM customer WHERE CustomerID=4;

ALTER TABLE product CHANGE stockQTy Qty_purchased VARCHAR(20);