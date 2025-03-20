CREATE DATABASE home;
USE home;
SHOW DATABASES;

CREATE TABLE customer (
    customerID INT(15) PRIMARY KEY,
    customerName VARCHAR(225),
    location VARCHAR(225)
);

SHOW TABLES;

CREATE TABLE productTable (
    productID INT(10) PRIMARY KEY,
    productName VARCHAR(225),
    price DECIMAL(10, 2)
);
DESC productTable

INSERT INTO productTable (productID, productName, price) VALUES (101, 'laptop', 2500);
INSERT INTO productTable (productID, productName, price) VALUES (102, 'phone', 800.5);
INSERT INTO productTable (productID, productName, price) VALUES (103, 'tablet', 1200);
SELECT * FROM productTable;

CREATE TABLE orders (
    orderID INT(10) PRIMARY KEY,
    customerID INT(10),
    productID INT(10),
    quantity INT(10),
    orderDate VARCHAR(225),
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (productID) REFERENCES productTable(productID)
);
DESC orders