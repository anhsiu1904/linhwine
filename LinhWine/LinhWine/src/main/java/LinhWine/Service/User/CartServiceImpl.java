package LinhWine.Service.User;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Dao.CartDao;
import LinhWine.Dto.CartDto;

@Service
public class CartServiceImpl implements ICartService {

	@Autowired
	private CartDao cartDao = new CartDao();
	
	public HashMap<Long, CartDto> addCart(long id, HashMap<Long, CartDto> cart) {
		return cartDao.AddCart(id, cart);
	}

	public HashMap<Long, CartDto> editCart(long id, int quanty, HashMap<Long, CartDto> cart) {
		return cartDao.editCart(id, quanty, cart);
	}

	public HashMap<Long, CartDto> delCart(long id, HashMap<Long, CartDto> cart) {
		return cartDao.delCart(id, cart);
	}

	public int totalQuanty(HashMap<Long, CartDto> cart) {
		return cartDao.totalQuanty(cart);
	}

	public double totalPrice(HashMap<Long, CartDto> cart) {
		return cartDao.totalPrice(cart);
	}

}
