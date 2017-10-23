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

	public void sessionInitialization(HttpSession hs)
	{
		 List<Category> categorylist=categroyDao.retriveCategory();
		 hs.setAttribute("categoryList", categorylist);
		 List<Supplier> supplierlist=supplierDao.retrieveSupplier();
		 hs.setAttribute("supplierList", supplierlist);
		 List<Product> productlist=productDao.retrieveProduct();
		 hs.setAttribute("productList", productlist);
	}
	@RequestMapping(value="/home")
	public String homepage(HttpSession hs)
	{
		sessionInitialization(hs);
		return "home";
	}
	
	@RequestMapping(value="/adding")
	public String adding(Model m,HttpSession hs)
	{
		sessionInitialization(hs);
		m.addAttribute("category", new Category());
		m.addAttribute("supplier", new Supplier());
		m.addAttribute("product", new Product());
		m.addAttribute("status","add");
		return "adding";
	}

	@RequestMapping(value="/viewproduct")
	public String viewProduct(Model m,HttpSession hs)
	{
		sessionInitialization(hs);
		m.addAttribute("category", new Category());
		m.addAttribute("supplier", new Supplier());
		m.addAttribute("product", new Product());
		return "viewproduct";
	}
}


