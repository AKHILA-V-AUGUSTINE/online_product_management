<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.productmngmt.beans.AddUserBean"%>
<%@page import="com.productmngmt.dao.AddUserDao"%>
<%
	int usrId = Integer.parseInt(request.getParameter("usrId"));
	String usrName = request.getParameter("usrName");
	String usrContact = request.getParameter("usrContact");
	String usrEmail = request.getParameter("usrEmail");
	String usrUserName = request.getParameter("usrUserName");
	String usrPassword = request.getParameter("usrPassword");
	String usrRole = request.getParameter("usrRole");

	AddUserBean usr = new AddUserBean();
	usr.setUserPerId(usrId);
	usr.setUserPerName(usrName.toUpperCase().trim());
	usr.setUserPerContact(usrContact);
	usr.setUserPerEmail(usrEmail);
	usr.setUserPerUsername(usrUserName.toUpperCase().trim());
	usr.setUserPerPassword(usrPassword);
	usr.setUserPerRole(usrRole);

	boolean flag = AddUserDao.updateUser(usr);

	if (flag) {
		response.sendRedirect("UsersVED.jsp");
	} else {
		response.sendRedirect("error.jsp");
	}
%>