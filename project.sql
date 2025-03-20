CREATE DATABASE project;
USE project;

CREATE TABLE hospital(
    hospitalID VARCHAR(10) PRIMARY KEY,
    hospitalName VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(50),
    zipcode INT(10),
    emergencyNumber VARCHAR(50),
    email VARCHAR(255)
    );
INSERT INTO hospital(hospitalID,hospitalName,address,city,zipcode,emergencyNumber,email) VALUES('NM1','City Medicine Centre','123 Main St','New York',10001,'1-800-123456','info@citymedical.com');
INSERT INTO hospital(hospitalID,hospitalName,address,city,zipcode,emergencyNumber,email) VALUES('NM2','Green Valley Hospital','456 Elm St','Los Angeles',90012,'1-800-654321','contact@greenvalley.com');
INSERT INTO hospital(hospitalID,hospitalName,address,city,zipcode,emergencyNumber,email) VALUES('NM3','St. Marys Clinic','789 Oak St','Chicago',60601,'1-800-741852','support@stmaryclinic.com');
INSERT INTO hospital(hospitalID,hospitalName,address,city,zipcode,emergencyNumber,email) VALUES('NM4','Blue Cross Hospital','321 Pine St','Huston',77002,'1-800-789654','info@bluecrosshospital.com');
INSERT INTO hospital(hospitalID,hospitalName,address,city,zipcode,emergencyNumber,email) VALUES('NH5','Sunshine','852 Maple St','Miami',33101,'1-800-369258','help@sunshine.com');

SELECT*FROM hospital;

CREATE TABLE owner(
ownerID VARCHAR(10) PRIMARY KEY,
name VARCHAR(15),
title VARCHAR(15),
contact VARCHAR(30),
hospitalID VARCHAR(10),
FOREIGN KEY(hospitalID) REFERENCES hospital(hospitalID)
);


INSERT INTO owner(ownerID,name,title,contact,hospitalID) VALUES('AD1','Okello','CEO','+123-56476409','NM1');
INSERT INTO owner(ownerID,name,title,contact,hospitalID) VALUES('AD2','Mukasa','Founder','+457-89024579','NM2');
INSERT INTO owner(ownerID,name,title,contact,hospitalID) VALUES('AD3','Tumuzebaze','Chairman','+780-34569080','NM3');
INSERT INTO owner(ownerID,name,title,contact,hospitalID) VALUES('AD4','Odong','CEO','+345-78902345','NM4');
INSERT INTO owner(ownerID,name,title,contact,hospitalID) VALUES('AD5','Kitibwa','Chairman','+145-78905678','NM5');

SELECT*FROM owner;

CREATE TABLE employee(
    employeeID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(15),
    email VARCHAR(30),
    contact INT(10),
    speciality VARCHAR(25)
);

INSERT INTO employee(employeeID,name,email,contact,speciality) VALUES('EMP-001','JOAN','joan@gmail.com',753478332,'Public Health Physician');
INSERT INTO employee(employeeID,name,email,contact,speciality) VALUES('EMP-002','Priscilla','priscilla@gmail.com',786594756,'pediatrician');
INSERT INTO employee(employeeID,name,email,contact,speciality) VALUES('EMP-003','Auma','auma@gmail.com',765496754,'Immunologist');
INSERT INTO employee(employeeID,name,email,contact,speciality) VALUES('EMP-004','Grace','grace@gmail,com',765993290,'Pediatrician');
INSERT INTO employee(employeeID,name,email,contact,speciality) VALUES('EMP-005','Emma','emma@gmail.com',743289390,'pediatrician');

SELECT*FROM employee

CREATE TABLE patient(
    childID VARCHAR(10) PRIMARY KEY,
    childName VARCHAR(10),
    dateOfbirth VARCHAR(10),
    gender VARCHAR(5),
    guardianName VARCHAR(10),
    contact INT(10)

);
INSERT INTO patient(childID,childName,dateOfbirth,gender,guardianName,contact) VALUES('CH-001','Henry','2008-02-12','M','Irene',766553432);
INSERT INTO patient(childID,childName,dateOfbirth,gender,guardianName,contact) VALUES('CH-002','Hannah','2010-25-08','F','Allan',754992094);
INSERT INTO patient(childID,childName,dateOfbirth,gender,guardianName,contact) VALUES('CH-003','Anitah','2005-01-01','F','Andrew',784902483);
INSERT INTO patient(childID,childName,dateOfbirth,gender,guardianName,contact) VALUES('CH-004','Samuel','2012-04-07','M','Faith',796554345);
INSERT INTO patient(childID,childName,dateOfbirth,gender,guardianName,contact) VALUES('CH-005','Isaac','2009-31-10','M','Maria',750394885);

SELECT*FROM patient;

CREATE TABLE medicine(
    medicineID VARCHAR(5) PRIMARY KEY,
    nameOfmedicine VARCHAR(15),
    decription VARCHAR(50),
    dosage VARCHAR(20)
);

INSERT INTO medicine(medicineID,nameOfmedicine,decription,dosage) VALUES('N1','Paracetamol','Pain reliever and blood thinner','500mg,#x daily');
INSERT INTO medicine(medicineID,nameOfmedicine,decription,dosage) VALUES('N2','Amoxicillin','Antibiotics used for bacterial infections','250mg,3x daily');
INSERT INTO medicine(medicineID,nameOfmedicine,decription,dosage) VALUES('N3','Ibuprofen','Anti-infammatory and pain reliever','400mg,2x daily');
INSERT INTO medicine(medicineID,nameOfmedicine,decription,dosage) VALUES('N4','Metformin','Used to control blood sugar in diabets','850mg, 2x daily');

SELECT*FROM medicine;