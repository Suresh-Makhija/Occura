package com.occura.dao;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;

import com.occura.bean.PatientAppointmentBean;
import com.occura.bean.PatientBean;
import com.occura.bean.UserBean;
import com.occura.bean.UserProfileBean;
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


	public  UserProfileBean findUserProfile(int user_id)
	{
		Session session = HibernateUtil.openSession();
		UserProfileBean userProfileBean = null;
		try {
				Query query = session.createQuery("FROM UserProfileBean where user_id = "+user_id+"");
				//Query query = session.createQuery("FROM UserProfileBean where user_profile_id = "+user_id+"");
				userProfileBean = (UserProfileBean) query.uniqueResult();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return userProfileBean;
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
	public  HashMap<String, Integer> dashboardBasicDetails() throws HibernateException, SQLException
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		 HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		 Connection con = session.connection().getMetaData().getConnection();
		try {
			tx = session.getTransaction();
			CallableStatement cbStatas = con.prepareCall("call occura.new_procedure(?,?,?,?,?)");
			cbStatas.registerOutParameter(1,Types.INTEGER);
			cbStatas.registerOutParameter(2,Types.INTEGER);
			cbStatas.registerOutParameter(3,Types.DOUBLE);
			cbStatas.registerOutParameter(4,Types.DOUBLE);
			cbStatas.registerOutParameter(5,Types.INTEGER);
			cbStatas.executeUpdate();
			hashMap.put("total_patient", cbStatas.getInt(1));
			hashMap.put("today_patient", cbStatas.getInt(2));
			hashMap.put("revenue", cbStatas.getInt(3) + cbStatas.getInt(4));
			hashMap.put("total_operation", cbStatas.getInt(5) );
			hashMap.put("operation_income", cbStatas.getInt(4) );
			hashMap.put("pharmacy_income", cbStatas.getInt(3) );
		}
		catch (Exception e) {
			e.printStackTrace();
			if(tx != null)
			{
				tx.rollback();
			}

		}
		finally {
			session.close();
		}
		return hashMap;
}
	public  List<Object[]> findRevenueChart(String from , String to,String format)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			tx = session.getTransaction();
			tx.begin();
			 query = "select "+format+"(crt_date) AS month,sum(total_price_per_operation) amount FROM " +
					"occura.patient_operation_history_tbl WHERE crt_date >= '"+from+"' AND crt_date < '"+to+"' " +
					"GROUP BY FORMAT(crt_date, 'yyyy_MM') ORDER BY crt_date";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
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
		return dataList ;
	}

	public  List<Object[]> findPatientChart()
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			tx = session.getTransaction();
			tx.begin();
			 query = "select unix_timestamp(crt_date) , count(1) FROM occura.patient_tbl group by month(crt_date)";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
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
		return dataList ;
	}


	public  List<Object[]> toDograph()
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			tx = session.getTransaction();
			tx.begin();
			 query = "SELECT DATE_FORMAT(appoint.appointment_date_time,'%d/%m/%Y %h:%i:%s %p') as crt_date,description,concat(first_name,\"  \",last_name) FROM occura.patient_appointment_tbl as appoint " +
			 		"left outer join occura.patient_tbl as patient on patient.patient_id = appoint.patient_id "+
					" where DATE(appoint.appointment_date_time)=curdate() ";
			 
//			 query = "SELECT DATE_FORMAT(appoint.appointment_date_time,'%d/%m/%Y %h:%i:%s %p') as crt_date,full_name FROM occura.patient_appointment_tbl as appoint " +
//				 		"left outer join occura.patient_tbl as patient on patient.patient_id = appoint.patient_id "+
//				 		" where DATE(appoint.appointment_date_time)=curdate() ";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
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
		return dataList ;
	}


	public  List<Object[]> findRevenueChartMedicine(String from , String to,String format)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			tx = session.getTransaction();
			tx.begin();
			 query = "select "+format+"(crt_date) AS month,sum(medicine_Qty * total_price_per_medicine) amount FROM " +
					" occura.patient_medicine_history_tbl WHERE crt_date >= '"+from+"' AND crt_date < '"+to+"' " +
					" GROUP BY FORMAT(crt_date, 'yyyy_MM') ORDER BY crt_date";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
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
		return dataList ;
	}

	
	public  List<Object[]> OperationHistoryOperationCount(String from , String to,String format)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			tx = session.getTransaction();
			tx.begin();
			 query = "select "+format+"(crt_date) AS month ,count(1) amount FROM occura.patient_operation_history_tbl " + 
					" WHERE crt_date >= '"+from+"' AND crt_date < '"+to+"' GROUP BY FORMAT(crt_date, 'yyyy_MM') " + 
					" ORDER BY crt_date";
		  SQLQuery sqlQuery = session.createSQLQuery(query);
		  dataList = sqlQuery.list();
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
		return dataList ;
	}
	
	public  List<Object[]> OperationHistoryPatientCount(String from , String to,String format)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			tx = session.getTransaction();
			tx.begin();
			 query = "select "+format+"(crt_date) AS month , count(1) amount FROM occura.patient_tbl WHERE " + 
					" crt_date >= '"+from+"' AND crt_date < '"+to+"' GROUP BY FORMAT(crt_date, 'yyyy_MM') " + 
					" ORDER BY crt_date";
		  SQLQuery sqlQuery = session.createSQLQuery(query);
		  dataList = sqlQuery.list();
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
		return dataList ;
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


	public static PatientBean findEmailByPatient(String email)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		PatientBean patient = null;
		try {
			tx = session.getTransaction();
			tx.begin();
				Query query = session.createQuery("FROM PatientBean where lower(email_address) = lower('"+email+"') ");
				patient = (PatientBean) query.uniqueResult();
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
		return patient;
	}
	
	public static PatientAppointmentBean findDateTimeByPatient(String appointmentdate)
	{
		Session session = HibernateUtil.openSession();
		PatientAppointmentBean patient = null;
		try {
				Query query = session.createQuery("FROM PatientAppointmentBean where DATE_FORMAT(appointment_date_time,'%d/%m/%Y %h:%i:%s %p') "
						+ " = DATE_FORMAT('"+appointmentdate+"','%d/%m/%Y %h:%i:%s %p') ");
				patient = (PatientAppointmentBean) query.uniqueResult();
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

//}
