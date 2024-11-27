Use Test;
-- CTRL + M for execution plan
-- Run all queries at the same time for cost comparison in Ctrl+M menu


-- First query
SELECT DISTINCT c.PESEL, c.Nazwisko
	FROM Egzemplarz e
		JOIN Ksiazka k ON e.Ksiazka_ID=k.Ksiazka_ID
		JOIN Wypozyczenie w ON e.Egzemplarz_ID=w.Egzemplarz_ID
		JOIN Czytelnik c ON c.Czytelnik_ID = w.Czytelnik_ID;-- Second querySELECT c.PESEL, c.Nazwisko
	FROM Czytelnik c WHERE c.Czytelnik_ID IN
		(SELECT w.Czytelnik_ID FROM Wypozyczenie w
			JOIN Egzemplarz e ON e.Egzemplarz_ID=w.Egzemplarz_ID
			JOIN Ksiazka k ON e.Ksiazka_ID=k.Ksiazka_ID)-- Third query - additional subquery added by usSELECT c.PESEL, c.Nazwisko
	FROM Czytelnik c WHERE c.Czytelnik_ID IN
		(SELECT w.Czytelnik_ID FROM Wypozyczenie w
			WHERE w.Egzemplarz_ID IN
				(SELECT e.Egzemplarz_ID FROM Egzemplarz e
					JOIN Ksiazka k ON e.Ksiazka_ID = k.Ksiazka_ID));


