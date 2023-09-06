create table schools (
  id varchar(16) primary key,
  name varchar(256) not null
);

create index school_name on schools(name);
