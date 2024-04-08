<%--
Document : ADD USERS
Created on :06/04/24
Author : Akhila
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.productmngmt.beans.AddProductBean"%>
<%@page import="com.productmngmt.dao.AddProductDao"%>
<%@page import="com.productmngmt.dao.AddProductCategoryDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.productmngmt.beans.AddProductCategoryBean"%>
<%
	String prod_name = request.getParameter("prod_name");
	String prod_desc = request.getParameter("prod_desc");
	String prod_category = request.getParameter("prod_category");
	String prod_price = request.getParameter("prod_price");
	try {
		// Get all categories
		ArrayList<AddProductCategoryBean> categories = AddProductCategoryDao.getAllCategory();

		int catId = -1; // Default category ID, assuming -1 indicates no category found

		// Search for the category ID based on the category name
		for (AddProductCategoryBean category : categories) {
			if (category.getCatName().equals(prod_category)) {
				catId = category.getCatId();
				break;
			}
		}
		AddProductBean addproduct = new AddProductBean();

		addproduct.setProdName(prod_name.toUpperCase().trim());
		addproduct.setProdDesc(prod_desc.toUpperCase().trim());
		addproduct.setCatId(catId);
		addproduct.setProdPrice(prod_price.toUpperCase().trim());
		boolean flag = AddProductDao.insertProduct(addproduct);

		if (flag) { // if inserted
			response.sendRedirect("ProductVED.jsp"); //redirect to
		} else {
			response.sendRedirect("Error.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("Error.jsp");
	}
%>