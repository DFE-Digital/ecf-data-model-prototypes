
 insert into induction_periods (id, appropriate_body_id, mentor_id, registration_id, started_on, finished_on) SELECT 
    case when (p.name = 'ECT C'  AND m.name = 'MENTOR B' and ab.name = 'Appropriate Body A') then 1
 when (p.name = 'ECT A'  AND s.name = 'SCHOOL A' AND m.name = 'MENTOR A' and ab.name = 'Appropriate Body A') then 2
 when (p.name = 'ECT B'  AND s.name = 'SCHOOL A' AND m.name = 'MENTOR A' and ab.name = 'Appropriate Body A') then 3
 end,
    ab.id,
    m.id,
	r.id,
    r.started_on,
    r.finished_on
 FROM people m, registrations r, people p, appropriate_bodies ab, schools s
 where p.id = r.person_id and s.id = r.funding_school_id
 AND (
 (p.name = 'ECT C'  AND m.name = 'MENTOR B' and ab.name = 'Appropriate Body A' and s.name = 'SCHOOL B')
 OR (p.name = 'ECT A'  AND s.name = 'SCHOOL A' AND m.name = 'MENTOR A' and ab.name = 'Appropriate Body A')
 OR (p.name = 'ECT B'  AND s.name = 'SCHOOL A' AND m.name = 'MENTOR A' and ab.name = 'Appropriate Body A')
 )
;

