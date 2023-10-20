create table induction_periods (
  id varchar(64) primary key,
  mentorship_id varchar(64) references mentorships(id),
  appropriate_body_id varchar(64) references appropriate_bodies(id),
  started_on date not null,
  finished_on date null
);

create index induction_periods_mentorship_id on induction_periods(mentorship_id);
create index induction_periods_appropriate_body_id on induction_periods(appropriate_body_id);
