<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.productmngmt.beans.AddProductCategoryBean"%>
<%@page import="com.productmngmt.dao.AddProductCategoryDao"%>
<%
int usrId = Integer.parseInt(request.getParameter("id"));

AddProductCategoryBean cat = new AddProductCategoryBean();
cat.setCatId(usrId);

	boolean flag = AddProductCategoryDao.deleteCategory(cat);

	if (flag) {
		response.sendRedirect("CategoryVED.jsp");
	} else {
		response.sendRedirect("error.jsp");
	}
%>