-- ksiazka and egzemplarz already have clustered indexes on Ksiazka_ID and Egzemplarz_ID

-- nonclustered index on Ksiazka_ISBN for faster lookups
CREATE NONCLUSTERED INDEX IDX_Ksiazka_ISBN ON Ksiazka(ISBN);

-- nonclustered index on Egzemplarz.Ksiazka_ID for faster joins
CREATE NONCLUSTERED INDEX IDX_Egzemplarz_Ksiazka_ID ON Egzemplarz(Ksiazka_ID);

-- covering index for a query that joins Ksiazka and Egzemplarz
CREATE NONCLUSTERED INDEX IDX_Covering_Ksiazka_Egzemplarz ON Egzemplarz(Ksiazka_ID, Sygnatura)
	INCLUDE (Egzemplarz_ID);

-- test query
SELECT K.Tytul, K.Autor, K.ISBN, E.Sygnatura 
	FROM Ksiazka K
	JOIN Egzemplarz E
	ON K.Ksiazka_ID = E.Ksiazka_ID
	WHERE K.ISBN = '1234567890';