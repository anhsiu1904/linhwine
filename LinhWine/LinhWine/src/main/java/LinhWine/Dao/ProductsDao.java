package LinhWine.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import LinhWine.Entity.MapperProducts;
import LinhWine.Entity.Products;
@Repository
public class ProductsDao extends BaseDao {
	
	public List<Products> getAllProducts(){
		List<Products> list = new ArrayList<Products>();
		String sql = "SELECT * FROM products ";
		
		list = _jdbcTemplate.query(sql, new MapperProducts());
		return list;
	}
	

	
	public List<Products> searchProducts(String kw){
		List<Products> list = new ArrayList<Products>();
		String sql = "SELECT * FROM products ";
		sql += "WHERE tensp LIKE '%"+kw+"%' ";
		
		list = _jdbcTemplate.query(sql, new MapperProducts());
		return list;
	}
	
	public List<Products> getDataProducts(){
		List<Products> list = new ArrayList<Products>();
		String sql = "SELECT * FROM products ";
		sql += "ORDER BY so_luong_ban DESC ";
		sql += "LIMIT 8 ";
		list = _jdbcTemplate.query(sql, new MapperProducts());
		return list;
	}
	
	public List<Products> getHightlightProducts(){
		List<Products> list = new ArrayList<Products>();
		String sql = "SELECT * FROM products ";
		sql += "WHERE sp_noi_bat = 1 ";
		sql += "ORDER BY RAND() ";
		sql += "LIMIT 8 ";
		list = _jdbcTemplate.query(sql, new MapperProducts());
		return list;
	}
	
	public List<Products> getVangProducts(){
		List<Products> list = new ArrayList<Products>();
		String sql = "SELECT * FROM products ";
		sql += "WHERE id_category = 1 AND gia < 1000000 ";
		sql += "ORDER BY RAND() ";
		sql += "LIMIT 8 ";
		list = _jdbcTemplate.query(sql, new MapperProducts());
		return list;
	}
	
	
	public List<Products> getAllProductById(int id){
		List<Products> list = new ArrayList<Products>();
		String sql = "SELECT * FROM products ";
		sql += "WHERE id_category = "+ id;
		list = _jdbcTemplate.query(sql, new MapperProducts());
		return list;
	}
	public List<Products> getDataProductPage(int id, int start, int totalPage){
		List<Products> list = new ArrayList<Products>();
		List<Products> listProductById = getAllProductById(id);
		List<Products> listProduct = getAllProducts();
		String sql = "SELECT * FROM products ";
		if(id > 0) {
			sql += "WHERE id_category = "+ id+" ";
		}
		
		sql += "LIMIT "+ start +", "+ totalPage;
		if(listProductById.size() > 0) {
			list = _jdbcTemplate.query(sql, new MapperProducts());
		}
		if(listProduct.size()>0 & id==0) {
			list = _jdbcTemplate.query(sql, new MapperProducts());
		}
		
		return list;
	}
	
	public List<Products> getDataSearchProductPage(String kw, int start, int totalPage){
		List<Products> list = new ArrayList<Products>();
		List<Products> listSearch = searchProducts(kw);
		String sql = "SELECT * FROM products ";
		sql += "WHERE tensp LIKE '%"+kw+"%' ";
		sql += "LIMIT "+ start +", "+ totalPage;
		
		if(listSearch.size()>0) {
			list = _jdbcTemplate.query(sql, new MapperProducts());
		}
		
		return list;
	}

	public List<Products> getProductById(long id) {
		 
		String sql = "SELECT * FROM products ";
		sql += "WHERE id = "+id;
		List<Products> listProductById = _jdbcTemplate.query(sql, new MapperProducts());
		return listProductById;
	}
	
	public Products findProductById(long id) {
		
		String sql = "SELECT * FROM products ";
		sql += "WHERE id = "+id;
		Products product = _jdbcTemplate.queryForObject(sql, new MapperProducts());
		return product;
	}
	
	
	
