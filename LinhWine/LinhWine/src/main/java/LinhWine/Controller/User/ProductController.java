package LinhWine.Controller.User;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Dto.PageDto;
import LinhWine.Service.User.CategoryServiceImpl;
import LinhWine.Service.User.PageServiceImpl;
import LinhWine.Service.User.ProductServiceImpl;

@Controller
public class ProductController extends BaseController {
	
	@Autowired
	ProductServiceImpl productService;
	
	@Autowired
	private CategoryServiceImpl categoryService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	private int totalProductsPage = 12;
	
	@RequestMapping("/chi-tiet-san-pham/{id}")
	public ModelAndView Product(@PathVariable long id) {

		_mvShare.setViewName("user/products/product");
		_mvShare.addObject("product", productService.getProductById(id));
		int id_category = productService.getProductById(id).getId_category();
		_mvShare.addObject("productByIdCategory", productService.getProductByIdCategory(id_category));
		return _mvShare;
	}
	
	@RequestMapping("/tat-ca-san-pham")
	public ModelAndView index() {
		
		
		
		_mvShare.setViewName("/user/products/allProduct");
		
		int totalData = productService.getAllProducts().size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, 1);
		_mvShare.addObject("sortPage", "");
		_mvShare.addObject("pageProductInfo", pageInfo);
		_mvShare.addObject("productsPage", categoryService.getDataProductsPage(0, pageInfo.getStart(), totalProductsPage));
		return _mvShare;
	}
	
	@RequestMapping(value = "/tat-ca-san-pham/{currentPage}")
	public ModelAndView page( @PathVariable int currentPage) {
		
		_mvShare.setViewName("/user/products/allProduct");
		
		int totalData = productService.getAllProducts().size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, currentPage);
		
		_mvShare.addObject("pageProductInfo", pageInfo);
		_mvShare.addObject("productsPage", categoryService.getDataProductsPage(0, pageInfo.getStart(), totalProductsPage));
		
		return _mvShare;
	}
	
	@RequestMapping("/tim-kiem-san-pham")
	public ModelAndView searchProduct(@RequestParam(value = "kw", required = false, defaultValue = "") String kw) {
		
		
		_mvShare.setViewName("/user/products/searchProduct");
		
		int totalData = productService.searchProducts(kw).size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, 1);
		
		_mvShare.addObject("searchProductInfo", pageInfo);
		_mvShare.addObject("searchProductsPage", productService.getDataSearchProductPage(kw,  pageInfo.getStart(), totalProductsPage));
		return _mvShare;
	}
	
	@RequestMapping(value = "/tim-kiem-san-pham/{currentPage}")
	public ModelAndView searchPage( @PathVariable String currentPage, @RequestParam(value = "kw", required = false, defaultValue = "") String kw) {
		
		_mvShare.setViewName("/user/products/searchProduct");
		
		int totalData = productService.searchProducts(kw).size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, Integer.parseInt(currentPage));
		
		_mvShare.addObject("searchProductInfo", pageInfo);
		_mvShare.addObject("searchProductsPage", productService.getDataSearchProductPage(kw,  pageInfo.getStart(), totalProductsPage));
		
		return _mvShare;
	}
	@RequestMapping(value = "/tat-ca-san-pham/{type}/{currentPage}")
	public ModelAndView sortProduct( @PathVariable String type, @PathVariable String currentPage) {
		
		int totalData = productService.sortProduct(type).size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage,Integer.parseInt(currentPage));
		
		_mvShare.addObject("type", type);
		_mvShare.addObject("sortProductInfo", pageInfo);
		_mvShare.addObject("sortPage", productService.sortProductPage(type, pageInfo.getStart(), totalProductsPage));
		_mvShare.setViewName("/user/products/allProduct");
		return _mvShare;
	}
	
	
}
