package LinhWine.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Service.User.NewServiceImpl;

@Controller
public class HomeController extends BaseController {

	@RequestMapping("/")
	public ModelAndView Index() {
		_mvShare.addObject("slides", _homeServiceImpl.getDataSlides());
		
		_mvShare.addObject("products", _homeServiceImpl.getDataProducts());
		_mvShare.addObject("hightlight", _homeServiceImpl.getHightlightProducts());
		_mvShare.addObject("vang", _homeServiceImpl.getVangProducts());
		_mvShare.setViewName("user/index");
		return _mvShare;
	}
	
	
	
}
