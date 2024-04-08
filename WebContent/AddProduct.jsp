<%--
Document : ADD USERS
Created on :06/04/24
Author : Akhila
--%>

<%@ include file="Header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.productmngmt.beans.AddProductCategoryBean"%>
<%@page import="com.productmngmt.dao.AddProductCategoryDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Products</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div style="text-align: center;">
<h1>ADD NEW PRODUCT</h1>
	<form name="product" method="post" action="AddProductAction.jsp"
		onsubmit="return validateform()">

		
		<label>Product Name</label>&nbsp; <input type="text" name="prod_name"
			id="prod_name" /><br> <br> <label>Product
			Description</label>&nbsp; <textarea rows="3" cols="16" name="prod_desc" id="prod_desc"> </textarea><br>
		<br> <label>Category Name</label>&nbsp;&nbsp; <select
			name="prod_category">
			<option>SELECT</option>
			<%
				ArrayList<AddProductCategoryBean> categoryNames = AddProductCategoryDao.getCategoryName();
				for (AddProductCategoryBean category : categoryNames) {
			%>
			<option><%=category.getCatName()%></option>
			<%
				}
			%>

		</select><br> <br> <label>Price</label>&nbsp; <input type="text"
			name="prod_price" id="prod_price" /><br> <br> <input
			type="submit" name="reg_submit" value="SAVE" />

	</form></div>

</body>
</html>
<%@ include file="Footer.jsp" %>