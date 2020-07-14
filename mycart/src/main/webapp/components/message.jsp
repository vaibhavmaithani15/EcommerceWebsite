
<%
	String message = (String) session.getAttribute("message");
	if (message != null) {
		//Print Message
		//	out.println(message);
%>
<div  id="toast" class="alert alert-success alert-dismissible fade show display"
	role="alert">
	<strong><%=message%></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%
	session.removeAttribute("message");
	}
%>




