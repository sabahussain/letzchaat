package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.Register;
import com.service.RegisterService;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class RegisterController {
	
	@Autowired
	RegisterService registerService;
	
	@RequestMapping("/signup")
	public ModelAndView index (Model model) {  
		ModelAndView m=new ModelAndView("signup");
	    return m;
	}
	

	@RequestMapping("/signin")
	public ModelAndView signin (Model model) {  
		ModelAndView m=new ModelAndView("signin");
	    return m;
	}
	
	
	@RequestMapping("/successRegister")
	public String signin(@ModelAttribute("r")Register r,ModelMap model)
	{
		r.setEnabled(true);
		r.setRole("ROLE_USER");
		registerService.addUser(r);
		 model.addAttribute("user",r);
		 System.out.println(r);
		return "successRegister";
	}
	
	@RequestMapping("/login")
	public ModelAndView loginCheck(HttpServletRequest request, HttpServletResponse response)
	{
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String name=registerService.loginUser(username,password);
		if(name==null)
		{
			String message="Username or password incorrect.";
			ModelAndView modelAndView=new ModelAndView("redirect:/signin");
			modelAndView.addObject("msg",message);
			return modelAndView;
		}
		else
		{
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("name", name);
		   ModelAndView modelAndView =new ModelAndView("index","name",name);
		   return modelAndView;
		}
	}
	
	@RequestMapping("/signOut")
	public ModelAndView signout(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession(false);
		session.invalidate();
		ModelAndView modelAndView =new ModelAndView("index","name",null);
		return modelAndView;
	}

}
