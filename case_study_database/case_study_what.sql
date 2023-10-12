-- Câu 2
select * from staff where fullname_staff like "H%" or fullname_staff like "T%" or fullname_staff like "K%" and length(fullname_staff) < 15;

-- Câu 3
select * from clients where (year(curdate()) - year(date_of_birth_client)) between 18 and 50  and (address_client like "%Đà Nẳng%" or address_client like "%Quảng Trị%") ;

-- Câu 4
select clients.code_client, clients.fullname_client , count(contract.code_client) as "Số Lần Đặt Phòng" from clients
join contract on clients.code_client = contract.code_client
join typeclient on typeclient.code_type_client = clients.code_type_client where typeclient.name_type_client = "Diamond"
group by clients.code_client, clients.fullname_client;

-- Câu 5
select
 clients.code_client as "Mã Khách Hàng",
 clients.fullname_client as "Tên Khách Hàng",
 typeclient.name_type_client as "Tên Loại Khoách Hàng",
 contract.code_contract as "Mã Hợp Đồng",
 service.name_service as "Tên Dịch Vụ",
 contract.start_date_contract as "Ngày Làm Hợp Đồng",
 contract.end_date_contract as "Ngày Kết Thúc",
 sum(service.rental_costs + detailedcontract.quantity * servicegowith.price) as "Tổng Tiền"
 from clients 
 left join 
 typeclient on clients.code_type_client = typeclient.code_type_client
 left join
 contract on clients.code_client = contract.code_client
 left join 
 service on service.code_service = contract.code_service
 left join
detailedcontract  on detailedcontract.code_contract = contract.code_contract
left join
servicegowith on servicegowith.code_service_gowith = detailedcontract.code_service_gowith
group by  
 clients.code_client ,
 clients.fullname_client ,
 typeclient.name_type_client,
 contract.code_contract,
 service.name_service ,
 contract.start_date_contract,
 contract.end_date_contract 
;

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

-- Câu 8 - 3 cách
select fullname_client from clients group by fullname_client having count(*) > 1 ;
select distinct fullname_client from clients where fullname_client in (select fullname_client from clients group by fullname_client having count(*) > 1);

-- Câu 9
select
 month(contract.start_date_contract) as "Tháng",
 count(distinct contract.code_client) as "Số Lượng "
 from clients
 join contract on clients.code_client = contract.code_client
 where year(start_date_contract) = 2021 
 group by
 month(contract.start_date_contract)
 ;
 
