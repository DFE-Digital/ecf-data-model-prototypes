create table induction_periods (
  id serial primary key,
  mentor_id integer references people(id),
  registration_id integer references registrations(id),
  appropriate_body_id integer references appropriate_bodies(id),
  started_on date not null,
  finished_on date null
);

create index induction_periods_appropriate_body_id on induction_periods(appropriate_body_id);
