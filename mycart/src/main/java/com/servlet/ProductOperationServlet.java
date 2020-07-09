package com.servlet;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.CategoryDAO;
import com.DAO.ProductDAO;
import com.entities.Category;
import com.entities.Product;
import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;
import com.helper.FactoryProvider;
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private String categorytitle ;  
     private String categorydescription;
     private String op;
     private String productName;
     private String productDescription;
     private String productImage;
     private int productPrice;
     private int productDiscount;
     private int productQuantity;
     private int categoryId;
   
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
				HttpSession httpSession= request.getSession();
				httpSession.setAttribute("message","Category Added Successfully");
				
				response.sendRedirect("admin.jsp");
				return;
				

				
			}else if(op.trim().equals("addproduct")) {
//				fetching product data
				productName=request.getParameter("productName");
				productDescription=request.getParameter("productDescription");
				productPrice=Integer.parseInt(request.getParameter("productPrice"));
				productDiscount=Integer.parseInt(request.getParameter("productDiscount"));
				productQuantity=Integer.parseInt(request.getParameter("productQuantity"));
				categoryId=Integer.parseInt(request.getParameter("catId"));
				

				Product p=new Product();
				p.setpName(productName);
				p.setpDesc(productDescription);
				p.setpPrice(productPrice);
				p.setpDiscount(productDiscount);
				p.setpQuantity(productQuantity);
				
				
//				Geting image from form
				Part part=request.getPart("image");
				productImage=part.getSubmittedFileName();
				System.out.println("IMAGE NAME IS "+ productImage);
				p.setpPhoto(productImage);
				
//				get category by id
				CategoryDAO categoryDAO=new CategoryDAO(FactoryProvider.getFactory());
				Category category=categoryDAO.getCategoryById(categoryId);
				p.setCategory(category);
				
//				product save to database 
				ProductDAO productDAO=new ProductDAO(FactoryProvider.getFactory());
				productDAO.saveProduct(p);
				
				
//				Pic Upload 
//				Find out path to upload photo 
				String path=request.getRealPath("img")+java.io.File.separator+ "products"+java.io.File.separator +productImage;
				System.out.println(path);
				
//				uploading code
				FileOutputStream fos=new FileOutputStream(path);
				InputStream is=part.getInputStream();
//				reading data
				byte[] data=new byte[is.available()];
				is.read(data);
				
//				Writing the data
				fos.write(data);
				fos.close();
				
				
				
				
				HttpSession httpSession= request.getSession();
				httpSession.setAttribute("message","Product Added Successfully");
				response.sendRedirect("admin.jsp");
				
			}
			
			
			
		} catch (Exception e) {
			HttpSession httpSession= request.getSession();
				httpSession.setAttribute("errormessage","Failed To Add");
				response.sendRedirect("admin.jsp");
				return;
		}
	}

}
