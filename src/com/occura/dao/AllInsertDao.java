package com.occura.dao;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.occura.bean.PatientBean;
import com.occura.bean.UserBean;
import com.occura.util.HibernateUtil;

public class AllInsertDao {

	
	public static boolean insertUser(UserBean user)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(user);
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
		return true;
	}
	
	
}
