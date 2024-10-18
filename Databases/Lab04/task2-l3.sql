-- brakujace kolumny
ALTER TABLE company
ADD COLUMN current_offers_count INTEGER DEFAULT 0,
ADD COLUMN total_offers_count INTEGER DEFAULT 0;

-- funkcja
CREATE OR REPLACE FUNCTION update_offer_counts()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE company
        SET current_offers_count = current_offers_count + 1,
            total_offers_count = total_offers_count + 1
        WHERE id = NEW.company_id;
    ELSIF TG_OP = 'UPDATE' THEN
        -- Obsługa aktualizacji oferty (opcjonalnie)
    ELSIF TG_OP = 'DELETE' THEN
        UPDATE company
        SET current_offers_count = current_offers_count - 1
        WHERE id = OLD.company_id;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- trigger
CREATE TRIGGER update_offer_counts_trigger
AFTER INSERT OR UPDATE OR DELETE ON offer
FOR EACH ROW
EXECUTE FUNCTION update_offer_counts();


-- wyliczenia na start
UPDATE company
SET current_offers_count = (
    SELECT COUNT(*)
    FROM offer
    WHERE offer.company_id = company.id
    AND offer.deleted_at IS NULL -- tutaj wersja z deleted_at, ale mozna rownie dobrze wyliczyc to z osobnej tabeli
);

UPDATE company
SET total_offers_count = (
    SELECT COUNT(*)
    FROM offer
    WHERE offer.company_id = company.id
);

select * from company;