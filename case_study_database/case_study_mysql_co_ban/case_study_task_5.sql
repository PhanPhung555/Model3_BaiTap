
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
