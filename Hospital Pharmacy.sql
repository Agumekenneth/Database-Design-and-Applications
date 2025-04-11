CREATE DATABASE AgumeKennethS24B38017;
USE AgumeKennethS24B38017;

CREATE TABLE Patient(
    Patient_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(30),
    Age INT(10),
    Gender VARCHAR(8),
    Contact VARCHAR(15)
);

DESC Patient;

ALTER TABLE Patient CHANGE Contact Contact_Number VARCHAR(10);

INSERT INTO Patient(Patient_ID,Name ,Age,Gender,Contact_Number) VALUES('P001','John Kintu',35,'Male','0700111111');
INSERT INTO Patient(Patient_ID,Name ,Age,Gender,Contact_Number) VALUES('P002','Sarah Nambi',28,'Female','0700222222');
INSERT INTO Patient(Patient_ID,Name ,Age,Gender,Contact_Number) VALUES('P003','Paul Okello',42,'Male','0700333333');

SELECT * FROM Patient;

CREATE TABLE Doctor(
    Doctor_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(30),
    Specialization VARCHAR(30),
    Contact VARCHAR(15)
);

DESC Doctor;

CREATE TABLE Appointment(
    Appointment_ID VARCHAR(10) PRIMARY KEY,
    Patient_ID VARCHAR(10),
    Doctor_ID VARCHAR(10),
    Date DATE,
    Time TIME,
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY(Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

DESC Appointment;

CREATE TABLE Prescription(
    Prescription_ID VARCHAR(10) PRIMARY KEY,
    Appointment_ID VARCHAR(10),
    Medicine VARCHAR(10),
    Dosage VARCHAR(10),
    FOREIGN KEY(Appointment_ID) REFERENCES Appointment(Appointment_ID)
);

-- QUESTION 2

CREATE TABLE Pharmacist(
    Pharmacist_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(30),
    Qualification VARCHAR(10),
    Contact_Number INT(10)
);

DESC Pharmacist;

INSERT INTO Pharmacist(Pharmacist_ID,Name,Qualification,Contact_Number) VALUES('101','Akex Bukenya','BPharm',0700111111);
INSERT INTO Pharmacist(Pharmacist_ID,Name,Qualification,Contact_Number) VALUES('102','Diana Musoke','BPharm',0701222222);
   
INSERT INTO Pharmacist(Pharmacist_ID,Name,Qualification,Contact_Number) VALUES('103','Samuel Opio','BPharm','0701333333');

SELECT * FROM Pharmacist;

CREATE TABLE Medicine(
    Medicine_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(15),
    Type VARCHAR(10),
    Price_Per_Unit_UGX INT(10),
    Stock_Quantity INT(10)
);

DESC Medicine;

INSERT INTO Medicine(Medicine_ID,Name,Type,Price_Per_Unit_UGX,Stock_Quantity) VALUES('201','Paracentamol','Painkiller',5000.00,100);
INSERT INTO Medicine(Medicine_ID,Name,Type,Price_Per_Unit_UGX,Stock_Quantity) VALUES('202','Amoxicillin','Antibiotic',8000.50,50);
INSERT INTO Medicine(Medicine_ID,Name,Type,Price_Per_Unit_UGX,Stock_Quantity) VALUES('203','Ibuprofen','Painkiller',7000.25,75);

SELECT* FROM Medicine;
ALTER TABLE Medicine CHANGE Price_Per_Unit_UGX Price_Per_Unit_UGX DECIMAL(10,2);


DESC Prescription;

ALTER TABLE Prescription ADD COLUMN Patient_ID VARCHAR(10);
ALTER TABLE Prescription ADD FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID);

ALTER TABLE Prescription ADD COLUMN Pharmacist_ID VARCHAR(10);
ALTER TABLE Prescription ADD FOREIGN KEY(Pharmacist_ID) REFERENCES Pharmacist(Pharmacist_ID);
ALTER TABLE Prescription ADD COLUMN Medicine_ID VARCHAR(10);
ALTER TABLE Prescription ADD FOREIGN KEY(Medicine_ID) REFERENCES Medicine(Medicine_ID);
ALTER TABLE Prescription CHANGE Dosage Dosage DECIMAL(5,2);
ALTER TABLE Prescription CHANGE Dosage Dosage_mg DECIMAL(5,2);

ALTER TABLE Prescription DROP COLUMN Medicine;
SHOW CREATE TABLE Prescription ;
ALTER TABLE Prescription DROP FOREIGN KEY Prescription_ibfk_1;
ALTER TABLE Prescription DROP COLUMN Appointment_ID;
ALTER TABLE Prescription ADD COLUMN Duration_Days INT(10);

INSERT INTO Prescription(Prescription_ID,Dosage_mg,Patient_ID,Pharmacist_ID,Medicine_ID) VALUES('301','500.50','P001','101','201');
INSERT INTO Prescription(Prescription_ID,Dosage_mg,Patient_ID,Pharmacist_ID,Medicine_ID,Duration_Days) VALUES('302','250.25','P002','102','202',7);
INSERT INTO Prescription(Prescription_ID,Dosage_mg,Patient_ID,Pharmacist_ID,Medicine_ID,Duration_Days) VALUES('303','400.75','P003','103','203',3);

SELECT* FROM Prescription;

UPDATE Prescription SET Duration_Days=5 WHERE Prescription_ID='301';

CREATE TABLE Sales_Transaction(
    Transcation_ID INT(10) PRIMARY KEY,
    Prescription_ID VARCHAR(10),
    Date DATE,
    Quantity_sold INT(10),
    Total_Amount_UGX DECIMAL(10,2),
    FOREIGN KEY(Prescription_ID) REFERENCES Prescription(Prescription_ID)
);
ALTER TABLE Sales_Transcation ADD FOREIGN KEY (Prescription_ID) REFERENCES Prescription_ID (Prescription_ID);

INSERT INTO Sales_Transaction(Transcation_ID,Prescription_ID,Date,Quantity_sold,Total_Amount_UGX) VALUES(401,'301','2024-01-16',10,50000.10);
INSERT INTO Sales_Transaction(Transcation_ID,Prescription_ID,Date,Quantity_sold,Total_Amount_UGX) VALUES(402,'302','2024-02-11',5,40002.50);
INSERT INTO Sales_Transaction(Transcation_ID,Prescription_ID,Date,Quantity_sold,Total_Amount_UGX) VALUES(403,'303','2024-03-06',7,49001.75);

SELECT* FROM Sales_Transaction;
-- part b
UPDATE Patient SET Name='Jim Page' WHERE Patient_ID='P001';

SELECT * FROM Patient;

-- part c
CREATE VIEW view2b AS SELECT *FROM Medicine WHERE Type='Painkiller';

SELECT * FROM view2b;

-- part d
CREATE VIEW view2c AS 
SELECT SUM(Total_Amount_UGX) AS Total_Amount_Collected 
FROM Sales_Transaction;

SELECT * FROM view2c;

-- part e

CREATE VIEW view2d AS
SELECT p.Name AS Patient_Name, m.Name AS Medicine_Name
FROM Patient p, Prescription pr, Medicine m
WHERE p.Patient_ID = pr.Patient_ID
AND pr.Medicine_ID = m.Medicine_ID;

SELECT * FROM view2d;

-- part c

CREATE VIEW viewleast AS 
SELECT Patient_ID, MIN(Dosage_mg) AS Smallest_Dosage 
FROM Prescription GROUP BY Patient_ID;
SELECT * FROM viewleast;

-- QUESTION 3
CREATE VIEW view3a AS
SELECT DISTINCT Type
FROM Medicine
ORDER BY Type ASC;
SELECT*FROM view3a;

-- part b

CREATE VIEW view3b AS
SELECT AVG(Dosage_mg) AS Average_Dosage
FROM Prescription;
SELECT*FROM view3b;

-- part c
CREATE VIEW view3c AS
 SELECT * FROM Patient WHERE Name LIKE 'N%';
SELECT * FROM view3c;

-- part d
CREATE VIEW view3d AS
SELECT p.Patient_ID, p.Name AS Patient_Name, SUM(st.Quantity_sold) AS Total_Quantity_Sold
FROM Patient p
JOIN Prescription pr ON p.Patient_ID = pr.Patient_ID
JOIN Sales_Transaction st ON pr.Prescription_ID = st.Prescription_ID
GROUP BY p.Patient_ID, p.Name;

SELECT * FROM view3d;

-- part e

CREATE VIEW view3e AS
 SELECT * FROM Sales_Transaction WHERE Total_Amount_UGX > 50000;
SELECT * FROM view3e;
-- part f

CREATE VIEW viewbtn AS
SELECT *
FROM Patient
WHERE Age BETWEEN 28 AND 41;
SELECT * FROM viewbtn;

-- part g
CREATE VIEW viewp AS
SELECT *
FROM Medicine
WHERE Type = 'Painkiller';
SELECT * FROM viewp;

-- QUESTION 4(schema Modification and Table creation)
-- part a
ALTER TABLE Patient ADD COLUMN Email VARCHAR(30);
DESC Patient;

-- part b
ALTER TABLE Medicine CHANGE Medicine_ID Drug_ID VARCHAR(10);
DESC Medicine;

-- part c
ALTER TABLE Medicine MODIFY Type VARCHAR(30);
DESC Medicine;

-- part d

CREATE TABLE projectX(
    Project_ID VARCHAR(10) PRIMARY KEY,
    Project_Name VARCHAR(20),
    Project_Manager VARCHAR(20),
    company VARCHAR(30)
);

DESC projectX;
INSERT INTO projectX(Project_ID,Project_Name,Project_Manager,company) VALUES('PX001','ProjectX','Charles Leclerc','Redbull');
INSERT INTO projectX(Project_ID,Project_Name,Project_Manager,company) VALUES('PX002','ProjectY','Lewis Hamilton','Mercedes');
INSERT INTO projectX(Project_ID,Project_Name,Project_Manager,company) VALUES('PX003','ProjectZ','Max Verstappen','Redbull');

SELECT * FROM projectX;