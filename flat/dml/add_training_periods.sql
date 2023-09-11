insert into training_periods (id, started_on, finished_on, lead_provider_id, delivery_partner_id, registration_id)
select 
 1,
 TO_DATE('2022-10-01', 'YYYY-MM-DD'),
 null,
 lp.id,
 dp.id,
 r.id
FROM
registrations R
inner join people ect on ect.id = r.person_id
inner join schools s on s.id = r.funding_school_id
cross join lead_providers lp
cross join delivery_partners dp
where ect.id = 1
and s.id = 1
and lp.id = 1
and dp.id = 1
;
