-- Câu 16
select 
staff.code_staff as "code",
staff.fullname_staff as "Tên"
from staff 
left join contract on contract.code_staff = staff.code_staff
group by 
staff.code_staff
having count(contract.code_staff) = 0;

delete from staff where code_staff in (
	select cd_staff
    from (
		select staff.code_staff as cd_staff
        from staff
        left join contract 
		on contract.code_staff = staff.code_staff
		group by 
		staff.code_staff
		having count(contract.code_staff) = 0
    ) as subquery
);