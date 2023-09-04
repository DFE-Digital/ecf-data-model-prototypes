create table training_periods (
  id serial primary key,
  mentorship_id integer references mentorships(id),
  started_on date not null,
  finished_on date null,

  -- to be determined, should the lead provider and delivery partners
  -- be linked via an 'induction programme'? for now, let's skip it
  -- as I'm not sure it provides much value without cohorts
  lead_provider_id integer references lead_providers(id),
  delivery_partner_id integer references delivery_partners(id)
);

create index training_periods_lead_provider_id on training_periods(lead_provider_id);
create index training_periods_delivery_partner_id on training_periods(delivery_partner_id);
create index training_periods_mentorship_id on training_periods(mentorship_id);
