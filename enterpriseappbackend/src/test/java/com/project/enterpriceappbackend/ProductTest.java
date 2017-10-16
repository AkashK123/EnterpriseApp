package com.project.enterpriceappbackend;

import static org.junit.Assert.*;

import java.util.Iterator;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.project.dao.ProductDao;
import com.project.hiberconfig.HiberConfigBackend;
import com.project.model.Product;

public class ProductTest {

	static ProductDao productDao;
	@BeforeClass
	public static void initialize()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext(HiberConfigBackend.class);
		context.scan("com.project.*");
		productDao=(ProductDao)context.getBean("productDaoImpl");
	}
	@Ignore
	@Test
	public void addProduct() 
	{
		try{
		Product product=new Product();
		product.setId(1);
		product .setProductName("Samsung J7");
		product.setProductDescription("3000 mh battery");
		product.setProductPrice(20000);
		product.setCategoryId(101);
		product.setProductStock(200);
		product.setSupplierId(120);
		productDao.addProduct(product);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void updateProduct() 
	{
		try{
		Product product=new Product();
		product.setId(1);
		product .setProductName("Samsung J7");
		product.setProductDescription("5.7 inches");
		product.setProductPrice(20000);
		product.setCategoryId(101);
		product.setProductStock(200);
		product.setSupplierId(120);
		productDao.updateProduct(product);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void deleteProduct() 
	{
		try{
		Product product=new Product();
		product.setId(103);
		productDao.deleteProduct(product.getId());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Test
	public void getProduct() 
	{
		try{
		Product product=new Product();
		product.setId(102);
		Product product1=productDao.getProduct(product.getId());
		System.out.println(product1.getProductName());
		System.out.println(product1.getProductDescription());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void retrieveProduct() 
	{
		try{
		List<Product> list=productDao.retrieveProduct();
		for (Product product1: list) 
		{
			System.out.println(product1.getId());
		}}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}