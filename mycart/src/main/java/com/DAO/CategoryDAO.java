package com.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Category;

public class CategoryDAO {
	private SessionFactory factory;
	int catId;

	public CategoryDAO(SessionFactory factory) {
		super();
		this.factory = factory;
	}
//	save category to database
	public int saveCategory(Category cat) {
		
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			 catId=(Integer) session.save(cat);
			tx.commit();
			session.close();	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return catId;
	}
	
	

}
