package LinhWine.Entity;

import java.sql.Date;

public class Products {
	private long id_product;
	private int id_category;
	private String tensp;
	private String anh;
	private double gia;
	private int giam_gia;
	private int so_luong_ban;
	private int so_luong_ton;
	private String loaisp;
	private String thuong_hieu;
	private String xuat_xu;
	private String dung_tich;
	private String nong_do;
	private int tuoi_ruou;
	private String bo_suu_tap;
	private String mo_ta;
	private Date ngay_tao;
	private Date ngay_cap_nhat;
	private boolean sp_noi_bat;
	public Products() {
		super();
	}
	public long getId_product() {
		return id_product;
	}
	public void setId_product(long id_product) {
		this.id_product = id_product;
	}
	public int getId_category() {
		return id_category;
	}
	public void setId_category(int id_category) {
		this.id_category = id_category;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
	}
	public int getGiam_gia() {
		return giam_gia;
	}
	public void setGiam_gia(int giam_gia) {
		this.giam_gia = giam_gia;
	}
	public int getSo_luong_ban() {
		return so_luong_ban;
	}
	public void setSo_luong_ban(int so_luong_ban) {
		this.so_luong_ban = so_luong_ban;
	}
	public int getSo_luong_ton() {
		return so_luong_ton;
	}
	public void setSo_luong_ton(int so_luong_ton) {
		this.so_luong_ton = so_luong_ton;
	}
	public String getLoaisp() {
		return loaisp;
	}
	public void setLoaisp(String loaisp) {
		this.loaisp = loaisp;
	}
	public String getThuong_hieu() {
		return thuong_hieu;
	}
	public void setThuong_hieu(String thuong_hieu) {
		this.thuong_hieu = thuong_hieu;
	}
	public String getXuat_xu() {
		return xuat_xu;
	}
	public void setXuat_xu(String xuat_xu) {
		this.xuat_xu = xuat_xu;
	}
	public String getDung_tich() {
		return dung_tich;
	}
	public void setDung_tich(String dung_tich) {
		this.dung_tich = dung_tich;
	}
	public String getNong_do() {
		return nong_do;
	}
	public void setNong_do(String nong_do) {
		this.nong_do = nong_do;
	}
	public int getTuoi_ruou() {
		return tuoi_ruou;
	}
	public void setTuoi_ruou(int tuoi_ruou) {
		this.tuoi_ruou = tuoi_ruou;
	}
	public String getBo_suu_tap() {
		return bo_suu_tap;
	}
	public void setBo_suu_tap(String bo_suu_tap) {
		this.bo_suu_tap = bo_suu_tap;
	}
	public String getMo_ta() {
		return mo_ta;
	}
	public void setMo_ta(String mo_ta) {
		this.mo_ta = mo_ta;
	}
	public Date getNgay_tao() {
		return ngay_tao;
	}
	public void setNgay_tao(Date ngay_tao) {
		this.ngay_tao = ngay_tao;
	}
	public Date getNgay_cap_nhat() {
		return ngay_cap_nhat;
	}
	public void setNgay_cap_nhat(Date ngay_cap_nhat) {
		this.ngay_cap_nhat = ngay_cap_nhat;
	}
	public boolean isSp_noi_bat() {
		return sp_noi_bat;
	}
	public void setSp_noi_bat(boolean sp_noi_bat) {
		this.sp_noi_bat = sp_noi_bat;
	}
	
	
	
}
