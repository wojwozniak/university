CREATE OR REPLACE FUNCTION plan_zajec_prac(kod_prac INTEGER, kod_sem INTEGER)
RETURNS TABLE (
    kod_grupy integer,
    kod_przed_sem integer,
    kod_uz integer,
    max_osoby smallint,
    rodzaj_zajec character(1),
    termin character(13),
    sala character varying(3)
) as $$
BEGIN
    RETURN QUERY
	select  grupa.kod_grupy,
    grupa.kod_przed_sem,
    grupa.kod_uz,
    grupa.max_osoby,
    grupa.rodzaj_zajec,
    grupa.termin,
    grupa.sala from grupa
		join przedmiot_semestr on przedmiot_semestr.kod_przed_sem = grupa.kod_przed_sem
		  where grupa.kod_uz = plan_zajec_prac.kod_prac and plan_zajec_prac.kod_sem = przedmiot_semestr.semestr_id;
END;
$$ LANGUAGE plpgsql;

select * from plan_zajec_prac(187, 39);