insert into induction_periods(id, appropriate_body_id, mentorship_id, started_on, finished_on) values
  (
    'IP-1',
    'AB-A',
    (select id from mentorships m where m.mentor_id = 'MENTOR-A' and m.mentee_id = 'ECT-A'),
    '2023-11-16',
    null
  ),
  (
    'IP-2',
    'AB-A',
    (select id from mentorships m where m.mentor_id = 'MENTOR-A' and m.mentee_id = 'ECT-A'),
    '2023-11-16',
    null
  ),
  (
    'IP-3',
    'AB-B',
    (select id from mentorships m where m.mentor_id = 'MENTOR-B' and m.mentee_id = 'ECT-C'),
    '2022-10-24',
    null
  )
;
