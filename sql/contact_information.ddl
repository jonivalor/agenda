
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
