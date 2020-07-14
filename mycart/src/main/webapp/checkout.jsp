<%

Users user = (Users) session.getAttribute("current_user");
if (user == null) {
	/* first check weather a user is login or not  */
	session.setAttribute("errormessage", "Login First");
	response.sendRedirect("login.jsp");
	return;
} 

%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout | Mycart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>

<div class="container">
<div class="row">

<div class="col-md-7">
<!-- card -->
<div class="card-lg mt-3 ">
<h4 class="text-center">Review Your Order</h4>
<div class="cart-body"></div>
</div>

</div>
<div class="col-md-5">
<div class="card-lg mt-3 ">
<h4 class="text-center">Your Details</h4>
<form action="#">

<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">  
     <label for="exampleInputName">Enter Name</label>
    <input value="<%=user.getUserName() %>" type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter Name">
  </div>
  <div class="form-group">  
     <label for="exampleInputName">Enter Phone</label>
    <input value="<%=user.getUserPhone() %>"  type="tel" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter Phone Number">
  </div>
   <div class="form-group">
    <label for="address">Shipping Address</label>
    <textarea  class="form-control" placeholder="Enter Shipping Address" id="exampleFormControlTextarea1" rows="3"><%=user.getUserAddress() %></textarea>
  </div>
  <div class="input-group mb-3">
  <div class="input-group-prepend">
    <div class="input-group-text">
    <input name="test" id="cash" type="radio" aria-label="Radio button for following text input">
    </div>
  </div>
  <input value="Cash On Delivery" type="text" class="form-control" aria-label="Text input with radio button">
</div>
 <div class="input-group mb-3">
  <div class="input-group-prepend">
    <div class="input-group-text">
    <input name="test" id="net" type="radio" aria-label="Radio button for following text input">
    </div>
  </div>
  <input value="Net Banking" type="text" class="form-control" aria-label="Text input with radio button">
</div>
  <div class="container text-center">
  <button class="btn btn-outline-success " >Place Order</button>
  <button class="btn btn-outline-info">Continue Shopping</button>
  </div>
</form>
</div>
</div>

</div>

</div>

 
 <%@include file="components/common_modal.jsp" %>
</body>
</html>