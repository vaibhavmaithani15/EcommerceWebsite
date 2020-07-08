<%@page import="com.entities.Users"%>
<%



Users user=(Users)session.getAttribute("current_user");
if(user==null){
	/* first check weather a user is login or not  */
	session.setAttribute("errormessage", "Login First");
	response.sendRedirect("login.jsp");
	return;
}else{
	/* then check wheather a user that is login is admin or not */
	if(user.getUserType().equals("normal")){
		session.setAttribute("errormessage", "Access Denied");
		response.sendRedirect("login.jsp");
		return;
	}
}


%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel | Mycart</title>
<%@include file="components/common_css_js.jsp"%>
<link rel="stylesheet" href="css/style.css">
<script src="js/script.js"></script>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<h1>This is admin Panel Page</h1>
</body>
</html>