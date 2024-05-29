package LinhWine.Service.User;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Dao.BillsDao;
import LinhWine.Dto.CartDto;
import LinhWine.Entity.BillDetail;
import LinhWine.Entity.Bills;
@Service
public class BillsServiceImpl implements IBillsService {

	@Autowired
	private BillsDao billsDao;
	
	public int addBills(Bills bill) {
		return billsDao.addBills(bill);
	}

	public void addBillsDetail(HashMap<Long, CartDto> carts) {
		long idBills = billsDao.getIdLastBills();
		
		for(Map.Entry<Long, CartDto> itemCart : carts.entrySet()) {
			BillDetail billDetail = new BillDetail();
			billDetail.setId_bills(idBills);
			billDetail.setId_product(itemCart.getValue().getProduct().getId_product());
			billDetail.setQuanty(itemCart.getValue().getQuanty());
			billDetail.setTotal(itemCart.getValue().getTotalPrice());
			billsDao.addBillsDetails(billDetail);
		}
	}

	public List<Bills> getAllBills() {
		return billsDao.getAllBills();
	}

	public List<BillDetail> getBillDetailById(long id) {
		return billsDao.getBillDetailById(id);
	}

	public List<Bills> getBillById(long id) {
		return billsDao.getBillById(id);
	}

	public int editStatus(long id, String status, Date date) {
		return billsDao.editStatus(id, status, date);
	}

	public List<Bills> getAllBillsComplete() {
		return billsDao.getAllBillsComplete();
	}

	public List<Bills> getBillByName(String name) {
		return billsDao.getBillByName(name);
	}

	
}
