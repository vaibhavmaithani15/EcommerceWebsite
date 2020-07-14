package com.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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
	
//	get all products
	public  List<Product> getAllProducts(){
	Session s = this.factory.openSession();
		Query query=s.createQuery("from Product");
		List<Product> list=query.list();
		return list;
		
	}
	
//	get all products of given id
	public  List<Product>  getAllProductsById(int cId){
		Session s = this.factory.openSession();
			Query query=s.createQuery("from Product as p where p.category.categoryId =: id");
			query.setParameter("id", cId);
			List<Product> list=query.list();
			return list;
			
		}
	
	
	

}
