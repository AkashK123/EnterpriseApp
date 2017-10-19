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
import com.project.model.Product;

@Controller
public class ProductController 
{
@Autowired
ProductDao productDao;
@Autowired
SupplierDao supplierDao;
@Autowired
CategroyDao categroyDao;

@RequestMapping(value="/product")
public String productOperation(Model m,HttpSession hs)
{

	List<Product> productlist=productDao.retrieveProduct();
	m.addAttribute("product", new Product());
	m.addAttribute("status", "add");
	m.addAttribute("productList", productlist);
	return "product";
}
@RequestMapping(value="/addproduct")
public String addProductOperation(@ModelAttribute("product") Product product,Model m)
{
	MultipartFile file=product.getPimg();
	productDao.addProduct(product);
	
	List<Product> productlist=productDao.retrieveProduct();
	m.addAttribute("product", new Product());
	m.addAttribute("status", "add");
	m.addAttribute("productList", productlist);
	
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

	
	return "product";
}


@RequestMapping(value="/updateproduct{id}")
public String updateProductOperation(@PathVariable("id") int id,Model m)
{
	Product product=productDao.getProduct(id);
	List<Product> productlist=productDao.retrieveProduct();
	m.addAttribute("product", product);
	m.addAttribute("status", "update");
	m.addAttribute("productList", productlist);
	
	return "product";
}


@RequestMapping(value="/updateproductdata")
public String updateProductData(@ModelAttribute("product") Product product,Model m)
{
	productDao.updateProduct(product);
	List<Product> productlist=productDao.retrieveProduct();
	m.addAttribute("product", new Product());
	m.addAttribute("status", "add");
	m.addAttribute("productList", productlist);
	
	return "product";
}

@RequestMapping(value="/deleteproduct{id}")
public String deleteProductOperation(@PathVariable("id") int id,Model m)
{
	productDao.deleteProduct(id);
	List<Product> productlist=productDao.retrieveProduct();
	m.addAttribute("product", new Product());
	m.addAttribute("status", "add");
	m.addAttribute("productList", productlist);	
	return "product";
}

}
