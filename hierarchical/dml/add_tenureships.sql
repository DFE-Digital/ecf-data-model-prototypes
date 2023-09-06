insert into tenureships(id, school_id, person_id, started_on, finished_on) values
  (
    'TENURESHIP-1',
    (select id from schools where name = 'School A'),
    (select id from people where name = 'Mentor A'),
    '2012-11-24',
    null
  ),
  (
    'TENURESHIP-2',
    (select id from schools where name = 'School A'),
    (select id from people where name = 'ECT A'),
    '2022-09-11',
    null
  ),
  (
    'TENURESHIP-3',
    (select id from schools where name = 'School A'),
    (select id from people where name = 'ECT B'),
    '2020-02-24',
    null
  )
;
