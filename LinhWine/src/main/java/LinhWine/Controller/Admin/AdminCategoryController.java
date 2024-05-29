package LinhWine.Controller.Admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Controller.User.BaseController;
import LinhWine.Entity.Categories;
import LinhWine.Service.User.CategoryServiceImpl;

@Controller
public class AdminCategoryController extends BaseController {
	@Autowired
	CategoryServiceImpl categoryService;
	
	@RequestMapping(value={"/quan-tri/quan-ly-danh-muc"})
	public ModelAndView category() {
		_mvShare.setViewName("admin/product/QLdanhmuc");
		return _mvShare;
	}
	@RequestMapping(value={"/quan-tri/them-danh-muc"},  method = RequestMethod.GET)
	public ModelAndView addCategory() {
		_mvShare.addObject("category", "");
		_mvShare.setViewName("admin/product/editDanhMuc");
		_mvShare.addObject("addCategory", new Categories());
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/them-danh-muc"},  method = RequestMethod.POST)
	public ModelAndView addNewCategory(@ModelAttribute("addCategory") Categories category) {
		int count = categoryService.addCategory(category);
		_mvShare.addObject("categories", _homeServiceImpl.getDataCategories());
		_mvShare.setViewName("admin/product/QLdanhmuc");
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/cap-nhat-danh-muc/{id}"}, method = RequestMethod.GET)
	public ModelAndView editCategory(@PathVariable String id) {
		_mvShare.setViewName("admin/product/editDanhMuc");
		_mvShare.addObject("category", categoryService.getCategoryById(Long.parseLong(id)).get(0));
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/cap-nhat-danh-muc/{id}"}, method = RequestMethod.POST)
	public ModelAndView updateCategory(@PathVariable String id, @ModelAttribute("category") Categories category) {
		int count = categoryService.updateCategory(category, Long.parseLong(id));
		
		_mvShare.addObject("categories", _homeServiceImpl.getDataCategories());
		_mvShare.setViewName("admin/product/QLdanhmuc");
		return _mvShare;
	}

	@RequestMapping(value={"/quan-tri/xoa-danh-muc/{id}"})
	public ModelAndView deleteCategory(HttpSession session, @PathVariable String id) {
		int count = categoryService.deleteCategory(Long.parseLong(id));
		if(count > 1) {
			session.setAttribute("success", "Đã xóa danh mục!");
		}else {
			session.setAttribute("fail", "Có lỗi xảy ra!");
		}
		_mvShare.addObject("categories", _homeServiceImpl.getDataCategories());
		_mvShare.setViewName("admin/product/QLdanhmuc");
		return _mvShare;
	}

}
