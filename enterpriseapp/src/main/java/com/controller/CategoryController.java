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
	public ModelAndView addCategoryOpreation(@ModelAttribute Category category,Model m,HttpSession hs)
	{
		categroyDao.addCategory(category);
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
		m.addAttribute("category", new Category());
	return new ModelAndView("category","categorylist",list);
	}
	
	@RequestMapping(value="/updateCategory{id}")
	public ModelAndView updateCategoryOpreation(@PathVariable("id") int id,Model m)
	{
		Category category=categroyDao.getCategory(id);
		List<Category> list=categroyDao.retriveCategory();
		m.addAttribute("status","update");
		m.addAttribute("category", category);
	return new ModelAndView("category","categorylist",list);
	}
	
	@RequestMapping(value="/updateCategoryData")
	public ModelAndView updateCategoryData(@ModelAttribute Category category,Model m)
	{
		categroyDao.updateCategory(category);
		List<Category> list=categroyDao.retriveCategory();
		m.addAttribute("status","add");
		m.addAttribute("category", category);
	return new ModelAndView("category","categorylist",list);
	}
	
}

