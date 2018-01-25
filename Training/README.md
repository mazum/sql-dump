# SQL DUMP > Training Material

## Part 1: Setup Server
Install MS SQL Server Management Studio.
Use this command on cmd prompt to create local DB Server: sqllocaldb create "<Name>"
Use this command on cmd prompt to check if the server is created: sqllocaldb info
Then connect to (LocalDb)\<Name>

## Part 2: Create A Database
Create new Database by right clicking on Database folder and clicking on "New Database".
Give it a name eg: StudentTracker and any location for DB Files and press OK.

## Part 3: Create Tables
Right click on Table and Create Table with following Data(very intuitive):
1. StudentId - int - NOT NULL- Primary Key- Identity (1,1)
2. FirstName - nvarChar(25) - NOT NULL
3. LastName - nvarChar(50) - NOT NULL
4. DateOfBirth - date - NOT NULL
5. CreateDate - datetime - NOT NULL - default(getdate())
6. EditDate - datetime - NOT NULL - default(getdate())
Save Students Table.

Tools > Options > Designer > Uncheck the check box for Prevent Saving changes that require table re-creation > Click OK.

Create another Table:
1. AddressId - int - NOT NULL- Primary Key- Identity (1,1)
2. StudentId - int - NOT NULL
3. AddressType - nvarChar(10) - NOT NULL
4. StreetName - nvarChar(50) - NOT NULL
5. StreetNumber - nvarChar(20) - NOT NULL
6. State - nvarChar(3) - NOT NULL
7. Country - nvarChar(20) - NOT NULL
8. PostalCode - nvarChar(20) - NOT NULL
9. CreateDate - datetime - NOT NULL - default(getdate())
10. EditDate - datetime - NOT NULL - default(getdate())
Save Addresses Table.

## Part 4: Relationship
Right click on fields > click Relationship.
Primary Table > Students
Primary Field > StudentId
Foreign Table > Addresses
Foreign Field > StudentId.

## Part 5: Create Tables with Script. Data Defination Language(DDL).
Create, Alter, Drop, Truncate.
Check training.sql file.

## Part 6: Data Manipulation Language(DML).
Select, Insert, Update and Delete.
Check training.sql file.

## Part 7: Many to Many relationship
Check training.sql file.
View Dependencies.
Edit Top 200.
Add 2 locations- Online and A321.
Add 2 Courses- Science and English.
Add Relations in StudentsCourses Table.

## Part 8: Rename Columns
Check training.sql file.

## Part 9: Add and Drop Constraint
Check training.sql file.
Try to insert without DateOfBirth. It Throws error.
Add a default DateOfBirth '1900-01-01'.
Drop Constraint using training.sql.
Add Constraint using training.sql.

## Part 10: Joins and Views.
Check training.sql file.
Adds views.

## Part 11: Aggregates
TBA.