-- Conventional wisdom would tell us that first query should be the most efficient one 
-- (no IN statements, just simple JOINs (which are very effective (proven by 6NF databases)) 

-- let's check it with query execution plan

-- Query plan shows us that the first query is actually the most costly one, 
-- while 2 and 3 are functionally the same in the eyes of the engine


-- after adding more data to czytelnik and egzemplarz query 1 became as fast as other ones

-- after generating a ton of rows to wypozyczenie 1 becomest the slowest one again, with
-- query 3 being the fastest. Seems that in this scenario (where Wypozyczenie would be the most
-- populated table) engine is non optimising perfectly, while using query 3 is the best solution. 


  INSERT INTO [Test].[dbo].[Czytelnik] ([PESEL], [Nazwisko], [Miasto], [Data_Urodzenia], [Ostatnie_Wypozyczenie])
VALUES
('12345678901', 'Kowalski', 'Wroc³aw', '1985-05-12', '2024-10-25'),
('23456789012', 'Nowak', 'Warszawa', '1990-03-22', '2024-10-10'),
('34567890123', 'Wiœniewski', 'Kraków', '1987-07-30', '2024-09-15'),
('45678901234', 'D¹browski', 'Gdañsk', '1975-11-10', '2024-11-02'),
('56789012345', 'Zieliñski', 'Poznañ', '1995-01-01', '2024-10-18'),
('00100000000', 'Kaczmarek', 'Wroc³aw', '1982-05-21', '2024-11-05'),
('00100000001', 'Nowakowski', 'Poznañ', '1992-06-15', '2024-11-01'),
('00100000002', 'Lewandowski', 'Warszawa', '1980-02-09', '2024-10-28'),
('00100000003', 'WoŸniak', 'Gdañsk', '1995-08-17', '2024-10-22'),
('00100000004', 'Jankowski', 'Kraków', '1988-04-04', '2024-10-19'),
('00100000005', 'Szymañski', '£ódŸ', '1993-07-03', '2024-10-10'),
('00100000006', 'Dudek', 'Szczecin', '1984-11-15', '2024-10-12'),
('00100000007', 'Kwiatkowski', 'Katowice', '1996-01-06', '2024-10-25'),
('00100000008', 'Zawisza', 'Opole', '1983-03-30', '2024-10-16'),
('00100000009', 'Sikora', 'Toruñ', '1990-09-21', '2024-10-18'),
('00100000010', 'B¹k', 'Rzeszów', '1991-11-12', '2024-10-26'),
('00100000011', 'Biel', 'Lublin', '1994-04-29', '2024-10-14'),
('00100000012', 'Górka', 'Bydgoszcz', '1992-10-10', '2024-10-02'),
('00100000013', 'Mazur', 'Zielona Góra', '1995-05-21', '2024-09-30'),
('00100000014', 'Brzeziñski', 'Bia³ystok', '1986-02-08', '2024-09-25'),
('00100000015', 'Koz³owski', 'Wroc³aw', '1989-12-13', '2024-09-18'),
('00100000016', 'Adamczyk', 'Warszawa', '1997-03-14', '2024-09-21'),
('00100000017', 'Sienkiewicz', 'Gdañsk', '1990-07-19', '2024-09-28'),
('00100000018', 'Krajewski', 'Kraków', '1984-11-03', '2024-09-16'),
('00100000019', 'Majewski', 'Poznañ', '1983-04-17', '2024-09-22'),
('00100000020', 'Œlusarczyk', '£ódŸ', '1996-06-24', '2024-09-20'),
('00100000021', 'Zieliñski', 'Szczecin', '1982-05-19', '2024-09-12'),
('00100000022', 'Pawlak', 'Wroc³aw', '1991-02-28', '2024-09-30'),
('00100000023', 'Zió³kowski', 'Katowice', '1990-07-15', '2024-09-05'),
('00100000024', 'Szczepanik', 'Lublin', '1997-01-04', '2024-09-15'),
('00100000025', 'Wójcik', 'Toruñ', '1987-08-24', '2024-09-10'),
('00100000026', 'Cieœlak', 'Rzeszów', '1994-12-06', '2024-09-01'),
('00100000027', 'Maj', 'Opole', '1993-02-14', '2024-08-28'),
('00100000028', 'Gajda', 'Bia³ystok', '1995-09-17', '2024-08-20'),
('00100000029', 'Dziuba', 'Zielona Góra', '1991-03-18', '2024-08-22');

SET IDENTITY_INSERT [Test].[dbo].[Egzemplarz] ON;

INSERT INTO [Test].[dbo].[Egzemplarz] ([Egzemplarz_ID], [Sygnatura], [Ksiazka_ID])
VALUES
(10000, 'A12345', 1),
(10001, 'A12346', 2),
(10002, 'B23456', 1),
(10003, 'C34567', 3),
(10004, 'D45678', 2);

SET IDENTITY_INSERT [Test].[dbo].[Egzemplarz] OFF;

INSERT INTO [Test].[dbo].[Ksiazka] ([ISBN], [Tytul], [Autor], [Rok_Wydania], [Cena], [Wypozyczona_Ostatni_Miesiac])
VALUES
('978-3-16-148410-0', 'Tajemnice Przesz³oœci', 'Jan Kowalski', 2020, 49.99, 1),
('978-1-60309-452-8', 'Przewodnik po Wroc³awiu', 'Anna Nowak', 2022, 39.99, 0),
('978-0-06-112008-4', 'Zbrodnia i Kara', 'Fyodor Dostoevsky', 1866, 29.99, 1),
('978-0-452-28423-4', 'Wielki Gatsby', 'F. Scott Fitzgerald', 1925, 59.99, 1),
('978-0-14-028329-7', '1984', 'George Orwell', 1949, 19.99, 0);

DECLARE @Czytelnik_ID INT;
DECLARE @Egzemplarz_ID INT;
DECLARE @Data DATE;
DECLARE @Liczba_Dni INT;
DECLARE @Counter INT = 0;

WHILE @Counter < 999
BEGIN
    SELECT @Czytelnik_ID = Czytelnik_ID FROM dbo.Czytelnik ORDER BY NEWID() OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;
    SELECT @Egzemplarz_ID = Egzemplarz_ID FROM dbo.Egzemplarz ORDER BY NEWID() OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;
    
    SET @Data = DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 365), GETDATE());
    SET @Liczba_Dni = (ABS(CHECKSUM(NEWID()) % 30)) + 1;
    
    INSERT INTO dbo.Wypozyczenie (Czytelnik_ID, Egzemplarz_ID, Data, Liczba_Dni)
    VALUES (@Czytelnik_ID, @Egzemplarz_ID, @Data, @Liczba_Dni);

    SET @Counter = @Counter + 1;
END
