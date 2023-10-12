-- Câu 23
SET sql_safe_updates = 0;
delimiter //
create procedure delete_client (in code_client int)
begin
	delete from clients
    where clients.code_client = code_client;
end //
delimiter ;
call delete_client(13);
SET sql_safe_updates = 1;
-- Câu 24
delimiter //
create procedure create_contract (
	in p_start_date_contract datetime,
    in p_end_date_contract datetime,
    in p_monney_deposit double,
    in p_code_staff int,
    in p_code_client int ,
    in p_code_service int
)
begin 
	-- Tạo Biến
	declare code_staff_check int;
	declare code_client_check int;
	declare code_service_check int;
    
    -- Trả về code_ của nhân viên , khách hàng , dịch vụ có trong hệ thống
    select count(*) into code_staff_check from staff  where staff.code_staff = p_code_staff;
    select count(*) into code_client_check from clients  where clients.code_client = p_code_client;
    select count(*) into code_service_check from service  where service.code_service = p_code_service;
    
    if code_staff_check = 0 then
		signal sqlstate '45000' set MESSAGE_TEXT  = 'Mã nhân viên không hợp lệ.';
    elseif code_client_check = 0 then
		signal sqlstate '45000' set message_text = 'Mã khách hàng không hợp lệ.';
	elseif code_service_check = 0 then
    signal sqlstate '45000' set message_text = 'Mã dịch vụ không hợp lệ.';
    else
      insert into contract (start_date_contract, end_date_contract, monney_deposit, code_staff, code_client, code_service)
            value (p_start_date_contract, p_end_date_contract, p_monney_deposit, code_staff_check, code_client_check, code_service_check);
	end if;
end //
delimiter ;
call create_contract('2023-10-12', '2023-12-31', 1000.00, 10,3, 6);