CREATE DATABASE LAB7

USE LAB7

go
create table Students
(RollNo varchar(7) primary key
,Name varchar(30)
,WarningCount int
,Department varchar(15)
)
GO
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'1', N'Ali', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'2', N'Bilal', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'3', N'Ayesha', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'4', N'Ahmed', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'5', N'Sara', 0, N'EE')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'6', N'Salman', 1, N'EE')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'7', N'Zainab', 2, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'8', N'Danial', 1, N'CS')

go
create table Courses
(
CourseID int primary key,
CourseName varchar(40),
PrerequiteCourseID int,
CreditHours int
) 
GO
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (10, N'Database Systems', 20, 3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (20, N'Data Structures', 30,3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (30, N'Programing', NULL,3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (40, N'Basic Electronics', NULL,3)
go

go
Create table Instructors 
(
InstructorID int Primary key,
Name varchar(30),
Department varchar(7) ,
)
GO
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (100, N'Ishaq Raza', N'CS')
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (200, N'Zareen Alamgir', N'CS')
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (300, N'Saima Zafar', N'EE')
go
Create table Semester
(
Semester varchar(15) Primary key,
[Status] varchar(10),
)
GO
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Fall2016', N'Complete')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2016', N'Complete')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2017', N'InProgress')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Summer2016', N'Cancelled')
go
Create table Courses_Semester
(
InstructorID int Foreign key References Instructors(InstructorID),
CourseID int Foreign key References Courses(CourseID),
Semester varchar(15) Foreign key References Semester(Semester), 
Section varchar(1) ,
AvailableSeats int,
Department varchar(2)
)
GO
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'D', 45, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'C', 0, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (100, 10, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2016', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2016', N'A', 0, N'CS')

go



create table Registration
(
Semester varchar(15) Foreign key References Semester(Semester),
RollNumber  varchar(7) Foreign key References Students(RollNo),
CourseID int Foreign key References Courses(CourseID), 
Section varchar(1),
GPA float
)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'1', 20, N'A', 3.3)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'2', 20, N'B', 4)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2016', N'1', 30, N'A', 1.0)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'6', 40, N'D',0.0)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2017', N'6', 40, N'D',1)


go

Create table ChallanForm
(Semester varchar(15) Foreign key References Semester(Semester),
RollNumber  varchar(7) Foreign key References Students(RollNo),
TotalDues int,
[Status] varchar(10)
)
GO
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'1', 100000, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'2', 13333, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'3', 5000, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'4', 20000, N'Pending')


select * from Students
select * from Courses
select * from Instructors
select * from Registration
select * from Semester
select * from Courses_Semester
select * from ChallanForm

GO
-- Functionality 1
create trigger TRG_PreventDeletion
on Students
instead of delete
as
begin
    PRINT 'You don’t have the permission to delete the student'
end

GO

delete from 
Students
where RollNo = 5

GO

-- Functionality 2
create trigger TRG_PreventCourseInsertion
on Courses
instead of insert
as
begin
    PRINT 'You don’t have the permission to Insert a new Course'
end

GO

INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (100, N'Database', 20, 3)

GO

-- Functionality 3
create table Notify (
    NotificationID INT PRIMARY KEY IDENTITY,
    StudentID VARCHAR(7),
    NotificationString VARCHAR(255)
)

GO

CREATE TRIGGER TRG_CourseRegistrationNotification
ON Registration
AFTER INSERT
AS
BEGIN
    DECLARE @RollNo VARCHAR(7), @CourseID INT, @PrereqID INT, @Seats INT, @Semester VARCHAR(15);

    SELECT @RollNo = i.RollNumber, @CourseID = i.CourseID, @Semester = i.Semester
    FROM inserted i;

    SELECT @PrereqID = PrerequiteCourseID FROM Courses WHERE CourseID = @CourseID;

    IF @PrereqID IS NOT NULL AND NOT EXISTS 
	(
        SELECT 1 FROM Registration 
        WHERE RollNumber = @RollNo AND CourseID = @PrereqID AND GPA >= 2.0
    )
    BEGIN
        INSERT INTO Notify (StudentID, NotificationString)
        VALUES (@RollNo, 'Registration failed: Prerequisite not passed.');
        RETURN;
    END

    SELECT @Seats = AvailableSeats FROM Courses_Semester WHERE CourseID = @CourseID AND Semester = @Semester;

    IF @Seats <= 0
    BEGIN
        INSERT INTO Notify (StudentID, NotificationString)
        VALUES (@RollNo, 'Registration failed: No available seats.');
        RETURN;
    END

    INSERT INTO Notify (StudentID, NotificationString)
    VALUES (@RollNo, 'Registration successful.');
END;

GO
-- Functionality 4
create trigger TRG_EnsureFeeClearance
ON Registration
instead OF insert
as
BEGIN
    declare @RollNumber VARCHAR(7)
    select @RollNumber = RollNumber from INSERTED

	declare @status varchar(10)
	select @status = RollNumber from INSERTED

    IF EXISTS 
	(
        SELECT 1 FROM ChallanForm WHERE RollNumber = @RollNumber AND TotalDues > 20000 AND @status = 'Pending'
    )
    begin 
        print 'Enrollment not allowed due to pending fee exceeding 20,000'
    end
    else
    begin
        insert into Registration SELECT * FROM INSERTED;
    end
END
GO

INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'4', 20, N'A', 3.3)
INSERT [dbo].[Registration] (Semester, RollNumber, CourseID, Section, GPA) VALUES ('Spring2016', N'1', 40, 'A', 3.5)
select * from Notify

GO

-- Functionality 5
create trigger TRG_PreventCourseSemesterDeletion
on Courses_Semester
instead of delete
as
begin
    declare @AvailableSeats INT;
    select @AvailableSeats = AvailableSeats FROM DELETED;

    if @AvailableSeats < 10
    begin
        PRINT 'Not possible'
    end
    else
    begin
        PRINT 'Successfully deleted';
        DELETE FROM Courses_Semester WHERE AvailableSeats = @AvailableSeats;
    end
end

GO

-- Functionality 6
create trigger TRG_ModifyDeleteInstructor
on Instructors
instead of delete, UPDATE
as
begin
    print 'Modification of Instructors table is not allowed'
end;
go

