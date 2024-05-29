package LinhWine.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import LinhWine.Entity.Products;

@Service
public interface IProductService {
	public Products getProductById(long id);
	public List<Products> getProductByIdCategory(int id);
	public List<Products> sortProductByIdPage(long id, String sort, int start, int totalPage);
	public List<Products> sortProductById(long id, String sort);
	public List<Products> getAllProducts();
	public List<Products> sortProduct(String sort);
	public List<Products> sortProductPage(String sort, int start, int totalPage);
	public List<Products> searchProducts(String kw);
	public List<Products> getDataSearchProductPage(String kw, int start, int totalPage);
	
	
	public int addProduct(Products product);
	public int updateProduct(Products product, long id);
	public int deleteProduct(long id);
	public int updateQuantyProduct(long id, int slt, int slb);
}
