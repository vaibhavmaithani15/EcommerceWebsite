<%@page import="com.helper.FactoryProvider"%>
<html>
<head>
<title>MyCart | HOME</title>
 <%@include file="components/common_css_js.jsp" %> 
</head>
<body>
<%@include file="components/navbar.jsp" %> 
<h2>Hello World!</h2>
<%
out.println(FactoryProvider.getFactory()+"<br>");
%>
</body>
</html>
