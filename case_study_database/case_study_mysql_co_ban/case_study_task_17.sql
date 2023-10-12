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