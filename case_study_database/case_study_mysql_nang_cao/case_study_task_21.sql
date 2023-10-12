-- Câu 21
create view v_staff as
select 
	staff.code_staff ,
    fullname_staff ,
    date_of_birth_staff,
    number_cmnd_staff,
    salary_staff,
    number_phone_staff,
    email_staff,
    address_staff,
    code_location,
    code_lever,
	code_part
 from staff
join contract 
on contract.code_staff = staff.code_staff
where  address_staff like "%Đà Nẳng%" ;