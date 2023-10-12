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