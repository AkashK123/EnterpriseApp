package com.controller;



import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.project.dao.CategroyDao;
import com.project.model.Category;
import com.project.model.Product;
import com.project.model.Supplier;

@Controller
public class CategoryController 
{
	@Autowired
	CategroyDao categroyDao;
	
	public void refreshCategorySession(HttpSession hs,Model m)
	{
		m.addAttribute("category", new Category());
		m.addAttribute("supplier", new Supplier());
		m.addAttribute("product", new Product());
		hs.removeAttribute("categoryList");
		List<Category> list=categroyDao.retriveCategory();
		hs.setAttribute("categoryList", list);
	}
	
	@RequestMapping(value="/adminaddcategory")
	public String addCategoryOpreation(@ModelAttribute("category") Category category,Model m,HttpSession hs)
	{
		categroyDao.addCategory(category);
		m.addAttribute("status","add");
		m.addAttribute("taskcomplete", "added");
		refreshCategorySession(hs,m);
	return "adding";
	}
	@RequestMapping(value="/admindeleteCategory{id}")
	public String deleteCategoryOpreation(@PathVariable("id") int id,Model m,HttpSession hs)
	{
		categroyDao.deleteCategory(id);
		m.addAttribute("status","add");
		m.addAttribute("taskcomplete", "deleted");
		refreshCategorySession(hs,m);
	return "adding";
	}
	

@RequestMapping(value="/adminupdateCategory{id}",method=RequestMethod.GET)
public String updateCategoryOperation(@PathVariable("id") int id,Model m,HttpSession hs)
{
	refreshCategorySession(hs,m);
	Category category=categroyDao.getCategory(id);
	m.addAttribute("category", category);
	m.addAttribute("status", "update");
	return "adding";
}

	@RequestMapping(value="/adminupdateCategoryData")
	public String updateCategoryData(@ModelAttribute("category") Category category,Model m,HttpSession hs)
	{
		categroyDao.updateCategory(category);
		m.addAttribute("status","add");
		m.addAttribute("taskcomplete", "updated");
		refreshCategorySession(hs,m);
		return "adding";
	}
	
}

