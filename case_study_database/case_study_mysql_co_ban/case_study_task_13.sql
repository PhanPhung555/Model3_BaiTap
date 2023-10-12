select 
servicegowith.code_service_gowith as "Mã Dịch Vụ",
servicegowith.name_service_gowith as "Tên Dịch Vụ",
sum(detailedcontract.quantity) as "Số lần"
from servicegowith
join detailedcontract
on detailedcontract.code_service_gowith = servicegowith.code_service_gowith
group by
servicegowith.code_service_gowith
having sum(detailedcontract.quantity) = (
    select MAX(t_max)
    from (
        select max(detailedcontract.quantity) as t_max from detailedcontract
    ) 
 as subquery
 );