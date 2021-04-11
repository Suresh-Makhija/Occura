package com.diSync.localDAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.di.bean.ChallanBean;
import com.di.bean.ChallanLineBean;
import com.di.bean.ChallanOutBean;
import com.di.bean.ChallanOutLineBean;
import com.di.bean.CustomerBean;
import com.di.bean.CustomerProductBean;
import com.di.bean.UserBean;
import com.di.bean.WorkHistoryBean;
import com.di.bean.WorkProductBean;
import com.di.bean.WorkProductProcessBean;
import com.di.util.HibernateUtil;
import com.diSync.util.HibernateUtilLiveDatabase;

public class AllLocalListDAO {

	//Details Of User
	public UserBean detailsOfUser(int userId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		UserBean userBean = new UserBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserBean where user_id = '"+userId+"'");
			userBean = (UserBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			////e.printStackTrace();
		} finally {
			session.close();
		}
		return userBean;
	}
	
	
	//List Of all User
	public List<UserBean> listOfUser() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<UserBean> listOfUser = new ArrayList<UserBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserBean");
			listOfUser = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			////e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfUser;
	}
	
	
	
	//List Of all cutomer product by customer id
		public List<CustomerProductBean> listOfCustomerProduct(String cId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<CustomerProductBean> listOfProcess = new ArrayList<CustomerProductBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from CustomerProductBean where customerBean = '"+cId+"'");
				listOfProcess = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfProcess;
		}
		
		

		//List Of customer
		public List<CustomerBean> listOfCustomer(String custId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<CustomerBean> listOfCustomer = new ArrayList<CustomerBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from CustomerBean where parent_customer_id = '"+custId+"'"); //Or customer_id = '"+custId+"'
				listOfCustomer = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfCustomer;
		}
		
		
		
		//List Of Work History
		public List<WorkHistoryBean> listOfWorkHistory(String custId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<WorkHistoryBean> listOfWorkHistory = new ArrayList<WorkHistoryBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from WorkHistoryBean where customerBean.parent_customer_id = '"+custId+"' and insert_date >= DATEADD(DAY,-180,GETDATE())");
				listOfWorkHistory = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfWorkHistory;
		}
		
		
		//List Of Work History Product
		public List<WorkProductBean> listOfWorkProduct(String custId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<WorkProductBean> listOfWorkHistory = new ArrayList<WorkProductBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from WorkProductBean where workHistoryBean.customerBean.parent_customer_id = '"+custId+"' and insert_datetime >= DATEADD(DAY,-180,GETDATE())");
				listOfWorkHistory = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfWorkHistory;
		}
		
		
		//List Of product Process
		public List<WorkProductProcessBean> listOfWorkproductProcess(String custId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<WorkProductProcessBean> listOfWorkProductProcess = new ArrayList<WorkProductProcessBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from WorkProductProcessBean where workHistoryBean.customerBean.parent_customer_id = '"+custId+"' and insert_datetime >= DATEADD(DAY,-210,GETDATE()) order by insert_datetime DESC");
				listOfWorkProductProcess = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfWorkProductProcess;
		}
		
		//List Of product Process by wpid
		public List<WorkProductProcessBean> listOfWorkProductProcessByWorkProductProcessId(String wpid) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<WorkProductProcessBean> listOfWorkProductProcess = new ArrayList<WorkProductProcessBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from WorkProductProcessBean where work_product_process_id = '"+wpid+"'");
				listOfWorkProductProcess = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				//e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfWorkProductProcess;
		}
		
		
		//List Of Challan
		public List<ChallanBean> listOfChallan(String custId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<ChallanBean> listOfChallan = new ArrayList<ChallanBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from ChallanBean where customerBean.parent_customer_id = '"+custId+"' or userBean.customer_id = '"+custId+"'");
				listOfChallan = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfChallan;
		}
		
		
		
		//List Of ChallanOut
		public List<ChallanOutBean> listOfChallanOut(String custId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<ChallanOutBean> listOfChallanOut = new ArrayList<ChallanOutBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from ChallanOutBean where challanBean.customerBean.parent_customer_id = '"+custId+"' or challanBean.userBean.customer_id = '"+custId+"'");
				listOfChallanOut = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfChallanOut;
		}
				
		
		//List Of ChallanLine
		public List<ChallanLineBean> listOfChallanLine(String custId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<ChallanLineBean> listOfChallanLine = new ArrayList<ChallanLineBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from ChallanLineBean where challanBean.customerBean.parent_customer_id = '"+custId+"' or challanBean.userBean.customer_id = '"+custId+"'");
				listOfChallanLine = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfChallanLine;
		}
		
		
		
		//List Of ChallanOutLine
		public List<ChallanOutLineBean> listOfChallanOutLine(String custId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<ChallanOutLineBean> listOfChallanOutLine = new ArrayList<ChallanOutLineBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from ChallanOutLineBean where challanOutBean.challanBean.customerBean.parent_customer_id = '"+custId+"' or challanOutBean.challanBean.userBean.customer_id = '"+custId+"'");
				listOfChallanOutLine = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				////e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfChallanOutLine;
		}
	
			
	
}
