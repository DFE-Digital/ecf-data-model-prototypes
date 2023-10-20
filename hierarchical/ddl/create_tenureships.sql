create table tenureships (
  id varchar(64) primary key,
  person_id varchar(64) references people(id) not null,
  school_id varchar(64) references schools(id) not null,
  started_on date not null,
  finished_on date null
);

create index tenureships_person_id on tenureships(person_id);
create index tenureships_school_id on tenureships(school_id);
