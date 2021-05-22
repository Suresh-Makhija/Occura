package com.occura.dao;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.occura.bean.UserBean;
import com.occura.util.HibernateUtil;

public class AllListDao {

	
	public static UserBean findUserByName(String user,String email)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		 UserBean userBean = null;
		try {
			tx = session.getTransaction();
			tx.begin();
		  Query query = session.createQuery("FROM UserBean where lower(name) = lower('"+user+"') or lower(email) = lower('"+email+"')");
		 userBean = (UserBean) query.uniqueResult();
			tx.commit();
		}
		catch (Exception e) {
			if(tx != null)
			{
				tx.rollback();
			}
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return userBean;
	}
	
	
	public static UserBean findUserByLogin(String user,String email,String pswd)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		 UserBean userBean = null;
		try {
			tx = session.getTransaction();
			tx.begin();
		  Query query = session.createQuery("FROM UserBean where lower(name) = lower('"+user+"') or lower(email) = lower('"+email+"') and password = '"+pswd+"'");
		 userBean = (UserBean) query.uniqueResult();
			tx.commit();
		}
		catch (Exception e) {
			if(tx != null)
			{
				tx.rollback();
			}
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return userBean;
	}
	
}
