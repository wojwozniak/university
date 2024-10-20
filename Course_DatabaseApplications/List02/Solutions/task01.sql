CREATE OR ALTER FUNCTION late_books (@days_overdue INT)
	RETURNS TABLE AS RETURN
(
    SELECT C.PESEL, COUNT(DISTINCT W.Wypozyczenie_ID) 'Late Books'
		FROM Wypozyczenie W
		JOIN Czytelnik C ON W.Czytelnik_ID = C.Czytelnik_ID
		WHERE W.Liczba_Dni >= @days_overdue
		GROUP BY C.PESEL
);

SELECT * FROM late_books(14);