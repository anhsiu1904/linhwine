package LinhWine.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperProducts implements RowMapper<Products> {

	public Products mapRow(ResultSet rs, int rowNum) throws SQLException {
		Products products = new Products();
		products.setId_product(rs.getLong("id"));
		products.setId_category(rs.getInt("id_category"));
		products.setTensp(rs.getString("tensp"));
		products.setAnh(rs.getString("anh"));
		products.setGia(rs.getDouble("gia"));
		products.setGiam_gia(rs.getInt("giam_gia"));
		products.setSo_luong_ban(rs.getInt("so_luong_ban"));
		products.setSo_luong_ton(rs.getInt("so_luong_ton"));
		products.setLoaisp(rs.getString("loaisp"));
		products.setThuong_hieu(rs.getString("thuong_hieu"));
		products.setXuat_xu(rs.getString("xuat_xu"));
		products.setDung_tich(rs.getString("dung_tich"));
		products.setNong_do(rs.getString("nong_do"));
		products.setTuoi_ruou(rs.getInt("tuoi_ruou"));
		products.setBo_suu_tap(rs.getString("bo_suu_tap"));
		products.setMo_ta(rs.getString("mo_ta"));
		products.setNgay_tao(rs.getDate("ngay_tao"));
		products.setNgay_cap_nhat(rs.getDate("ngay_cap_nhat"));
		products.setSp_noi_bat(rs.getBoolean("sp_noi_bat"));
		
		return products;
	}
	
}
