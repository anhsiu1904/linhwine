package LinhWine.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import LinhWine.Entity.ChangePass;
import LinhWine.Entity.MapperRole;
import LinhWine.Entity.MapperUsers;
import LinhWine.Entity.Role;
import LinhWine.Entity.Users;

@Repository
public class AccountDao extends BaseDao {

	public int AddAccount(Users user) {
		String sql = "INSERT INTO users ";
		sql += "( tendn, matkhau, hoten, sdt, diachi, status ) ";
		sql += "VALUES ( ";
		sql += "'"+user.getTendn()+"', ";
		sql += "'"+user.getMatkhau()+"', ";
		sql += "'"+user.getHoten()+"', ";
		sql += "'"+user.getSdt()+"', ";
		sql += "'"+user.getDiachi()+"', ";
		sql += ""+1+") ";
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int saveUserMember(Users user) {
		String sql = "INSERT INTO user_role  ";
		sql += "(user_id, role_id) ";
		sql += "VALUES ( ";
		sql += ""+user.getId()+", ";
		sql += +1+") ";
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	public Users getUserByName(Users user) {
		String sql = "SELECT * FROM users  " ;
		sql += "WHERE tendn ='"+user.getTendn()+"'";
		Users result = _jdbcTemplate.queryForObject(sql, new MapperUsers());
		return result;
	}
	
	public Users getUserByAcc(Users user) {
		String sql = "SELECT * FROM users u " ;
			sql += "INNER JOIN user_role ur ON u.id = ur.user_id ";
			sql += "INNER JOIN role r ON ur.role_id = r.id_role ";
			sql+="WHERE tendn = '"+user.getTendn()+"' AND status = "+1;
		
		
		List<Users> result = _jdbcTemplate.query(sql, new MapperUsers());
		return result.isEmpty()? null : result.get(0);
	}
	
	public List<Role> getAllRole(){
		String sql = "SELECT * FROM role ";
		
		List<Role> list = _jdbcTemplate.query(sql, new MapperRole());
		return list;
	}

	public List<Users> getAllUsers(){
		String sql = "SELECT * FROM users ";
		
		List<Users> list = _jdbcTemplate.query(sql, new MapperUsers());
		return list;
	}
	
	public List<Users> getUserById(long id) {
		String sql = "SELECT * FROM users u ";
		sql += "INNER JOIN user_role ur ON u.id = ur.user_id ";
		sql += "INNER JOIN role r ON ur.role_id = r.id_role ";
		sql += "WHERE u.id = "+id;
		
		List<Users> result = _jdbcTemplate.query(sql, new MapperUsers());
		return result;
	}
	
	public int updateUser(Users user, long id) {
		String sql = "UPDATE users u ";
		sql += "INNER JOIN user_role ur ON u.id=ur.user_id ";
		sql += "INNER JOIN role r ON ur.role_id=r.id_role ";
		sql += "SET u.status = "+user.isStatus()+", ";
		sql += "ur.role_id = "+user.getRole().getId_role()+" ";
		sql += "WHERE u.id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int deleteUser(long id) {
		String sql = "DELETE FROM users ";
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int changeInformation(Users user, long id) {
		String sql = "UPDATE users ";
		sql += "SET hoten = '"+user.getHoten()+"', ";
		sql += "sdt = '"+user.getSdt()+"', ";
		sql += "diachi = '"+user.getDiachi()+"' ";
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	public int changePass(ChangePass pass, long id) {
		String sql = "UPDATE users ";
		sql += "SET matkhau = '"+pass.getNewpass()+"' ";
		
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
}
