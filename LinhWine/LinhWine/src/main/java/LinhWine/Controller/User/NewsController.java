package LinhWine.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Dto.PageDto;
import LinhWine.Service.User.NewServiceImpl;
@Controller
public class NewsController extends BaseController {

	@Autowired
	NewServiceImpl newService;
	
	@RequestMapping("/tin-tuc")
	public ModelAndView index() {
		_mvShare.addObject("newCategory", newService.getAllCategoryNews());
		_mvShare.addObject("allNews", newService.getAllNews());
		_mvShare.setViewName("user/news/new");
		return _mvShare;
	}
	
	@RequestMapping(value = "/tin-tuc/{id}")
	public ModelAndView news(@PathVariable long id) {
		_mvShare.addObject("newCategory", newService.getAllCategoryNews());
		_mvShare.addObject("newByIdCategoryNew", newService.getNewByCategoryNew(id));
		_mvShare.addObject("idCategoryNew", id);
		_mvShare.setViewName("user/news/categorynew");
		
		return _mvShare;
	}
	
	@RequestMapping("/chi-tiet-tin-tuc/{id}")
	public ModelAndView detailNew(@PathVariable long id) {

		_mvShare.addObject("newCategory", newService.getAllCategoryNews());
		_mvShare.addObject("newById", newService.getNewById(id).get(0));
		_mvShare.addObject("idNew", id);
		_mvShare.setViewName("user/news/detailNew");
		return _mvShare;
	}

}
