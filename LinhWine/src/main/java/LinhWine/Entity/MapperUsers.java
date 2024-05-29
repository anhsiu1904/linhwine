package LinhWine.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperUsers  implements RowMapper<Users> {

	public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
		Users users = new Users();
		users.setId(rs.getLong("id"));
		users.setTendn(rs.getString("tendn"));
		users.setMatkhau(rs.getString("matkhau"));
		users.setHoten(rs.getString("hoten"));
		users.setSdt(rs.getString("sdt"));
		users.setDiachi(rs.getString("diachi"));
		users.setStatus(rs.getBoolean("status"));
		try {
			Role role = new Role();
			role.setId_role(rs.getLong("id_role"));
			role.setName(rs.getString("name"));
			users.setRole(role);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return users;
	}

}
