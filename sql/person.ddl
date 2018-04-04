
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
