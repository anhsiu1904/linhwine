package LinhWine.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Dao.CategoriesDao;
import LinhWine.Dao.ProductsDao;
import LinhWine.Entity.Categories;
import LinhWine.Entity.Products;
@Service
public class CategoryServiceImpl implements ICategoryService {
	@Autowired
	private ProductsDao productsDao;
	
	@Autowired
	private CategoriesDao categoriesDao;
	
	public List<Products> getAllProductsById(int id) {
		
		return productsDao.getAllProductById(id);
	}
	
	public List<Products> getDataProductsPage(int id, int start, int totalPage) {
		 
		return productsDao.getDataProductPage(id, start, totalPage);
	}

	public int addCategory(Categories category) {
		
		return categoriesDao.addCategory(category);
	}

	public List<Categories> getCategoryById(long id) {
		return categoriesDao.getCategoryById(id);
	}

	public int updateCategory(Categories category, long id) {
		return categoriesDao.updateCategory(category, id);
	}

	public int deleteCategory(long id) {
		return categoriesDao.deleteCategory(id);
	}

	

}
