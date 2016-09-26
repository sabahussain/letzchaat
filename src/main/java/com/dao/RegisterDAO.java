package com.dao;
import com.model.*;

public interface RegisterDAO {
	
	public void addUser(Register r);
	public String loginUser(String username,String password);

}
