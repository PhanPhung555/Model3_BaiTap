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