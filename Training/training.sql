--***Part 5***
CREATE TABLE dbo.EmailAddresses
(
	EmailAddressId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	StudentId int NOT NULL,
	URI nvarchar(250) NOT NULL DEFAULT('home@home.com'),
	CreateDate datetime NOT NULL DEFAULT((getdate())),
	EditDate datetime NOT NULL DEFAULT((getdate()))
);

--***********************************************************************
ALTER TABLE dbo.EmailAddresses WITH CHECK ADD CONSTRAINT [FK_EmailAddresses_Students] FOREIGN KEY ([StudentId])
REFERENCES dbo.Students ([StudentId]);

--***********************************************************************
--***Part 6***
INSERT INTO [dbo].[Students]
           ([FirstName]
           ,[LastName]
           ,[DateOfBirth])
     VALUES
           ('Ada'
           ,'Mathews'
           ,'2001-01-01');

--***********************************************************************
INSERT INTO [dbo].[Addresses]
           ([StudentId]
           ,[Name]
           ,[StreetName]
           ,[StreetNumber]
           ,[State]
           ,[Country]
           ,[PostalCode])
     VALUES
           (1
           ,'Home'
           ,'Collins Street'
           ,'101'
           ,'VIC'
           ,'AU'
           ,'3000');

--***********************************************************************
select * from dbo.Addresses

select * from dbo.Students

--***********************************************************************
UPDATE [dbo].[Addresses]
   SET [StreetName] = 'Collins Street Head'
 WHERE AddressId = 2

--***********************************************************************
DELETE FROM [dbo].[Addresses]
      WHERE AddressId = 2

--***********************************************************************
INSERT INTO [dbo].[EmailAddresses]
           ([StudentId]
           ,[URI])
     VALUES
           (1
           ,'home@home.com');

--***********************************************************************
select * from dbo.Addresses

select * from dbo.Students

select * from dbo.EmailAddresses

select * from dbo.Courses

select * from dbo.Locations

--***********************************************************************
--***Part 7***
CREATE TABLE dbo.Courses
(
	CourseId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CourseCode nvarchar(10) NOT NULL DEFAULT('XXXX-XXXX'),
	CourseName nvarchar(26) NOT NULL DEFAULT(''),
	LocationId int NOT NULL DEFAULT(1),
	CreateDate datetime NOT NULL DEFAULT((getdate())),
	EditDate datetime NOT NULL DEFAULT((getdate()))
);

--***********************************************************************
CREATE TABLE dbo.Locations
(
	LocationId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name nvarchar(20) NOT NULL DEFAULT('Room'),
	CreateDate datetime NOT NULL DEFAULT((getdate())),
	EditDate datetime NOT NULL DEFAULT((getdate()))
);

--***********************************************************************
ALTER TABLE dbo.Courses WITH CHECK ADD CONSTRAINT [FK_Courses_Locations] FOREIGN KEY ([LocationId])
REFERENCES dbo.Locations ([LocationId]);

--***********************************************************************
CREATE TABLE dbo.StudentsCourses
(
	StudentsCourseId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	StudentId int NOT NULL,
	CourseId int NOT NULL,
	CreateDate datetime NOT NULL DEFAULT((getdate())),
	EditDate datetime NOT NULL DEFAULT((getdate()))
);

--***********************************************************************
ALTER TABLE dbo.StudentsCourses WITH CHECK ADD CONSTRAINT [FK_StudentsCourses_Students] FOREIGN KEY ([StudentId])
REFERENCES dbo.Students ([StudentId]);

--***********************************************************************
ALTER TABLE dbo.StudentsCourses WITH CHECK ADD CONSTRAINT [FK_StudentsCourses_Courses] FOREIGN KEY ([CourseId])
REFERENCES dbo.Courses ([CourseId]);

--***********************************************************************
--***Part 8***
exec sp_rename 'Students.DataOfBirth', 'DateOfBirth', 'COLUMN'

--***********************************************************************
--***Part 9***
ALTER TABLE Students
ADD CONSTRAINT [DF_Students_DateOfBirth] DEFAULT ('1900-01-01') FOR DateOfBirth;

--***********************************************************************
--***Part 10***
SELECT * FROM Students
INNER JOIN Addresses
ON Students.StudentId = Addresses.StudentId

--***********************************************************************
SELECT * FROM Students
LEFT JOIN Addresses
ON Students.StudentId = Addresses.StudentId

--***********************************************************************
SELECT * FROM Students
INNER JOIN StudentsCourses
ON StudentsCourses.StudentId = Students.StudentId
INNER JOIN Courses
ON Courses.CourseId = StudentsCourses.CourseId
INNER JOIN Locations
ON Locations.LocationId = Courses.LocationId

--***********************************************************************
SELECT Students.FirstName, Students.LastName,
(Students.FirstName + ' ' + Students.LastName) AS FullName,
(Addresses.StreetNumber + ' ' + Addresses.StreetName) AS Address,
(CourseCode + '-' + CourseName) AS CourseTitle 
FROM Students
INNER JOIN Addresses
ON Students.StudentId = Addresses.StudentId
INNER JOIN StudentsCourses
ON StudentsCourses.StudentId = Students.StudentId
INNER JOIN Courses
ON Courses.CourseId = StudentsCourses.CourseId
INNER JOIN Locations
ON Locations.LocationId = Courses.LocationId

--***********************************************************************

