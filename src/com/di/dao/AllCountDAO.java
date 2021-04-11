package com.di.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.di.bean.ChallanBean;
import com.di.bean.ChallanLineBean;
import com.di.bean.ChallanOutBean;
import com.di.bean.ChallanOutLineBean;
import com.di.util.HibernateUtil;
import com.di.util.HibernateUtilLive;

public class AllCountDAO {

	
	//Count of product
	public long getlastNumberOfProduct() {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(product_master_id) from ProductMasterBean");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	//Count of product process
	public long getlastNumberOfProductProcess() {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(product_process_id) from ProductProcessBean");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	//Count of Main Customer
	public long getlastNumberOfMainCustomer(int parent_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;

        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            if(parent_id == 0) {
            	query = session.createQuery("select count(customer_id) from CustomerBean where parent_customer_id = 0");
            }else {
            	query = session.createQuery("select count(customer_id) from CustomerBean where parent_customer_id = '"+parent_id+"'");
            }
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	//Count of User
	public long getlastNumberOfUser() {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;

        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(user_id) from UserBean");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	//Count of User
	public long getlastNumberOfCustomerProduct(int cust_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;

        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(customer_product_id) from CustomerProductBean where customerBean  = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfWorkHistory(int cust_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(work_history_id) from WorkHistoryBean where customerBean.parent_customer_id  = '"+cust_id+"' ");
        	System.err.println(query);	
            maxvalue = (Long) query.uniqueResult();
            System.err.println("MAX===="+maxvalue);	
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfWorkProductHistory(int cust_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(work_product_id) from WorkProductBean where workHistoryBean.customerBean.parent_customer_id  = '"+cust_id+"' ");
            System.out.println(query);
        	maxvalue = (Long) query.uniqueResult();
            System.out.println("================="+maxvalue);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfWorkProductProcessHistory(int cust_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(work_product_process_id) from WorkProductProcessBean where workProductBean.workHistoryBean.customerBean.parent_customer_id  = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfRateCriteria(int cust_id) {
        Session session = HibernateUtilLive.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(rate_criteria_id) from RateCriteriaBean where customer_id = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfInvoiceByCustomer(int cust_id) {
        Session session = HibernateUtilLive.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(invoice_id) from InvoiceBean where customerBean.parent_customer_id = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfSltlInvoiceByCustomer(int cust_id) {
        Session session = HibernateUtilLive.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(sltl_invoice_id) from SltlinvoiceBean where invoiceBean.customerBean.parent_customer_id = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfInvoiceLineByCustomer(int cust_id) {
        Session session = HibernateUtilLive.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(invoice_line_id) from InvoiceLineBean where invoiceBean.customerBean.parent_customer_id = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfSltlInvoiceLineByCustomer(int cust_id) {
        Session session = HibernateUtilLive.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(sltl_invoice_line_id) from SltlInvoiceLineBean where sltlinvoiceBean.invoiceBean.customerBean.parent_customer_id = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfCustomerProductRateByCustomer(int cust_id) {
        Session session = HibernateUtilLive.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(customer_product_rate_id) from CustomerProductRateBean where customer_id = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfCurrencyByCustomer(int cust_id) {
        Session session = HibernateUtilLive.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(currency_id) from CurrencyBean where customer_id = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            //e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	public long getlastNumberOfChallanByCustomer(int cust_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(challan_id) from ChallanBean where userBean.customer_id = '"+cust_id+"'");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	public long getlastNumberOfChallanByCustomer(int cust_id,int year1,int year2) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(challan_id) from ChallanBean where userBean.customer_id = '"+cust_id+"' and (((MONTH(INSERT_DATE) between 4 and 12) and YEAR(INSERT_DATE) = '"+year1+"') or ((MONTH(INSERT_DATE) between 1 and 3) and YEAR(INSERT_DATE) = '"+year2+"')))");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfOutChallanByChallan(String challan_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        
        
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(challan_out_id) from ChallanOutBean where challanBean.challan_id = '"+challan_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	public long getlastNumberOfChallanLineByCustomer(int cust_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
        	query = session.createQuery("select count(challan_line_id) from ChallanLineBean where challanBean.userBean.customer_id = '"+cust_id+"' ");
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	
	public long getlastNumberOfOutChallanByCustomer(int cust_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
            
        	query = session.createQuery("select count(challan_out_id) from ChallanOutBean where userBean.customer_id = '"+cust_id+"' ");
        		
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
	public long getlastNumberOfChallanOutLineByCustomer(int cust_id) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        long maxvalue = 0;
        
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = null;
        	query = session.createQuery("select count(challan_out_line_id) from ChallanOutLineBean where challanOutBean.userBean.customer_id = '"+cust_id+"' ");
            maxvalue = (Long) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return maxvalue;
    }
	
	
}
