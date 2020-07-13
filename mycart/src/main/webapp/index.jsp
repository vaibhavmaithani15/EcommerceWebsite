<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Category"%>
<%@page import="com.DAO.CategoryDAO"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ProductDAO"%>
<%@page import="com.helper.FactoryProvider"%>
<html>
<head>
<title>MyCart | HOME</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
	

		<div class="row mt-3 mx-2">
			<%
			
				ProductDAO dao = new ProductDAO(FactoryProvider.getFactory());
				String cat = request.getParameter("category");

				List<Product> list = null;
				if (cat == null || cat.trim().equals("all")) {

					list = dao.getAllProducts();
				} else {
					int cId = Integer.parseInt(cat.trim());

					list = dao.getAllProductsById(cId);

				}

				CategoryDAO cdao = new CategoryDAO(FactoryProvider.getFactory());
				List<Category> clist = cdao.getCategories();
			%>
			<!-- Show Categories -->
			<div class="col-md-2">
				<div class="list-group mt-4">
					<%-- <h1>Number of Category is <%= clist.size() %></h1> --%>
					<a href="index.jsp?category=all" id="test1"
						class="list-group-item list-group-item-action active">All
						Products</a> 

					<%
						for (Category category : clist) {
							
							String cat1 = request.getParameter("category");
							int cat2=category.getCategoryId();
						//	out.print(cat1+"<br>"+cat2);
					%>
						<a href="index.jsp?category=<%=category.getCategoryId()%>" onclick="setSelectedTestPlan();" id="test2" class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>
						
					<%
					if(cat1==null || cat1.trim().equals("all")){
					//out.print("all/null");
					%>	
					
					<!-- Java Script Dynamically Add class active to All Products -->
						
		
					<% 	
					}else if(Integer.parseInt(cat1)==cat2){
						
						
						
						
					//	out.print(cat1+"<br>"+cat2);
					%>
					<!-- Java Script code to dynamically add class active according to id  -->
					<% 
						}
					
						}
					%>	
				</div>
			</div>
			<!-- Show Products -->

			<div class="col-md-10 admin">
				<!-- row -->
				<div class="row mt-4">
					<div class="col-md-12">
						<div class="card-columns">
							<!-- Traversing Product -->
							<%
								for (Product product : list) {
							%>
							<div class="card">
								<div class="container text-center">
									<img class="card-img-top m-2 "
										src="img/products/<%=product.getpPhoto()%>"
										style="max-height: 150px; max-width: 100%; width: auto;">
								</div>

								<div class="card-body ">
									<h5 class="card-title hover-title"><%=Helper.getWords24(product.getpName())%></h5>
									<p class="card-text"><%=Helper.getWords(product.getpDesc())%></p>
									<div class="container text-center">
									
									<button class="btn btn-outline-info  text-center">View
										More</button>
										</div>
								</div>
								<div class="card-footer text-center">
									<p class="display-5 text-center hover-title">
										&#8377;<%=product.getPriceAfterDiscount() %>/- <span style="font-size: 15px; font-style: italic; " class ="text-secondary discount-label">&#8377;<s><%= product.getpPrice() %></s> <%=     product.getpDiscount() +"% off" %></span></p>
									<button class="btn btn-outline-success btn-block text-center" onclick="add_to_cart(<%= product.getpId()%>,'<%= product.getpName()%>',<%= product.getPriceAfterDiscount()%>)">Add
										to cart</button>
								</div>
							</div>
							<%
								}
								if (list.size() == 0) {

									out.print("<h5>No Item in this category</h5>");
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
