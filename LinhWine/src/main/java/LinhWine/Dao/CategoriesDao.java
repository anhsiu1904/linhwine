package LinhWine.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import LinhWine.Entity.Categories;
import LinhWine.Entity.MapperCategories;

@Repository
public class CategoriesDao extends BaseDao {
	
	public List<Categories> getDataCategories(){
		List<Categories> list = new ArrayList<Categories>();
		String sql = "SELECT * FROM categories";
		list = _jdbcTemplate.query(sql, new MapperCategories());
		
		return list;
	}
	
	public int addCategory(Categories category) {
		String sql= "INSERT INTO categories( ";
		sql += "name, description) VALUES (";
		sql += "'"+category.getName()+"', ";
		sql += "'"+category.getDescription()+"') ";
 		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public List<Categories> getCategoryById(long id) {
		String sql = "SELECT * FROM categories ";
		sql += "WHERE id = "+id;
		
		List<Categories> result = _jdbcTemplate.query(sql, new MapperCategories());
		return result;
	}
	
	public int updateCategory(Categories category, long id) {
		String sql = "UPDATE categories ";
		sql += "SET name = '"+category.getName()+"', ";
		sql += "description = '"+category.getDescription()+"' ";
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int deleteCategory(long id) {
		String sql = "DELETE FROM categories ";
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
}
