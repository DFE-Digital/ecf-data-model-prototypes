create table lead_provider_associations (
  id integer primary key,
  person_id integer references people(id),
  lead_provider_id integer references lead_providers(id)
);

create index lead_provider_assocations_person_id on lead_provider_associations(person_id);
create index lead_provider_assocations_lead_provider_id on lead_provider_associations(lead_provider_id);
