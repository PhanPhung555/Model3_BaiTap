
-- Câu 4
select 
clients.code_client,
 clients.fullname_client , 
 count(contract.code_client) as "Số Lần Đặt Phòng" 
 from clients
join contract on clients.code_client = contract.code_client
join typeclient on typeclient.code_type_client = clients.code_type_client where typeclient.name_type_client = "Diamond"
group by clients.code_client, clients.fullname_client;
