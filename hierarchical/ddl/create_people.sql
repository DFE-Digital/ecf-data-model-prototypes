create table people (
  id varchar(64) primary key,
  name varchar(128) not null
);

create index people_name on people(name);
