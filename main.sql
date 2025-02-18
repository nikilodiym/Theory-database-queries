create database Hospital;
go
use Hospital;
go

create table Doctor(
    DoctorID int primary key,
    DoctorName varchar(50),
    DoctorSpeciality varchar(50),
    DoctorSalary int
);
go

create table Department(
    DepartmentID int primary key identity(1,1) not null,
    DepartmentName nvarchar(100) not null unique,
    DepartmentHead varchar(50),
    Building int not null check (Building between 1 and 5),
    Financing money not null check (Financing >= 0) default 0,
    Floor int not null check (Floor >= 1)
);
go

create table Diseases(
    DiseaseID int primary key identity(1,1) not null,
    DiseaseName nvarchar(100) not null unique,
    DiseaseDescription nvarchar(1000) not null,
    DiseaseSymptoms nvarchar(1000) not null,
    DiseaseTreatment nvarchar(1000) not null,
    DiseaseSeverity int not null check (DiseaseSeverity >= 1) default 1
);
go

SELECT * FROM Diseases;

SELECT DoctorName, DoctorID FROM Doctor;

SELECT DISTINCT DiseaseDescription FROM Diseases;

SELECT DiseaseName AS "Name of Disease", DiseaseSeverity AS "Severity of Disease" FROM Diseases;

SELECT d.DoctorName, dp.DepartmentName, ds.DiseaseName
FROM Doctor d, Department dp, Diseases ds
WHERE d.DoctorID = dp.DepartmentHead AND ds.DiseaseID = d.DoctorSpeciality;

SELECT DepartmentName FROM Department WHERE Building = 5 AND Financing < 30000;

SELECT DepartmentName FROM Department WHERE Building = 3 AND Financing BETWEEN 12000 AND 15000;

SELECT DepartmentName, Building, Financing FROM Department WHERE Building IN (3, 6) AND (Financing < 11000 OR Financing > 25000);

SELECT DepartmentName, Building FROM Department WHERE Building IN (1, 3, 8, 10);

SELECT DiseaseName FROM Diseases WHERE DiseaseSeverity NOT IN (1, 2);

SELECT DepartmentName FROM Department WHERE Building NOT IN (1, 3);

SELECT DepartmentName FROM Department WHERE Building IN (1, 3);

SELECT DoctorName FROM Doctor WHERE Doctor.DoctorName LIKE 'N%';