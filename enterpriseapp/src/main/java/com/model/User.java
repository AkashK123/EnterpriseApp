package com.model;

import java.io.Serializable;

public class User implements Serializable
{
	private static final long serialVersionUID = 1L;
String name;
String email;
String role;


	public User() 
	{
	}

	public User(String name, String email, String role) {
	super();
	this.name = name;
	this.email = email;
	this.role = role;
}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
}
