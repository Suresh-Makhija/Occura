package com.di.dao;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.security.core.userdetails.User;

import com.di.bean.CurrencyBean;
import com.di.bean.CustomerBean;
import com.di.bean.CustomerProductBean;
import com.di.bean.CustomerProductRateBean;
import com.di.bean.CustomerTypeBean;
import com.di.bean.HandoverBean;
import com.di.bean.HandoverStoneBean;
import com.di.bean.InvoiceBean;
import com.di.bean.InvoiceLineBean;
import com.di.bean.ProductMasterBean;
import com.di.bean.ProductProcessBean;
import com.di.bean.RateCriteriaBean;
import com.di.bean.SltlInvoiceLineBean;
import com.di.bean.SltlinvoiceBean;
import com.di.bean.UserBean;
import com.di.bean.WorkHistoryBean;
import com.di.bean.WorkProductBean;
import com.di.bean.WorkProductProcessBean;
import com.di.util.HibernateUtil;
import com.di.util.HibernateUtilLive;
import com.diSync.util.HibernateUtilLiveDatabase;

public class AllUpdateDAO{

	public boolean deactivateProduct(int pId,int active)
	{
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE ProductMasterBean SET active = :a where product_master_id = :pmi");
			 query.setParameter("a" ,active);
			 query.setParameter("pmi",pId);
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
	
	
	public boolean deactivateCustomer(int cId,int active)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE CustomerBean SET active = :a, deactive_date = :dd where customer_id = :ci");
			 query.setParameter("a" ,active);
			 query.setParameter("dd", new Date());
			 query.setParameter("ci",cId);
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
	
	
	public boolean deactivateWorkHistory(String wId,int active)
	{
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE WorkHistoryBean SET active = :a, deactive_date = :dd where work_history_id = :whi");
			 query.setParameter("a" ,active);
			 query.setParameter("dd", new Date());
			 query.setParameter("whi",wId);
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
	
	
	public boolean deactivateProcess(int ppId,int active)
	{
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE ProductProcessBean SET active = :a where product_process_id = :ppi");
			 query.setParameter("a" ,active);
			 query.setParameter("ppi",ppId);
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
	
	
	public boolean deactivateCustomerProduct(int cpid,int active)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE CustomerProductBean SET active = :a where customer_product_id = :cpid");
			 query.setParameter("a" ,active);
			 query.setParameter("cpid",cpid);
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
	
	public boolean changePassword(int user_id,String pass)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE UserBean SET password = :p where user_id = :ui");
			 query.setParameter("p" ,pass);
			 query.setParameter("ui",user_id);
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
	
	
	public boolean deactivateActivateUser(int userId,int active)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE UserBean SET active = :a where user_id = :ui");
			 query.setParameter("a" ,active);
			 query.setParameter("ui",userId);
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
	
	
	public boolean deactivateWorkProduct(String wId,int active)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE WorkProductBean SET active = :a where work_history_id = :wId");
			 query.setParameter("a" ,active);
			 query.setParameter("wId",wId);
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
	
	
	public boolean deactivateWorkProductProcess(String wId,int active)
	{
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE WorkProductProcessBean SET active = :a where work_history_id = :wId");
			 query.setParameter("a" ,active);
			 query.setParameter("wId",wId);
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
	
	public boolean productUpdate(ProductMasterBean productMasterBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(productMasterBean);
			 result = true;
			 tx.commit();
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
	
	public boolean customerUpdate(CustomerBean customerBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(customerBean);
			 result = true;
			 tx.commit();
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
	
	
	public boolean workUpdate(WorkHistoryBean workHistoryBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(workHistoryBean);
			 result = true;
			 tx.commit();
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
	
	
	public boolean productProcessUpdate(ProductProcessBean productProcessBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(productProcessBean);
			 result = true;
			 tx.commit();
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
	
	
	public boolean workProductUpdate(WorkProductBean workProductBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(workProductBean);
			 result = true;
			 tx.commit();
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
	
	
	
	public boolean workProductProcessUpdate(WorkProductProcessBean workProductProcessBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(workProductProcessBean);
			 result = true;
			 tx.commit();
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
	
	
	public boolean customerTypeMasterUpdate(CustomerTypeBean customerTypeBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(customerTypeBean);
			 result = true;
			 tx.commit();
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
	
	public boolean invoiceUpdate(InvoiceBean invoiceBean){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(invoiceBean);
			 result = true;
			 tx.commit();
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
	
	public boolean sltlInvoiceUpdate(SltlinvoiceBean sltlinvoiceBean){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(sltlinvoiceBean);
			 result = true;
			 tx.commit();
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
		
		 Session session = HibernateUtil.openSession();
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
			 query.setParameter("whi", wId);
			 
			 
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
	
	
	public boolean updateRateCriteria(int rateId,String value,String action)
	{
		AllListDAO allListDAO = new AllListDAO();
		RateCriteriaBean rateCriteriaBean = allListDAO.detailsOfLastRateByRateId(rateId);
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean flag = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = null;
			
			 if(action.equalsIgnoreCase("fromCarat")) {
				 String name = value +" - "+rateCriteriaBean.getCarat_size_to();
				 query = session.createQuery("UPDATE RateCriteriaBean SET carat_size_from = :value,name = :name where rate_criteria_id = :rateId");
				 query.setParameter("name" ,name);
			 }else if(action.equalsIgnoreCase("toCarat")) {
				 String name = rateCriteriaBean.getCarat_size_from()+" - "+value;
				 query = session.createQuery("UPDATE RateCriteriaBean SET carat_size_to = :value,name = :name where rate_criteria_id = :rateId");
				 query.setParameter("name" ,name);
			 }else if(action.equalsIgnoreCase("rate")) {
				 query = session.createQuery("UPDATE RateCriteriaBean SET rate = :value where rate_criteria_id = :rateId");
			 }else if(action.equalsIgnoreCase("margine")) {
				 query = session.createQuery("UPDATE RateCriteriaBean SET sltl_share = :value where rate_criteria_id = :rateId");
			 }else if(action.equalsIgnoreCase("minRate")) {
				 query = session.createQuery("UPDATE RateCriteriaBean SET min_rate = :value where rate_criteria_id = :rateId");
			 }else if(action.equalsIgnoreCase("rateStone")) {
				 query = session.createQuery("UPDATE RateCriteriaBean SET rate_per_stone = :value where rate_criteria_id = :rateId");
			 }else if(action.equalsIgnoreCase("minRateStone")) {
				 query = session.createQuery("UPDATE RateCriteriaBean SET min_rate_per_stone = :value where rate_criteria_id = :rateId");
			 }
			 
			 query.setParameter("value" ,Double.parseDouble(value));
			 query.setParameter("rateId" ,rateId);
			 
			 int result = query.executeUpdate();
			 tx.commit();
			 flag = true;
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			 e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return flag;
	}
	
	public boolean clientProductRateUpdate(CustomerProductRateBean customerProductRateBean){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(customerProductRateBean);
			 result = true;
			 tx.commit();
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
	
	
	public boolean deactiveProductRate(int cId,int pId)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE CustomerProductRateBean SET active = :a, deactive_datetime = :dd where active = :aa and customerBean.customer_id = :cb and productMasterBean.product_master_id = :pmb");
			
			 query.setParameter("a" ,0);
			 query.setParameter("dd" ,new Date());
			 query.setParameter("aa", 1);
			 query.setParameter("cb", cId);
			 query.setParameter("pmb", pId);
			 
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
	
	
	public boolean currencyUpdate(int currid,double value)
	{
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE CurrencyBean SET conversion = :c where currency_id = :ci");
			 query.setParameter("c" ,value);
			 query.setParameter("ci",currid);
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
	
	public boolean invoiceDisUpdate(String iid,double disPer,double disVale,double finalAmount)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE InvoiceBean SET discount_per = :dp,discount_amount = :da,final_outstanding = :fo where invoice_id = :ii");
			 query.setParameter("ii" ,iid);
			 query.setParameter("dp",disPer);
			 query.setParameter("da",disVale);
			 query.setParameter("fo",finalAmount);
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
	
	
	public boolean invoiceCurrUpdate(String iid,double grossValue,double disVale,double finalAmount,String toCurr,double converion)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE InvoiceBean SET gross_outstanding = :go,discount_amount = :da,final_outstanding = :fo,currency_type = :ct,conversion = :con  where invoice_id = :ii");
			 query.setParameter("ii" ,iid);
			 query.setParameter("go",grossValue);
			 query.setParameter("da",disVale);
			 query.setParameter("fo",finalAmount);
			 query.setParameter("ct",toCurr);
			 query.setParameter("con",converion);
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
	
	public boolean sltlinvoiceDisUpdate(String iid,double disPer,double disVale,double finalAmount)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE SltlinvoiceBean SET sltl_discount_per = :dp,sltl_discount_amount = :da,sltl_final_outstanding = :fo where invoice_id = :ii");
			 query.setParameter("ii" ,iid);
			 query.setParameter("dp",disPer);
			 query.setParameter("da",disVale);
			 query.setParameter("fo",finalAmount);
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
	
	
	public boolean sltlinvoiceCurrUpdate(String iid,double grossValue,double disVale,double finalAmount,String toCurr,double converion)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE SltlinvoiceBean SET sltl_gross_outstanding = :sgo,sltl_discount_amount = :da,sltl_final_outstanding = :fo,currency_type = :ct,conversion = :con where invoice_id = :ii");
			 query.setParameter("ii" ,iid);
			 query.setParameter("sgo",grossValue);
			 query.setParameter("da",disVale);
			 query.setParameter("fo",finalAmount);
			 query.setParameter("ct",toCurr);
			 query.setParameter("con",converion);
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
	
	
	public boolean invoicelineCurrUpdate(String ilid,double rate)
	{
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE InvoiceLineBean SET  rate = :r  where invoice_line_id = :ili");
			 query.setParameter("ili" ,ilid);
			 query.setParameter("r",rate);
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
	
	
	public boolean sltlInvoicelineCurrUpdate(int ilid,double rate)
	{
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE SltlInvoiceLineBean  SET  amount = :r where sltl_invoice_line_id = :ili");
			 query.setParameter("ili" ,ilid);
			 query.setParameter("r",rate);
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
	
	
	public boolean rateCriteriaUpdate(RateCriteriaBean rateCriteriaBean){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(rateCriteriaBean);
			 result = true;
			 tx.commit();
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
	
	
	public boolean invoicePostingUpdate(String iid,int user_id,Date postingDate)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE InvoiceBean SET posting = :p,posting_date = :pd,posting_by = :pb where invoice_id = :ii");
			 query.setParameter("ii" ,iid);
			 query.setParameter("p",1);
			 query.setParameter("pd",postingDate);
			 query.setParameter("pb",user_id);
			 
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
	
	
	public boolean invoiceUnPostingUpdate(String iid,int user_id,Date postingDate)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE InvoiceBean SET posting = :p,posting_date = :pd,posting_by = :pb where invoice_id = :ii");
			 query.setParameter("ii" ,iid);
			 query.setParameter("p",0);
			 query.setParameter("pd",postingDate);
			 query.setParameter("pb",user_id);
			 
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
	
	
	public boolean updateRateCriteriaStatus(int custId,int custTypeId,String name)
	{
		 Session session = HibernateUtilLiveDatabase.openSession();
		 Transaction tx = null;	
		 try {
			
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("update RateCriteriaBean set status = :s where customer_id = :ci and customer_type_id = :cti and name = :n");
			 query.setParameter("s",0);
			 query.setParameter("ci",custId);
			 query.setParameter("cti",custTypeId);
			 query.setParameter("n",name);
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
	
	public boolean invoiceLineUpdate(InvoiceLineBean invoiceLineBean){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(invoiceLineBean);
			 result = true;
			 tx.commit();
		 } catch (Exception e) {
			 if (tx != null) {
				 tx.rollback();
			 }
			// e.printStackTrace();
		 } finally {
			 session.close();
		 }	
		 return result;
	}
	
	public boolean sltlInvoiceLineUpdate(SltlInvoiceLineBean sltlInvoiceLineBean){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.update(sltlInvoiceLineBean);
			 result = true;
			 tx.commit();
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
	
	
	public boolean invoicelineActiveStatus(int ilid,int active)
	{
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE InvoiceLineBean SET  active = :a  where invoice_line_id = :ili");
			 query.setParameter("ili" ,ilid);
			 query.setParameter("a",active);
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
	
	
	public boolean sltlInvoicelineActiveStatus(int ilid,int active)
	{
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE SltlInvoiceLineBean  SET  active = :a where invoiceLineBean.invoice_line_id = :ili");
			 query.setParameter("ili" ,ilid);
			 query.setParameter("a",active);
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

	
	public boolean handoverStatusUpdate(String id,String status,Date returndate)
	{
		
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE HandoverStoneBean  SET  status = :s, return_date_time = :r where handover_stone_id = :hsi");
			 query.setParameter("s" ,status);
			 query.setParameter("r",returndate);
			 query.setParameter("hsi",id);
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
	
	
	public boolean handoverStatusUpdateUsingwid(String wid,String status,Date returndate)
	{
		
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE HandoverStoneBean  SET  status = :s, return_date_time = :r where work_history_id = :wid");
			 query.setParameter("s" ,status);
			 query.setParameter("r",returndate);
			 query.setParameter("wid",wid);
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
	
	
	
	public boolean updateHandoverName(String id,String name)
	{
		
		
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE HandoverBean SET person_name = :pn    where handover_id = :hi");
			 query.setParameter("pn" ,name);
			 query.setParameter("hi",id);
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
	
	
	public boolean updateHandoverStoneRemark(String id,String remark)
	{
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE HandoverStoneBean SET remark = :r  where handover_stone_id = :hi");
			 query.setParameter("r" ,remark);
			 query.setParameter("hi",id);
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
	
	
	public boolean invoiceBillDetailUpdate(String iid,Date billDate,String billRef,int billed)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE InvoiceBean SET billed = :b,bill_date = :bd,bill_ref = :br where invoice_id = :ii");
			 query.setParameter("ii" ,iid);
			 query.setParameter("b",1);
			 query.setParameter("bd",billDate);
			 query.setParameter("br",billRef);
			 
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
	
	
	public boolean updateInvoiceRate(String iid,double rate)
	{
		
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 Query query = session.createQuery("UPDATE InvoiceLineBean SET perStoneRate = :psr where invoice_line_id = :ili");
			 query.setParameter("psr" ,rate);
			 query.setParameter("ili", iid);
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
	
	
}
