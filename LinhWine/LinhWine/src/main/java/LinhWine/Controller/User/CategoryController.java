package LinhWine.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Dto.PageDto;
import LinhWine.Service.User.CategoryServiceImpl;
import LinhWine.Service.User.PageServiceImpl;
import LinhWine.Service.User.ProductServiceImpl;
@Controller
public class CategoryController extends BaseController {
	
	@Autowired
	private CategoryServiceImpl categoryService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	@Autowired
	ProductServiceImpl productService;
	
	private int totalProductsPage = 8;
	
	@RequestMapping(value = "/san-pham/{id}")
	public ModelAndView Product(@PathVariable int id) {
		
		_mvShare.setViewName("user/products/category");
		
		int totalData = categoryService.getAllProductsById(id).size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, 1);
		_mvShare.addObject("idCategory", id);
		_mvShare.addObject("sortByIdPage", "");
		_mvShare.addObject("pageInfo", pageInfo);
		_mvShare.addObject("ProductsPage", categoryService.getDataProductsPage(id, pageInfo.getStart(), totalProductsPage));
		
		return _mvShare;
	}
	@RequestMapping(value = "/san-pham/{id}/{currentPage}")
	public ModelAndView Product(@PathVariable int id, @PathVariable String currentPage) {
		
		_mvShare.setViewName("user/products/category");
		
		int totalData = categoryService.getAllProductsById(id).size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage, Integer.parseInt(currentPage));
		_mvShare.addObject("idCategory", id);
		_mvShare.addObject("pageInfo", pageInfo);
		_mvShare.addObject("ProductsPage", categoryService.getDataProductsPage(id, pageInfo.getStart(), totalProductsPage));
		
		return _mvShare;
	}
	@RequestMapping(value = "/san-pham/{id}/{type}/{currentPage}")
	public ModelAndView sortProductById(@PathVariable int id, @PathVariable String type, @PathVariable String currentPage) {
		
		int totalData = productService.sortProductById(id, type).size();
		PageDto pageInfo = pageService.getInfoPage(totalData, totalProductsPage,Integer.parseInt(currentPage));
		
		_mvShare.addObject("type", type);
		_mvShare.addObject("idCategory", id);
		_mvShare.addObject("sortProductByIdInfo", pageInfo);
		_mvShare.addObject("sortByIdPage", productService.sortProductByIdPage(id, type, pageInfo.getStart(), totalProductsPage));
		_mvShare.setViewName("/user/products/category");
		return _mvShare;
	}
}
