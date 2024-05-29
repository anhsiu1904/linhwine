package LinhWine.Dao;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import LinhWine.Entity.BillDetail;
import LinhWine.Entity.Bills;
import LinhWine.Entity.MapperBillDetail;
import LinhWine.Entity.MapperBills;
@Repository
public class BillsDao extends BaseDao {

	public int addBills(Bills bill ) {
		String sql = "INSERT INTO bills (";
		sql += "tendn, sdt, hoten, diachi, total, soluong, note, trang_thai, ngay_tao ) ";
		sql += "VALUES (";
		sql += "'"+bill.getTendn()+"', ";
		sql += "'"+bill.getSdt()+"', ";
		sql += "'"+bill.getHoten()+"', ";
		sql += "'"+bill.getDiachi()+"', ";
		sql += ""+bill.getTotal()+", ";
		sql += ""+bill.getSoluong()+", ";
		sql += "'"+bill.getNote()+"', ";
		sql += "'"+bill.getTrang_thai()+"', ";
		sql += "'"+bill.getNgay_tao()+"') ";
		
		int insert = _jdbcTemplate.update(sql);
		
		return insert;
	}
	public long getIdLastBills() {
		String sql = "SELECT MAX(id) FROM bills";
		long id = _jdbcTemplate.queryForObject(sql, new Object[] {}, Long.class);
		return id;
	}
	
	public int addBillsDetails(BillDetail billDetail) {
		String sql = "INSERT INTO billdetail ( ";
		sql += "id_product, id_bills, quanty, total) ";
		sql += "VALUES (";
		sql += " "+billDetail.getId_product()+", ";
		sql += " "+billDetail.getId_bills()+", ";
		sql += " "+billDetail.getQuanty()+", ";
		sql += " "+billDetail.getTotal()+" )";
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public List<Bills> getAllBills(){
		String sql = "SELECT * FROM bills ";
		
		
		List<Bills> list = _jdbcTemplate.query(sql, new MapperBills());
		return list;
	}
	
	public List<Bills> getAllBillsComplete(){
		String sql = "SELECT * FROM bills ";
		sql += "WHERE trang_thai = 'Hoàn thành' ";
		
		List<Bills> list = _jdbcTemplate.query(sql, new MapperBills());
		return list;
	}
	
	public List<Bills> getBillById(long id){
		String sql = "SELECT * FROM bills ";
		sql += "WHERE id="+id;
		
		List<Bills> list = _jdbcTemplate.query(sql, new MapperBills());
		return list;
	}
	public List<BillDetail> getBillDetailById(long id){
		String sql = "SELECT * FROM billdetail ";
		sql += "WHERE id_bills = "+id; 
		
		List<BillDetail> list = _jdbcTemplate.query(sql, new MapperBillDetail());
		return list;
	}
	
	
	
	public int editStatus(long id, String status, Date date) {
		String sql = "UPDATE bills ";
		sql += "SET trang_thai = '"+status+"', ";
		sql += "ngay_cap_nhat = '"+date+ "' ";
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public List<Bills> getBillByName(String name){
		String sql = "SELECT * FROM bills ";
		sql += "WHERE tendn = '"+name+"' ";
		
		List<Bills> list = _jdbcTemplate.query(sql, new MapperBills());
		return list;
	}
}
