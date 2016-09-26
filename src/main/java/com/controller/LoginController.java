package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.LoginService;
import com.model.*;

@Controller
public class LoginController {

	@Autowired
	public LoginService loginService;


	@RequestMapping(value="/signin1" ,method = RequestMethod.GET)
	   public String redirect(@ModelAttribute("userForm") Register register,ModelMap model)
	   {
		Register r=new Register();
		/*String email=r.getEmail();
		String password=r.getPassword();*/
		String email=register.getEmail();
		String password=register.getPassword();
		boolean userExists = loginService.isValidCredentials(email, password);
		if(userExists){
			System.out.println("Logged in Successfully");
			return "index";		
		}
		else
		{
			System.out.println("Try again");
			return "signin";
	    }
		
	}
}
