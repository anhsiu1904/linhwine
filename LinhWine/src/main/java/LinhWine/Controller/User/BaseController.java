package LinhWine.Controller.User;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Service.User.HomeServiceImpl;

@Controller
public class BaseController {
	@Autowired
	protected HomeServiceImpl _homeServiceImpl;
	public ModelAndView _mvShare = new ModelAndView();
	
	@PostConstruct
	public ModelAndView Init() {
		_mvShare.addObject("categories", _homeServiceImpl.getDataCategories());
		_mvShare.addObject("menu", _homeServiceImpl.getDataMenu());
		return _mvShare;
	}
}
