package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import com.model.Blog;
import com.service.BlogService;

@RestController
public class BlogRestController {
	
	@Autowired
	BlogService blogService;
	
	@RequestMapping(value = "/blog/", method = RequestMethod.GET)
    public ResponseEntity<List<Blog>> fetchAllBlogs() {
        List<Blog> blogs = blogService.fetchAllBlogs();
        if(blogs.isEmpty()){
            return new ResponseEntity<List<Blog>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Blog>>(blogs, HttpStatus.OK);
    }
	  @RequestMapping(value = "/blog/{id}", method = RequestMethod.PUT)
	 public ResponseEntity<Blog> updateBlog(@PathVariable("id") int id, @RequestBody Blog blog) {
	         blogService.updateBlog(id);
	        return new ResponseEntity<Blog>(HttpStatus.OK);
	    }
	  @RequestMapping(value = "/blog/{id}", method = RequestMethod.DELETE)
	 public ResponseEntity<Blog> deleteBlog(@PathVariable("id") int id) {
	         blogService.removeBlog(id);
	        return new ResponseEntity<Blog>(HttpStatus.OK);
	    }

}
