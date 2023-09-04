create table training_periods (
  id serial primary key,
  started_on date not null,
  finished_on date null,
  registration_id integer references registrations(id),

  -- to be determined, should the lead provider and delivery partners
  -- be linked via an 'induction programme'? for now, let's skip it
  -- as I'm not sure it provides much value without cohorts
  lead_provider_id integer references lead_providers(id),
  delivery_partner_id integer references delivery_partners(id)
);

create index training_periods_lead_provider_id on training_periods(lead_provider_id);
create index training_periods_delivery_partner_id on training_periods(delivery_partner_id);
