<%@ include file="Header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="com.productmngmt.beans.AddUserBean"%>
<%@page import="com.productmngmt.dao.AddUserDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div style="text-align: center;">
<h1>VIEW USER DETAILS</h1><br>
<table border="1" style='margin: auto;'>
		<tr>
			<th>SL.NO</th>
			<th>NAME</th>
			<th>CONTACT</th>
			<th>EMAIL</th>
			<th>USERNAME</th>
			<th>PASSWORD</th>
			<th>ROLE</th>
			<th>EDIT</th>
			<th>DELETE</th>
		</tr>

		<%
		int i=0;
			ArrayList<AddUserBean> users= AddUserDao.getAllUsers();

			for (AddUserBean usr : users) {
		%>
		<tr>
			<%-- <td><%=cat.getCaId()%></td> --%>
			<td><%=++i %></td>
			<td><%=usr.getUserPerName()%></td>
			<td><%=usr.getUserPerContact()%></td>
			<td><%=usr.getUserPerEmail()%></td>
			<td><%=usr.getUserPerUsername()%></td>
			<td><%=usr.getUserPerPassword()%></td>
			<td><%=usr.getUserPerRole()%></td>
			<td><a href="UserEditAction.jsp?id=<%=usr.getUserPerId()%>">edit</a></td>
			<td><a href="UserDelete.jsp?id=<%=usr.getUserPerId()%>">delete</a></td>
		</tr>
		<%
			}
		%>
	</table>
	</div>
</body>
</html>
<%@ include file="Footer.jsp" %>