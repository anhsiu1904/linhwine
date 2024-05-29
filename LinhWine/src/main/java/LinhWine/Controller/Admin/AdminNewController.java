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
import LinhWine.Entity.News;
import LinhWine.Entity.Users;
import LinhWine.Service.User.AccountServiceImpl;
import LinhWine.Service.User.NewServiceImpl;

@Controller
public class AdminNewController extends BaseController {
 
	@Autowired
	NewServiceImpl newService;
	
	@Autowired
	AccountServiceImpl accountService;
	
	@RequestMapping(value={"/quan-tri/quan-ly-tin-tuc"})
	public ModelAndView news() {
		_mvShare.addObject("allUser", accountService.getAllUsers());
		_mvShare.addObject("allNews", newService.getAllNews());
		_mvShare.setViewName("admin/new/QLtintuc");
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/chi-tiet-tin-tuc/{id}"})
	public ModelAndView detail(@PathVariable long id) {
		
		_mvShare.addObject("detailNew", newService.getNewById(id).get(0));
		_mvShare.addObject("allUser", accountService.getAllUsers());
		
		_mvShare.setViewName("admin/new/chitiettintuc");
		return _mvShare;
	}
	long millis=System.currentTimeMillis();
	java.sql.Date date=new java.sql.Date(millis);
	@RequestMapping(value={"/quan-tri/them-tin-tuc"},  method = RequestMethod.GET)
	public ModelAndView addNew() {
		_mvShare.addObject("idNew", "");
		_mvShare.addObject("newCategory", newService.getAllCategoryNews());
		_mvShare.setViewName("admin/new/editNew");
		_mvShare.addObject("addNew", new News());
		return _mvShare;
	}
	
	
	
	@RequestMapping(value={"/quan-tri/them-tin-tuc"},  method = RequestMethod.POST)
	public ModelAndView addNews(@ModelAttribute("addNew") News news, @RequestParam CommonsMultipartFile file,  
	           HttpSession session) {
		Users loginInfo = (Users)session.getAttribute("LoginInfo");
		news.setNguoi_tao(loginInfo.getId());
		news.setAnh(file.getOriginalFilename());
		news.setNgay_tao(date);
		int count = newService.addNew(news);
		saveImageForProduct(file, session);
		_mvShare.addObject("newCategory", newService.getAllCategoryNews());
		_mvShare.addObject("allNews", newService.getAllNews());
		_mvShare.setViewName("admin/new/QLtintuc");
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/cap-nhat-tin-tuc/{id}"},  method = RequestMethod.GET)
	public ModelAndView editNew(@PathVariable long id) {
		_mvShare.addObject("idNew", id);
		_mvShare.addObject("newCategory", newService.getAllCategoryNews());
		_mvShare.setViewName("admin/new/editNew");
		_mvShare.addObject("editNew", newService.getNewById(id).get(0));
		return _mvShare;
	}
	
	
	
	@RequestMapping(value={"/quan-tri/cap-nhat-tin-tuc/{id}"},  method = RequestMethod.POST)
	public ModelAndView updateNews(@PathVariable long id, @ModelAttribute("editNew") News news, @RequestParam CommonsMultipartFile file,  
	           HttpSession session) {
		Users loginInfo = (Users)session.getAttribute("LoginInfo");
		news.setNguoi_cap_nhat(loginInfo.getId());
		if(!file.getOriginalFilename().isEmpty()) {
			news.setAnh(file.getOriginalFilename());
		}else {
			news.setAnh(newService.getNewById(id).get(0).getAnh());
		}
		
		news.setNgay_cap_nhat(date);
		int count = newService.updateNew(news,id);
		saveImageForProduct(file, session);
		_mvShare.addObject("newCategory", newService.getAllCategoryNews());
		_mvShare.addObject("allNews", newService.getAllNews());
		_mvShare.setViewName("admin/new/QLtintuc");
		return _mvShare;
	}
	
	@RequestMapping(value={"/quan-tri/xoa-tin-tuc/{id}"})
	public String deleteNew(HttpServletRequest request, @PathVariable long id) {
		int count = newService.deleteNew(id);
		
		_mvShare.addObject("allNews", newService.getAllNews());
		_mvShare.setViewName("admin/new/QLtintuc");
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
