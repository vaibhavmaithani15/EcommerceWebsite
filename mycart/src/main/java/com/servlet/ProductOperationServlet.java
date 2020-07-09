package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CategoryDAO;
import com.entities.Category;
import com.helper.FactoryProvider;

public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private String categorytitle ;  
     private String categorydescription;
     private String op;
//     private String productName;
//     private String product
   
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession httpSession;
		try {
			
			op=request.getParameter("operation");
			if(op.trim().equals("addcategory")) {
//				fetching category data
			categorytitle=request.getParameter("catTitle");
				categorydescription=request.getParameter("catDescription");
				Category category=new Category();
				category.setCategoryTitle(categorytitle);
				category.setCategoryDescription(categorydescription);
				
//				save category to database
				CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
				int catId=categoryDAO.saveCategory(category);
				 httpSession= request.getSession();
				httpSession.setAttribute("message","Category Added Successfully");
				
				response.sendRedirect("admin.jsp");
				return;
				

				
			}else if(op.trim().equals("addproduct")) {
//				fetching product data
				
				
			}
			
			
			
		} catch (Exception e) {
			 httpSession= request.getSession();
				httpSession.setAttribute("errormessage","Failed To Add");
				response.sendRedirect("admin.jsp");
				return;
		}
	}

}
