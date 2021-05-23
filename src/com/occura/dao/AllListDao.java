package com.occura.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;

import com.occura.bean.PatientBean;
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
	
	public static String findPassword(String email)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		 String password = null;
		try {
			tx = session.getTransaction();
			tx.begin();
		  Query query = session.createQuery("select  u.password from UserBean u where  lower(email) = lower('"+email+"')");
		  query.setMaxResults(1);
		 password = (String) query.uniqueResult();
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
		return password ;
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
	
	
	public static List<PatientBean> getlistfromPatient()
	{
		Session session = HibernateUtil.openSession();
		List<PatientBean> patient = null;
		try {
			
		  Query query = session.createSQLQuery(" select a.first_name,a.last_name,a.full_name,b.appointment_date_time as appointment_date"
		  		+ " from patient_tbl a join patient_appointment_tbl b "
		  		+ " where DATE(b.appointment_date_time)=curdate() and  "
		  		+ " b.appointment_date_time BETWEEN now() and date_add(now(), interval 15 MINUTE) order by b.appointment_date_time")
				.addScalar("first_name")
				.addScalar("last_name")
				.addScalar("full_name")
				.addScalar("appointment_date")
				.setResultTransformer(
					Transformers.aliasToBean(PatientBean.class));
		  	patient = query.list();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return patient;
	}
	
}
