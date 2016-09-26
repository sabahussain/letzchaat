package com.model;
import javax.persistence.*;

import org.springframework.stereotype.Component;
@Component
@Entity
public class Register {
	
	@Id
	private String username;
	private String firstName;
	private String lastName;
	private String password;
	private String contact;
	private String email; 
	private String userType;
	private String role;
	private boolean enabled;
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "Register [username=" + username + ", firstName=" + firstName + ", lastName=" + lastName + ", password="
				+ password + ", contact=" + contact + ", email=" + email + ", userType=" + userType + ", role=" + role
				+ ", enabled=" + enabled + "]";
	}
	
	
	
	
	

}
