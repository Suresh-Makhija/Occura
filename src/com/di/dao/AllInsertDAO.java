package com.di.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.di.bean.BundleLogBean;
import com.di.bean.ChallanBean;
import com.di.bean.ChallanLineBean;
import com.di.bean.ChallanOutBean;
import com.di.bean.ChallanOutLineBean;
import com.di.bean.CurrencyBean;
import com.di.bean.CustomerBean;
import com.di.bean.CustomerProductBean;
import com.di.bean.CustomerProductRateBean;
import com.di.bean.HandoverBean;
import com.di.bean.HandoverStoneBean;
import com.di.bean.InvoiceBean;
import com.di.bean.InvoiceLineBean;
import com.di.bean.PaymentBean;
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

public class AllInsertDAO {

	AllCountDAO allCountDAO = new AllCountDAO();
	AllListDAO allListDAO = new AllListDAO();
	
	SimpleDateFormat ddmmyyyyhhmmss = new SimpleDateFormat("ddMMyyHHmmssSSS");
	//SimpleDateFormat ddmmyyhhmmss = new SimpleDateFormat("ddMMyyHHmmss");
	
	public boolean productInsert(ProductMasterBean productMasterBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
				long maxNumber = allCountDAO.getlastNumberOfProduct();
				maxNumber = maxNumber + 1;
				
				int pid = Integer.parseInt(110+""+maxNumber); // 110 for Product Table
				productMasterBean.setProduct_master_id(pid);
			 
			 session.save(productMasterBean);
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
	
	
	
	public boolean customerInsert(CustomerBean customerBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
				
				long maxNumber= allCountDAO.getlastNumberOfMainCustomer(0);
				
				 maxNumber = maxNumber + 1;
				
				int cid = Integer.parseInt(130+""+maxNumber); // 130 for Customer Table
				
				customerBean.setCustomer_id(cid);
				
			 
			 session.saveOrUpdate(customerBean);
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
	
	
	public boolean subCustomerInsert(CustomerBean customerBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 	int parent_customer_id = customerBean.getParent_customer_id();
			 	CustomerBean c = allListDAO.customerDetails(parent_customer_id);
			 
				long maxNumber= allCountDAO.getlastNumberOfMainCustomer(parent_customer_id);
				
				int custNum = c.getCustomer_num();
				
				maxNumber = maxNumber + 1;
				
				int cid = Integer.parseInt(130+""+custNum+""+maxNumber); // 130 for Customer Table
				
				customerBean.setCustomer_id(cid);
			 
			 session.saveOrUpdate(customerBean);
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
	
	
	
	
	
	public boolean workInsert(WorkHistoryBean workHistoryBean,int custId){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 int cust_id = custId;
			 
			 CustomerBean suCustomer = allListDAO.customerDetails(cust_id);
			 
			 int subCustNum = suCustomer.getCustomer_num();
			 
			 CustomerBean  mainCUstomer = allListDAO.customerDetails(suCustomer.getParent_customer_id());
			 
			 int mainCustNum = mainCUstomer.getCustomer_num();
			 int mainCustId = mainCUstomer.getCustomer_id();
			 long maxNumber= allCountDAO.getlastNumberOfWorkHistory(mainCustId);
			 maxNumber = maxNumber + 1;
				
			 //String wid = 150+""+mainCustNum+""+subCustNum+""+maxNumber; // 150 for Work History Table
			 
			 String wid = 150+""+mainCustNum+""+subCustNum+""+ddmmyyyyhhmmss.format(new Date()); // 150 for Work History Table
			 
			 workHistoryBean.setWork_history_id(wid);
			 
			 session.saveOrUpdate(workHistoryBean);
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
	
	
	
	public boolean productProcessInsert(ProductProcessBean productProcessBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
				
				long maxNumber= allCountDAO.getlastNumberOfProductProcess();
				maxNumber = maxNumber + 1;
				
				int ppid = Integer.parseInt(120+""+maxNumber); // 120 for Product process Table
				
				
				productProcessBean.setProduct_process_id(ppid);
				 
			 
			 session.save(productProcessBean);
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
	
	
	
	public boolean customerProductInsert(CustomerProductBean customerProductBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 	int parent_customer_id = customerProductBean.getCustomerBean().getCustomer_id();
			 	CustomerBean c = allListDAO.customerDetails(parent_customer_id);
			 
				long maxNumber= allCountDAO.getlastNumberOfCustomerProduct(parent_customer_id);
				
				int custNum = c.getCustomer_num();
				
				maxNumber = maxNumber + 1;
				
				int cpid = Integer.parseInt(140+""+custNum+""+maxNumber); // 140 for Customer Product Table
			 
				customerProductBean.setCustomer_product_id(cpid);
			 
			 session.saveOrUpdate(customerProductBean);
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
	
	
	public boolean workProductInsert(WorkProductBean workProductBean,int custId){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 int cust_id = custId;
			 
			/* CustomerBean suCustomer = allListDAO.customerDetails(cust_id);
			 int subCustNum = suCustomer.getCustomer_num();*/
			 
			/* CustomerBean  mainCUstomer = allListDAO.customerDetails(suCustomer.getParent_customer_id());
			 
			 int mainCustNum = mainCUstomer.getCustomer_num();
			 int mainCustId = mainCUstomer.getCustomer_id();
			 */
			 
			 /*long maxNumber= allCountDAO.getlastNumberOfWorkProductHistory(mainCustId);
			 maxNumber = maxNumber + 1;*/
				
			 String wpid = 160+""+cust_id+""+ddmmyyyyhhmmss.format(new Date()); // 160 for Workproduct History Table
			 
			 workProductBean.setWork_product_id(wpid);
			 
			 session.save(workProductBean);
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
	
	
	
	
	
	
	public boolean workProductProcessInsert(WorkProductProcessBean workProductProcessBean,int custId){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = custId;
			 
			/* CustomerBean suCustomer = allListDAO.customerDetails(cust_id);
			 
			 int subCustNum = suCustomer.getCustomer_num();
			 
			 CustomerBean  mainCUstomer = allListDAO.customerDetails(suCustomer.getParent_customer_id());
			 
			 int mainCustNum = mainCUstomer.getCustomer_num();
			 int mainCustId = mainCUstomer.getCustomer_id();
			 long maxNumber= allCountDAO.getlastNumberOfWorkProductProcessHistory(mainCustId);
			 maxNumber = maxNumber + 1;*/
				
			 String wpid = 170+""+cust_id+""+ddmmyyyyhhmmss.format(new Date()); // 170 for Work product process Table
			 
			 workProductProcessBean.setWork_product_process_id(wpid);
			 
			 session.save(workProductProcessBean);
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
	
	
	
	public boolean userInsert(UserBean userBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
				
				long maxNumber= allCountDAO.getlastNumberOfUser();
				
				maxNumber = maxNumber + 1;
				
				AllListDAO allListDAO = new AllListDAO();
				CustomerBean customerBean = allListDAO.customerDetails(userBean.getCustomer_id());
				
				int uid = Integer.parseInt("100"+customerBean.getCustomer_num()+maxNumber); // 100 for user table
				userBean.setUser_id(uid);
			 
			 session.save(userBean);
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
	
	
	
	public boolean rateCriteriaInsert(RateCriteriaBean rateCriteriaBean,int userCustId){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 String mainCustNum = "0";
			 if(customerBean != null) {
				 mainCustNum = String.valueOf(customerBean.getCustomer_num());
				 
				 if(customerBean.getParent_customer_id() != 0) {
					 
					 int pId = customerBean.getParent_customer_id();
					 CustomerBean customerBean1 = allListDAO.customerDetails(pId);
					 
					 mainCustNum = customerBean1.getCustomer_num()+""+customerBean.getCustomer_num();
					 
				 }

			 }
			 
			 
			 long maxNumber= allCountDAO.getlastNumberOfRateCriteria(cust_id);
			 maxNumber = maxNumber + 1;
				
			 int rtid = Integer.parseInt(180+""+mainCustNum+""+maxNumber); // 180 for Rate Criteria Table
			 rateCriteriaBean.setRate_criteria_id(rtid);
			 
			 session.save(rateCriteriaBean);
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
	
	public boolean invoiceInsert(InvoiceBean invoiceBean,int userCustId){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 int mainCustNum = 0;
			 if(customerBean != null) {
				 mainCustNum = customerBean.getCustomer_num();
			 }
			 
			 
			/* long maxNumber= allCountDAO.getlastNumberOfInvoiceByCustomer(cust_id);
			 maxNumber = maxNumber + 1;*/
				
			 String iId = 190+""+mainCustNum+""+ddmmyyyyhhmmss.format(new Date()); // 190 for Invoice Table
			 invoiceBean.setInvoice_id(iId);
			 
			 session.save(invoiceBean);
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
	
	
	
	public boolean invoiceLineInsert(InvoiceLineBean invoiceLineBean,int userCustId){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 /*int cust_id = userCustId;
			 
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 int mainCustNum = 0;
			 if(customerBean != null) {
				 mainCustNum = customerBean.getCustomer_num();
			 }
			 
			 
			 long maxNumber= allCountDAO.getlastNumberOfInvoiceLineByCustomer(cust_id);
			 maxNumber = maxNumber + 1;*/
				
			 String ilId = 200+""+ddmmyyyyhhmmss.format(new Date()); // 200 for Invoice Line Table
			 invoiceLineBean.setInvoice_line_id(ilId);
			 
			 session.save(invoiceLineBean);
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
	
	
	
	public boolean sltlInvoiceInsert(SltlinvoiceBean sltlinvoiceBean,int userCustId){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 
			/* CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 int mainCustNum = 0;
			 if(customerBean != null) {
				 mainCustNum = customerBean.getCustomer_num();
			 }
			 
			 
			 long maxNumber= allCountDAO.getlastNumberOfSltlInvoiceByCustomer(cust_id);
			 maxNumber = maxNumber + 1;*/
				
			 String siId = 210+""+ddmmyyyyhhmmss.format(new Date()); // 210 for Invoice Table
			 sltlinvoiceBean.setSltl_invoice_id(siId);
			 
			 session.save(sltlinvoiceBean);
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
	
	
	public boolean sltlinvoiceLineInsert(SltlInvoiceLineBean sltlInvoiceLineBean,int userCustId){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 int mainCustNum = 0;
			 if(customerBean != null) {
				 mainCustNum = customerBean.getCustomer_num();
			 }
			 
			 
			 long maxNumber= allCountDAO.getlastNumberOfSltlInvoiceLineByCustomer(cust_id);
			 maxNumber = maxNumber + 1;
				
			 int silId = Integer.parseInt(220+""+mainCustNum+""+maxNumber); // 220 for sltl Invoice Line Table
			 sltlInvoiceLineBean.setSltl_invoice_line_id(silId);
			 
			 session.save(sltlInvoiceLineBean);
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
	
	public boolean customerProductRateInsert(CustomerProductRateBean customerProductRateBean,int userCustId){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 System.out.println(cust_id);
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 String mainCustNum = "0";
			 if(customerBean != null) {
				 mainCustNum = String.valueOf(customerBean.getCustomer_num());
				 
				 if(customerBean.getParent_customer_id() != 0) {
					 
					 int pId = customerBean.getParent_customer_id();
					 CustomerBean customerBean1 = allListDAO.customerDetails(pId);
					 mainCustNum = customerBean1.getCustomer_num()+""+customerBean.getCustomer_num();
					 
					 
				 }

			 }
			 
			 long maxNumber= allCountDAO.getlastNumberOfCustomerProductRateByCustomer(cust_id);
			 maxNumber = maxNumber + 1;
				
			 int cprid = Integer.parseInt(230+""+mainCustNum+""+maxNumber); // 230 for Customer Product rate table
			 customerProductRateBean.setCustomer_product_rate_id(cprid);
			 
			 session.save(customerProductRateBean);
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
	
	
	
	
	public boolean currencyInsert(CurrencyBean currencyBean,int userCustId){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 String mainCustNum = "0";
			 if(customerBean != null) {
				 mainCustNum = String.valueOf(customerBean.getCustomer_num());
				 
				 if(customerBean.getParent_customer_id() != 0) {
					 
					 int pId = customerBean.getParent_customer_id();
					 CustomerBean customerBean1 = allListDAO.customerDetails(pId);
					 mainCustNum = customerBean1.getCustomer_num()+""+customerBean.getCustomer_num();
				 }

			 }
			 
			 long maxNumber= allCountDAO.getlastNumberOfCurrencyByCustomer(cust_id);
			 maxNumber = maxNumber + 1;
				
			 int currid = Integer.parseInt(240+""+mainCustNum+""+maxNumber); // 240 for Currency
			 
			 currencyBean.setCurrency_id(currid);
			 
			 session.save(currencyBean);
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
	
	
	
	public boolean challanInsert(ChallanBean challanBean,int userCustId){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 String mainCustNum = "0";
			 if(customerBean != null) {
				 mainCustNum = String.valueOf(customerBean.getCustomer_num());
				 
				 if(customerBean.getParent_customer_id() != 0) {
					 int pId = customerBean.getParent_customer_id();
					 CustomerBean customerBean1 = allListDAO.customerDetails(pId);
					 mainCustNum = customerBean1.getCustomer_num()+""+customerBean.getCustomer_num();
				 }

			 }
			 
			 long maxNumber= allCountDAO.getlastNumberOfChallanByCustomer(cust_id);
			 maxNumber = maxNumber + 1;
				
			// String challanid = 250+""+mainCustNum+""+maxNumber; // 250 for challan
			 
			 String challanid = 250+""+mainCustNum+""+ddmmyyyyhhmmss.format(new Date());; // 250 for challan
			 
			 
			 
			 challanBean.setChallan_id(challanid);
			 session.save(challanBean);
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
	
	
	
	public boolean challanLineInsert(ChallanLineBean challanLineBean,int userCustId){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 String mainCustNum = "0";
			 if(customerBean != null) {
				 mainCustNum = String.valueOf(customerBean.getCustomer_num());
				 
				 if(customerBean.getParent_customer_id() != 0) {
					 int pId = customerBean.getParent_customer_id();
					 CustomerBean customerBean1 = allListDAO.customerDetails(pId);
					 mainCustNum = customerBean1.getCustomer_num()+""+customerBean.getCustomer_num();
				 }

			 }
			 
			 long maxNumber= allCountDAO.getlastNumberOfChallanLineByCustomer(cust_id);
			 maxNumber = maxNumber + 1;
				
			 //String challanLineid = 260+""+mainCustNum+""+maxNumber; // 260 for challan line
			 
			 String challanLineid = 260+""+mainCustNum+""+ddmmyyyyhhmmss.format(new Date()); // 260 for challan line
			 
			 
			 challanLineBean.setChallan_line_id(challanLineid);
			 session.save(challanLineBean);
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
	
	
	public boolean challanOutInsert(ChallanOutBean challanOutBean,int userCustId){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 String mainCustNum = "0";
			 if(customerBean != null) {
				 mainCustNum = String.valueOf(customerBean.getCustomer_num());
				 
				 if(customerBean.getParent_customer_id() != 0) {
					 int pId = customerBean.getParent_customer_id();
					 CustomerBean customerBean1 = allListDAO.customerDetails(pId);
					 mainCustNum = customerBean1.getCustomer_num()+""+customerBean.getCustomer_num();
				 }

			 }
			 
			 long maxNumber= allCountDAO.getlastNumberOfOutChallanByCustomer(cust_id);
			 maxNumber = maxNumber + 1;
				
			 //String challan_out_id = 270+""+mainCustNum+""+maxNumber; // 270 for challan out
			 
			 String challan_out_id = 270+""+mainCustNum+""+ddmmyyyyhhmmss.format(new Date()); // 270 for challan out
			
			 
			 System.out.println(challan_out_id);
			 challanOutBean.setChallan_out_id(challan_out_id);
			 session.save(challanOutBean);
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
	
	
	public boolean challanOutLineInsert(ChallanOutLineBean challanOutLineBean,int userCustId){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 
			 int cust_id = userCustId;
			 CustomerBean customerBean = allListDAO.customerDetails(cust_id);
			 String mainCustNum = "0";
			 if(customerBean != null) {
				 mainCustNum = String.valueOf(customerBean.getCustomer_num());
				 
				 if(customerBean.getParent_customer_id() != 0) {
					 int pId = customerBean.getParent_customer_id();
					 CustomerBean customerBean1 = allListDAO.customerDetails(pId);
					 mainCustNum = customerBean1.getCustomer_num()+""+customerBean.getCustomer_num();
				 }

			 }
			 
			 long maxNumber= allCountDAO.getlastNumberOfChallanOutLineByCustomer(cust_id);
			 maxNumber = maxNumber + 1;
				
			 //String challanoutLineid = 280+""+mainCustNum+""+maxNumber; // 280 for challan out line
			 
			 String challanoutLineid = 280+""+mainCustNum+""+ddmmyyyyhhmmss.format(new Date()); // 280 for challan out line
			 
			 
			 challanOutLineBean.setChallan_out_line_id(challanoutLineid);
			 session.save(challanOutLineBean);
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
	
	
	public boolean bundleLogInsert(BundleLogBean bundleLogBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(bundleLogBean);
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
	
	
	public boolean handoverInsert(HandoverBean handoverBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(handoverBean);
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
	
	
	public boolean handoverStoneInsert(HandoverStoneBean handoverStoneBean){
		 Session session = HibernateUtil.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 session.save(handoverStoneBean);
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
	
	
	public boolean paymentInsert(PaymentBean paymentBean){
		 Session session = HibernateUtilLive.openSession();
		 Transaction tx = null;	
		 boolean result = false;
		 try {
			 tx = session.getTransaction();
			 tx.begin();
			 
			 String paymentId = 290+""+ddmmyyyyhhmmss.format(new Date()); // 290 for Payment
			 paymentBean.setPayment_id(paymentId);
			 
			 System.out.println("=============="+paymentBean.getPayment_id());
			 
			 session.save(paymentBean);
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
	
	
}
