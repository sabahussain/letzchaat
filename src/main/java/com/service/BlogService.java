package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BlogDAOImpl;
import com.model.Blog;

@Service
@Transactional
public class BlogService {
	@Autowired
	BlogDAOImpl blogDAOImpl;
	
	public void addBlog(Blog blog)
	{
		blogDAOImpl.addBlog(blog);
	}
	public List<Blog> listBlogByUser(String username)
	{
		List<Blog> list=blogDAOImpl.listBlogByUser(username);
		return list;
	}
	public Blog getBlogById(int id)
	{
		Blog blog=blogDAOImpl.getBlogById(id);
		return blog;
	}
	
	public void removeBlog(int id)
	{
		blogDAOImpl.removeBlog(id);
	}
	public void updateBlog(int id)
	{
		blogDAOImpl.updateBlog(id);
	}
	
	public List<Blog> fetchAllBlogs()
	{
		List<Blog> list=blogDAOImpl.fetchAllBlogs();
		return list;
	}


}
