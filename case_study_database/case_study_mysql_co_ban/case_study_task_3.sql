-- Câu 3
select
 * 
 from clients
 where (year(curdate()) - year(date_of_birth_client)) between 18 and 50 
 and (address_client like "%Đà Nẳng%" or address_client like "%Quảng Trị%") ;