package com.dao;

import java.util.List;

import com.model.Blog;

public interface BlogDAO {
	public void addBlog(Blog blog);
	public List<Blog> listBlogByUser(String username);
	public Blog getBlogById(int id);
	public void removeBlog(int id);
	public void updateBlog(int id);
	public List<Blog> fetchAllBlogs();
}
