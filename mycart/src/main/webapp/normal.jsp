<%

	Users user=(Users)session.getAttribute("current_user");
	if(user==null){
		/* first check weather a user is login or not */
		session.setAttribute("errormessage", "Login First");
		response.sendRedirect("login.jsp");
		return;
	}else{
		
		/* then check weather a user that is try to login is normal user or not */
		if(user.getUserType().equals("admin")){
			
			session.setAttribute("errormessage", "Login From Normal User Account");
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
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
<link rel="stylesheet" href="css/style.css">
<script src="js/script.js"></script>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<h1>This is normal user Panel</h1>



</body>
</html>