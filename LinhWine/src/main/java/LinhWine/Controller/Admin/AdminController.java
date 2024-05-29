package LinhWine.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Controller.User.BaseController;
import LinhWine.Entity.Bills;
import LinhWine.Entity.Categories;
import LinhWine.Entity.Products;
import LinhWine.Service.User.BillsServiceImpl;
import LinhWine.Service.User.CategoryServiceImpl;
import LinhWine.Service.User.ProductServiceImpl;
import LinhWine.utils.SessionUtil;
@Controller
public class AdminController extends BaseController {
	
	@Autowired
	BillsServiceImpl billService;
	
	@Autowired
	ProductServiceImpl productService;
	
	@RequestMapping("/quan-tri/trang-chu")
	public ModelAndView index() {
		double total = 0;
		int countProduct, sold = 0, countUser;
		List<Bills> listBill = billService.getAllBillsComplete();
		List<Products> listProducts = productService.getAllProducts();
		for (Bills bills : listBill) {
			total += bills.getTotal();
		}
		for (Products products : listProducts) {
			sold += products.getSo_luong_ban();
		}
		countProduct = listProducts.size();
		
		_mvShare.addObject("totalSold", total);
		_mvShare.addObject("soldQuanty", sold);
		_mvShare.addObject("productQuanty", countProduct);
		
		_mvShare.setViewName("admin/index");
		return _mvShare;
	}

	
	
	
}
