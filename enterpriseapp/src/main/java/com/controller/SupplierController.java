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
import com.project.model.Supplier;

@Controller
public class SupplierController 
{
@Autowired	
SupplierDao supplierDao;	

@RequestMapping(value="/supplier")
public String supplierOperation(Model m)
{
	List<Supplier> list=supplierDao.retrieveSupplier();
	m.addAttribute("supplier", new Supplier());
	m.addAttribute("status","add");
	m.addAttribute("supplierList",list);
	return "supplier";
}

@RequestMapping(value="/addsupplier")
public String addSupplierOperation( @ModelAttribute("supplier") Supplier supplier,Model m,HttpSession hs)
{
	hs.removeAttribute("supplierList");
	supplierDao.addSupplier(supplier);
	List<Supplier> list=supplierDao.retrieveSupplier();
	hs.setAttribute("supplierList", list);
	m.addAttribute("supplier", new Supplier());
	m.addAttribute("status","add");
	m.addAttribute("supplierList",list);
	return "supplier";
}

@RequestMapping(value="/deletesupplier{id}")
public String deleteSupplierOperation(@PathVariable("id") int id,Model m)
{
	supplierDao.deleteSupplier(id);
	List<Supplier> list=supplierDao.retrieveSupplier();
	m.addAttribute("status", "add");
	m.addAttribute("supplier", new Supplier());
	m.addAttribute("supplierList",list);
	return "supplier";
}

@RequestMapping(value="/updatesupplier{id}")
public String updateSupplierOperation(@PathVariable("id") int id,Model m)
{
	Supplier supplier=supplierDao.getSupplier(id);
	List<Supplier> list=supplierDao.retrieveSupplier();
	m.addAttribute("supplier", supplier);
	m.addAttribute("status", "update");
	m.addAttribute("supplierList",list);
	return "supplier";
}

@RequestMapping(value="/updatesupplierdata")
public String updateSupplierData(@ModelAttribute("supplier") Supplier supplier,Model m)
{
	supplierDao.updateSupplier(supplier);
	List<Supplier> list=supplierDao.retrieveSupplier();
	m.addAttribute("status", "add");
	m.addAttribute("supplier", new Supplier());
	m.addAttribute("supplierList",list);
	return "supplier";
}
}
