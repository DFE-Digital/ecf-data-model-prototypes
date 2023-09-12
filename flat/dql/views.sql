-- School view of induction periods
create or replace function School_IP (School_ID int)
 returns table ("School Name" text, "ECT Name" text, "ECT ID" int, "Mentor Name" text,  "IP Started" date, "IP Ended" date)
 as $$
select s.NAME as "School Name", ect.name as "ECT Name", ect.id as "ECT ID", mentor.name, ip.started_on, ip.finished_on
from induction_periods ip
inner join appropriate_bodies ab on ab.id = ip.appropriate_body_id
inner join people mentor on mentor.id =ip.mentor_id
inner join registrations r on r.id = ip.registration_id
inner join schools s on S.id = r.funding_school_id
inner join people ECT on ect.id= r.person_id
where (ip.finished_on > current_date OR ip.finished_on is null)
and s.id = $1
order by s.id asc, ect.id asc
$$
LANGUAGE SQL;



-- School view of registrations
create or replace function School_Reg (School_ID int)
 returns table ("School Name" text, "Teacher Name" text, "Registrated from" date, "Registrated to" date)
 as $$
select s.NAME, t.name, r.started_on, r.finished_on
from registrations r
inner join people T on T.id = r.person_id
inner join schools s on S.id = r.funding_school_id
where s.id = $1
order by s.id asc, t.id asc, r.finished_on desc, r.started_on desc
$$
LANGUAGE SQL;


-- LP or DP view of ECTs and training periods
create or replace FUNCTION LP_VIEW (LP_ID int)
 RETURNS TABLE ("LP NAME" TEXT, "DP NAME" TEXT, "School Name" text, "ECT Name" text, "TP ID" int, "TP Started" date, "TP Ended" date)
 as $$
select 
 lp.name, dp.name, s.name, ect.name, tp.id, tp.started_on, 
 case when tp.finished_on is not null then tp.finished_on
 else null
 end
FROM training_periods tp
inner join registrations R on r.id = tp.registration_id
inner join people ect on ect.id = r.person_id
inner join schools s on s.id = r.funding_school_id
inner join lead_providers lp on tp.lead_provider_id = lp.id
inner join delivery_partners dp on tp.delivery_partner_id = dp.id
where lp.id = $1
order by lp.id asc, dp.id asc, tp.finished_on desc
 $$
 LANGUAGE SQL;
;

