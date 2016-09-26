package com.dao;



import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;


@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	SessionFactory sessionFactory;
	 public Session getSession()
	   {
	   	return sessionFactory.openSession();
	   }


	public boolean isValidCredentials(String email, String password) {
		
		System.out.println("In Check login");
		System.out.println(email+"    "+password);
		Session session = sessionFactory.openSession();
		boolean userFound = false;
		String q =" from Register where email=:email and password=:password";
		Query query = session.createQuery(q);
		query.setParameter("email",email);
		query.setParameter("password",password);
		System.out.println(query.toString());
		List list = query.list();

		if ((list != null) && (list.size() > 0)) {
			System.out.println("flag set true");
			userFound= true;
		}
        
		session.close();
		return userFound; 
	}
	

}