	public int addSanPham(Products product) {
		String sql ="INSERT INTO products ";
		sql += "( id_category, tensp, anh, gia, giam_gia, so_luong_ban, so_luong_ton, loaisp, "
				+ "thuong_hieu, xuat_xu, dung_tich, nong_do, tuoi_ruou, bo_suu_tap, mo_ta, ngay_tao, ngay_cap_nhat, sp_noi_bat ) ";
		sql += "VALUES ( ";
		sql += ""+product.getId_category()+", ";
		sql += " '"+product.getTensp()+"', ";
		sql += " '"+product.getAnh()+"', ";
		sql += ""+product.getGia()+", ";
		sql += ""+product.getGiam_gia()+", ";
		sql += ""+0+", ";
		sql += ""+product.getSo_luong_ton()+", ";
		sql += " '"+product.getLoaisp()+"', ";
		sql += " '"+product.getThuong_hieu()+"', ";
		sql += " '"+product.getXuat_xu()+"', ";
		sql += " '"+product.getDung_tich()+"', ";
		sql += " '"+product.getNong_do()+"', ";
		sql += " "+product.getTuoi_ruou()+", ";
		sql += " '"+product.getBo_suu_tap()+"', ";
		sql += " '"+product.getMo_ta()+"', ";
		sql += " '"+product.getNgay_tao()+"', ";
		sql += " '"+product.getNgay_cap_nhat()+"', ";
		sql += " "+product.isSp_noi_bat()+") ";
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int updateProduct(Products product, long id) {
		String sql = "UPDATE products ";
		sql += "SET tensp = '"+product.getTensp()+"', ";
		sql += "id_category ="+product.getId_category()+", ";
		sql += "anh = '"+product.getAnh()+"', ";
		sql += "gia ="+product.getGia()+", ";
		sql += "giam_gia ="+product.getGiam_gia()+", ";
		sql += "so_luong_ton ="+product.getSo_luong_ton()+", ";
		sql += "loaisp = '"+product.getLoaisp()+"', ";
		sql += "thuong_hieu = '"+product.getThuong_hieu()+"', ";
		sql += "xuat_xu = '"+product.getXuat_xu()+"', ";
		sql += "dung_tich = '"+product.getDung_tich()+"', ";
		sql += "nong_do = '"+product.getNong_do()+"', ";
		sql += "tuoi_ruou ="+product.getTuoi_ruou()+", ";
		sql += "bo_suu_tap = '"+product.getBo_suu_tap()+"', ";
		sql += "mo_ta = '"+product.getMo_ta()+"', ";
		sql += "ngay_cap_nhat = '"+product.getNgay_cap_nhat()+"', ";
		sql += "sp_noi_bat ="+product.isSp_noi_bat()+" ";
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int updateQuantyProduct(long id, int slt, int slb) {
		String sql = "UPDATE products ";
		sql += "SET so_luong_ton ="+slt+", ";
		sql += "so_luong_ban = "+slb+" ";
		
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public int deleteProduct(long id) {
		String sql = "DELETE FROM products ";
		sql += "WHERE id = "+id;
		
		int insert = _jdbcTemplate.update(sql);
		return insert;
	}
	
	public List<Products> sortProduct(String sort){
		List<Products> list = new ArrayList<Products>();
		String sql = "SELECT * FROM products ";
		if(sort.equals("tang")) {
			sql += "ORDER BY gia ASC ";
		}
		
		if(sort.equals("giam")) {
			sql += "ORDER BY gia DESC ";
		}
		
		list = _jdbcTemplate.query(sql, new MapperProducts());
		return list;
	}
	
	public List<Products> sortProductById(long id, String sort) {
		 
		String sql = "SELECT * FROM products ";
		sql += "WHERE id_category = "+id+" ";
		
		if(sort.equals("tang")) {
			sql += "ORDER BY gia ASC ";
		}
		
		if(sort.equals("giam")) {
			sql += "ORDER BY gia DESC ";
		}
		
		List<Products> listProductById = _jdbcTemplate.query(sql, new MapperProducts());
		return listProductById;
	}
	
	public List<Products> sortProductPage(String sort, int start, int totalPage){
		List<Products> list = new ArrayList<Products>();
		List<Products> listSort = sortProduct(sort);
		String sql = "SELECT * FROM products ";
		if(sort.equals("tang")) {
			sql += "ORDER BY gia ASC ";
		}
		
		if(sort.equals("giam")) {
			sql += "ORDER BY gia DESC ";
		}
		
		sql += "LIMIT "+ start +", "+ totalPage;
		
		if(listSort.size()>0) {
			list = _jdbcTemplate.query(sql, new MapperProducts());
		}
		
		return list;
	}
	
	public List<Products> sortProductByIdPage(long id, String sort, int start, int totalPage){
		List<Products> list = new ArrayList<Products>();
		List<Products> listSort = sortProductById(id, sort);
		String sql = "SELECT * FROM products ";
		sql += "WHERE id_category = "+id+" ";
		if(sort.equals("tang")) {
			sql += "ORDER BY gia ASC ";
		}
		
		if(sort.equals("giam")) {
			sql += "ORDER BY gia DESC ";
		}
		
		sql += "LIMIT "+ start +", "+ totalPage;
		
		if(listSort.size()>0) {
			list = _jdbcTemplate.query(sql, new MapperProducts());
		}
		
		return list;
	}
}
