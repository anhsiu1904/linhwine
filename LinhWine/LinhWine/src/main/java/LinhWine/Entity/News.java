package LinhWine.Entity;

import java.sql.Date;

public class News {

	private long id_new;
	private String anh;
	private String tieu_de;
	private String tom_tat;
	private String noi_dung;
	private long id_new_category;
	private long nguoi_tao;
	private Date ngay_tao;
	private long nguoi_cap_nhat;
	private Date ngay_cap_nhat;
	
	

	public long getId_new() {
		return id_new;
	}
	
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public void setId_new(long id_new) {
		this.id_new = id_new;
	}
	public String getTieu_de() {
		return tieu_de;
	}
	public void setTieu_de(String tieu_de) {
		this.tieu_de = tieu_de;
	}
	public String getTom_tat() {
		return tom_tat;
	}
	public void setTom_tat(String tom_tat) {
		this.tom_tat = tom_tat;
	}
	public String getNoi_dung() {
		return noi_dung;
	}
	public void setNoi_dung(String noi_dung) {
		this.noi_dung = noi_dung;
	}
	public long getId_new_category() {
		return id_new_category;
	}
	public void setId_new_category(long id_new_category) {
		this.id_new_category = id_new_category;
	}
	public long getNguoi_tao() {
		return nguoi_tao;
	}
	public void setNguoi_tao(long nguoi_tao) {
		this.nguoi_tao = nguoi_tao;
	}
	public Date getNgay_tao() {
		return ngay_tao;
	}
	public void setNgay_tao(Date ngay_tao) {
		this.ngay_tao = ngay_tao;
	}
	public long getNguoi_cap_nhat() {
		return nguoi_cap_nhat;
	}
	public void setNguoi_cap_nhat(long nguoi_cap_nhat) {
		this.nguoi_cap_nhat = nguoi_cap_nhat;
	}
	public Date getNgay_cap_nhat() {
		return ngay_cap_nhat;
	}
	public void setNgay_cap_nhat(Date ngay_cap_nhat) {
		this.ngay_cap_nhat = ngay_cap_nhat;
	}
	

}
