create table appropriate_bodies (
  id varchar(16) primary key,
  name varchar(64) not null
);

create index appropriate_body_name on appropriate_bodies(name);
