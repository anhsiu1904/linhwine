package LinhWine.Service.User;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import LinhWine.Dto.CartDto;
import LinhWine.Entity.BillDetail;
import LinhWine.Entity.Bills;
@Service
interface IBillsService {
	public int addBills(Bills bill);
	public List<Bills> getBillByName(String name);
	public void addBillsDetail(HashMap<Long, CartDto> carts);
	
	public List<Bills> getAllBills();
	public List<Bills> getBillById(long id);
	public List<BillDetail> getBillDetailById(long id);
	public int editStatus(long id, String status, Date date);
	public List<Bills> getAllBillsComplete();
}
