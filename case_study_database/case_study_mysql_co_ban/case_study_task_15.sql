 -- Câu 15
 select 
 staff.code_staff as "Mã Nhân Viên",
 staff.fullname_staff as "Họ Tên",
 lever.name_lever as "Tên Trình Độ",
 part.name_part as "Tên Bộ Phận",
 staff.number_phone_staff as "SDT",
 staff.address_staff as "Địa Chỉ"
 from staff
 join part 
 on part.code_part = staff.code_part
 join lever
 on lever.code_lever = staff.code_lever
 join contract
 on contract.code_staff = staff.code_staff
 where year(contract.start_date_contract) in (2020,2021)
group by
 staff.code_staff
 having count(contract.code_staff) < 3 
 ;
