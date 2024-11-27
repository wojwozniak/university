-- Setup
Use Test;
DROP INDEX IDX_Ksiazka_ISBN ON Ksiazka;
DROP INDEX IDX_Egzemplarz_Ksiazka_ID ON Egzemplarz;
DROP INDEX IDX_Covering_Ksiazka_Egzemplarz ON Egzemplarz;

-- ksiazka and egzemplarz already have clustered indexes on Ksiazka_ID and Egzemplarz_ID
SELECT K.Tytul, K.Autor, K.ISBN, E.Sygnatura 
	FROM Ksiazka K
	JOIN Egzemplarz E
	ON K.Ksiazka_ID = E.Ksiazka_ID
	WHERE K.ISBN = '1234567890';


-- nonclustered index on Ksiazka_ISBN for faster lookups
CREATE NONCLUSTERED INDEX IDX_Ksiazka_ISBN ON Ksiazka(ISBN);

SELECT K.ISBN	
	FROM Ksiazka K
	JOIN Egzemplarz E
	ON K.Ksiazka_ID = E.Ksiazka_ID
	WHERE K.ISBN = '1234567890';


-- nonclustered index on Egzemplarz.Ksiazka_ID for faster joins
CREATE NONCLUSTERED INDEX IDX_Egzemplarz_Ksiazka_ID ON Egzemplarz(Ksiazka_ID);

SELECT K.ISBN	
	FROM Ksiazka K
	JOIN Egzemplarz E
	ON K.Ksiazka_ID = E.Ksiazka_ID
	WHERE K.ISBN = '1234567890';

-- covering index for a query that joins Ksiazka and Egzemplarz
CREATE NONCLUSTERED INDEX IDX_Covering_Ksiazka_Egzemplarz ON Egzemplarz(Ksiazka_ID, Sygnatura)
	INCLUDE (Egzemplarz_ID);

SELECT K.Ksiazka_ID, E.Sygnatura	
	FROM Ksiazka K
	JOIN Egzemplarz E
	ON K.Ksiazka_ID = E.Ksiazka_ID
	WHERE K.ISBN = '1234567890';