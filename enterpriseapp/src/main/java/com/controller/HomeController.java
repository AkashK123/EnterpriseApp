package com.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/login")
	public String Loginpage(HttpSession hs,@RequestParam(name="error",required=false) String error,Model m)
	{
		if(error!=null)
		{
			m.addAttribute("message", "Invalid Username or password");
		}
		
		sessionInitialization(hs);
		return "login";
	}
	
	@RequestMapping(value="/adminadding")
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
		m.addAttribute("product", new Product());
		return "viewproduct";
	}
	@RequestMapping(value="/accessdenied")
	public String accessdenied(Model m)
	{
		m.addAttribute("error","Access for this page is denied for all users");
		return "error";
	}
	
	@RequestMapping(value="/performlogoutoperation")
	public String logoutOperation(HttpServletRequest request,HttpServletResponse response)
	{
		//fetch the authentication object
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		if(authentication!=null)
		{
			new SecurityContextLogoutHandler().logout(request, response, authentication);
			
		}
		return "redirect:/home";
	}
	
	@RequestMapping(value="/search")
	public String search(@RequestParam("searchname") String searchname,Model m,HttpSession hs)
	{
		sessionInitialization(hs);
		List<Product> list=productDao.retrieveProductByName(searchname);
		m.addAttribute("productList",list);
		m.addAttribute("product",new Product());
		return "viewproduct";
	}
	
	
}


