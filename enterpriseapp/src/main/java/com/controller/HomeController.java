package com.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.CategroyDao;
import com.project.model.Category;

@Controller
public class HomeController {
	
	@Autowired
	CategroyDao categroyDao; 
	
	@RequestMapping(value="/home")
	public String homepage(HttpSession hs)
	{
		List<Category> list=categroyDao.retriveCategory();
		 hs.setAttribute("categoryList", list);
		return "home";
	}
}


