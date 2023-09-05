with
  mentorship_ids_by_mentor_name as (
    select m.id, p.name
    from mentorships m
    inner join tenureships t on m.mentor_id = t.id
    inner join people p on t.person_id = p.id
  ),
  mentorship_ids_by_mentee_name as (
    select m.id, p.name
    from mentorships m
    inner join tenureships t on m.mentee_id = t.id
    inner join people p on t.person_id = p.id
  ),
  mentorship_ids_by_names as (
    select m.id, mentor.name as mentor_name, mentee.name as mentee_name
    from mentorships m
    inner join mentorship_ids_by_mentor_name mentor on m.id = mentor.id
    inner join mentorship_ids_by_mentee_name mentee on m.id = mentee.id
  )
insert into induction_periods(appropriate_body_id, mentorship_id, started_on, finished_on) values
  (
    (select id from appropriate_bodies where name = 'Appropriate Body A'),
    (select id from mentorship_ids_by_names m where m.mentor_name = 'Mentor A' and m.mentee_name = 'ECT A'),
    '2023-11-16',
    null
  )
;
