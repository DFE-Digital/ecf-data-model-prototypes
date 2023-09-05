create table people (
  id serial primary key,
  name varchar(128) not null
);

create index people_name on people(name);
