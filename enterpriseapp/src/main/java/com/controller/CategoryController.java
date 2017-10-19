package com.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.CategroyDao;
import com.project.model.Category;

@Controller
public class CategoryController 
{
	@Autowired
	CategroyDao categroyDao;
	
	public void refreshSession(HttpSession hs)
	{
		
		hs.removeAttribute("categoryList");
		List<Category> list=categroyDao.retriveCategory();
		hs.setAttribute("categoryList", list);
	}
	
	@RequestMapping(value="/category")
	public String categoryOpreation(Model m)
	{
		m.addAttribute("category", new Category());
		m.addAttribute("status","add");
		return "category";
	}
	@RequestMapping(value="/addcategory")
	public String addCategoryOpreation(@ModelAttribute("category") Category category,Model m,HttpSession hs)
	{
		categroyDao.addCategory(category);
		m.addAttribute("category", new Category());
		m.addAttribute("status","add");
		refreshSession(hs);
	return "category";
	}
	@RequestMapping(value="/deleteCategory{id}")
	public String deleteCategoryOpreation(@PathVariable("id") int id,Model m,HttpSession hs)
	{
		categroyDao.deleteCategory(id);
		m.addAttribute("status","add");
		m.addAttribute("category", new Category());
		refreshSession(hs);
	return "category";
	}
	

@RequestMapping(value="/updateCategory{id}")
public String updateCategoryOperation(@PathVariable("id") int id,Model m)
{
	Category category=categroyDao.getCategory(id);
	m.addAttribute("category", category);
	m.addAttribute("status", "update");
	return "category";
}

	
	@RequestMapping(value="/updateCategoryData")
	public String updateCategoryData(@ModelAttribute("category") Category category,Model m,HttpSession hs)
	{
		categroyDao.updateCategory(category);
		m.addAttribute("status","add");
		m.addAttribute("category", new Category());
		refreshSession(hs);
		return "category";
	}
	
}

