package LinhWine.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperBills implements RowMapper<Bills> {

	public Bills mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bills bill = new Bills();
		bill.setId(rs.getLong("id"));
		bill.setTendn(rs.getString("tendn"));
		bill.setHoten(rs.getString("hoten"));
		bill.setSdt(rs.getString("sdt"));
		bill.setDiachi(rs.getString("diachi"));
		bill.setTotal(rs.getDouble("total"));
		bill.setSoluong(rs.getInt("soluong"));
		bill.setNote(rs.getString("note"));
		bill.setTrang_thai(rs.getString("trang_thai"));
		bill.setNgay_tao(rs.getDate("ngay_tao"));
		bill.setNgay_cap_nhat(rs.getDate("ngay_cap_nhat"));
		
		return bill;
	}

}
