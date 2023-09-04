create table people (
  id serial primary key,
  name varchar(128)
);

create index people_name on people(name);
