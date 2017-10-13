package com.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Product {

	@Id
	private int id;
	private String productName,productDescription;
	private int productStock,productPrice,categoryId,supplierId;
	public Product() 
	{
		
	}
	public Product(int id, String productName, String productDescription, int productStock, int productPrice,
			int categoryId, int supplierId) {
		super();
		this.id = id;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productStock = productStock;
		this.productPrice = productPrice;
		this.categoryId = categoryId;
		this.supplierId = supplierId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
}
