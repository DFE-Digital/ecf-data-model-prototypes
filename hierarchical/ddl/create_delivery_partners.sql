create table delivery_partners (
  id serial primary key,
  name varchar(64)
);

create index delivery_partner_name on delivery_partners(name);
