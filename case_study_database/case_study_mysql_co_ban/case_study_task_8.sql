-- Câu 8 - 3 cách
select 
fullname_client 
from clients
group by 
fullname_client having count(*) > 1 ;


select distinct 
fullname_client 
from clients
where 
fullname_client in (select fullname_client from clients group by fullname_client having count(*) > 1);