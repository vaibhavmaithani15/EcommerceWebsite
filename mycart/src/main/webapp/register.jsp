
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
 <!-- Css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/script.js"></script>    
</head>
<body>
<%@include file="components/navbar.jsp" %> 
<div class="row mt-5">
	<div class="col-md-4 offset-md-4">
	<div class="card">
		<div class="card-body px-5">
		
			<h3 class="text-center display-5"> Sign Up Here </h3>
		<form action="">
		<div class="form-group">
    	<label for="name">User Name</label>
    	<input type="text" class="form-control" id="name"  placeholder="Enter Name" required>
    	</div>
    	
    	<div class="form-group">
    	<label for="email">User Email</label>
    	<input type="email" class="form-control" id="email"  placeholder="Enter Email" required>
    	</div>
    	
    	<div class="form-group">
    	<label for="password">User Password</label>
    	<input type="password" class="form-control" id="password"  placeholder="Enter Password" required>
    	</div>
    	
    	<div class="form-group">
    	<label for="phone">User Phone</label>
    	<input type="tel" class="form-control" id="phone"  placeholder="Enter Phone" required>
    	</div>
    	
    	<div class="form-group">
    	<label for="address">User Address</label>
    	<textarea class="form-control" placeholder="Enter Your Address" required></textarea>
    	</div>
    	
    	<div class="container text-center">
    		<button type="submit" class="btn btn-outline-success">Register</button>
    		<button type="reset" class="btn btn-outline-warning">Reset</button>
    	</div>
    	
    	<div class="container mt-3 mb-3 ">
    		<a href="signup.jsp" class="btn btn-outline-primary btn-block">Already Hava A Account? Login Here</a>
    		
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
