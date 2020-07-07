package com.DAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.Users;

public class UserDAO {
	private SessionFactory factory;
	
	
public UserDAO(SessionFactory factory) {
		super();
		this.factory = factory;
	}


//	Get User Email and Password
	
	public Users getUserByEmailAndPassword(String email, String password) {
		
		Users user= null;
		
		try {
			
			String query="from Users where userEmail =:e and userPassword =:p";
			Session session=this.factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user=(Users) q.uniqueResult();
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return  user;
		
	}
	

}
