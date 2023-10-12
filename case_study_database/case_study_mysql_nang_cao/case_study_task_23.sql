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