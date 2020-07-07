
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
 <!-- Css -->
<%@include file="components/common_css_js.jsp" %> 
<link rel="stylesheet" href="css/style.css">
<script src="js/script.js"></script>
   
</head>
<body>
<%@include file="components/navbar.jsp" %> 

<div class="row mt-5">
	<div class="col-md-4 offset-md-4">
	<div class="card">
			<%@include file="components/message.jsp" %>
			<%@include file="components/errormessage.jsp" %>
		<div class="card-body px-5">
		
			<h3 class="text-center display-5"> Sign Up Here </h3>
		<form id="user_form" action="RegisterServlet" method="POST">
		<div class="form-group">
    	<label for="name">User Name</label>
    	<input name="user_name" type="text" class="form-control" id="name"  placeholder="Enter Name" required>
    	</div>
    	
    	<div class="form-group">
    	<label for="email">User Email</label>
    	<input name="user_email" type="email" class="form-control" id="email"  placeholder="Enter Email" required>
    	</div>
    	
    	<div class="form-group">
    	<label  for="password">User Password</label>
    	<input name="user_password" type="password" class="form-control" id="password"  placeholder="Enter Password" required>
    	</div>
    	
    	<div class="form-group">
    	<label for="phone">User Phone</label>
    	<input name="user_phone" type="tel" class="form-control" id="phone"  placeholder="Enter Phone" required>
    	</div>
    	
    	<div class="form-group">
    	<label for="address">User Address</label>
    	<textarea name="user_address" class="form-control" placeholder="Enter Your Address" required></textarea>
    	</div>
    	
    	<div class="container text-center">
    		<button type="submit" class="btn btn-outline-success">Register</button>
    		<button type="reset" class="btn btn-outline-warning">Reset</button>
    	</div>
    	
    	<div class="container mt-3 mb-3 ">
    		<a href="login.jsp" class="btn btn-outline-primary btn-block">Already Hava A Account? Login Here</a>
    		
    	</div>
    	
    	<div class="container">
    		
    	</div>
		</form>
		
		
		
		</div>
	
	</div>
	
		
	</div>
</div>

</body>
</html><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
