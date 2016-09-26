package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.model.Blog;
import com.service.BlogService;

@Controller
public class BlogController {
	
	@Autowired
	BlogService blogService;
	
	@RequestMapping("/forumwelcome")
	public String forumWelcome(HttpServletRequest request,ModelMap model)
	{
		 Gson gson=new Gson();
		 HttpSession session=request.getSession(false);
		   String username=(String)session.getAttribute("username");
		   System.out.println("Inside postlist "+username);
	    	List<Blog> list = blogService.listBlogByUser(username);
	    	System.out.println("LIST IS "+list);
	    	String json=gson.toJson(list);
	    	System.out.println(json);
	        model.addAttribute("listpost", json.toString());
	    	return "forumwelcome";
	}
	@RequestMapping("/addPost")
	public ModelAndView addPost()
	{
		return new ModelAndView("addPost");
	}
	
	@RequestMapping("/newblog")
	public ModelAndView newblog()
	{
		return new ModelAndView("newblog");
	}
	
	@RequestMapping("/postAdd")
	public ModelAndView addPost1(HttpServletRequest request,@ModelAttribute("blog")Blog blog)
	{
		 HttpSession session=request.getSession(false);
		   String username=(String)session.getAttribute("username");
		  blog.setUsername(username);
		blogService.addBlog(blog);
		return new ModelAndView("addPost","msg","Blog Published Successfully");
	}
	
	@RequestMapping("/postList")
	public String listPost(HttpServletRequest request,ModelMap model)
	{
		 Gson gson=new Gson();
		 HttpSession session=request.getSession(false);
		   String username=(String)session.getAttribute("username");
		   System.out.println("Inside postlist "+username);
	    	List<Blog> list = blogService.listBlogByUser(username);
	    	System.out.println("LIST IS "+list);
	    	String json=gson.toJson(list);
	    	System.out.println(json);
	        model.addAttribute("listpost", json.toString());
	    	return "forumwelcome";
	}
	
	@RequestMapping(value="/editPost/{id}")
	public ModelAndView editPost(@PathVariable("id")int id)
	{
		System.out.println("hello");
		 //Gson gson=new Gson();
		 ModelAndView mv=new ModelAndView("forumwelcome");
	//	Blog blog=blogService.getBlogById(id);
		//String json=gson.toJson(blog);
		//mv.addObject("command",json);
		return mv;
	}
	
	@RequestMapping(value="/editsave/{id}")  
    public ModelAndView editsave(@PathVariable("id") int id){  
        blogService.updateBlog(id);  
        return new ModelAndView("redirect:/forumwelcome");  
    }  
	
	@RequestMapping(value="/deletepost/{id}")  
    public ModelAndView delete(@PathVariable int id){  
		blogService.removeBlog(id);
        return new ModelAndView("redirect:/forumwelcome");  
    }  
	
	@RequestMapping(value="/del")  
    public void may(){  
		System.out.println("Hello me");
    } 

}
