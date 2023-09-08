create table appropriate_bodies (
  id varchar(64) primary key,
  name varchar(64) not null
);

create index appropriate_body_name on appropriate_bodies(name);
