CREATE DATABASE USERDB

CREATE TABLE Users(
Id INT Primary Key Identity(1,1),
Name NVARCHAR(30),
Email NVARCHAR(50)
);

CREATE TABLE Movies(
Id INT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(50),
Duration INT
);

CREATE TABLE Tickets(
Id INT PRIMARY KEY IDENTITY(1,1),
UserId INT FOREIGN KEY REFERENCES Users(Id),
MovieId INT FOREIGN KEY REFERENCES Movies(Id),
SeatNumber INT,
Price DECIMAL (10,2)
)

INSERT INTO Users(Name,Email) 
VALUES('Leman','lemanbayramova@gmail.com'),
('Nubar','nubarmammadli@gmail.com'),
('Aytaj','aytajshakarzade@gmail.com'),
('Narmin','narminzeynalli@gmail.com'),
('Vusale','vusalenesibova@gmail.com')

INSERT INTO Movies(Title,Duration)
VALUES('Hobbit',240),
('Interstellar', 180),
('Supernatural',149),
('Teen Wolf',160),
('Game of Thrones',155)

INSERT INTO Tickets (UserId, MovieId, SeatNumber, Price)
VALUES(1, 1, 10, 55.00), 
(1, 2, 12, 40.00), 
(2, 1, 11, 34.00),
(3, 3, 5, 15.00), 
(3, 1, 14, 19.00),
(4, 4, 1, 30.00),
(4, 5, 2, 22.00),
(5, 2, 8, 25.00),
(5, 3, 9, 17.00),
(1, 3, 20, 28.00);

SELECT * FROM Users;
SELECT * FROM Movies;
SELECT * FROM Tickets;


--1. Bütün biletlər (Inner Join)
SELECT u.Name as [User adı],m.Title as [Film adı],t.SeatNumber,t.Price
FROM Tickets t
INNER JOIN Users u ON t.UserId=u.Id
INNER JOIN Movies m ON t.MovieId=m.Id

--2.Heç bilet almayan userlər(LEFT JOIN + NULL check)
SELECT u.Name
FROM Users u
LEFT JOIN Tickets t ON u.Id=t.UserId
WHERE t.Id is null;

--3.Ən bahalı bileti alan user + film + qiymət(ORDER BY + LIMIT / TOP 1)
SELECT TOP 1 u.Name, m.Title, t.Price
FROM Tickets t
INNER JOIN Users u ON t.UserId = u.Id
INNER JOIN Movies m ON t.MovieId = m.Id
ORDER BY t.Price DESC;

--4.Qiyməti 20-dən yuxarı olan biletlər
SELECT u.Name, m.Title, t.Price
FROM Tickets t
INNER JOIN Users u ON t.UserId = u.Id
INNER JOIN Movies m ON t.MovieId = m.Id
WHERE t.Price > 20;


