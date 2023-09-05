with schools_and_teachers as (
  select t.id, s.name as school_name, p.name as person_name
  from tenureships t
  inner join people p on t.person_id = p.id
  inner join schools s on t.school_id = s.id
)
insert into mentorships(mentor_id, mentee_id, started_on, finished_on) values
  (
    (select id from schools_and_teachers where school_name = 'School A' and person_name = 'ECT A'),
    (select id from schools_and_teachers where school_name = 'School A' and person_name = 'Mentor A'),
    '2022-11-13',
    null
  ),
  (
    (select id from schools_and_teachers where school_name = 'School A' and person_name = 'ECT B'),
    (select id from schools_and_teachers where school_name = 'School A' and person_name = 'Mentor A'),
    '2022-10-24',
    null
  )
;
