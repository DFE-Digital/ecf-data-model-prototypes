create table registrations (
  id serial primary key,
  person_id integer references people(id),
  funding_school_id integer references schools(id),
  started_on date not null,
  finished_on date null
);

create index registrations_person_id on registrations(person_id);
