package com.di.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.di.bean.ChallanLineBean;
import com.di.bean.HandoverBean;
import com.di.bean.HandoverStoneBean;
import com.di.bean.PaymentBean;
import com.di.bean.RateCriteriaBean;
import com.di.bean.WorkProductBean;
import com.di.bean.WorkProductProcessBean;
import com.di.util.HibernateUtil;
import com.di.util.HibernateUtilLive;
import com.diSync.util.HibernateUtilLiveDatabase;

public class AllDeleteDAO {

	public boolean deleteWorkProduct(int wId)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete WorkProductBean where workHistoryBean.work_history_id = :wid");
			 query.setInteger("wid",wId);
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
	
	
	
	public boolean deleteWorkProductProcess(int wId)
	{
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete WorkProductProcessBean where workHistoryBean.work_history_id = :wid");
			 query.setInteger("wid",wId);
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
	
	
	
	public boolean deleteHandover(String hsid)
	{
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete HandoverStoneBean where handover_stone_id = :hsi");
			 query.setParameter("hsi",hsid);
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
	
	
	public boolean deleteChallanLine(String challanId)
	{
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete ChallanLineBean where challan_line_id = :cli");
			 query.setParameter("cli",challanId);
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
	
	public boolean deleteayment(String pid)
	{
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete PaymentBean where payment_id = :pid");
			 query.setParameter("pid",pid);
			 int result = query.executeUpdate();
			 System.out.println(result);
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
	
	public boolean deleteInvoice(String iId)
	{
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete InvoiceBean where invoice_id = :iId");
			 query.setParameter("iId",iId);
			 int result = query.executeUpdate();
			 System.out.println(result);
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
	public boolean deleteInvoiceLine(String iId)
	{
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("delete InvoiceLineBean where invoice_id = :iId");
			 query.setParameter("iId",iId);
			 int result = query.executeUpdate();
			 System.out.println(result);
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
	
	
	
}
