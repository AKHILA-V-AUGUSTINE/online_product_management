<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.productmngmt.beans.AddProductBean"%>
<%@page import="com.productmngmt.dao.AddProductDao"%>

<%
	int prodId = Integer.parseInt(request.getParameter("id"));

	AddProductBean pro = new AddProductBean();
	pro.setProdId(prodId);

	boolean flag = AddProductDao.deleteProduct(pro);

	if (flag) {
		response.sendRedirect("index.html");
	} else {
		response.sendRedirect("error.jsp");
	}
%>