create table delivery_partner_associations (
  id integer primary key,
  person_id integer references people(id),
  delivery_partner_id integer references delivery_partners(id)
);

create index delivery_partner_assocations_person_id on delivery_partner_associations(person_id);
create index delivery_partner_assocations_delivery_partner_id on delivery_partner_associations(delivery_partner_id);
