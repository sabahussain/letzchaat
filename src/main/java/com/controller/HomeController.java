package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.Register;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public ModelAndView home()
	{
		ModelAndView m=new ModelAndView("index");
		return m;
	}
	@RequestMapping("/index")
	public ModelAndView home1()
	{
		ModelAndView m=new ModelAndView("index");
		return m;
	}
	@RequestMapping("/chatindex")
	public ModelAndView home2()
	{
		ModelAndView m=new ModelAndView("chatindex");
		return m;
	}

	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	
}
