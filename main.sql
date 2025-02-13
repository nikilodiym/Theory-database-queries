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

