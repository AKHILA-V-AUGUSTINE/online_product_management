<%--
Document : ADD USERS
Created on :06/04/24
Author : Akhila
--%>
<%@ include file="Header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.productmngmt.beans.AddProductBean"%>
<%@page import="com.productmngmt.dao.AddProductDao"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductVED</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div style="text-align: center;">
<h1>PRODUCT DETAILS</h1>
		<table border="1" style='margin: auto;'>
			<tr>
				<th>SL.NO</th>
				<th>PRODUCT NAME</th>
				<th>DESCRIPTION</th>
				<th>CATEGORY</th>
				<th>PRICE</th>
				<!-- <th>EDIT</th>
				<th>DELETE</th> -->
			</tr>

			<%
				int i = 0;
				ArrayList<AddProductBean> prod = AddProductDao.getAllProduct();

				for (AddProductBean pro : prod) {
			%>
			<tr>
				<%-- <td><%=cat.getCaId()%></td> --%>
				<td><%=++i%></td>
				<td><%=pro.getProdName()%></td>
				<td><%=pro.getProdDesc()%></td>
				<td><%=pro.getCatId()%></td>
				<td><%=pro.getProdPrice()%></td>
				<%-- <td><a href="CategoryEditAction.jsp?id=<%=pro.getProdId()%>">edit</a></td>
				<td><a href="CategoryDeleteAction.jsp?id=<%=pro.getProdId()%>">delete</a></td> --%>
			</tr>
			<%
				}
			%>
		</table>
	</div>


</body>
</html>
<%@ include file="Footer.jsp" %>