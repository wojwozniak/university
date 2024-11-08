CREATE TYPE IDTable AS TABLE
(
    Czytelnik_ID INT
);

GO

CREATE OR ALTER PROCEDURE GetTotalBorrowedDays
    @ReaderIDs IDTable READONLY
AS
BEGIN
    SELECT 
        W.Czytelnik_ID, 
        SUM(W.Liczba_Dni) AS Total_Borrowed_Days
    FROM 
        Wypozyczenie W
    JOIN 
        @ReaderIDs RID ON W.Czytelnik_ID = RID.Czytelnik_ID
    GROUP BY 
        W.Czytelnik_ID;
END;
GO

SELECT * FROM Czytelnik;

DECLARE @ReaderIDs IDTable;
INSERT INTO @ReaderIDs (Czytelnik_ID) VALUES (1), (2), (3), (4);
EXEC GetTotalBorrowedDays @ReaderIDs;