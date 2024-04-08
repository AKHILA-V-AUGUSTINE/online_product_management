<%--
Document : ADD USERS
Created on :04/04/24
Author : Akhila
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import="com.productmngmt.beans.AddUserBean"%>
<%@page import="com.productmngmt.dao.AddUserDao"%>
<%
	String reg_name = request.getParameter("reg_name");
	String reg_phno = request.getParameter("reg_phno");
	String reg_email = request.getParameter("reg_email");
	String reg_user_name = request.getParameter("reg_user_name");
	String reg_user_pwd = request.getParameter("reg_user_pwd");
	String users_cat = request.getParameter("users_cat");

	AddUserBean adduserBean = new AddUserBean();

	adduserBean.setUserPerName(reg_name.toUpperCase().trim());
	adduserBean.setUserPerContact(reg_phno);
	adduserBean.setUserPerEmail(reg_email);
	adduserBean.setUserPerUsername(reg_user_name.toUpperCase().trim());
	adduserBean.setUserPerPassword(reg_user_pwd);
	adduserBean.setUserPerRole(users_cat);

	boolean flag = AddUserDao.insertUsers(adduserBean);

	if (flag) { // if inserted
		response.sendRedirect("index.jsp"); //redirect to
	} else {
		response.sendRedirect("Error.jsp");
	}
%>