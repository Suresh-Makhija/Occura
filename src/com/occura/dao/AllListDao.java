package com.occura.dao;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

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
		Transaction tx = null;
		UserProfileBean userProfileBean = null;
		try {
			tx = session.getTransaction();
			tx.begin();
		  Query query = session.createQuery("FROM UserProfileBean where user_id = "+user_id+"");
		  userProfileBean = (UserProfileBean) query.uniqueResult();
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
			 query = "\r\n" + 
					"\r\n" + 
					"select\r\n" + 
					" "+format+"(crt_date) AS month\r\n" + 
					" , sum(total_price_per_operation) amount\r\n" + 
					"FROM\r\n" + 
					"occura.patient_operation_history_tbl\r\n" + 
					"WHERE\r\n" + 
					" \r\n" + 
					"  crt_date >= '"+from+"'\r\n" + 
					" AND crt_date < '"+to+"' \r\n" + 
					"GROUP BY FORMAT(crt_date, 'yyyy_MM')\r\n" + 
					"ORDER BY crt_date";
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
			 query = "\r\n" + 
					"\r\n" + 
					"select\r\n" + 
					"unix_timestamp(crt_date)\r\n" + 
					" , count(1) \r\n" + 
					"FROM\r\n" + 
					"occura.patient_tbl group by month(crt_date)";
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
			 query = "SELECT appoint.crt_date,description,concat(first_name,\"  \",last_name) FROM occura.patient_appointment_tbl as appoint\r\n" + 
			 		"left outer join occura.patient_tbl as patient on patient.patient_id = appoint.patient_id";
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
			 query = "\r\n" + 
					"\r\n" + 
					"select\r\n" + 
					" "+format+"(crt_date) AS month\r\n" + 
					" , sum(medicine_Qty * total_price_per_medicine) amount\r\n" + 
					"FROM\r\n" + 
					"occura.patient_medicine_history_tbl\r\n" + 
					"WHERE\r\n" + 
					" \r\n" + 
					"  crt_date >= '"+from+"'\r\n" + 
					" AND crt_date < '"+to+"' \r\n" + 
					"GROUP BY FORMAT(crt_date, 'yyyy_MM')\r\n" + 
					"ORDER BY crt_date";
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
			 query = "\r\n" + 
					"\r\n" + 
					"select\r\n" + 
					" "+format+"(crt_date) AS month\r\n" + 
					" , count(1) amount\r\n" + 
					"FROM\r\n" + 
					"occura.patient_operation_history_tbl\r\n" + 
					"WHERE\r\n" + 
					" \r\n" + 
					"  crt_date >= '"+from+"'\r\n" + 
					" AND crt_date < '"+to+"' \r\n" + 
					"GROUP BY FORMAT(crt_date, 'yyyy_MM')\r\n" + 
					"ORDER BY crt_date";
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
			 query = "\r\n" + 
					"\r\n" + 
					"select\r\n" + 
					" "+format+"(crt_date) AS month\r\n" + 
					" , count(1) amount\r\n" + 
					"FROM\r\n" + 
					"occura.patient_tbl\r\n" + 
					"WHERE\r\n" + 
					" \r\n" + 
					"  crt_date >= '"+from+"'\r\n" + 
					" AND crt_date < '"+to+"' \r\n" + 
					"GROUP BY FORMAT(crt_date, 'yyyy_MM')\r\n" + 
					"ORDER BY crt_date";
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
}

//}
