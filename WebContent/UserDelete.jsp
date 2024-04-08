<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.productmngmt.beans.AddUserBean"%>
<%@page import="com.productmngmt.dao.AddUserDao"%>
<%
	int usrId = Integer.parseInt(request.getParameter("id"));

	AddUserBean usr = new AddUserBean();
	usr.setUserPerId(usrId);

	boolean flag = AddUserDao.deleteUser(usr);

	if (flag) {
		response.sendRedirect("UsersVED.jsp");
	} else {
		response.sendRedirect("error.jsp");
	}
%>