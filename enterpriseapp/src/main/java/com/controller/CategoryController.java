package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/category")
	public ModelAndView categoryOpreation(Model m)
	{
		List<Category> list=categroyDao.retriveCategory();
		m.addAttribute("category", new Category());
		m.addAttribute("status","add");
	return new ModelAndView("category","categorylist",list);
	}
	@RequestMapping(value="/addcategory")
	public ModelAndView addCategoryOpreation(@ModelAttribute("category") Category category,Model m,HttpSession hs)
	{
		categroyDao.addCategory(category);
		//Update for Category List
		hs.removeAttribute("categoryList");
		List<Category> list=categroyDao.retriveCategory();
		hs.setAttribute("categoryList", list);
		m.addAttribute("category", new Category());
		m.addAttribute("status","add");
	return new ModelAndView("category","categorylist",list);
	}
	@RequestMapping(value="/deleteCategory{id}")
	public ModelAndView deleteCategoryOpreation(@PathVariable("id") int id,Model m)
	{
		categroyDao.deleteCategory(id);
		List<Category> list=categroyDao.retriveCategory();
		m.addAttribute("status","add");
		m.addAttribute("category", new Category());
	return new ModelAndView("category","categorylist",list);
	}
	

@RequestMapping(value="/updateCategory{id}")
public String updateCategoryOperation(@PathVariable("id") int id,Model m)
{
	Category category=categroyDao.getCategory(id);
	List<Category> list=categroyDao.retriveCategory();
	m.addAttribute("category", category);
	m.addAttribute("status", "update");
	m.addAttribute("categorylist",list);
	return "category";
}

	
	@RequestMapping(value="/updateCategoryData")
	public ModelAndView updateCategoryData(@ModelAttribute("category") Category category,Model m)
	{
		categroyDao.updateCategory(category);
		List<Category> list=categroyDao.retriveCategory();
		m.addAttribute("status","add");
		m.addAttribute("category", new Category());
	return new ModelAndView("category","categorylist",list);
	}
	
}

