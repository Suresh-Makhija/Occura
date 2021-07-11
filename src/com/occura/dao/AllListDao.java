package com.occura.dao;


import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.DatatypeConverter;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;

import com.occura.bean.MasterChiefComplaintBean;
import com.occura.bean.MasterDiagnoBean;
import com.occura.bean.MasterMedicineBean;
import com.occura.bean.PatientAppointmentBean;
import com.occura.bean.PatientBean;
import com.occura.bean.PatientCCHistory;
import com.occura.bean.PatientDiagnoHistory;
import com.occura.bean.PatientMedicineHistory;
import com.occura.bean.UserBean;
import com.occura.bean.UserProfileBean;
import com.occura.util.HibernateUtil;
import com.occura.utility.CommonUtility;

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

	public  List<UserBean> getUserList()
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<UserBean> usList = new ArrayList<UserBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
		  Query query = session.createQuery("FROM UserBean");
		  usList =  query.list();
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
		return usList;
	}
	
	public  List<MasterChiefComplaintBean> getChiefComplaintList()
	{
		Session session = HibernateUtil.openSession();
		List<MasterChiefComplaintBean> ChiefComplaintList = new ArrayList<MasterChiefComplaintBean>();
		try {
		  Query query = session.createQuery("FROM MasterChiefComplaintBean");
		  ChiefComplaintList =  query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return ChiefComplaintList;
	}
	
	public  List<MasterMedicineBean> getTreatmentList()
	{
		Session session = HibernateUtil.openSession();
		List<MasterMedicineBean> masterMedicineBeans = new ArrayList<MasterMedicineBean>();
		try {
		  Query query = session.createQuery("FROM MasterMedicineBean");
		  masterMedicineBeans =  query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return masterMedicineBeans;
	}
	
	public  List<MasterDiagnoBean> getDiagnosList()
	{
		Session session = HibernateUtil.openSession();
		List<MasterDiagnoBean> masterDiagnoBeans = new ArrayList<MasterDiagnoBean>();
		try {
		  Query query = session.createQuery("FROM MasterDiagnoBean");
		  masterDiagnoBeans =  query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return masterDiagnoBeans;
	}
	
	public  UserProfileBean findUserProfile(int user_id)
	{
		Session session = HibernateUtil.openSession();
		UserProfileBean userProfileBean = null;
		try {
		  Query query = session.createQuery("FROM UserProfileBean where user_id = "+user_id+"");
		  query.setMaxResults(1);
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
	public  UserBean findUser(int user_id)
	{
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		UserBean userBean = null;
		try {
			tx = session.getTransaction();
			tx.begin();
		  Query query = session.createQuery("FROM UserBean where user_id = "+user_id+"");
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
		 UserBean userBean = null;
		try {
		  Query query = session.createQuery("FROM UserBean where (lower(name) = lower('"+user+"') or lower(email) = lower('"+email+"')) and password = '"+pswd+"'");
		  //query.setMaxResults(1);
		  userBean = (UserBean) query.uniqueResult();
		}
		catch (Exception e) {
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
		 HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		 Connection con = session.connection().getMetaData().getConnection();
		try {
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
		}
		finally {
			session.close();
		}
		return hashMap;
}
	
	public  List<Object[]> findRevenueChart(String from , String to,String format)
	{
		Session session = HibernateUtil.openSession();
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			 query = "select "+format+"(crt_date) AS month,sum(total_price_per_operation) amount FROM " +
					"occura.patient_operation_history_tbl WHERE crt_date >= '"+from+"' AND crt_date < '"+to+"' " +
					"GROUP BY FORMAT(crt_date, 'yyyy_MM') ORDER BY crt_date";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
		}
		catch (Exception e) {
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
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			 query = "select unix_timestamp(crt_date) , count(1) FROM occura.patient_tbl group by month(crt_date)";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
		}
		catch (Exception e) {
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
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			 query = "SELECT DATE_FORMAT(appoint.appointment_date_time,'%d/%m/%Y %h:%i:%s %p') as crt_date,full_name FROM occura.patient_appointment_tbl as appoint " +
				 		"left outer join occura.patient_tbl as patient on patient.patient_id = appoint.patient_id "+
				 		" where DATE(appoint.appointment_date_time)=curdate() ";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
		}
		catch (Exception e) {
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
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			 query = "select "+format+"(crt_date) AS month,sum(medicine_Qty * total_price_per_medicine) amount FROM " +
					" occura.patient_medicine_history_tbl WHERE crt_date >= '"+from+"' AND crt_date < '"+to+"' " +
					" GROUP BY FORMAT(crt_date, 'yyyy_MM') ORDER BY crt_date";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
		}
		catch (Exception e) {
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
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			 query = "select "+format+"(crt_date) AS month ,count(1) amount FROM occura.patient_operation_history_tbl " + 
					" WHERE crt_date >= '"+from+"' AND crt_date < '"+to+"' GROUP BY FORMAT(crt_date, 'yyyy_MM') " + 
					" ORDER BY crt_date";
		  SQLQuery sqlQuery = session.createSQLQuery(query);
		  dataList = sqlQuery.list();
		}
		catch (Exception e) {
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
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			 query = "select "+format+"(crt_date) AS month , count(1) amount FROM occura.patient_tbl WHERE " + 
					" crt_date >= '"+from+"' AND crt_date < '"+to+"' GROUP BY FORMAT(crt_date, 'yyyy_MM') " + 
					" ORDER BY crt_date";
		  SQLQuery sqlQuery = session.createSQLQuery(query);
		  dataList = sqlQuery.list();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return dataList ;
	}

	public static List<Object[]> getlistfromPatient()
	{
		Session session = HibernateUtil.openSession();
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			query = "select a.first_name,a.last_name,a.full_name," + 
					" DATE_FORMAT(b.appointment_date_time,'%d-%m-%Y %h:%i:%s %p') as appointment_date " + 
					" from occura.patient_tbl a join occura.patient_appointment_tbl b on a.patient_id=b.patient_id " + 
					" where DATE(b.appointment_date_time)=curdate() and " + 
					" b.appointment_date_time BETWEEN now() and date_add(now(), interval 15 MINUTE) order by b.appointment_date_time";
				 SQLQuery sqlQuery = session.createSQLQuery(query);
				 dataList = sqlQuery.list();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return dataList;
	}


	public static PatientBean findEmailByPatient(String email)
	{
		Session session = HibernateUtil.openSession();
		PatientBean patient = null;
		try {
				Query query = session.createQuery("FROM PatientBean where lower(email_address) = lower('"+email+"') ");
				query.setMaxResults(1);
				patient = (PatientBean) query.uniqueResult();
		}
		catch (Exception e) {
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
				query.setMaxResults(1);
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
	
	public  List<PatientBean> findQueryOldCase(String oldcasequery)
	{
		Session session = HibernateUtil.openSession();
		List<PatientBean> patientList = new ArrayList<PatientBean>();
		try {
		  Query query = session.createQuery("FROM PatientBean where lower(full_name) like lower('%"+oldcasequery+"%') or "
		  		+ " mobile_no like '%"+oldcasequery+"%'   ");
		  patientList =  query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return patientList;
	}
	
	public static String getPriceMedicine(String med_id,String quantity)
	{
		Session session = HibernateUtil.openSession();
		MasterMedicineBean medicineBo = new MasterMedicineBean();
		Double medicine_price,output = null;
		int count_per_tab;
		try {
				Query query = session.createQuery("FROM MasterMedicineBean where master_medicine_id = "+med_id+" ");
				query.setMaxResults(1);
				medicineBo = (MasterMedicineBean) query.uniqueResult();
				
				if(medicineBo != null)
				{
					medicine_price = medicineBo.getMedicine_price();
					count_per_tab = medicineBo.getCount_per_tab();
					output = (double) Integer.parseInt(quantity) * (medicine_price/count_per_tab);
				}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return output.toString();
	}
	
	
	public  List<Object[]> getCalendardata()
	{
		Session session = HibernateUtil.openSession();
		List<Object[]> dataList = new ArrayList<Object[]>();
		String query = "";
		try {
			 query = "SELECT a.appointment_id,a.patient_id,a.appointment_date_time,b.full_name,a.description, " + 
			 		"DATE_FORMAT(a.appointment_date_time, '%m/%d/%Y %T') as appointment_date_str " + 
			 		" FROM occura.patient_appointment_tbl a left join patient_tbl b on a.patient_id=b.patient_id " + 
			 		" order by a.appointment_date_time";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 dataList = sqlQuery.list();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return dataList ;
	}
	
	public static PatientBean getPatientlistfromHistory(String patient_id)
	{
		Session session = HibernateUtil.openSession();
		PatientBean patientBo = new PatientBean();
		
		try {
			    Query query = session.createQuery("FROM PatientBean where patient_id = "+patient_id+" ");
				query.setMaxResults(1);
				patientBo = (PatientBean) query.uniqueResult();
				
				if(patientBo != null)
				{
					String documentName = patientBo.getPhoto();
					String propertiesName = "TestUploadFile";
					
					String fileName=null;
					if(!CommonUtility.checkString(documentName)) {
						fileName=CommonUtility.getFilePathFromcommonConfigVariable(propertiesName)+documentName;
						
						if(fileName != null && !("").equals(fileName) && new File(fileName).exists()) {
							byte[] bArray=CommonUtility.readFileToByteArray(new File(fileName));
							patientBo.setFilebyte(DatatypeConverter.printBase64Binary(bArray));
						}
					}else
					{// No Image
						fileName=CommonUtility.getFilePathFromcommonConfigVariable(propertiesName)+"no_image.jpg";
						if(fileName != null && !("").equals(fileName) && new File(fileName).exists()) {
							byte[] bArray=CommonUtility.readFileToByteArray(new File(fileName));
							patientBo.setFilebyte(DatatypeConverter.printBase64Binary(bArray));
						}
					}
					
				}
			 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return patientBo ;
	}
	
	
	public  List<Object[]> getPatientHistory(String patient_id)
	{
		Session session = HibernateUtil.openSession();
		List<Object[]> patienthistorylist = new ArrayList<Object[]>();
		String query = "";
		try {
			 query = "SELECT a.appointment_id,a.patient_id,a.appointment_date_time,b.full_name,a.description, " + 
			 		" DATE_FORMAT(a.appointment_date_time, '%m/%d/%Y %T') as appointment_date_str " + 
			 		" FROM occura.patient_appointment_tbl a left join patient_tbl b on a.patient_id=b.patient_id " + 
			 		" where a.patient_id = "+patient_id+" order by a.appointment_date_time";
			 SQLQuery sqlQuery = session.createSQLQuery(query);
			 patienthistorylist = sqlQuery.list();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return patienthistorylist ;
	}
	
	public static String getAppointmentlistfromHistory(String patient_id,String appointment_id)
	{
		Session session = HibernateUtil.openSession();
		String appointementdate_str = null;
		try {
			    Query query = session.createQuery(" SELECT DATE_FORMAT(appointment_date_time, '%m/%d/%Y %T') as appointment_date_str " + 
			    		" FROM occura.patient_appointment_tbl " + 
			    		" where patient_id = "+patient_id+" and appointment_id = "+appointment_id+" ");
			    query.setMaxResults(1);
			    appointementdate_str = (String) query.uniqueResult();
		    }
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return appointementdate_str ;
	}
	
	public Map<String, Object> getSessionlist(String appointment_id,String patient_id)  throws Exception {
				
				Map<String,Object> mapList = new HashMap<String, Object>();
				Session session = HibernateUtil.openSession();
				
				List<PatientDiagnoHistory> list_diagno = null;
				List<PatientCCHistory> list_cc = null;
				List<PatientMedicineHistory> list_medicine = null;
				String patient_name = null;
				String appointment_date_str = null;
				Query query = null;
				try {
						
						query = session.createSQLQuery("SELECT appointment_id,patient_id, " + 
								"  (case when crt_date is not null then DATE_FORMAT(crt_date, '%m/%d/%Y %T') else '-' end) as crt_date_str," + 
								"  (select GROUP_CONCAT(diagno_description SEPARATOR ', ') from master_diagno_tbl as diagno " + 
								"  where FIND_IN_SET (diagno.master_diagno_id,ord_diagno.master_diagno_id)) as diagno_name " + 
								"  FROM `patient_diagno_history_tbl` as ord_diagno "+
								"  where appointment_id="+appointment_id+" and patient_id="+patient_id+" ")
										.addScalar("appointment_id")
										.addScalar("patient_id")
										.addScalar("crt_date_str")
										.addScalar("diagno_name")
										.setResultTransformer(Transformers.aliasToBean(PatientDiagnoHistory.class));		
						list_diagno = query.list();
						
						
						
						query = session.createSQLQuery(" select appointment_id,patient_id,cc_description as cc_name," + 
								" (case when a.crt_date is not null then DATE_FORMAT(a.crt_date, '%m/%d/%Y %T') else '-' end) as crt_date_str," + 
								" (case when a.duration is not null then a.duration else '-' end) as duration, " + 
								" (case when a.eye is not null then a.eye else '-' end) as eye " + 
								" from patient_cc_history_tbl a " + 
								"left join master_cc_tbl b on a.master_cc_id=b.master_cc_id" + 
								"  where appointment_id="+appointment_id+" and patient_id="+patient_id+" ")
										.addScalar("appointment_id")
										.addScalar("patient_id")
										.addScalar("cc_name")
										.addScalar("crt_date_str")
										.addScalar("duration")
										.addScalar("eye")
										.setResultTransformer(Transformers.aliasToBean(PatientCCHistory.class));		
						list_cc = query.list();
						
						
						query = session.createSQLQuery(" select appointment_id,patient_id,medicine_description as medicine_name," + 
								"	(case when a.crt_date is not null then DATE_FORMAT(a.crt_date, '%m/%d/%Y %T') else '-' end) as crt_date_str," + 
								"	(case when a.duration is not null then a.duration else '-' end) as duration, " + 
								"	(case when a.eye is not null then a.eye else '-' end) as eye, " + 
								"	(case when a.description is not null then a.description else '-' end) as description, " + 
								"	medicine_Qty,total_price_per_medicine " + 
								"	from patient_medicine_history_tbl a " + 
								"	left join master_medicine_tbl b on a.master_medicine_id=b.master_medicine_id " + 
								"  where appointment_id="+appointment_id+" and patient_id="+patient_id+" ")
										.addScalar("appointment_id")
										.addScalar("patient_id")
										.addScalar("medicine_name")
										.addScalar("crt_date_str")
										.addScalar("duration")
										.addScalar("eye")
										.addScalar("description")
										.addScalar("medicine_Qty")
										.addScalar("total_price_per_medicine")
										.setResultTransformer(Transformers.aliasToBean(PatientMedicineHistory.class));		
						list_medicine = query.list();
						
						
						 query = session.createQuery(" SELECT DATE_FORMAT(appointment_date_time, '%m/%d/%Y %T') as appointment_date_str " + 
					    		" FROM occura.patient_appointment_tbl " + 
					    		" where patient_id = "+patient_id+" and appointment_id = "+appointment_id+" ");
					    query.setMaxResults(1);
					    appointment_date_str = (String) query.uniqueResult();
						
					    query = session.createQuery(" SELECT full_name FROM occura.patient_tbl where patient_id="+patient_id+" ");
					    query.setMaxResults(1);
					    patient_name = (String) query.uniqueResult();
						
						
						mapList.put("list_diagno", list_diagno);
						mapList.put("list_cc", list_cc);
						mapList.put("list_medicine", list_medicine);
						mapList.put("appointment_date_str", appointment_date_str);
						mapList.put("patient_name", patient_name);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (session != null) {
						session.close();
						}
				}
				return mapList;
			}
			
}

//}
