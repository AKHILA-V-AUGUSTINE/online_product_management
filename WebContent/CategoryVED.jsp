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
<title>ProductCategoryVED</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div style="text-align: center;">
	<h1>VIEW PRODUCT CATEGORY</h1><br>
		<table border="1" style='margin: auto;'>
			<tr>
				<th>SL.NO</th>
				<th>NAME</th>
				<th>EDIT</th>
				<th>DELETE</th>
			</tr>

			<%
				int i = 0;
				ArrayList<AddProductCategoryBean> catg = AddProductCategoryDao.getAllCategory();

				for (AddProductCategoryBean cat : catg) {
			%>
			<tr>
				<%-- <td><%=cat.getCaId()%></td> --%>
				<td><%=++i%></td>
				<td><%=cat.getCatName()%></td>
				<td><a href="CategoryEditAction.jsp?id=<%=cat.getCatId()%>">edit</a></td>
				<td><a href="CategoryDeleteAction.jsp?id=<%=cat.getCatId()%>">delete</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

</body>
</html>
<%@ include file="Footer.jsp" %>