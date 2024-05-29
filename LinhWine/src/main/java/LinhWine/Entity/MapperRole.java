package LinhWine.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperRole  implements RowMapper<Role> {

	public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
		
			Role role = new Role();
			role.setId_role(rs.getLong("id_role"));
			role.setName(rs.getString("name"));
			
		
		return role;
	}

}
