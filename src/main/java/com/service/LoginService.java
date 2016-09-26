package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.LoginDAOImpl;

@Service
@Transactional
public class LoginService {
	@Autowired(required=true)
	LoginDAOImpl loginDAOImpl;
	
	public boolean isValidCredentials(String email, String password)
	{
		System.out.println(email+"   "+password);
		return loginDAOImpl.isValidCredentials(email, password);
	}
	

}
