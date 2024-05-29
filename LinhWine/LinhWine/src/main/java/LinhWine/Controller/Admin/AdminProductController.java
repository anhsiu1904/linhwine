package LinhWine.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Controller.User.BaseController;
import LinhWine.Dto.PageDto;
import LinhWine.Entity.Products;
import LinhWine.Service.User.CategoryServiceImpl;
import LinhWine.Service.User.PageServiceImpl;
import LinhWine.Service.User.ProductServiceImpl;

@Controller
public class AdminProductController extends BaseController {

	@Autowired
	ProductServiceImpl productService;
	
	@Autowired
	private CategoryServiceImpl categoryService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	private int totalProductsPage = 8;
	
	@RequestMapping("/quan-tri/quan-ly-san-pham")
	public ModelAndView index() {
		_mvShare.addObject("allProducts", productService.getAllProducts());
		_mvShare.setViewName("/admin/product/QLsanpham");
		
		int totalData = productService.getAllProducts().size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, 1);
		
		_mvShare.addObject("pageAdminInfo", pageInfo);
		_mvShare.addObject("adminProductsPage", categoryService.getDataProductsPage(0, pageInfo.getStart(), totalProductsPage));
		return _mvShare;
	}
	
	@RequestMapping(value = "/quan-tri/quan-ly-san-pham/{currentPage}")
	public ModelAndView page( @PathVariable String currentPage) {
		
		_mvShare.setViewName("/admin/product/QLsanpham");
		
		int totalData = productService.getAllProducts().size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, Integer.parseInt(currentPage));
		
		_mvShare.addObject("pageAdminInfo", pageInfo);
		_mvShare.addObject("adminProductsPage", categoryService.getDataProductsPage(0, pageInfo.getStart(), totalProductsPage));
		
		return _mvShare;
	}
	
	@RequestMapping("/quan-tri/chi-tiet-san-pham/{id}")
	public ModelAndView detailProduct(@PathVariable long id) {

		_mvShare.setViewName("/admin/product/chitietsanpham");
		_mvShare.addObject("product", productService.getProductById(id));
		int id_category = productService.getProductById(id).getId_category();
		_mvShare.addObject("productByIdCategory", productService.getProductByIdCategory(id_category));
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/them-san-pham"}, method = RequestMethod.GET)
	public ModelAndView product() {
		_mvShare.addObject("editProduct", "");
		_mvShare.setViewName("/admin/product/editSanPham");
		_mvShare.addObject("addProduct", new Products());
		_mvShare.addObject("categories", _homeServiceImpl.getDataCategories());
	
		return _mvShare;
	}
	
	long millis=System.currentTimeMillis();
	java.sql.Date date=new java.sql.Date(millis);
	
	@RequestMapping(value={"/quan-tri/them-san-pham"}, method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("addProduct") Products product, @RequestParam CommonsMultipartFile file,  
	           HttpSession session) {
		product.setAnh(file.getOriginalFilename());
		product.setNgay_tao(date);
		product.setNgay_cap_nhat(date);
		int count = productService.addProduct(product);
		saveImageForProduct(file, session);
		
		int totalData = productService.getAllProducts().size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, 1);
		
		_mvShare.addObject("pageAdminInfo", pageInfo);
		_mvShare.addObject("adminProductsPage", categoryService.getDataProductsPage(0, pageInfo.getStart(), totalProductsPage));
		
		_mvShare.setViewName("/admin/product/QLsanpham");
		
	
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/cap-nhat-san-pham/{id}"}, method = RequestMethod.GET)
	public ModelAndView editProduct(@PathVariable String id) {
		_mvShare.setViewName("/admin/product/editSanPham");
		_mvShare.addObject("editProduct", productService.getProductById(Long.parseLong(id)));
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/cap-nhat-san-pham/{id}"}, method = RequestMethod.POST)
	public ModelAndView updateCategory(@PathVariable String id, @ModelAttribute("editProduct") Products product ,@RequestParam CommonsMultipartFile file,  
	           HttpSession session) {
		
		product.setNgay_cap_nhat(date);
		if(!file.getOriginalFilename().isEmpty()) {
			product.setAnh(file.getOriginalFilename());
		}else {
			product.setAnh(productService.getProductById(Long.parseLong(id)).getAnh());
		}
			
		
		int count = productService.updateProduct(product, Long.parseLong(id));
		saveImageForProduct(file, session);
		
		int totalData = productService.getAllProducts().size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, 1);
		
		_mvShare.addObject("pageAdminInfo", pageInfo);
		_mvShare.addObject("adminProductsPage", categoryService.getDataProductsPage(0, pageInfo.getStart(), totalProductsPage));
		_mvShare.setViewName("admin/product/QLsanpham");
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/xoa-san-pham/{id}"})
	public String deleteProduct(HttpServletRequest request, @PathVariable String id) {
		int count = productService.deleteProduct(Long.parseLong(id));
		
		int totalData = productService.getAllProducts().size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, 1);
		
		_mvShare.addObject("pageAdminInfo", pageInfo);
		_mvShare.addObject("adminProductsPage", categoryService.getDataProductsPage(0, pageInfo.getStart(), totalProductsPage));
		_mvShare.setViewName("admin/product/QLsanpham");
		return "redirect:"+request.getHeader("Referer");
	}

	
	
	public void saveImageForProduct(@RequestParam CommonsMultipartFile file, HttpSession session) {

		ServletContext context = session.getServletContext();  
	    String path = context.getRealPath("/assets/user/img");  
	    String filename = file.getOriginalFilename();  
	  
	           
	  
	    byte[] bytes = file.getBytes();  
	    BufferedOutputStream stream;
		try {
			stream = new BufferedOutputStream(  
	                 new FileOutputStream(path+"/"+filename));  
			try {
				stream.write(bytes);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		    try {
				stream.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		    try {
				stream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	    
		
		
	}
}
