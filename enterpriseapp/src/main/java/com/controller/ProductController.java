package com.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.ProductDao;
import com.project.model.Product;

@Controller
public class ProductController 
{
@Autowired
ProductDao productDao;

@RequestMapping(value="/product")
public String productOperation(Model m)
{
	
	List<Product> productlist=productDao.retrieveProduct();
	m.addAttribute("product", new Product());
	m.addAttribute("productList", productlist);
	return "product";
}
@RequestMapping(value="/addproduct")
public String addProductOperation(@ModelAttribute("product") Product product,Model m)
{
	productDao.addProduct(product);
	
	List<Product> productlist=productDao.retrieveProduct();
	m.addAttribute("product", new Product());
	m.addAttribute("productList", productlist);
	return "product";
}

@RequestMapping(value="/updateproduct")
public String updateProduct(@ModelAttribute("product") Product product,Model m)
{
	System.out.println("product"+product.getId());
	System.out.println("product"+product.getProductName());
	System.out.println("product"+product.getProductDescription());
	System.out.println("product"+product.getProductStock());
	System.out.println("product"+product.getProductPrice());
	System.out.println("product"+product.getCategoryId());
	System.out.println("product"+product.getSupplierId());
	productDao.updateProduct(product);
	List<Product> productlist=productDao.retrieveProduct();
	m.addAttribute("product", new Product());
	m.addAttribute("productList", productlist);
	
	return "product";
}
}
