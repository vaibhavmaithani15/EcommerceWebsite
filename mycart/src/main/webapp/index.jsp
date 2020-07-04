<%@page import="com.helper.FactoryProvider"%>
<html>
<body>
<h2>Hello World!</h2>
<%

out.println(FactoryProvider.getFactory()+"<br>");
%>
</body>
</html>
