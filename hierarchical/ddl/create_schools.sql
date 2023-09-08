create table schools (
  id varchar(64) primary key,
  name varchar(256) not null
);

create index school_name on schools(name);
