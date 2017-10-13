package com.project.daoimp;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cache.spi.access.RegionAccessStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.project.dao.RegistrationFormDao;
import com.project.model.RegistrationForm;

@Repository("registrationFormDaoImpl")
@Transactional
public class RegistrationFormDaoImpl implements RegistrationFormDao 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public void createUser(RegistrationForm registrationForm) 
	{
		sessionFactory.getCurrentSession().save(registrationForm);
	}
	public void updateUser(RegistrationForm registrationForm) 
	{
		sessionFactory.getCurrentSession().update(registrationForm);
	}
	public void deleteUser(String email) 
	{
		Query query=sessionFactory.getCurrentSession().createQuery("delete from RegistrationForm where email= :email");
		query.setString("email", email);
		query.executeUpdate();
	}
	public RegistrationForm getUser(String email)
	{
		RegistrationForm registrationForm=sessionFactory.getCurrentSession().get(RegistrationForm.class,email);
		return registrationForm;
	}

}
