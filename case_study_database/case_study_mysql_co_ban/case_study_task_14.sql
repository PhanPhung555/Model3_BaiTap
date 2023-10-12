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