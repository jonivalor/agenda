
-------------------------
-- CONTACT INFORMATION
-------------------------

CREATE TABLE contact_information (
	mobile_phone                  text, 
	land_line                     text,
	email                         text,
	address1                      text,
	address2                      text
);


CREATE OR REPLACE RULE contact_information_prevent_insert AS
	ON INSERT TO 
		contact_information
	DO INSTEAD NOTHING;

CREATE OR REPLACE FUNCTION contact_information (
	IN p_mobile_phone             text,
	IN p_land_line                text,
	IN p_email                    text, 
	IN p_address1                 text,
	IN p_address2                 text
) RETURNS contact_information AS 
$$
	SELECT (
		p_mobile_phone,
		p_land_line,
		p_email,
		p_address1,
		p_address2
	)::contact_information;
$$ LANGUAGE sql STABLE STRICT;

-------------------------
-- PERSON
-------------------------

CREATE TABLE person (
	dni                           integer PRIMARY KEY,
	name                          text NOT NULL,
	surname                       text NOT NULL,
	birthday                      date,
	nationality                   text,
	contact_information           contact_information
);

CREATE INDEX person_surname_idx ON person(surname);

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
	v_surname                     text;
BEGIN
	v_surname = p_surname;
	IF v_surname = null THEN
		SELECT * FROM person ORDER BY surname;
		RETURN
	ELSE
		SELECT * FROM person WHERE surname ilike v_surname || '%' ORDER BY surname;
		RETURN
	END IF;
END;
$$ LANGUAGE plpgsql STABLE STRICT;

-------------------------
-- WEBAPI
-------------------------

CREATE OR REPLACE FUNCTION webapi_person_create_person (
	IN p_person                   text
) RETURNS void AS $$
DECLARE
	v_person                      jsonb;
	v_contact_information         contact_information;

BEGIN
	v_person := p_person::jsonb;

	v_contact_information := contact_information (
		v_person #>> '{contact_information, mobile_phone}',
		v_person #>> '{contact_information, land_line}',
		v_person #>> '{contact_information, email}',
		v_person #>> '{contact_information, address1}',
		v_person #>> '{contact_information, address2}'
	);

	PERFORM person (
		(v_person ->> 'dni')::integer,
		v_person ->> 'name',
		v_person ->> 'surname',
		(v_person ->> 'birthday')::date,
		v_person ->> 'nationality',
		v_contact_information
	);
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION webapi_person_search_by_surname (
	IN p_surname                  text DEFAULT '{"surname": "%"}'
) RETURNS text AS $$
DECLARE
	v_surname                     jsonb;

BEGIN
	v_surname := p_surname::jsonb;

	RETURN array_to_json(array_agg(p))::text FROM person_search_by_surname(v_surname ->> 'surname') p;
END;
$$ LANGUAGE plpgsql STABLE STRICT;
