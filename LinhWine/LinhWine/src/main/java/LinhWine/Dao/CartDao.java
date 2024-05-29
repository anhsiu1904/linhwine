package LinhWine.Dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import LinhWine.Dto.CartDto;
import LinhWine.Entity.Products;

@Repository
public class CartDao extends BaseDao {
	
	@Autowired
	ProductsDao productsDao = new ProductsDao();
	
	public HashMap<Long, CartDto> AddCart(long id, HashMap<Long, CartDto> cart) {
		CartDto itemCart = new CartDto();
		Products product = productsDao.findProductById(id);
		if(product != null && cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuanty(itemCart.getQuanty() + 1);
			if(itemCart.getProduct().getGiam_gia() > 0) {
				double total = product.getGia() - product.getGia()*product.getGiam_gia()/100;
				itemCart.setTotalPrice(itemCart.getQuanty() * total);
			}else {
				itemCart.setTotalPrice(itemCart.getQuanty() * itemCart.getProduct().getGia());
			}
			
		}else {
			itemCart.setProduct(product);
			itemCart.setQuanty(1);
			if(itemCart.getProduct().getGiam_gia() > 0) {
				itemCart.setTotalPrice(product.getGia() - product.getGia()*product.getGiam_gia()/100);
			}else {
				itemCart.setTotalPrice(product.getGia());
			}
			
		}
		cart.put(id, itemCart);
		return cart;
	}
	
	public HashMap<Long, CartDto> editCart(long id, int quanty, HashMap<Long, CartDto> cart) {
		
		if(cart == null) {
			return cart;
		}
		CartDto itemCart = new CartDto();
		if(cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuanty(quanty);
			if(itemCart.getProduct().getGiam_gia() > 0) {
				double total = itemCart.getProduct().getGia() - itemCart.getProduct().getGia()*itemCart.getProduct().getGiam_gia()/100;
				itemCart.setTotalPrice(quanty * total);
			}else {
				itemCart.setTotalPrice(quanty * itemCart.getProduct().getGia());
			}
			
		}
		
		cart.put(id, itemCart);
		return cart;
	}
	
	public HashMap<Long, CartDto> delCart(long id, HashMap<Long, CartDto> cart) {
		if(cart == null) {
			return cart;
		}
		if(cart.containsKey(id)) {
			cart.remove(id);
		}
		return cart;
	}
	
	public int totalQuanty(HashMap<Long, CartDto> cart) {
		int totalQuanty= 0;
		for(Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			totalQuanty += itemCart.getValue().getQuanty();
		}
		return totalQuanty;
	}
	
	public double totalPrice(HashMap<Long, CartDto> cart) {
		double totalPrice= 0;
		for(Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			totalPrice += itemCart.getValue().getTotalPrice();
		}
		return totalPrice;
	}
}
