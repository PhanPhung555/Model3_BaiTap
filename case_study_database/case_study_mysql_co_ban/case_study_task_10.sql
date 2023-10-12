-- Câu 10 
-- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select 
contract.code_contract as "Mã Hợp Đồng",
contract.start_date_contract as "Ngày Làm HĐ",
contract.end_date_contract as "Ngày Kết Thúc HĐ",
contract.monney_deposit as "Tiền Đặt Cọc",
sum(distinct quantity) as "Số Lượng"
from contract
left join detailedcontract 
on contract.code_contract = detailedcontract.code_contract
group by
contract.code_contract,
contract.start_date_contract,
contract.end_date_contract ,
contract.monney_deposit ;