package LinhWine.Service.User;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Dao.AccountDao;
import LinhWine.Entity.ChangePass;
import LinhWine.Entity.Role;
import LinhWine.Entity.Users;
@Service
public class AccountServiceImpl implements IAccountService {

	@Autowired
	AccountDao accountDao;

	public int addAccount(Users user) {
		
		
		if(user.getTendn().length()>5) {
			if(user.getMatkhau().length()>5) {
				user.setMatkhau(BCrypt.hashpw(user.getMatkhau(), BCrypt.gensalt(12)));
				accountDao.AddAccount(user);
				
				return 1;
			}else {
				return 2;
			}
			
		}else {
			return 3;
		}
				
		
		
		
		
	}

	public Users checkAccount(Users user) {
		String pass = user.getMatkhau();
		user = accountDao.getUserByAcc(user);
		if(user == null) {
			return null ;
			
		}else {
			if(BCrypt.checkpw(pass, user.getMatkhau())) {
				return user;
			}else {
				return null;
			}
		}
		
	}

	public int saveUserMember(Users user) {
		
		return accountDao.saveUserMember(user);
	}

	public Users getUserByName(Users user) {
		
		return accountDao.getUserByName(user);
	}

	public List<Users> getAllUsers() {
		return accountDao.getAllUsers();
	}

	public List<Users> getUserById(long id) {
		return accountDao.getUserById(id);
	}

	public int updateUser(Users user, long id) {
		return accountDao.updateUser(user, id);
	}

	public List<Role> getAllRole() {
		return accountDao.getAllRole();
	}

	public int deleteUser(long id) {
		return accountDao.deleteUser(id);
	}

	public int changeInformation(Users user, long id) {
		return accountDao.changeInformation(user, id);
	}

	public String changePass(ChangePass pass, long id) {
		Users user = accountDao.getUserById(id).get(0);
		if(BCrypt.checkpw(pass.getOldpass(), user.getMatkhau())) {
			if(pass.getNewpass().length()>5) {
				if(pass.getNewpass().equals(pass.getConfirmpass())) {
					pass.setId(user.getId());
					pass.setNewpass(BCrypt.hashpw(pass.getNewpass(), BCrypt.gensalt(12)));
					accountDao.changePass(pass, id);
					return "";
				}else {
					return "confirm";
				}
			}else {
				return "length";
			}
			
		
	}else {
		return "old";
	}

	
	}
}
