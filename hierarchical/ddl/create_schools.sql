create table schools (
  id integer primary key, -- urn
  name varchar(256) not null
);

create index school_name on schools(name);
