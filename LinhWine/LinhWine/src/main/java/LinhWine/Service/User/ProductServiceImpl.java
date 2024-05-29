package LinhWine.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Dao.ProductsDao;
import LinhWine.Entity.Products;

@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	ProductsDao productsDao;
	
	public Products getProductById(long id) {
		
		return productsDao.getProductById(id).get(0);
	}

	public List<Products> getProductByIdCategory(int id) {
		
		return productsDao.getAllProductById(id);
	}

	public List<Products> getAllProducts() {
		return productsDao.getAllProducts();
	}

	public int addProduct(Products product) {
		return productsDao.addSanPham(product);
	}

	public int updateProduct(Products product, long id) {
		return productsDao.updateProduct(product, id);
	}

	public int deleteProduct(long id) {
		return productsDao.deleteProduct(id);
	}



	public List<Products> searchProducts(String kw) {
		return productsDao.searchProducts(kw);
	}

	public List<Products> getDataSearchProductPage(String kw, int start, int totalPage) {
		return productsDao.getDataSearchProductPage(kw, start, totalPage);
	}

	public int updateQuantyProduct(long id, int slt, int slb) {
		return productsDao.updateQuantyProduct(id, slt, slb);
	}

	public List<Products> sortProduct(String sort) {
		return productsDao.sortProduct(sort);
	}

	public List<Products> sortProductPage(String sort, int start, int totalPage) {
		return productsDao.sortProductPage(sort, start, totalPage);
	}

	public List<Products> sortProductByIdPage(long id, String sort, int start, int totalPage) {
		return productsDao.sortProductByIdPage(id, sort, start, totalPage);
	}

	public List<Products> sortProductById(long id, String sort) {
		return productsDao.sortProductById(id, sort);
	}

}
