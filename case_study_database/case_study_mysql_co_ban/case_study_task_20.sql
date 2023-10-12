-- Câu 20
select 
code_staff as "Mã ",
fullname_staff as "Tên",
email_staff as "Email",
number_phone_staff as "SDT",
address_staff as "Địa Chỉ",
'Nhân viên' AS "Khách Hàng Or Nhân Viên"
from staff
union all 
select 
code_client as "Mã",
fullname_client as "Tên",
email_client as "Email",
number_phone_client as "SDT",
address_client as "Địa Chỉ",
'Khách hàng' AS "Khách Hàng Or Nhân Viên"
from clients;
