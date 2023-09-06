create table delivery_partners (
  id varchar(16) primary key,
  name varchar(64) not null
);

create index delivery_partner_name on delivery_partners(name);
