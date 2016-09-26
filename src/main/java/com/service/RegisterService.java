package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.RegisterDAOImpl;
import com.model.Register;

@Service
@Transactional
public class RegisterService {
	@Autowired
	RegisterDAOImpl registerDAOImpl;
	
	public void addUser(Register r)
	{
		registerDAOImpl.addUser(r);
	}
	
	public String loginUser(String username,String password)
	{
		String name=registerDAOImpl.loginUser(username, password);
		return name;
	}

}
