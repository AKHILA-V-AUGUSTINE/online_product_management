<%@ include file="Header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.productmngmt.beans.AddUserBean"%>
<%@page import="com.productmngmt.dao.AddUserDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		AddUserBean usr = new AddUserBean();
		usr.setUserPerId(id);
		ArrayList<AddUserBean> adduserbean = AddUserDao.getUserDetailsById(usr);
	%>
	<div style="text-align: center;">
	<form name="userEdit" method="post" action="UserUpdateAction.jsp">
	<h1>UPDATE USER DETAILS</h1><br>
		<table style='margin: auto;'>
			<%
				for (AddUserBean usrs : adduserbean) {
			%>
			<tr>
				<td></td>
				<td><input name="usrId" type="hidden"
					value="<%=usrs.getUserPerId()%>" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input name="usrName" type="text"
					value="<%=usrs.getUserPerName()%>" /></td>
			</tr>
			<tr>
				<td>Contact</td>
				<td><input name="usrContact" type="text"
					value="<%=usrs.getUserPerContact()%>" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input name="usrEmail" type="text"
					value="<%=usrs.getUserPerEmail()%>" /></td>
			</tr>
			<tr>
				<td>UserName</td>
				<td><input name="usrUserName" type="text"
					value="<%=usrs.getUserPerUsername()%>" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input name="usrPassword" type="text"
					value="<%=usrs.getUserPerPassword()%>" /></td>
			</tr>
			<tr>
				<td>Role</td>
				<td><input name="usrRole" type="text"
					value="<%=usrs.getUserPerRole()%>" /></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td></td>
				<td><input type="submit" value="UPDATE" /></td>
			</tr>
		</table>
	</form>
	</div>

</body>
</html>
<%@ include file="Footer.jsp" %>