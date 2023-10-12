-- Câu 10
select 
contract.code_contract as "Mã Hợp Đồng",
contract.start_date_contract as "Ngày Làm HĐ",
contract.end_date_contract as "Ngày Kết Thúc HĐ",
contract.monney_deposit as "Tiền Đặt Cọc",
sum(distinct quantity) as "Số Lượng"
from contract
left join detailedcontract 
on contract.code_contract = detailedcontract.code_contract
group by
contract.code_contract,
contract.start_date_contract,
contract.end_date_contract ,
contract.monney_deposit ;

-- Câu 11
select 
servicegowith.code_service_gowith as "Mã Dịch Vụ",
servicegowith.name_service_gowith as "Tên Dịch Vụ"
 from servicegowith
join detailedcontract 
on servicegowith.code_service_gowith = detailedcontract.code_service_gowith
join contract
on detailedcontract.code_contract = contract.code_contract
join clients
on contract.code_client = clients.code_client
join typeclient
on clients.code_type_client = typeclient.code_type_client
where name_type_client = "Diamond" and (address_client like '%Vinh%' or address_client like '%Quảng Ngãi%')
group by
servicegowith.code_service_gowith,
servicegowith.name_service_gowith
;

-- Câu 12
select 
contract.code_contract as "Mã Dịch Vụ",
staff.fullname_staff as "Tên Nhân Viên",
clients.fullname_client as "Tên Khách Hàng",
clients.number_phone_client as "SDT khách hàng",
service.name_service as "Tên Dịch Vụ",
count(detailedcontract.quantity) as "Số Lượng DV đi Kèm",
contract.monney_deposit as "Tiền Đặt Cọc"
from contract
left join staff
on staff.code_staff = contract.code_staff
left join clients
on clients.code_client = contract.code_client
left join service 
on service.code_service = contract.code_service
left join detailedcontract
on detailedcontract.code_contract = contract.code_contract
where date_format(contract.start_date_contract,'%Y-%m') between '2020-10' and '2020-12'
and contract.start_date_contract not in 
 (
	select contract.start_date_contract from contract
    where date_format(contract.start_date_contract,'%Y-%m') between '2021-01' and '2021-06'
)
-- WHERE ((YEAR(contract.start_date_contract) = 2020 AND MONTH(contract.start_date_contract) BETWEEN 10 AND 12)
-- AND (YEAR(contract.start_date_contract) <> 2021 OR MONTH(contract.start_date_contract) NOT BETWEEN 1 AND 6))
group by
contract.code_contract
;

-- Câu 13
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
 
 -- Câu 14
select 
 contract.code_contract as "Mã Hợp Đồng",
 typeservice.name_type_service as "Tên Loại Dịch Vụ",
 servicegowith.name_service_gowith as "Tên Dịch Vụ đi kèm",
 count(distinct servicegowith.code_service_gowith) as "Số Lần sử dụng"
 from contract
 join service
 on service.code_service = contract.code_service
 join typeservice
 on typeservice.code_type_service = service.code_type_service
 join detailedcontract
 on detailedcontract.code_contract = contract.code_contract
 join servicegowith
 on servicegowith.code_service_gowith = detailedcontract.code_service_gowith
 group by
 contract.code_contract,
typeservice.name_type_service,
 servicegowith.name_service_gowith 
 having count(servicegowith.code_service_gowith) = 1
;
 
 -- Câu 15
 select 
 staff.code_staff as "Mã Nhân Viên",
 staff.fullname_staff as "Họ Tên",
 lever.name_lever as "Tên Trình Độ",
 part.name_part as "Tên Bộ Phận",
 staff.number_phone_staff as "SDT",
 staff.address_staff as "Địa Chỉ"
 from staff
 join part 
 on part.code_part = staff.code_part
 join lever
 on lever.code_lever = staff.code_lever
 join contract
 on contract.code_staff = staff.code_staff
 where year(contract.start_date_contract) in (2020,2021)
group by
 staff.code_staff
 having count(contract.code_staff) < 3 
 ;

-- Câu 16
select 
staff.code_staff as "code",
staff.fullname_staff as "Tên"
from staff 
left join contract on contract.code_staff = staff.code_staff
group by 
staff.code_staff
having count(contract.code_staff) = 0;

delete from staff where code_staff in (
	select cd_staff
    from (
		select staff.code_staff as cd_staff
        from staff
        left join contract 
		on contract.code_staff = staff.code_staff
		group by 
		staff.code_staff
		having count(contract.code_staff) = 0
    ) as subquery
);
-- Câu 17
SET sql_safe_updates = 0;
update clients set code_type_client = 1
where code_client in (
	select cd_client 
    from (
	select
	 clients.code_client as cd_client
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
	where year(contract.start_date_contract) = 2021 
	group by  
	clients.code_client
    having
    sum(service.rental_costs + detailedcontract.quantity * servicegowith.price) > 10000000 
	) as subquery
) ;




-- Câu 18 (Sự Ràng Buộc)
delete from clients
where code_client in (
select clients.code_client from clients
join contract 
on contract.code_client = clients.code_client
where year(contract.start_date_contract) < 2021
)
;

-- Câu 19
SET sql_safe_updates = 0;
update servicegowith 
set price = price * 2
where code_service_gowith in(
	select 
	code_ser
    from (
	select  detailedcontract.code_service_gowith as code_ser
    from detailedcontract
    join servicegowith
    on servicegowith.code_service_gowith = detailedcontract.code_service_gowith
    join contract
    on contract.code_contract = detailedcontract.code_contract
    where 
    year(contract.start_date_contract) = 2020
    group by
	detailedcontract.code_service_gowith
	having
	max(detailedcontract.quantity) > 10
    ) as subquery
);
SET sql_safe_updates = 1;

-- Câu 20
select 
code_staff as "Mã ",
fullname_staff as "Tên",
email_staff as "Email",
number_phone_staff as "SDT",
address_staff as "Địa Chỉ",
'Nhân viên' AS "Khách Hàng Or Nhân Viên"
from staff
union all 
select 
code_client as "Mã",
fullname_client as "Tên",
email_client as "Email",
number_phone_client as "SDT",
address_client as "Địa Chỉ",
'Khách hàng' AS "Khách Hàng Or Nhân Viên"
from clients;
