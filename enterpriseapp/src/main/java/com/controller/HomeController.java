package com.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.CategroyDao;
import com.project.dao.SupplierDao;
import com.project.model.Category;
import com.project.model.Supplier;

@Controller
public class HomeController {
	
	@Autowired
	CategroyDao categroyDao; 
	@Autowired
	SupplierDao supplierDao;
	
	@RequestMapping(value="/home")
	public String homepage(HttpSession hs)
	{
		List<Category> list=categroyDao.retriveCategory();
		 hs.setAttribute("categoryList", list);
		 List<Supplier> list1=supplierDao.retrieveSupplier();
		 hs.setAttribute("supplierList", list1);
		return "home";
	}
}


