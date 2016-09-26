package com.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Blog;


@Repository
public class BlogDAOImpl implements BlogDAO{

	@Autowired
	SessionFactory sessionFactory;
	 public Session getSession()
	   {
	   	return sessionFactory.openSession();
	   }

	public void addBlog(Blog blog) {
		Session session = getSession();
		Transaction t=session.beginTransaction();
		blog.setPostDate(new Date());
		session.save(blog);
	    t.commit();
       System.out.println("Blog added successfully"+blog);	
   }

	public List<Blog> listBlogByUser(String username) {
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		Query query=session.createQuery("from Blog where username=:username");
		query.setString("username", username);
		List<Blog> list=query.list();
		transaction.commit();
		session.close();
		return list;
      }
	
	public List<Blog> fetchAllBlogs() {
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		Query query=session.createQuery("from Blog");
		List<Blog> list=query.list();
		transaction.commit();
		session.close();
		return list;
      }
	
    public Blog getBlogById(int id) {
		
		Session session = getSession();
		Transaction t=session.beginTransaction();
	        Blog blog = (Blog) session.load(Blog.class, new Integer(id));
	        t.commit();
	        return blog;
	}
    
   
    
    public void removeBlog(int id) {
		Session session = getSession();
		Transaction t=session.beginTransaction();
		 Blog blog = (Blog) session.load(Blog.class, new Integer(id));
	    session.delete(blog);
	    t.commit();

	}
    
     public void updateBlog(int id) {
		
    	 Session session = getSession();
 		Transaction t=session.beginTransaction();
 		 Blog blog = (Blog) session.load(Blog.class, new Integer(id));
 	    session.update(blog);
 	    t.commit();
     }

	
	}


