package com.occura.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.occura.bean.PatientAppointmentBean;
import com.occura.bean.PatientBean;
import com.occura.bean.UserBean;
import com.occura.bean.UserProfileBean;
import com.occura.util.HibernateUtil;

public class AllUpdateDao {

	public boolean updateUserProfile(UserProfileBean userProfileBean)
	{
		boolean flag = false;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			 session.saveOrUpdate(userProfileBean);
			tx.commit();
			if(session != null)
			{
				flag = true;
			}
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
		return flag;
	}
}
		

