package com.productmngmt.beans;

public class AddProductCategoryBean {
	/*
	 * @Author:Akhila
	 * Date:5/4/2024
	 * Version:1.0
	 * Purpose:Bean/Model class for Category Table
	 */
	
	private int catId;
	private String catName;
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
}
