-- Câu 7
select 
code_service as "Ma Dich Vu",
name_service as "Tên Dịch Vụ",
acreage as "Diện Tích",
number_person_max as "Số Người Max",
rental_costs as "Chi Phí Thuê",
name_type_service as "Tên Loại Dịch Vụ"
from service
join typeservice on service.code_type_service = typeservice.code_type_service
where code_service in (
	select code_service from contract 
	where 
    year(start_date_contract) = 2020
)
and code_service not in (
	select code_service from contract 
	where 
    year(start_date_contract) = 2021
) ;