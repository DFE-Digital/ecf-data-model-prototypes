
delete from induction_periods;
delete from registrations;
delete from appropriate_bodies;
delete from delivery_partners;
delete from lead_providers;
delete from people;
delete from schools;



insert into appropriate_bodies(id, name) values
  (1, 'Appropriate Body A'),
  (2, 'Appropriate Body B')
;

insert into delivery_partners(id, name) values
  (1, 'Delivery Partner A'),
  (2, 'Delivery Partner B'),
  (3, 'Delivery Partner C')
;


insert into lead_providers(id, name) values
  (1, 'Lead Provider A'),
  (2, 'Lead Provider B'),
  (3, 'Lead Provider C')
;

insert into people(id, name) values
  (1, 'ECT A'),
  (2, 'ECT B'),
  (3, 'ECT C'),
  (4, 'ECT D'),
  (5, 'MENTOR A'),
  (6, 'MENTOR B')
;

insert into schools(id, name) values
  (1, 'SCHOOL A'),
  (2, 'SCHOOL B'),
  (3, 'SCHOOL C')
;


insert into registrations (id, funding_school_id, person_id, started_on, finished_on) 
select
case when s.name = 'SCHOOL A' AND P.NAME = 'MENTOR A' then 1
when S.NAME = 'SCHOOL A' AND P.NAME = 'ECT A' then 2
when S.NAME = 'SCHOOL A' AND P.NAME = 'ECT B' then 3
when S.NAME = 'SCHOOL A' AND P.NAME = 'ECT C' then 4
when S.NAME = 'SCHOOL B' AND P.NAME = 'ECT C' then 5
when S.NAME = 'SCHOOL B' AND P.NAME = 'MENTOR B' then 6
end,
s.id,
p.id,
case when s.name = 'SCHOOL A' AND P.NAME = 'MENTOR A' then TO_DATE('2012-11-24', 'YYYY-MM-DD')
when S.NAME = 'SCHOOL A' AND P.NAME = 'ECT A' then TO_DATE('2022-09-11', 'YYYY-MM-DD')
when S.NAME = 'SCHOOL A' AND P.NAME = 'ECT B' then TO_DATE('2020-02-24', 'YYYY-MM-DD')
when S.NAME = 'SCHOOL A' AND P.NAME = 'ECT C' then TO_DATE('2018-04-30', 'YYYY-MM-DD')
when S.NAME = 'SCHOOL B' AND P.NAME = 'ECT C' then TO_DATE('2018-04-30', 'YYYY-MM-DD')
when S.NAME = 'SCHOOL B' AND P.NAME = 'MENTOR B' then TO_DATE('2020-05-01', 'YYYY-MM-DD')
end,
case
when S.NAME = 'SCHOOL A' AND P.NAME = 'ECT C' then TO_DATE('2019-07-12', 'YYYY-MM-DD')
else null
end
FROM
schools s, people p
where
(s.name = 'SCHOOL A' AND P.NAME = 'MENTOR A')
OR (S.NAME = 'SCHOOL A' AND P.NAME = 'ECT A')
OR (S.NAME = 'SCHOOL A' AND P.NAME = 'ECT B')
OR (S.NAME = 'SCHOOL A' AND P.NAME = 'ECT C')
OR (S.NAME = 'SCHOOL B' AND P.NAME = 'ECT C')
OR (S.NAME = 'SCHOOL B' AND P.NAME = 'MENTOR B')
;

  
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

