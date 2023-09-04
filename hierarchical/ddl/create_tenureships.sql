create table tenureships (
  id serial primary key,
  person_id integer references people(id) not null,
  school_id integer references schools(id) not null,
  started_on date not null,
  finished_on date null
);

create index tenureships_person_id on tenureships(person_id);
create index tenureships_school_id on tenureships(school_id);
