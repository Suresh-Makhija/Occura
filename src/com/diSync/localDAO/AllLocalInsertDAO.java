package com.diSync.localDAO;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.di.bean.ChallanBean;
import com.di.bean.ChallanLineBean;
import com.di.bean.ChallanOutBean;
import com.di.bean.ChallanOutLineBean;
import com.di.bean.CustomerBean;
import com.di.bean.CustomerProductBean;
import com.di.bean.CustomerTypeBean;
import com.di.bean.ProductMasterBean;
import com.di.bean.ProductProcessBean;
import com.di.bean.StatusBean;
import com.di.bean.UserBean;
import com.di.bean.WorkHistoryBean;
import com.di.bean.WorkProductBean;
import com.di.bean.WorkProductProcessBean;
import com.di.util.HibernateUtil;
import com.diSync.util.HibernateUtilLiveDatabase;

public class AllLocalInsertDAO {

	public boolean userInsert(UserBean userBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(userBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean customerProductInsert(CustomerProductBean customerProductBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(customerProductBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean statusInsert(StatusBean statusBean){
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(statusBean);
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
	
	
	public boolean productInsert(ProductMasterBean productMasterBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(productMasterBean);
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
	
	
	public boolean productProcessInsert(ProductProcessBean productProcessBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(productProcessBean);
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
	
	
	public boolean customerInsert(CustomerBean customerBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(customerBean);
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
	
	
	public boolean workHistoryInsert(WorkHistoryBean workHistoryBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(workHistoryBean);
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
	
	public boolean workHistoryProductInsert(WorkProductBean workProductBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(workProductBean);
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
	
	public boolean workProductProcessInsert(WorkProductProcessBean workProductProcessBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(workProductProcessBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean customerTypeInsert(CustomerTypeBean customerTypeBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(customerTypeBean);
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
	
	public boolean chllanInsert(ChallanBean challanBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(challanBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean chllanOutInsert(ChallanOutBean challanOutBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(challanOutBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean chllanLineInsert(ChallanLineBean challanLineBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(challanLineBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean chllanOutLineInsert(ChallanOutLineBean challanOutLineBean){
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(challanOutLineBean);
			 tx.commit();
			 result = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
}
