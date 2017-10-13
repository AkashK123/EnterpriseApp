package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.Category;

@Controller
public class SignupController 
{
	@RequestMapping(value="/signup")
	public ModelAndView formpage()
	{
		return new ModelAndView("signup", "category", new Category());
	}	
}
