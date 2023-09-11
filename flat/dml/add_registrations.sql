
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
