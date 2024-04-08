<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.productmngmt.beans.AddUserBean"%>
<%@page import="com.productmngmt.dao.AddUserDao"%>
<%
	String email = request.getParameter("email");

	String pass = request.getParameter("pass");
	AddUserBean usr = new AddUserBean();
	usr.setUserPerEmail(email);
	usr.setUserPerPassword(pass);
	String role = AddUserDao.loginUser(usr);

	if (role != null) {
		// Set session attribute with the logged-in user's role
		session.setAttribute("userRole", role);
		
		// Redirect to the appropriate page based on user's role
		if (role.equals("ADMIN")) {
			response.sendRedirect("index.jsp");
		} else if (role.equals("STAFF")) {
			response.sendRedirect("StaffIndex.jsp");
		} else {
			response.sendRedirect("UserIndex.jsp");
		}
	} else {
		response.sendRedirect("error.jsp");
	}
%>