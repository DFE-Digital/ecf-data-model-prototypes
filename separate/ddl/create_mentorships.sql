create table mentorships (
  id serial primary key,
  mentee_id integer references tenureships(id),
  mentor_id integer references tenureships(id), -- assume the mentor is at a school for now
  started_on date not null,
  finished_on date null
);

create index mentorships_mentee_id on mentorships(mentee_id);
create index mentorships_mentor_id on mentorships(mentor_id);
