package com.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Product;

public class ProductDAO {
	
	private SessionFactory factory;
	int pId;
	
	public ProductDAO(SessionFactory factory) {
		super();
		this.factory = factory;
	}
//	save product to database
	
	public boolean saveProduct(Product product) {
		boolean f=false;
		try {
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			pId=(Integer)session.save(product);
			session.close();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	
	
	

}
