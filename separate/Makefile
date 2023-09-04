database_name=prototype_separate
psql_command=psql -q

refresh:
	${psql_command} < ./ddl/create_database.sql
	${psql_command} ${database_name} < ./ddl/create_people.sql
	${psql_command} ${database_name} < ./ddl/create_schools.sql
	${psql_command} ${database_name} < ./ddl/create_appropriate_bodies.sql
	${psql_command} ${database_name} < ./ddl/create_delivery_partners.sql
	${psql_command} ${database_name} < ./ddl/create_lead_providers.sql
	# join tables
	${psql_command} ${database_name} < ./ddl/create_tenureships.sql
	${psql_command} ${database_name} < ./ddl/create_mentorships.sql
	${psql_command} ${database_name} < ./ddl/create_appropriate_body_appointments.sql
	${psql_command} ${database_name} < ./ddl/create_delivery_partner_associations.sql
	${psql_command} ${database_name} < ./ddl/create_lead_provider_associations.sql
