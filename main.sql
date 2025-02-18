create database UserDB;
go
use UserDB;
go

create table Departments (
    Id int identity(1,1) primary key,
    Name nvarchar(100) not null unique,
    Financing money not null check (Financing >= 0) default 0
);

create table Faculties (
    Id int identity(1,1) primary key,
    Name nvarchar(100) not null unique,
    Dean nvarchar(max) not null
);

create table Groups (
    Id int identity(1,1) primary key,
    Name nvarchar(10) not null unique,
    Rating int not null check (Rating between 0 and 5),
    Year int not null check (Year between 1 and 5)
);

create table Teachers (
    Id int identity(1,1) primary key,
    Surname nvarchar(max) not null,
    Name nvarchar(max) not null,
    Position nvarchar(max) not null,
    Salary money not null check (Salary > 0),
    Premium money not null check (Premium >= 0) default 0,
    EmploymentDate date not null check (EmploymentDate >= '1990-01-01'),
    IsAssistant bit not null default 0,
    IsProfessor bit not null default 0
);

insert into Departments (Name, Financing) values
('Software Development', 15000),
('Mathematics', 9000),
('Physics', 12000),
('Biology', 30000);

insert into Faculties (Name, Dean) values
('Engineering', 'Dr. John Smith'),
('Computer Science', 'Dr. Alice Johnson'),
('Mathematics', 'Dr. Robert Brown');

insert into Groups (Name, Rating, Year) values
('CS-101', 4, 3),
('CS-102', 5, 4),
('Math-201', 3, 5),
('Physics-301', 2, 5);

insert into Teachers (Surname, Name, Position, Salary, Premium, EmploymentDate, IsAssistant, IsProfessor) values
('Johnson', 'Mark', 'Professor', 1200, 300, '1995-06-15', 0, 1),
('Brown', 'Emily', 'Assistant', 500, 200, '2010-03-12', 1, 0),
('Davis', 'Michael', 'Lecturer', 900, 250, '2005-08-21', 0, 0),
('Wilson', 'Anna', 'Assistant', 600, 180, '2012-11-05', 1, 0);

select * from Departments order by Id desc;

select Name as "Group Name", Rating as "Group Rating" from Groups;

select Surname,
       (Salary / Premium) * 100 as "Salary to Premium %",
       (Salary / (Salary + Premium)) * 100 as "Salary to Total %"
from Teachers;

select 'The dean of faculty ' + Name + ' is ' + Dean as FacultyInfo from Faculties;

select Surname from Teachers where IsProfessor = 1 and Salary > 1050;

select Name from Departments where Financing < 11000 or Financing > 25000;

select Name from Faculties where Name <> 'Computer Science';

select Surname, Position from Teachers where IsProfessor = 0;

select Surname, Position, Salary, Premium from Teachers where Position = 'Assistant' and Premium between 160 and 550;

select Surname, Salary from Teachers where Position = 'Assistant';

select Surname, Position from Teachers where EmploymentDate < '2000-01-01';

select Name as "Name of Department" from Departments where Name < 'Software Development' order by Name;

select Surname from Teachers where Position = 'Assistant' and (Salary + Premium) <= 1200;

select Name from Groups where Year = 5 and Rating between 2 and 4;

select Surname from Teachers where Position = 'Assistant' and (Salary < 550 or Premium < 200);
