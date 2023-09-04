create table mentorships (
  id serial primary key,
  mentee_id integer references tenureships(id) not null,
  started_on date not null,
  finished_on date null,

  -- assume the mentor is at a school for now despite the policy
  -- stating they don't have to be. From a practical point of
  -- view they will be.
  mentor_id integer references tenureships(id)
);

create index mentorships_mentee_id on mentorships(mentee_id);
create index mentorships_mentor_id on mentorships(mentor_id);
