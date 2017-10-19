package com.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.CategroyDao;
import com.project.dao.ProductDao;
import com.project.dao.SupplierDao;
import com.project.model.Category;
import com.project.model.Product;
import com.project.model.Supplier;

@Controller
public class HomeController {
	
	@Autowired
	CategroyDao categroyDao; 
	@Autowired
	SupplierDao supplierDao;
	@Autowired
	ProductDao productDao;

	
	@RequestMapping(value="/home")
	public String homepage(HttpSession hs)
	{
		List<Category> categorylist=categroyDao.retriveCategory();
		 hs.setAttribute("categoryList", categorylist);
		 List<Supplier> supplierlist=supplierDao.retrieveSupplier();
		 hs.setAttribute("supplierList", supplierlist);
		 List<Product> productlist=productDao.retrieveProduct();
		 hs.setAttribute("productList", productlist);
		return "home";
	}
	
	@RequestMapping(value="/adding")
	public String adding(Model m,HttpSession hs)
	{
		m.addAttribute("category", new Category());
		m.addAttribute("status","add");
		return "adding";
	}
	
}


