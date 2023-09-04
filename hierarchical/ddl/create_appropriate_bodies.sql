create table appropriate_bodies (
  id integer primary key,
  name varchar(64)
);

create index appropriate_body_name on appropriate_bodies(name);
