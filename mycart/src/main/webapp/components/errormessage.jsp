
<%
	String errormessage = (String) session.getAttribute("errormessage");
	if (errormessage != null) {
		//Print Message
		//	out.println(message);
%>
<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<strong><%=errormessage%></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%
	session.removeAttribute("errormessage");
	}
%>




