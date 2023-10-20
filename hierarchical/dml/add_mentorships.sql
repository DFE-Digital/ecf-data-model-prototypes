insert into mentorships(id, mentee_id, mentor_id, started_on, finished_on) values
  (
    'men-edward-michael-grange-hill-1',
     (select id from tenureships where school_id = 'Grange Hill' and person_id = 'Edward'),
     (select id from tenureships where school_id = 'Grange Hill' and person_id = 'Michael'),
     '2022-09-12',
     null
  ),
  (
    'men-erica-mary-sunnydale-1',
     (select id from tenureships where school_id = 'Sunnydale High' and person_id = 'Erica'),
     (select id from tenureships where school_id = 'Sunnydale High' and person_id = 'Mary'),
     '2022-09-05',
     null
  )
;
