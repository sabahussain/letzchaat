package com.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Register;

@Repository
public class RegisterDAOImpl implements RegisterDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	 public Session getSession()
	   {
	   	return sessionFactory.openSession();
	   }

	public void addUser(Register r) {
	
			Session session = getSession();
			Transaction t=session.beginTransaction();
			session.persist(r);
		    t.commit();
	       System.out.println("User Registered successfully"+r);	
	}
	
	public String loginUser(String username,String password)
	{
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		Query query=session.createQuery("Select firstName from Register where username=:username and password=:password ");
		query.setString("username", username);
		query.setString("password", password);
		List<String> list=query.list();
		transaction.commit();
		session.close();
		if(list.isEmpty())
			{
			return null;
			}
		else
		return list.get(0);
	}
	
	

}
