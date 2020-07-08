package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.entities.Users;
import com.helper.FactoryProvider;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String email;
	private String password;
	       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		HttpSession httpSession=request.getSession();
		try {
			email=request.getParameter("email");
			password=request.getParameter("password");
			
//			validation
			
//			Authenticating User from Database
			UserDAO userDAO=new UserDAO(FactoryProvider.getFactory());
			Users user=userDAO.getUserByEmailAndPassword(email, password);
//			System.out.println(user);
			if(user==null) {
		
				httpSession.setAttribute("errormessage", "Invalid Details");
				response.sendRedirect("login.jsp");
			}else {
				out.println("<h1>Welcom "+user.getUserName()+"</h1>");
				
//				Session Tracking for login process
				httpSession.setAttribute("current_user", user);
				
				if(user.getUserType().equals("admin")) {
//					Admin user=Admin.jsp
					response.sendRedirect("admin.jsp");
				}else if(user.getUserType().equals("normal")) {
//					   Normal user=normal.jsp
					response.sendRedirect("normal.jsp");
				}else {
					out.println("We Had not identified user type");
				}

				
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
