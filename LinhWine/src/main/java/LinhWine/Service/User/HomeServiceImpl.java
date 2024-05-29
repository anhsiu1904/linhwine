package LinhWine.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Dao.CategoriesDao;
import LinhWine.Dao.MenuDao;
import LinhWine.Dao.ProductsDao;
import LinhWine.Dao.SlidesDao;
import LinhWine.Entity.Categories;
import LinhWine.Entity.Menu;
import LinhWine.Entity.Products;
import LinhWine.Entity.Slides;
@Service
public class HomeServiceImpl implements IHome {
	@Autowired
	private SlidesDao slidesDao;
	@Autowired
	private CategoriesDao categoriesDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private ProductsDao productsDao;
	
	public List<Slides> getDataSlides() {
		
		return slidesDao.getDataSlides();
	}

	public List<Categories> getDataCategories() {
		
		return categoriesDao.getDataCategories();
	}

	public List<Menu> getDataMenu() {
		
		return menuDao.getDataMenu();
	}

	public List<Products> getDataProducts() {
		
		return productsDao.getDataProducts();
	}

	public List<Products> getHightlightProducts() {
		
		return productsDao.getHightlightProducts();
	}

	public List<Products> getVangProducts() {
		
		return productsDao.getVangProducts();
	}
	
}
