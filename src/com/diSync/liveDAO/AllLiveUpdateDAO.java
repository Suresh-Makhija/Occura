package com.diSync.liveDAO;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.di.bean.ChallanBean;
import com.di.bean.ChallanLineBean;
import com.di.bean.ChallanOutBean;
import com.di.bean.ChallanOutLineBean;
import com.di.bean.CustomerBean;
import com.di.bean.CustomerProductBean;
import com.di.bean.ProductMasterBean;
import com.di.bean.StatusBean;
import com.di.bean.UserBean;
import com.di.bean.WorkHistoryBean;
import com.di.bean.WorkProductBean;
import com.di.bean.WorkProductProcessBean;
import com.di.util.HibernateUtil;
import com.diSync.util.HibernateUtilLiveDatabase;

public class AllLiveUpdateDAO {

	public boolean userUpdate(UserBean userBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(userBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean customerProductUpdate(CustomerProductBean customerProductBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(customerProductBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	
	public boolean customerUpdate(CustomerBean customerBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(customerBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean workHistoryUpdate(WorkHistoryBean workHistoryBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(workHistoryBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean workHistoryproductUpdate(WorkProductBean workProductBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(workProductBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean workProductProcessUpdate(WorkProductProcessBean workProductProcessBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(workProductProcessBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean updateWorkStockStatus(String wId,int userId,int action)
	{
		
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE WorkHistoryBean SET in_stock = :is, in_stock_datetime = :isd, in_stock_by = :isb  where work_history_id = :whi");
			 
			 if(action == 2) {
				 query = session.createQuery("UPDATE WorkHistoryBean SET in_stock = :is, cleared_datetime = :isd, in_stock_by = :isb  where work_history_id = :whi");
			 }
			 query.setParameter("isb" ,userId);
			 query.setParameter("is" ,action);
			 query.setParameter("isd", new Date());
			 query.setParameter("whi", String.valueOf(wId));
			 
			 
			 int result = query.executeUpdate();
			 tx.commit();
			
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return true;
	}
	
	
	public boolean updateChallan(ChallanBean challanBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(challanBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	
	public boolean updateChallanOut(ChallanOutBean challanOutBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(challanOutBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean updateChallanLine(ChallanLineBean challanLineBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(challanLineBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean updateChallanOutLine(ChallanOutLineBean challanOutLineBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(challanOutLineBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	
}
