
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
	IN p_surname                  text DEFAULT '%'
) RETURNS SETOF person AS
$$
		SELECT * FROM person WHERE surname ilike p_surname || '%' ORDER BY surname;
$$ LANGUAGE sql STABLE STRICT;
