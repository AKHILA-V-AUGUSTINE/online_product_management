package com.productmngmt.beans;

public class AddUserBean {
	/*
	 * @Author:Akhila
	 * Date:4/4/2024
	 * Version:1.0
	 * Purpose:Bean/Model class for Users Table
	 */
	
	private int userPerId;
	private String userPerName;
	private String userPerContact;
	private String userPerEmail;
	private String userPerUsername;
	private String userPerPassword;
	private String userPerRole;
	public int getUserPerId() {
		return userPerId;
	}
	public void setUserPerId(int userPerId) {
		this.userPerId = userPerId;
	}
	public String getUserPerName() {
		return userPerName;
	}
	public void setUserPerName(String userPerName) {
		this.userPerName = userPerName;
	}
	public String getUserPerContact() {
		return userPerContact;
	}
	public void setUserPerContact(String userPerContact) {
		this.userPerContact = userPerContact;
	}
	public String getUserPerEmail() {
		return userPerEmail;
	}
	public void setUserPerEmail(String userPerEmail) {
		this.userPerEmail = userPerEmail;
	}
	public String getUserPerUsername() {
		return userPerUsername;
	}
	public void setUserPerUsername(String userPerUsername) {
		this.userPerUsername = userPerUsername;
	}
	public String getUserPerPassword() {
		return userPerPassword;
	}
	public void setUserPerPassword(String userPerPassword) {
		this.userPerPassword = userPerPassword;
	}
	public String getUserPerRole() {
		return userPerRole;
	}
	public void setUserPerRole(String userPerRole) {
		this.userPerRole = userPerRole;
	}
	

}
