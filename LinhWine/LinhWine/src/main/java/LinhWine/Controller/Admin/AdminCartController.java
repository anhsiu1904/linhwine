package LinhWine.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Controller.User.BaseController;
import LinhWine.Entity.BillDetail;
import LinhWine.Entity.Bills;
import LinhWine.Entity.Products;
import LinhWine.Service.User.BillsServiceImpl;
import LinhWine.Service.User.ProductServiceImpl;

@Controller
public class AdminCartController extends BaseController {

	@Autowired
	BillsServiceImpl billService;
	
	@Autowired
	ProductServiceImpl productService;
	
	@RequestMapping("/quan-tri/quan-ly-hoa-don")
	public ModelAndView index() {
		_mvShare.addObject("bills", billService.getAllBills());
		_mvShare.setViewName("admin/bills/QLhoadon");
		return _mvShare;
	}
	
	@RequestMapping("/quan-tri/chi-tiet-hoa-don/{id}")
	public ModelAndView detail(@PathVariable long id) {
		_mvShare.addObject("allProducts", productService.getAllProducts());
		_mvShare.addObject("bill", billService.getBillById(id).get(0));
		
		_mvShare.addObject("billdetail", billService.getBillDetailById(id));
		_mvShare.setViewName("admin/bills/chitiethoadon");
		return _mvShare;
	}
	
	long millis=System.currentTimeMillis();
	java.sql.Date date=new java.sql.Date(millis);
	
	@RequestMapping(value={"/quan-tri/cap-nhat-trang-thai/{id}/{trang_thai}"})
	public String updateStatus(HttpServletRequest request, @PathVariable long id, @PathVariable String trang_thai){
		
		List<BillDetail> listBillDetails = billService.getBillDetailById(id);
		List<Products> listProducts = productService.getAllProducts();
		Bills bill = billService.getBillById(id).get(0);
		
		if(trang_thai.equals("Hoàn thành")) {
			
			for (BillDetail billDetail : listBillDetails) {
				for (Products product : listProducts) {
					if(product.getId_product() == billDetail.getId_product()) {
						product.setSo_luong_ton(product.getSo_luong_ton() - billDetail.getQuanty());
						product.setSo_luong_ban(product.getSo_luong_ban() + billDetail.getQuanty());
						productService.updateQuantyProduct(product.getId_product(), product.getSo_luong_ton(), product.getSo_luong_ban());
					}
				}
			}
		}
		
		
		billService.editStatus(id, trang_thai, date);
		
		
		return "redirect:"+request.getHeader("Referer");
	}
}
