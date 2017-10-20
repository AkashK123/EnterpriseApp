package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.SupplierDao;
import com.project.model.Category;
import com.project.model.Product;
import com.project.model.Supplier;

@Controller
public class SupplierController 
{
@Autowired	
SupplierDao supplierDao;	

public void refreshSupplierSession(HttpSession hs,Model m)
{
	m.addAttribute("category", new Category());
	m.addAttribute("supplier", new Supplier());
	m.addAttribute("product", new Product());
	hs.removeAttribute("supplierList");
	List<Supplier> list=supplierDao.retrieveSupplier();
	hs.setAttribute("supplierList", list);
}

@RequestMapping(value="/supplier")
public String supplierOperation(Model m,HttpSession hs)
{
	m.addAttribute("status","add");
	refreshSupplierSession(hs,m);
	return "adding";
}

@RequestMapping(value="/addsupplier")
public String addSupplierOperation( @ModelAttribute("supplier") Supplier supplier,Model m,HttpSession hs)
{
	supplierDao.addSupplier(supplier);
	m.addAttribute("status","add");
	refreshSupplierSession(hs,m);
	return "adding";
}

@RequestMapping(value="/deletesupplier{id}")
public String deleteSupplierOperation(@PathVariable("id") int id,Model m,HttpSession hs)
{
	supplierDao.deleteSupplier(id);
	m.addAttribute("status", "add");
	refreshSupplierSession(hs,m);
	return "adding";
}

@RequestMapping(value="/updatesupplier{id}")
public String updateSupplierOperation(@PathVariable("id") int id,Model m,HttpSession hs)
{
	refreshSupplierSession(hs,m);
	Supplier supplier=supplierDao.getSupplier(id);
	m.addAttribute("supplier", supplier);
	m.addAttribute("status", "update");
	return "adding";
}

@RequestMapping(value="/updatesupplierdata")
public String updateSupplierData(@ModelAttribute("supplier") Supplier supplier,Model m,HttpSession hs)
{
	supplierDao.updateSupplier(supplier);
	m.addAttribute("status", "add");
	refreshSupplierSession(hs,m);
	return "adding";
}
}
