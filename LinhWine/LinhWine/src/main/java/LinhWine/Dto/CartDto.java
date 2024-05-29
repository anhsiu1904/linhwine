package LinhWine.Dto;

import LinhWine.Entity.Products;

public class CartDto {
	private int quanty;
	private	double totalPrice;
	private Products product;
	
	public CartDto() {
		
	}
	
	public CartDto(int quanty, double totalPrice, Products product) {
		this.quanty = quanty;
		this.totalPrice = totalPrice;
		this.product = product;
	}
	
	public int getQuanty() {
		return quanty;
	}
	public void setQuanty(int quanty) {
		this.quanty = quanty;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Products getProduct() {
		return product;
	}
	public void setProduct(Products product) {
		this.product = product;
	}
	
	
}
