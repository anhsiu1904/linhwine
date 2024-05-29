package LinhWine.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import LinhWine.Entity.ChangePass;
import LinhWine.Entity.Role;
import LinhWine.Entity.Users;

@Service
public interface IAccountService {
	public int addAccount(Users user);
	public Users checkAccount(Users user);
	public int saveUserMember(Users user);
	public Users getUserByName(Users user);
	public int changeInformation(Users user, long id);
	public String changePass(ChangePass pass, long id);
	
	public List<Users> getAllUsers();
	public List<Users> getUserById(long id);
	public int updateUser(Users user, long id);
	public List<Role> getAllRole();
	public int deleteUser(long id);
}
