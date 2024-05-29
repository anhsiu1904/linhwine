package LinhWine.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperNews implements RowMapper<News> {

	public News mapRow(ResultSet rs, int rowNum) throws SQLException {
		News news = new News();
		news.setId_new(rs.getLong("id_new"));
		news.setAnh(rs.getString("anh"));
		news.setTieu_de(rs.getString("tieu_de"));
		news.setTom_tat(rs.getString("tom_tat"));
		news.setNoi_dung(rs.getString("noi_dung"));
		news.setId_new_category(rs.getLong("id_new_category"));
		news.setNguoi_tao(rs.getLong("nguoi_tao"));
		news.setNgay_tao(rs.getDate("ngay_tao"));
		news.setNguoi_cap_nhat(rs.getLong("nguoi_cap_nhat"));
		news.setNgay_cap_nhat(rs.getDate("ngay_cap_nhat"));
		
		return news;
	}

}
