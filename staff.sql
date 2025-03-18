CREATE DATABASE class;
USE class;
SHOW  DATABASES;

CREATE TABLE staff(
    staffNo VARCHAR(20) PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(30),
    salary INT(10),
    age INT(10),
    gender VARCHAR(10)

);

DESC staff;
INSERT INTO staff (staffNo,fname,lname ,salary ,age ,gender) VALUES ('SL21','John','White',30000,32,'Male');
INSERT INTO staff (staffNo,fname,lname ,salary ,age ,gender) VALUES ('SG37','Ann','Beech',12000,28,'Female');
INSERT INTO staff (staffNo,fname,lname ,salary ,age ,gender) VALUES ('SG14','David','Ford',18000,25,'Male');
INSERT INTO staff (staffNo,fname,lname ,salary ,age ,gender) VALUES ('SA9','Mary','Howe',9000,32,'Female');
INSERT INTO staff (staffNo,fname,lname ,salary ,age ,gender) VALUES ('SG5','Susan','Brand',24000,35,'Female');
INSERT INTO staff (staffNo,fname,lname ,salary ,age ,gender) VALUES ('SL41','Julie','Lee',9000,20,'Female');

SELECT * FROM staff;
SELECT staffNo,fname,lname,salary,age,gender FROM staff;

SELECT salary FROM staff;

SELECT DISTINCT salary FROM staff;

SELECT salary,age,gender FROM staff;

