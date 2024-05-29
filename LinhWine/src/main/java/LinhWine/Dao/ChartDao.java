package LinhWine.Dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import LinhWine.Entity.Bills;
import LinhWine.Entity.Chart;
import LinhWine.Entity.MapperBills;

@Repository
public class ChartDao extends BaseDao {
	
	public List<Bills> getSumTotal(){
		String sql = "SELECT * FROM bills WHERE trang_thai='Hoàn thành'";
		
		List<Bills> list = _jdbcTemplate.query(sql, new MapperBills());
		return list;
	}
	
	

}
