package LinhWine.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Entity.Categories;
import LinhWine.Entity.Menu;
import LinhWine.Entity.Products;
import LinhWine.Entity.Slides;
@Service
public interface IHome {
	@Autowired
	public List<Slides> getDataSlides();
	public List<Categories> getDataCategories();
	public List<Menu> getDataMenu();
	public List<Products> getDataProducts();
	public List<Products> getHightlightProducts();
	public List<Products> getVangProducts();
}
