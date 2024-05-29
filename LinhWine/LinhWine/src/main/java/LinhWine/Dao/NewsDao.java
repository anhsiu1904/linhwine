package LinhWine.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import LinhWine.Entity.CategoryNew;
import LinhWine.Entity.MapperCategoryNew;
import LinhWine.Entity.MapperNews;
import LinhWine.Entity.News;

@Repository
public class NewsDao extends BaseDao {

	public List<News> getAllNews(){
		List<News> list = new ArrayList<News>();
		String sql = "SELECT * FROM news";
		list = _jdbcTemplate.query(sql, new MapperNews());
		
		return list;
	}
	
	public List<CategoryNew> getAllCategoryNews(){
		List<CategoryNew> list = new ArrayList<CategoryNew>();
		String sql = "SELECT * FROM new_category";
		list = _jdbcTemplate.query(sql, new MapperCategoryNew());
		
		return list;
	}
	
	public List<News> getNewByCategoryNew(long id){
		List<News> list = new ArrayList<News>();
		String sql = "SELECT * FROM news ";
		sql += "WHERE id_new_category = "+id;
		list = _jdbcTemplate.query(sql, new MapperNews());
		
		return list;
	}
	
	public List<News> getNewById(long id){
		List<News> list = new ArrayList<News>();
		String sql = "SELECT * FROM news ";
		sql += "WHERE id_new = "+id;
		list = _jdbcTemplate.query(sql, new MapperNews());
		
		return list;
	}

	public int addNew(News news) {
		String sql = "INSERT INTO news ";
		sql += "( anh, tieu_de, tom_tat, noi_dung, id_new_category, ngay_tao, nguoi_tao ) ";
		sql += "VALUES ( ";
		sql += " '"+news.getAnh()+"', ";
		sql += " '"+news.getTieu_de()+"', ";
		sql += " '"+news.getTom_tat()+"', ";
		sql += " '"+news.getNoi_dung()+"', ";
		sql += " "+news.getId_new_category()+", ";
		sql += " '"+news.getNgay_tao()+"', ";
		sql += " "+news.getNguoi_tao()+") ";
		
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int updateNew(News news, long id) {
		String sql = "UPDATE news ";
		sql += "SET anh = '"+news.getAnh()+"', ";
		sql += "tieu_de = '"+news.getTieu_de()+"', ";
		sql += "tom_tat = '"+news.getTom_tat()+"', ";
		sql += "id_new_category = "+news.getId_new_category()+", ";
		sql += "noi_dung = '"+news.getNoi_dung()+"', ";
		sql += "ngay_cap_nhat = '"+news.getNgay_cap_nhat()+"', ";
		sql += "nguoi_cap_nhat = "+news.getNguoi_cap_nhat()+" ";
		sql += "WHERE id_new = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int deleteNew(long id) {
		String sql = "DELETE FROM news ";
		sql += "WHERE id_new = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
}
