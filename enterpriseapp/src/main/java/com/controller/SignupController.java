package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.RegistrationFormDao;
import com.project.model.RegistrationForm;

@Controller
public class SignupController 
{	
	@Autowired
	RegistrationFormDao registrationFormDao;
	@RequestMapping(value="/signup")
	public String formpage(Model m)
	{
		m.addAttribute("registrationForm", new RegistrationForm());
		return "signup";
	}
	@RequestMapping(value="/register")
	public String registerOperation(@ModelAttribute("registrationForm") RegistrationForm registrationForm,Model m)
	{
		registrationFormDao.createUser(registrationForm);
		m.addAttribute("registrationForm", new RegistrationForm());
		return "signup";
	}
}
