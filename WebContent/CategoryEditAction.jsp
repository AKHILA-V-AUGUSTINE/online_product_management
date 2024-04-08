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
<title>Edit Category</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		AddProductCategoryBean cat = new AddProductCategoryBean();
		cat.setCatId(id);
		ArrayList<AddProductCategoryBean> addcatbean = AddProductCategoryDao.getCategoryDetailsById(cat);
	%>
	<div style="text-align: center;">
	<h1>Edit Category</h1><br>
	<form name="userEdit" method="post" action="CategoryUpdateAction.jsp">
		<table style='margin: auto;'>
			<%
				for (AddProductCategoryBean usrs : addcatbean) {
			%><tr>
				<td></td>
				<td><input name="usrId" type="hidden"
					value="<%=usrs.getCatId()%>" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input name="usrName" type="text"
					value="<%=usrs.getCatName()%>" /></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td></td>
				<td><input type="submit" name="cat-update" value="UPDATE" /></td>
			</tr>
		</table>
	</form>
	</div>

</body>
</html>
<%@ include file="Footer.jsp" %>