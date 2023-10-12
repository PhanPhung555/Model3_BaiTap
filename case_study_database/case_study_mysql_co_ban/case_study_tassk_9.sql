-- Câu 9
-- Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select
 month(contract.start_date_contract) as "Tháng",
 count(distinct contract.code_client) as "Số Lượng "
 from clients
 join contract on clients.code_client = contract.code_client
 where year(start_date_contract) = 2021 
 group by
 month(contract.start_date_contract)
 ;