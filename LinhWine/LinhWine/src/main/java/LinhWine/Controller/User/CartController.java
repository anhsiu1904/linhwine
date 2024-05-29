	package LinhWine.Controller.User;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Dto.CartDto;
import LinhWine.Entity.Bills;
import LinhWine.Entity.Users;
import LinhWine.Service.User.BillsServiceImpl;
import LinhWine.Service.User.CartServiceImpl;

@Controller
public class CartController extends BaseController {
	@Autowired
	private CartServiceImpl cartService = new CartServiceImpl();
	
	@Autowired
	private BillsServiceImpl billService = new BillsServiceImpl();
	
	@RequestMapping(value = {"/gio-hang"})
	public ModelAndView Cart() {
		_mvShare.addObject("slides", _homeServiceImpl.getDataSlides());
		
		_mvShare.addObject("products", _homeServiceImpl.getDataProducts());
		_mvShare.addObject("hightlight", _homeServiceImpl.getHightlightProducts());
		_mvShare.addObject("vang", _homeServiceImpl.getVangProducts());
		_mvShare.setViewName("user/products/cart");
		return _mvShare;
	}
	
	@RequestMapping(value = {"/add-cart/{id}"})
	public String addCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.addCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.totalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.totalPrice(cart));
		return "redirect:/gio-hang";
	}
	
	@RequestMapping(value = {"/edit-cart/{id}/{quanty}"})
	public String editCart(HttpServletRequest request, HttpSession session, @PathVariable long id,@PathVariable int quanty) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.editCart(id, quanty, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.totalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.totalPrice(cart));
		return "redirect:"+request.getHeader("Referer");
	}
	
	@RequestMapping(value = {"/del-cart/{id}"})
	public String delCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.delCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.totalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.totalPrice(cart));
		return "redirect:"+request.getHeader("Referer");
	}
	
	@RequestMapping(value = {"/checkout"}, method = RequestMethod.GET)
	public ModelAndView checkout(HttpServletRequest request, HttpSession session) {
		_mvShare.setViewName("user/bills/checkout");
		Bills bill = new Bills();
		Users loginInfo = (Users)session.getAttribute("LoginInfo");
		if(loginInfo != null) {
			bill.setTendn(loginInfo.getTendn());
			bill.setHoten(loginInfo.getHoten());
			bill.setSdt(loginInfo.getSdt());
			bill.setDiachi(loginInfo.getDiachi());
		}
		_mvShare.addObject("bills", bill);
		return _mvShare;
	}
	
	long millis=System.currentTimeMillis();
	java.sql.Date date=new java.sql.Date(millis);
	
	@RequestMapping(value = {"/checkout"}, method = RequestMethod.POST)
	public String checkoutBill(HttpServletRequest request, HttpSession session, @ModelAttribute("bills") Bills bill) {
		Users loginInfo = (Users)session.getAttribute("LoginInfo");
		if(loginInfo != null) {
			bill.setTendn(loginInfo.getTendn());
		}
		
		bill.setSoluong((Integer) session.getAttribute("TotalQuantyCart"));
		bill.setTotal((Double) session.getAttribute("TotalPriceCart"));
		bill.setTrang_thai("Đang giao");
		bill.setNgay_tao(date);
		if(billService.addBills(bill) > 0) {
			
			HashMap<Long, CartDto> carts = (HashMap<Long, CartDto>)session.getAttribute("Cart");
			billService.addBillsDetail(carts);
		}
		
		session.removeAttribute("Cart");
		session.removeAttribute("TotalPriceCart");
		return "redirect:/";
	}
}
