package LinhWine.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCategoryNew implements RowMapper<CategoryNew> {

	public CategoryNew mapRow(ResultSet rs, int rowNum) throws SQLException {
		CategoryNew categoryNew = new CategoryNew();
		categoryNew.setId(rs.getLong("id"));
		categoryNew.setName(rs.getString("name"));
		
		return categoryNew;
	}

}
