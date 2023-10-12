-- Câu 6
select 
code_service as "Ma Dich Vu",
name_service as "Tên Dịch Vụ",
acreage as "Diện Tích",
rental_costs as "Chi Phí Thuê",
name_type_service as "Tên Loại Dịch Vụ"
from service 
join typeservice on service.code_type_service = typeservice.code_type_service
where code_service 
not in (
	select code_service from contract
    where year(start_date_contract) = 2021 
    and month(start_date_contract) in (1,2,3)
);