CREATE DATABASE OnlineCourseSystem

CREATE TABLE Students(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(30),
Email NVARCHAR(50)
);


CREATE TABLE Courses(
Id INT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(100),
Duration INT
);

CREATE TABLE Entrollments(
İd INT PRIMARY KEY IDENTITY(1,1),
StudentId INT,
FOREIGN KEY (StudentId) REFERENCES Students(Id),
CourseId INT,
FOREIGN KEY (CourseId) REFERENCES Courses(Id),
Progress Int CHECK (Progress>=0 And Progress<=100),
Price DECIMAL(10,2),
)

INSERT INTO Students(Name,Email)
VALUES('Leman','lemanbayramova@gmail.com'),
('Aytac','aytac@gmail.com'),
('Nubar','nubar@gmail.com'),
('Narmin','narmin@gmail.com'),
('Vusale','vusale@gmail.com'),
('Omer','omer@gmail.com'),
('Kenan','kenan@gmail.com'),
('Sebine','sebine@gmail.com'),
('Inci','inci@gmail.com'),
('Lale','lale@gmail.com')


INSERT INTO Courses(Title,Duration)
VALUES('Code Akademy',6),
('Data science',2),
('Front-end',5),
('Back-end',7),
('IT',3)

INSERT INTO Entrollments(StudentId,CourseId,Progress,Price)
VALUES(1,1,60,500),
(2,2,30,200),
(3,1,90,500),
(4,3,45,600),
(5,4,100,800),
(6,1,10,500),
(7,2,55,256),
(8,3,20,600),
(9,4,85,800),
(10,2,70,200)

select *from Students;
select *from Courses;
select *from Entrollments

-- 1. Tapşırıq
SELECT 
    s.Name, 
    c.Title, 
    e.Progress, 
    e.Price
FROM Entrollments e
INNER JOIN Students s ON e.StudentId = s.Id
INNER JOIN Courses c ON e.CourseId = c.Id;

-- 2. Tapşırıq
SELECT 
    s.Id, 
    s.Name, 
    s.Email
FROM Students s
LEFT JOIN Entrollments e ON s.Id = e.StudentId
WHERE e.İd IS NULL;

-- 3. Tapşırıq
SELECT TOP 1 
    s.Name, 
    c.Title, 
    e.Price
FROM Entrollments e
JOIN Students s ON e.StudentId = s.Id
JOIN Courses c ON e.CourseId = c.Id
ORDER BY e.Price DESC;

-- 4. Tapşırıq
SELECT 
    s.Name, 
    c.Title, 
    e.Progress
FROM Entrollments e
JOIN Students s ON e.StudentId = s.Id
JOIN Courses c ON e.CourseId = c.Id
WHERE e.Progress > 50;


   







