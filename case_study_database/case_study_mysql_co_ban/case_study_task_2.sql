-- Câu 2
select
 * 
 from staff 
 where fullname_staff 
 like "H%" or fullname_staff like "T%"
 or fullname_staff like "K%"
 and length(fullname_staff) < 15;