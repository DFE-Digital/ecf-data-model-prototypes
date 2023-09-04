create table induction_periods (
  id serial primary key,
  mentorship_id integer references mentorships(id),
  appropriate_body_id integer references appropriate_bodies(id),
  started_on date not null,
  finished_on date null
);

create index induction_periods_mentorship_id on induction_periods(mentorship_id);
create index induction_periods_appropriate_body_id on induction_periods(appropriate_body_id);
