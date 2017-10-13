package com.project.dao;

import java.util.List;
import com.project.model.Category;

public interface CategroyDao 
{
	public void addCategory(Category category);
	public void updateCategory(Category category);
	public Category getCategory(int id);
	public void deleteCategory(int id);
	public List<Category> retriveCategory();
}
