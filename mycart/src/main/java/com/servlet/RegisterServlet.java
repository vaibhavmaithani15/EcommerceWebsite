package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Users;
import com.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			String userName=request.getParameter("user_name");
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			String userPhone=request.getParameter("user_phone");
			String userAddress=request.getParameter("user_address");
			
//			validations
//			Creating to User Object
			Users user=new Users(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
			Session hibernateSession=FactoryProvider.getFactory().openSession();
			Transaction tx=hibernateSession.beginTransaction();
			int userId=(Integer) hibernateSession.save(user);
			tx.commit();
			hibernateSession.close();
			out.println("Sucessfully Saved");
			out.println("<br> User Id is "+ userId);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
