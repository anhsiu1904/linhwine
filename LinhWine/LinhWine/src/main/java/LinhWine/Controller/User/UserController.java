package LinhWine.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Entity.BillDetail;
import LinhWine.Entity.Bills;
import LinhWine.Entity.ChangePass;
import LinhWine.Entity.Products;
import LinhWine.Entity.Users;
import LinhWine.Service.User.AccountServiceImpl;
import LinhWine.Service.User.BillsServiceImpl;
import LinhWine.Service.User.ProductServiceImpl;
import LinhWine.utils.SessionUtil;

@Controller
public class UserController extends BaseController {

	@Autowired
	AccountServiceImpl accountService;

	@Autowired
	BillsServiceImpl billService;

	@Autowired
	ProductServiceImpl productService;

	@RequestMapping(value = { "/dang-ky" }, method = RequestMethod.GET)
	public ModelAndView Register(Users user, HttpSession session) {
		_mvShare.setViewName("user/account/register");
		_mvShare.addObject("user", new Users());
		return _mvShare;
	}

	@RequestMapping(value = { "/dang-ky" }, method = RequestMethod.POST)
	public ModelAndView CreateAccount(HttpSession session, @ModelAttribute("user") Users user) {
		boolean check = true;
		int count;
		List<Users> listUsers = accountService.getAllUsers();
		for (Users users : listUsers) {
			if (user.getTendn().equals(users.getTendn())) {
				check = false;
				break;
			}
		}
		if (check) {
			count = accountService.addAccount(user);
		} else {
			count = 0;
		}

		if (count == 1) {

			session.setAttribute("status", "Đăng ký thành công");
			accountService.saveUserMember(accountService.getUserByName(user));
			_mvShare.setViewName("user/account/login");
		} else if(count==3){
			session.setAttribute("tendnLength", "Độ dài tên tài khoản lớn hơn 5 ký tự");
			_mvShare.setViewName("user/account/register");
		}else if(count == 2){
			session.setAttribute("passLength", "Độ dài mật khẩu lớn hơn 5 ký tự");
			_mvShare.setViewName("user/account/register");
		}else if(count == 0) {
			session.setAttribute("status", "Tên đăng nhập đã tồn tại");
			_mvShare.setViewName("user/account/register");
			
		}

		return _mvShare;
	}

	@RequestMapping(value = { "/dang-nhap" }, method = RequestMethod.GET)
	public ModelAndView Login() {
		_mvShare.setViewName("user/account/login");
		_mvShare.addObject("user", new Users());
		return _mvShare;
	}

	@RequestMapping(value = { "/dang-nhap" }, method = RequestMethod.POST)
	public ModelAndView Login(HttpServletRequest request, HttpSession session, @ModelAttribute("user") Users user) {
		user = accountService.checkAccount(user);

		if (user != null) {
			
			SessionUtil.getInstance().putValue(request, "UserLogin", user);
			if (user.getRole().getName().equals("USER")) {
				_mvShare.setViewName("redirect:/");

			} else if (user.getRole().getName().equals("ADMIN")) {
				_mvShare.setViewName("redirect:/quan-tri/trang-chu");

			}
			session.setAttribute("LoginInfo", user);
		} else {
			session.setAttribute("statusLogin", "Tài khoản hoặc mật khẩu không chính xác!");
			_mvShare.setViewName("redirect:/dang-nhap");

		}

		return _mvShare;
	}

	@RequestMapping(value = { "/dang-xuat" }, method = RequestMethod.GET)
	public String Logout(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("LoginInfo");
		SessionUtil.getInstance().removeValue(request, "UserLogin");
		return "redirect:/dang-nhap";
	}

	@RequestMapping(value = { "/thong-tin-tai-khoan" }, method = RequestMethod.GET)
	public ModelAndView information(HttpSession session) {

		Users loginInfo = (Users) session.getAttribute("UserLogin");
		if (loginInfo == null) {
			_mvShare.setViewName("redirect:/dang-nhap");
		} else {
			List<Bills> listBill = billService.getBillByName(loginInfo.getTendn());
			List<BillDetail> listBillDetail = new ArrayList<BillDetail>();
			for (Bills bills : listBill) {
				List<BillDetail> list = billService.getBillDetailById(bills.getId());
				for (BillDetail billDetail : list) {
					listBillDetail.add(billDetail);
				}

			}
			_mvShare.addObject("listBillDetail", listBillDetail);
			_mvShare.addObject("allProducts", productService.getAllProducts());
			_mvShare.addObject("billByName", listBill);

			_mvShare.setViewName("user/account/information");
		}

		return _mvShare;
	}

	@RequestMapping(value = { "/doi-thong-tin/{id}" }, method = RequestMethod.GET)
	public ModelAndView getUser(HttpSession session, @PathVariable long id) {
		if (session.getAttribute("UserLogin") == null) {
			_mvShare.setViewName("redirect:/dang-nhap");
		} else {
			_mvShare.setViewName("user/account/changeInformation");
			_mvShare.addObject("changeUser", accountService.getUserById(id).get(0));
		}
		return _mvShare;
	}

	@RequestMapping(value = { "/doi-thong-tin/{id}" }, method = RequestMethod.POST)
	public ModelAndView changeInformation(@PathVariable long id, @ModelAttribute("changeUser") Users user,
			HttpServletRequest request, HttpSession session) {
		
		int count = accountService.changeInformation(user, id);
		user.setTendn(accountService.getUserById(id).get(0).getTendn());
		SessionUtil.getInstance().putValue(request, "UserLogin", user);
		_mvShare.setViewName("user/account/information");
		

		return _mvShare;
	}

	@RequestMapping(value = { "/doi-mat-khau" }, method = RequestMethod.GET)
	public ModelAndView getPass(HttpSession session) {
		if (session.getAttribute("UserLogin") == null) {
			_mvShare.setViewName("redirect:/dang-nhap");
		} else {
			_mvShare.setViewName("user/account/changePass");
			_mvShare.addObject("changePass", new ChangePass());
			_mvShare.addObject("length", "");
			_mvShare.addObject("old", "");
			_mvShare.addObject("confirm", "");
		}
		return _mvShare;
	}

	@RequestMapping(value = { "/doi-mat-khau" }, method = RequestMethod.POST)
	public ModelAndView changePass(@ModelAttribute("changePass") ChangePass pass, HttpServletRequest request,
			HttpSession session) {
		Users user = (Users) session.getAttribute("UserLogin");

		String count = accountService.changePass(pass, user.getId());

		if (count == "") {
			SessionUtil.getInstance().putValue(request, "UserLogin", user);
			_mvShare.setViewName("user/account/information");

		} else if (count.equals("length")) {
			_mvShare.addObject("length", "Độ dài mật khẩu lớn hơn 5 ký tự");
			_mvShare.setViewName("user/account/changePass");
			

		} else if (count.equals("old")) {
			_mvShare.addObject("old", "Mật khẩu cũ không đúng");
			_mvShare.setViewName("user/account/changePass");

		} else if (count.equals("confirm")) {
			_mvShare.addObject("confirm", "Mật khẩu nhập lại không khớp");
			_mvShare.setViewName("user/account/changePass");

		}

		return _mvShare;
	}
}
