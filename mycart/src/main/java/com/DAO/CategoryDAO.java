package com.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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
	
	public List<Category> getCategories(){
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Category");
		List<Category> list = query.list();
		return list;
	} 
	public Category getCategoryById(int categoryId) 
	{
		Category cat=null;
		try {
			Session session = this.factory.openSession();
			cat=session.get(Category.class, categoryId);
			session.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cat;
	}
	

}
