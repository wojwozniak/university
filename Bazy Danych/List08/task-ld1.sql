--DROP FUNCTION pierwszy_zapis(integer, integer);

CREATE OR REPLACE FUNCTION pierwszy_zapis(semestr_id INTEGER, kod_uz INTEGER)
RETURNS TABLE (
    "data" timestamptz,
    nazwa text,
	imie varchar(15),
	nazwisko varchar(30)) as $$
BEGIN
    RETURN QUERY
	select wybor.data, semestr.nazwa, uzytkownik.imie, uzytkownik.nazwisko from przedmiot_semestr
		join grupa on przedmiot_semestr.kod_przed_sem = grupa.kod_przed_sem
		join wybor on grupa.kod_grupy = wybor.kod_grupy
		join semestr on semestr.semestr_id = przedmiot_semestr.semestr_id
		join uzytkownik on uzytkownik.kod_uz = wybor.kod_uz
			where pierwszy_zapis.semestr_id = przedmiot_semestr.semestr_id
			and wybor.kod_uz = pierwszy_zapis.kod_uz
			order by "data" asc
			limit 1;
END;
$$ LANGUAGE plpgsql;

select * from pierwszy_zapis(28, 2587);