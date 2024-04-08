package com.productmngmt.beans;

public class AddProductBean {
	/*
	 * @Author:Akhila
	 * Date:5/4/2024
	 * Version:1.0
	 * Purpose:Bean/Model class for Product Table
	 */
	
	private int prodId;
	private String prodName;
	private String prodDesc;
	private int catId;  //FK
	private String prodPrice;
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdDesc() {
		return prodDesc;
	}
	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(String prodPrice) {
		this.prodPrice = prodPrice;
	}

}
