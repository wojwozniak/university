CREATE TRIGGER trg_CheckSpecimensCount
	ON Egzemplarz
	INSTEAD OF INSERT
AS
BEGIN
    DECLARE @BookId INT;
    DECLARE @SpecimensCount INT;

    SELECT @BookId = Ksiazka_ID FROM inserted;

    SELECT @SpecimensCount = COUNT(*) 
		FROM Egzemplarz
			WHERE Ksiazka_ID = @BookId;

    IF @SpecimensCount >= 5
		BEGIN
			RAISERROR('A book can have a maximum of 5 specimens.', 16, 1);
			ROLLBACK TRANSACTION;
		END
    ELSE
		BEGIN
			INSERT INTO Egzemplarz (Egzemplarz_ID, Sygnatura, Ksiazka_ID)
				SELECT Egzemplarz_ID, Sygnatura, Ksiazka_ID FROM inserted;
		END
END;


-- ### Testing ###

Use Test;
GO;

-- Insert a book
SET IDENTITY_INSERT Ksiazka ON;
INSERT INTO Ksiazka (Ksiazka_ID, ISBN, Tytul, Autor, Rok_Wydania, Cena)
	VALUES (2137, '12345678902', 'Tytul', 'Robert Maklowicz', 2023, 29.99);
SET IDENTITY_INSERT Ksiazka OFF;


-- insert 5 specimens
SET IDENTITY_INSERT Egzemplarz ON;
INSERT INTO Egzemplarz (Egzemplarz_ID, Sygnatura, Ksiazka_ID)
	VALUES (2130, 'EG001', 2137),
		   (2131, 'EG002', 2137),
		   (2132, 'EG003', 2137),
		   (2133, 'EG004', 2137),
		   (2134, 'EG005', 2137);

-- 6th one should fail
INSERT INTO Egzemplarz (Egzemplarz_ID, Sygnatura, Ksiazka_ID)
	VALUES (2136, 'EG006', 2137);



SET IDENTITY_INSERT Egzemplarz OFF;