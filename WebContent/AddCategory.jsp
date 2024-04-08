<%--
Document : ADD USERS
Created on :05/04/24
Author : Akhila
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.productmngmt.beans.AddProductCategoryBean"%>
<%@page import="com.productmngmt.dao.AddProductCategoryDao"%>
<%
	String catg_name = request.getParameter("catg_name");
	AddProductCategoryBean addproductcategory = new AddProductCategoryBean();

	addproductcategory.setCatName(catg_name.toUpperCase().trim());
	boolean flag = AddProductCategoryDao.insertCategory(addproductcategory);

	if (flag) { // if inserted
		response.sendRedirect("CategoryVED.jsp"); //redirect to
	} else {
		response.sendRedirect("Error.jsp");
	}
%>