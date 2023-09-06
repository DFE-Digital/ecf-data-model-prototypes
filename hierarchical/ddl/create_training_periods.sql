create table training_periods (
  id varchar(16) primary key,
  mentorship_id varchar(16) references mentorships(id),
  started_on date not null,
  finished_on date null,

  -- to be determined, should the lead provider and delivery partners
  -- be linked via an 'induction programme'? for now, let's skip it
  -- as I'm not sure it provides much value without cohorts
  lead_provider_id varchar(16) references lead_providers(id),
  delivery_partner_id varchar(16) references delivery_partners(id)
);

create index training_periods_lead_provider_id on training_periods(lead_provider_id);
create index training_periods_delivery_partner_id on training_periods(delivery_partner_id);
create index training_periods_mentorship_id on training_periods(mentorship_id);
