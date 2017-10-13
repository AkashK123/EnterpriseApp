package com.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class RegistrationForm 
{
	@Id
	String email;
	String fname;
	String lname;
	String contact;
	String gender;
	String country;
	String address;
	String Password;
	String confirmPassword;
	String dob;
	
	public RegistrationForm() {
		
	}

	public RegistrationForm(String email, String fname, String lname, String contact, String gender, String country,
			String address, String password, String confirmPassword, String dob) {
		super();
		this.email = email;
		this.fname = fname;
		this.lname = lname;
		this.contact = contact;
		this.gender = gender;
		this.country = country;
		this.address = address;
		Password = password;
		this.confirmPassword = confirmPassword;
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	
		
}
