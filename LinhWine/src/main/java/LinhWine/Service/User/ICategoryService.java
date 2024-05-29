package LinhWine.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import LinhWine.Entity.Categories;
import LinhWine.Entity.Products;

@Service
public interface ICategoryService {
	
	public List<Products> getAllProductsById(int id);
	public List<Products> getDataProductsPage(int id, int start, int end);
	public int addCategory(Categories category);
	public List<Categories> getCategoryById(long id);
	public int updateCategory(Categories category, long id);
	public int deleteCategory( long id);
}
