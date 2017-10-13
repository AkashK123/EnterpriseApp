package com.project.dao;

import java.util.List;

import com.project.model.Product;

public interface ProductDao {
	public void addProduct(Product product);
	public void updateProduct(Product product);
	public void deleteProduct(int id);
	public List<Product> retrieveProduct();
	public Product getProduct(int id);
}
