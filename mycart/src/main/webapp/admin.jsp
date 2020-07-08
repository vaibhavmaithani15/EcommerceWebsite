<%@page import="com.entities.Users"%>
<%
	Users user = (Users) session.getAttribute("current_user");
	if (user == null) {
		/* first check weather a user is login or not  */
		session.setAttribute("errormessage", "Login First");
		response.sendRedirect("login.jsp");
		return;
	} else {
		/* then check wheather a user that is login is admin or not */
		if (user.getUserType().equals("normal")) {
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
	<div class="container">
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px"
								class="rounded mx-auto d-block img-fluid" alt="user_icon"
								src="img/team.png">
						</div>
						<h1>2323232</h1>
						<h1 class="display-5 text-muted">Users</h1>

					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px"
								class="rounded mx-auto d-block img-fluid" alt="user_icon"
								src="img/list.png">
						</div>
						<h1>322323</h1>
						<h1 class="display-5 text-muted">Categories</h1>

					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px"
								class="rounded mx-auto d-block img-fluid" alt="user_icon"
								src="img/product.png">
						</div>
						<h1>322243</h1>
						<h1 class="display-5 text-muted">Products</h1>

					</div>
				</div>

			</div>
		</div>

		<div class="row mt-3">

			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px"
								class="rounded mx-auto d-block img-fluid" alt="user_icon"
								src="img/calculator.png">
						</div>
						
						<p class="mt-2">Click here to add new Category</p>
						<h1 class="display-5 text-muted">Add Category</h1>

					</div>
				</div>


			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px"
								class="rounded mx-auto d-block img-fluid" alt="user_icon"
								src="img/add.png">
						</div>
						
						<p class ="mt-2">Click Here to add new Product</p>
						<h1 class="display-5 text-muted">Add Product</h1>

					</div>
				</div>


			</div>
		</div>
	</div>





</body>
</html>