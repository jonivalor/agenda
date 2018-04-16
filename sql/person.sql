
CREATE OR REPLACE FUNCTION person (
	IN p_dni                      integer,
	IN p_name                     text,
	IN p_surname                  text,
	IN p_birthday                 date,
	IN p_nationality              text,
	IN p_contact_information      contact_information
) RETURNS person AS
$$
	INSERT INTO person
		VALUES(p_dni, p_name, p_surname, p_birthday, p_nationality, p_contact_information)
	RETURNING *;
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION person_search_by_surname (
	IN p_surname                  text
) RETURNS SETOF person AS $$
DECLARE
	v_surname                     text
BEGIN
	v_surname = p_surname;
	IF v_surname = null THEN
		SELECT * FROM person ORDER BY surname;
	ELSE
		SELECT * FROM person WHERE surname ilike v_surname || '%' ORDER BY surname;
	END IF;
END;
$$ LANGUAGE plpgsql STABLE STRICT;
