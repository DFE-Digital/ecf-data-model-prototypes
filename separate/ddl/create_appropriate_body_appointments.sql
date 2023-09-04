create table appropriate_body_appointments (
  id integer primary key,
  person_id integer references people(id),
  appropriate_body_id integer references appropriate_bodies(id)
);

create index appropriate_body_appointments_person_id on appropriate_body_appointments(person_id);
create index appropriate_body_appointments_appropriate_body_id on appropriate_body_appointments(appropriate_body_id);
