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
	<div class="container admin">
	<div class="container-fluid mt-3">
	<%@include file="components/message.jsp" %>
	<%@include file="components/errormessage.jsp" %>
	</div>
	
	
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
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
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
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px"
								class="rounded mx-auto d-block img-fluid" alt="user_icon"
								src="img/add.png">
						</div>

						<p class="mt-2">Click Here to add new Product</p>
						<h1 class="display-5 text-muted">Add Product</h1>

					</div>
				</div>


			</div>
		</div>
	</div>

	<!-- Add Category Modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Adding
						Categories Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="POST">
					<input type="hidden" name="operation" value="addcategory">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category Title" required />
						</div>
						<div class="form-group">
							<textarea class="form-control" style="height: 150px"
								placeholder="Enter category description" name="catDescription"
								required></textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-outline-primary"
								data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- End Category Modal -->





	<!-- Add Product Modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Adding Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="POST" action="">
					<input type="hidden" name="operation" value="addproduct">

						<div class="form-group">
							<input type="text" class="form-control" name="productName"
								placeholder="Enter Product Name" required />
						</div>
						<div class="form-group">
							<textarea class="form-control" style="height: 150px"
								placeholder="Enter product description"
								name="productDescription" required></textarea>
						</div>
						<div class="form-group">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="productImage"
									name="productImage" /> <label for="image"
									class="custom-file-label">Product
									Image</label>
							</div>
							<small class="form-text text-muted">Max Size 3mb</small>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="productPrice"
								placeholder="Enter Price" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="productDiscount"
								placeholder="Enter Discount" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="productQuantity"
								placeholder="Enter Quantity" required />
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="productCategory"
								placeholder="Enter Product Category" required />
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-outline-primary"
								data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- End Product Modal -->


</body>
</html>