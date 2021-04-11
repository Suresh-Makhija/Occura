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

public class AllLocalUpdateDAO {

	public boolean userUpdate(UserBean userBean){
		 Session session = HibernateUtil.openSession();
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
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean customerProductUpdate(CustomerProductBean customerProductBean){
		 Session session = HibernateUtil.openSession();
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
			// //e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean statusUpdate(StatusBean statusBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(statusBean);
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
	
	
	public boolean productUpdate(ProductMasterBean productMasterBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(productMasterBean);
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
	
	
	public boolean productProcessUpdate(ProductProcessBean productProcessBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(productProcessBean);
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
	
	
	public boolean customerUpdate(CustomerBean customerBean){
		 Session session = HibernateUtil.openSession();
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
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean workProductProcessUpdate(WorkProductProcessBean workProductProcessBean){
		 Session session = HibernateUtil.openSession();
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
			 ////e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	
	public boolean workHistoryUpdate(WorkHistoryBean workHistoryBean){
		 Session session = HibernateUtil.openSession();
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
		 Session session = HibernateUtil.openSession();
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
	
	
	public boolean customerTypeUpdate(CustomerTypeBean customerTypeBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(customerTypeBean);
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
	
	
	public boolean updateChallan(ChallanBean challanBean){
		 Session session = HibernateUtil.openSession();
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
		 Session session = HibernateUtil.openSession();
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
		 Session session = HibernateUtil.openSession();
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
		 Session session = HibernateUtil.openSession();
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
