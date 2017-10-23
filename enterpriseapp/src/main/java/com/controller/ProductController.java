package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.dao.CategroyDao;
import com.project.dao.ProductDao;
import com.project.dao.SupplierDao;
import com.project.model.Category;
import com.project.model.Product;
import com.project.model.Supplier;

@Controller
public class ProductController 
{
@Autowired
ProductDao productDao;
@Autowired
SupplierDao supplierDao;
@Autowired
CategroyDao categroyDao;

public void refreshProductSession(HttpSession hs,Model m)
{
	m.addAttribute("category", new Category());
	m.addAttribute("supplier", new Supplier());
	m.addAttribute("product", new Product());
	hs.removeAttribute("productList");
	List<Product> productlist=productDao.retrieveProduct();
	hs.setAttribute("productList", productlist);
}

@RequestMapping(value="/addproduct")
public String addProductOperation(@ModelAttribute("product") Product product,Model m,HttpSession hs)
{
	MultipartFile file=product.getPimg();
	productDao.addProduct(product);
	m.addAttribute("status", "add");
	String path = "C:\\Users\\Mohan\\Desktop\\Workspace\\enterpriseapp\\src\\main\\webapp\\resources\\images\\product\\"+product.getId()+".jpg";
	
	File fileupload= new File(path);
	
	if(!file.isEmpty())
	{
		try {
			byte[] arr = file.getBytes();
			FileOutputStream fos = new FileOutputStream(fileupload);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			bos.write(arr);
			bos.close();
		} catch (IOException e) {
			System.out.println("File not uploaded");
		}
	}
	else{
		System.out.println("File not found");
	}
	System.out.println("File uploaded successfully");

	refreshProductSession(hs, m);
	return "adding";
}


@RequestMapping(value="/updateproduct{id}")
public String updateProductOperation(@PathVariable("id") int id,Model m,HttpSession hs)
{
	Product product=productDao.getProduct(id);
	refreshProductSession(hs, m);
	m.addAttribute("product", product);
	m.addAttribute("status", "update");
	
	return "viewproduct";
}


@RequestMapping(value="/updateproductdata")
public String updateProductData(@ModelAttribute("product") Product product,Model m,HttpSession hs)
{
	productDao.updateProduct(product);
	m.addAttribute("status", "add");
	refreshProductSession(hs, m);
	return "viewproduct";
}

@RequestMapping(value="/deleteproduct{id}")
public String deleteProductOperation(@PathVariable("id") int id,Model m,HttpSession hs)
{
	productDao.deleteProduct(id);
	m.addAttribute("status", "add");
	refreshProductSession(hs, m);
	return "viewproduct";
}




}
