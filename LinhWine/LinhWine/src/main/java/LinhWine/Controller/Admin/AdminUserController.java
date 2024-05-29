package LinhWine.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Controller.User.BaseController;
import LinhWine.Entity.Users;
import LinhWine.Service.User.AccountServiceImpl;

@Controller
public class AdminUserController extends BaseController {

	@Autowired
	AccountServiceImpl accountService;
	
	@RequestMapping("/quan-tri/quan-ly-tai-khoan")
	public ModelAndView index() {
		
		_mvShare.addObject("allUsers", accountService.getAllUsers());
		_mvShare.setViewName("admin/account/QLtaikhoan");
		
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/cap-nhat-tai-khoan/{id}"}, method = RequestMethod.GET)
	public ModelAndView editUser(@PathVariable String id) {
		_mvShare.setViewName("admin/account/editTaiKhoan");
		_mvShare.addObject("roles", accountService.getAllRole());
		_mvShare.addObject("user", accountService.getUserById(Long.parseLong(id)).get(0));
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/cap-nhat-tai-khoan/{id}"}, method = RequestMethod.POST)
	public ModelAndView updateUser(@PathVariable String id, @ModelAttribute("user") Users user) {
		int count = accountService.updateUser(user, Long.parseLong(id));
		
		_mvShare.addObject("allUsers", accountService.getAllUsers());
		_mvShare.setViewName("admin/account/QLtaikhoan");
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/xoa-tai-khoan/{id}"})
	public ModelAndView deleteUser(@PathVariable String id) {
		int count = accountService.deleteUser(Long.parseLong(id));
		_mvShare.addObject("allUsers", accountService.getAllUsers());
		_mvShare.setViewName("admin/account/QLtaikhoan");
		return _mvShare;
	}

}
