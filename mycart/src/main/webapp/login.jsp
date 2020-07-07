<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login/title</title>
<%@include file="components/common_css_js.jsp"%>
<link rel="stylesheet" href="css/style.css">
<script src="js/script.js"></script>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
				<%@include file="components/errormessage.jsp" %>
					<div class="card-header custom-bg text-center">
						<h3 class="display-5">Login Here</h3>


					</div>
					<div class="card-body">

						<form action="LoginServlet" method="POST">
						"
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label>
								 <input name="email" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required>
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
								<input name="password" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required>
							</div>
							<div class="container text-center">
							<button type="submit" class="btn btn-outline-success">Login</button>
							<button type="reset" class="btn btn-outline-success">Reset</button>
							</div>
							<div class="container text-center mt-3 mb-3">
							<a href="register.jsp" class="btn btn-outline-primary btn-block ">Sign Up Here</a>
							</div>
							
						</form>

					</div>
					
				</div>



			</div>
		</div>

	</div>
</body>
</html>