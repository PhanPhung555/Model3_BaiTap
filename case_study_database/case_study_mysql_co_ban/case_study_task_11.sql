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