package com.project.enterpriceappbackend;

import java.util.List;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.project.dao.CategroyDao;
import com.project.hiberconfig.HiberConfigBackend;
import com.project.model.Category;

public class CategoryTest 
{
	static CategroyDao categoryDao;
	@BeforeClass
	public static void initialize()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext(HiberConfigBackend.class);
    	context.scan("com.project.*");
    	categoryDao=(CategroyDao)context.getBean("categoryDaoImpl");
	}
	@Ignore
	@Test
	public void addCategory() 
	{
		try{
		Category category=new Category();
		category.setId(5);
		category.setCategoryName("Shoes");
		category.setCategoryDescription("Woodland");
		categoryDao.addCategory(category);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void updateCategory() 
	{
		try{
		Category category=new Category();
		category.setId(4);
		category.setCategoryName("Shoes");
		category.setCategoryDescription("Puma");
		categoryDao.updateCategory(category);	
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void deleteCategory() 
	{
		try{
		Category category=new Category();
		category.setId(4);
		categoryDao.deleteCategory(category.getId());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void getCategory() 
	{
		try{
		Category category=new Category();
		category.setId(5);
		Category category1=categoryDao.getCategory(category.getId());
		System.out.println(category1.getCategoryName());
		System.out.println(category1.getCategoryDescription());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@Ignore
	@Test
	public void retrieveCategory() 
	{
		try{
		List<Category> list=categoryDao.retriveCategory();
    	for (Category category1 : list) {
			System.out.println(category1.getId());
		}}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
