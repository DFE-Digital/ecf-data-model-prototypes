create table lead_providers (
  id varchar(64) primary key,
  name varchar(64) not null
);

create index lead_provider_name on lead_providers(name);
