package com.project.enterpriceappbackend;

import static org.junit.Assert.*;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.project.dao.RegistrationFormDao;
import com.project.hiberconfig.HiberConfigBackend;
import com.project.model.RegistrationForm;

public class RegistrationTest {

	static RegistrationFormDao registrationFormDao;
	@BeforeClass
	public static void initialize()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext(HiberConfigBackend.class);
    	context.scan("com.project.*");
    	registrationFormDao=(RegistrationFormDao)context.getBean("registrationFormDaoImpl");
	}
	@Ignore
	@Test
	public void addUser() 
	{
		try{
		RegistrationForm registrationForm=new RegistrationForm();
    	registrationForm.setAddress("17/B, Room no:-62");
    	registrationForm.setContact("9769841882");
    	registrationForm.setCountry("India");
    	registrationForm.setEmail("akashkumarmohan1996@gmail.com");
    	registrationForm.setFname("Akash");
    	registrationForm.setGender("Male");
    	registrationForm.setLname("Kumar");
    	registrationForm.setPassword("akash");
    	registrationForm.setConfirmPassword("akash");
    	registrationForm.setDob("06/03/1996");
    	registrationFormDao.createUser(registrationForm);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void updateUser() 
	{
		try{
		RegistrationForm registrationForm=new RegistrationForm();
    	registrationForm.setAddress("Room no:-62");
    	registrationForm.setContact("9769841882");
    	registrationForm.setCountry("India");
    	registrationForm.setEmail("akashkumarmohan1751@gmail.com");
    	registrationForm.setFname("Akash");
    	registrationForm.setGender("Male");
    	registrationForm.setLname("Kumar");
    	registrationForm.setPassword("akash");
    	registrationForm.setConfirmPassword("akash");
    	registrationForm.setDob("06/03/1996");
    	registrationFormDao.updateUser(registrationForm);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void deleteUser() 
	{
		try{
		RegistrationForm registrationForm=new RegistrationForm();
    	registrationForm.setEmail("akashkumarmohan1751@gmail.com");
    	registrationFormDao.deleteUser(registrationForm.getEmail());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Test
	public void getUser()
	{
		try{
			RegistrationForm registrationForm=new RegistrationForm();
			registrationForm.setEmail("akashkumarmohan1996@gmail.com");
			RegistrationForm registrationForm1=registrationFormDao.getUser(registrationForm.getEmail());
			System.out.println(registrationForm1.getFname());
			System.out.println(registrationForm1.getDob());
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
