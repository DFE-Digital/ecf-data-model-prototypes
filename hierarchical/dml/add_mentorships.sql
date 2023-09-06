insert into mentorships(id, mentor_id, mentee_id, started_on, finished_on) values
  (
    'MENTORSHIP-1',
    (select id from tenureships where school_id = 'SCHOOL-A' and person_id = 'ECT-A'),
    (select id from tenureships where school_id = 'SCHOOL-A' and person_id = 'MENTOR-A'),
    '2022-11-13',
    null
  ),
  (
    'MENTORSHIP-2',
    (select id from tenureships where school_id = 'SCHOOL-A' and person_id = 'ECT-B'),
    (select id from tenureships where school_id = 'SCHOOL-A' and person_id = 'MENTOR-A'),
    '2022-10-24',
    null
  ),
  (
    'MENTORSHIP-3',
    (select id from tenureships where school_id = 'SCHOOL-B' and person_id = 'ECT-C'),
    (select id from tenureships where school_id = 'SCHOOL-B' and person_id = 'MENTOR-B'),
    '2022-10-24',
    null
  )
;
