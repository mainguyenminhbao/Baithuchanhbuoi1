CREATE DATABASE MarkManagement
GO
Use MarkManagement
GO 
CREATE TABLE [dbo].[Students] (
    [StudentID]   NVARCHAR (12) NOT NULL,
    [StudentName] NVARCHAR (25) NOT NULL,
    [DateofBirth] DATETIME      NOT NULL,
    [Email]       NVARCHAR (40) NULL,
    [Phone]       NVARCHAR (12) NULL,
    [Class]       NVARCHAR (10) NULL,
    CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([StudentID] ASC)
)
CREATE TABLE [dbo].[Subjects] (
    [SubjectID]   NVARCHAR (10) NOT NULL,
    [SubjectName] NVARCHAR (25) NOT NULL,
    CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED ([SubjectID] ASC)
)
CREATE TABLE [dbo].[Mark] (
    [StudentID] NVARCHAR (12) NOT NULL,
    [SubjectID] NVARCHAR (10) NOT NULL,
    [Date]      DATETIME      NULL,
    [Theory]    TINYINT       NULL,
    [Practical] TINYINT       NULL,
    CONSTRAINT [PK_Mark] PRIMARY KEY CLUSTERED ([StudentID] ASC, [SubjectID] ASC)
)
insert into Students values ('AV0807005','Mai Trung Hiếu ', '11/10/1989','trunghieu@yahoo.com','0904115116','AV1')
insert into Students values ('AV0807006','Nguyễn Quý Hùng ', '2/12/1988','quyhung@yahoo.'com' ,'0955667787', 'AV2')
insert into Students values ('AV0807007','Đỗ Đắc Huỳnh ', '2/1/1990','dachuynh@yahoo.com', '0988574747', 'AV2')
insert into Students values ('AV0807008','An Đăng Khuê ', '6/3/1986','trunghieu@yahoo.com','0904115116','AV1')
insert into Students values ('AV0807009','Nguyễn T.Tuyết Lan ', '12/7/1989','trunghieu@yahoo.com','0904115116','AV1')
insert into Students values ('AV08070010','Đinh Phụng Long ', '2/12/1990','trunghieu@yahoo.com','0904115116','AV1')

insert into Subjects values ('S001' , 'SQL')
insert into Subjects values ('S002' , 'Java Simplefield')
insert into Subjects values ('S003' , 'Active Server Page')



INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807005', 'S001', 8, 25, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES('AV0807006', 'S002', 16, 30, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807007', 'S001', 10, 25, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807009', 'S003', 7, 13, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807010', 'S003', 9, 16, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807011', 'S002', 8, 30, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807012', 'S001', 7, 31, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807005', 'S002', 12, 11, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807009', 'S003', 11, 20, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807010', 'S001', 7, 6, '06-06-2008')
 
--- Câu 1---
select * from Students
go
--- Câu 2---
select * from Students
where Class = 'AV1'
go

---Câu 3---
UPDATE Students set Class = 'AV2' where StudentID = 'AV0807012'

---Câu 4--

SELECT COUNT(StudentName) 
FROM Students
WHERE Class = 'AV1';

SELECT COUNT(StudentName) 
FROM Students
WHERE Class = 'AV2';

---Câu 5--
Select * From Students Where Class='AV2' Order by StudentName

-- 6. Hiển thị danh sách sinh viên không đạt lý thuyết môn S001 (theory <10) thi ngày 6/5/2008
select * from Students inner join Mark ON Students.StudentID = Mark.StudentID
Where SubjectID = 'S001' and theory < 10 and Date = '6/5/2008'
-- 7. Hiển thị tổng số sinh viên không đạt lý thuyết môn S001. (theory <10)
select count(Class) As 'Tổng số sinh viên' From Students inner join Mark ON Students.StudentID = Mark.StudentID
Where SubjectID = 'S001' and theory < 10
-- 8.Hiển thị Danh sách sinh viên học lớp AV1 và sinh sau ngày 1/1/1980
select * from Students Where Class = 'AV1' and DateofBirth > '1/1/1980'
-- 9. Xoá sinh viên có mã AV0807011
DELETE FROM Students Where StudentID = 'AV0807011'
-- 10. Hiển thị danh sách sinh viên dự thi môn có mã S001 ngày 6/5/2008 bao gồm các trường sau: StudentID, StudentName, SubjectName, Theory, Practical, Date

select Students.StudentID,Mark.SubjectID,Theory,Practical,Date from Students inner join Mark ON Students.StudentID = Mark.StudentID where SubjectID = 'S001' and Date = '6/5/2008 '
