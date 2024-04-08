<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.productmngmt.beans.AddProductCategoryBean"%>
<%@page import="com.productmngmt.dao.AddProductCategoryDao"%>
<%
	int usrId = Integer.parseInt(request.getParameter("usrId"));
	String usrName = request.getParameter("usrName");

	AddProductCategoryBean cat = new AddProductCategoryBean();
	cat.setCatId(usrId);
	cat.setCatName(usrName.toUpperCase().trim());
	boolean flag = AddProductCategoryDao.updateCategory(cat);

	if (flag) {
		response.sendRedirect("CategoryVED.jsp");
	} else {
		response.sendRedirect("error.jsp");
	}
%>