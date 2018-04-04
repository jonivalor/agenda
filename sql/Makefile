rm .PHONY: clean

all: agenda.sql

agenda.sql: \
	person.ddl \
	contact_information.ddl
	touch agenda.sql
	cat contact_information.ddl >> agenda.sql
	cat contact_information.sql >> agenda.sql
	cat person.ddl >> agenda.sql
	cat person.sql >> agenda.sql
	cat webapi.sql >> agenda.sql

clean:
	$(RM) agenda.sql
