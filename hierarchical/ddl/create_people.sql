create table people (
  id varchar(16) primary key,
  name varchar(128) not null
);

create index people_name on people(name);
