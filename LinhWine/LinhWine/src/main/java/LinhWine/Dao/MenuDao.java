package LinhWine.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import LinhWine.Entity.MapperMenu;
import LinhWine.Entity.Menu;
@Repository
public class MenuDao extends BaseDao {
	public List<Menu> getDataMenu(){
		List<Menu> list = new ArrayList<Menu>();
		String sql = "SELECT * FROM menu";
		list = _jdbcTemplate.query(sql, new MapperMenu());
		return list;
	}
}
