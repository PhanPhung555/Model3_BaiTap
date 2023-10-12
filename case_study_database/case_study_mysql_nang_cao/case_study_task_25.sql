-- Câu 25
	-- Tạo 1 bảng lịch sử danh sách xóa để hiển thị
CREATE TABLE log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_time DATETIME NOT NULL,
    log_message VARCHAR(255) NOT NULL
);
	-- Trigger xóa sẽ thêm vào bảng log 1 kết quả
delimiter //
create trigger tr_delete_contract 
after delete on contract
for each row
begin
    declare remaining_records int;
    select COUNT(*) into remaining_records from contract;
	insert into log (log_time, log_message)
    value (now(), concat('Tổng số lượng bản ghi còn lại trong hop_dong: ', remaining_records));
end;
//
delimiter ;
delete from contract where code_contract = 15;
select * from log;