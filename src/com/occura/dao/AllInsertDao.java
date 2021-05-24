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
import com.occura.util.HibernateUtil;

public class AllInsertDao {

	public static <T> boolean save(T t)
	{Session session = HibernateUtil.openSession();
	Transaction tx = null;
	 boolean flag = false;
	try {
		tx = session.getTransaction();
		tx.begin();
		 session.saveOrUpdate(t);
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
		
//	public static boolean insertUser(UserBean user)
//	{
//		boolean value = true;
//		Session session = HibernateUtil.openSession();
//		Transaction tx = null;
//		try {
//			tx = session.getTransaction();
//			tx.begin();
//		  session.saveOrUpdate(user);
//			tx.commit();
//		}
//		catch (Exception e) {
//			value = false;
//			if(tx != null)
//			{
//				tx.rollback();
//			}
//			e.printStackTrace();
//		}
//		finally {
//			session.close();
//		}
//		return value;
//	}
	
	public static boolean savepatient(PatientBean patient) throws HibernateException, SQLException
	{
		boolean value = true;
		Session session = HibernateUtil.openSession();
		Session session2 = HibernateUtil.openSession();
		Transaction tx = null;
		Transaction tx1 = null;
		Query query=null;
		PatientBean patientBean = null;
		//Connection connection = null;
		//connection = (session).connection().getMetaData().getConnection();
		try {
			tx = session.getTransaction();
			tx.begin();
		   
//			PreparedStatement p=connection.prepareStatement(" insert into Table name (column) values (?,?,?,?,?,?,?) ");
//			p.setString(1,"");
//			p.executeUpdate();

			query  = session.createQuery("FROM PatientBean where mobile_no = '"+patient.getMobile_no()+"' ");
			patientBean = (PatientBean) query.uniqueResult();
			 
			if(patientBean == null)
			{
				session.saveOrUpdate(patient);
				if(session != null)
				{
					tx.commit();
					
					query = session2.createQuery("FROM PatientBean where mobile_no = '"+patient.getMobile_no()+"' ");
					patientBean = (PatientBean) query.uniqueResult();
					
					session2.clear();
					session2.close();
				}
			}
			
			tx1 = session.getTransaction();
			tx1.begin();
			
			PatientAppointmentBean appBean = new PatientAppointmentBean();
			appBean.setAppointment_date_time(patient.getAppointment_date());
			appBean.setCrt_date(patient.getCrt_date());
			appBean.setPatient_id(patientBean.getPatient_id());
			session.saveOrUpdate(appBean);
			if(session != null)
			{
				tx1.commit();
			}
			
			
//			query  = session2.createSQLQuery("INSERT INTO patient_tbl(first_name,last_name,gender,age,full_name,mobile_no,"
//					+ "email_address,photo,crt_date) "
//					+ " VALUES ('"+patient.getFirst_name()+"','"+patient.getLast_name()+"','""') ");
//			query.executeUpdate();
				
			
			
		}
		catch (Exception e) {
			value = false;
			if(tx != null)
			{
				tx.rollback();
			}
			if(tx1 != null)
			{
				tx1.rollback();
			}
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return value;
	}
	
}
