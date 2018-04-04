
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
