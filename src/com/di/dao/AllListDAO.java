package com.di.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
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
import com.di.bean.CustomerTypeBean;
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

public class AllListDAO {

	// user login Cardential check
	public UserBean checkLogin(String username, String password) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		UserBean userBean = new UserBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserBean where username ='" + username + "' and password = '"
					+ password + "' and active = 1");
			userBean = (UserBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return userBean;
	}

	// List Of product Master
	public List<ProductMasterBean> listOfProduct() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ProductMasterBean> listOfExpo = new ArrayList<ProductMasterBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from ProductMasterBean where active = 1 order by product_master_id DESC");
			listOfExpo = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}

	// Details Of Product using product id
	public ProductMasterBean productDetails(int pId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		ProductMasterBean productMasterBean = new ProductMasterBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ProductMasterBean where product_master_id = '" + pId + "'");
			productMasterBean = (ProductMasterBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return productMasterBean;
	}

	// List Of Customer Master
	public List<CustomerBean> listOfCustomerByParentId(int parent_id) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<CustomerBean> listOfExpo = new ArrayList<CustomerBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerBean where active = 1 and parent_customer_id = '"
					+ parent_id + "' order by customer_id DESC");
			listOfExpo = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}

	// List Of Customer Master
	public List<CustomerBean> listOfSubCustomer() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<CustomerBean> listOfExpo = new ArrayList<CustomerBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from CustomerBean where active = 1 and parent_customer_id !=  0 order by customer_id DESC");
			listOfExpo = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}

	// Details Of Product using product id
	public CustomerBean customerDetails(int cId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		CustomerBean customerBean = new CustomerBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerBean where customer_id = '" + cId + "'");
			
			customerBean = (CustomerBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return customerBean;
	}

	// Max Number of customer
	public int getMaxNumberOfCustomerByPId(int parent_id) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		int maxvalue = 0;

		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			if (parent_id == 0) {
				query = session.createQuery("select max(customer_num) from CustomerBean where parent_customer_id = 0");
			} else {
				query = session.createQuery(
						"select max(customer_num) from CustomerBean where parent_customer_id = '" + parent_id + "'");
			}

			maxvalue = (Integer) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return maxvalue;
	}

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistory(int count) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from WorkHistoryBean where active = 1 and parent_work_id = '0' order by insert_date DESC"); /*and in_stock = 0 */
			if (count != 0) {
				query.setMaxResults(count);
			}
			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistoryByParentWorkId(String workid) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from WorkHistoryBean where active = 1 and parent_work_id = '" + workid
					+ "' order by insert_date DESC");
			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistoryByCustomer(int count, int custId, int user_id) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from WorkHistoryBean where active = 1 and (userBean.customer_id ='"
					+ custId + "' or userBean = '" + user_id + "' or customerBean.parent_customer_id = '" + custId
					+ "') and parent_work_id = '0' order by insert_date DESC");
			if (count != 0) {
				query.setMaxResults(count);
			}
			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistoryByCustomerId(int custId, String fromDate, String toDate) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {
				query = session.createQuery(
						"from WorkHistoryBean w where not exists(from InvoiceLineBean i where i.workHistoryBean.work_history_id = w.work_history_id or i.workHistoryBean.parent_work_id = w.work_history_id and i.active = 1) and w.active = 1 and w.customerBean = '"
								+ custId
								+ "' and (in_stock = 2) and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111) ) order by w.insert_date DESC");
			} else {
				query = session.createQuery(
						"from WorkHistoryBean w where not exists(from InvoiceLineBean i where i.workHistoryBean.work_history_id = w.work_history_id or i.workHistoryBean.parent_work_id = w.work_history_id and i.active = 1) and w.active = 1 and w.customerBean = '"
								+ custId
								+ "' and (in_stock = 2)  and parent_work_id = '0' order by w.insert_date DESC");
			}

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistoryByCustomerIdByFilter(int custId, String kapan, String lot) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			if (custId != 0 && kapan.equalsIgnoreCase("0") && lot.equalsIgnoreCase("0")) {
				query = session.createQuery("from WorkHistoryBean  where customerBean = '" + custId
						+ "' and parent_work_id = '0' and active = 1 and in_stock in (0,1) order by insert_date ASC");
			} else if (custId != 0 && !kapan.equalsIgnoreCase("0") && lot.equalsIgnoreCase("0")) {
				query = session.createQuery("from WorkHistoryBean  where customerBean = '" + custId
						+ "' and kapan_name = '" + kapan
						+ "'  and parent_work_id = '0' and active = 1 and in_stock in (0,1) order by insert_date ASC");
			} else if (custId != 0 && !kapan.equalsIgnoreCase("0") && !lot.equalsIgnoreCase("0")) {
				query = session.createQuery("from WorkHistoryBean  where customerBean = '" + custId
						+ "' and kapan_name = '" + kapan + "' and lot_name = '" + lot
						+ "' and  parent_work_id = '0' and active = 1 and in_stock in (0,1) order by insert_date ASC");
			}

			

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistoryByCustomerIdByFilterForChallan(int custId, String kapan, String lot) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			if (custId != 0 && kapan.equalsIgnoreCase("0") && lot.equalsIgnoreCase("0")) {
				query = session.createQuery(
						"from WorkHistoryBean w where not exists(from ChallanLineBean c where c.workHistoryBean.work_history_id = w.work_history_id) and customerBean = '"
								+ custId + "' and parent_work_id = '0' and active = 1 and in_stock in (0,1) order by insert_date ASC");
			} else if (custId != 0 && !kapan.equalsIgnoreCase("0") && lot.equalsIgnoreCase("0")) {
				query = session.createQuery(
						"from WorkHistoryBean w  where not exists(from ChallanLineBean c where c.workHistoryBean.work_history_id = w.work_history_id) and customerBean = '"
								+ custId + "' and kapan_name = '" + kapan
								+ "'  and parent_work_id = '0' and active = 1 and in_stock in (0,1) order by insert_date ASC");
			} else if (custId != 0 && !kapan.equalsIgnoreCase("0") && !lot.equalsIgnoreCase("0")) {
				query = session.createQuery(
						"from WorkHistoryBean w  where not exists(from ChallanLineBean c where c.workHistoryBean.work_history_id = w.work_history_id) and customerBean = '"
								+ custId + "' and kapan_name = '" + kapan + "' and lot_name = '" + lot
								+ "' and  parent_work_id = '0' and active = 1 and in_stock in (0,1) order by insert_date ASC");
			}

			

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}
	
	
	// List Of Work History
		public List<WorkHistoryBean> listOfWorkHistoryByCustomerIdByFilterAll(int custId, String kapan, String lot) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = null;

				if (custId != 0 && kapan.equalsIgnoreCase("0") && lot.equalsIgnoreCase("0")) {
					query = session.createQuery(
							"from WorkHistoryBean  where customerBean = '"
									+ custId + "' and parent_work_id = '0' and active = 1  order by insert_date ASC");
				} else if (custId != 0 && !kapan.equalsIgnoreCase("0") && lot.equalsIgnoreCase("0")) {
					query = session.createQuery(
							"from WorkHistoryBean  where customerBean = '"
									+ custId + "' and kapan_name = '" + kapan
									+ "'  and parent_work_id = '0' and active = 1 order by insert_date ASC");
				} else if (custId != 0 && !kapan.equalsIgnoreCase("0") && !lot.equalsIgnoreCase("0")) {
					query = session.createQuery(
							"from WorkHistoryBean where customerBean = '"
									+ custId + "' and kapan_name = '" + kapan + "' and lot_name = '" + lot
									+ "' and  parent_work_id = '0' and active = 1  order by insert_date ASC");
				}

				

				listOfWork = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfWork;
		}

	
	// List Of Work History invoice
	public List<WorkHistoryBean> listOfWorkHistoryByCustomerIdByFilterForInvoice(int custId, String kapan, String lot) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			if (custId != 0 && kapan.equalsIgnoreCase("0") && lot.equalsIgnoreCase("0")) {
				query = session.createQuery(
						"from WorkHistoryBean w where not exists(from InvoiceLineBean c where c.workHistoryBean.work_history_id = w.work_history_id) and customerBean = '"
								+ custId + "' and parent_work_id = '0' and active = 1 and in_stock = 2 order by insert_date ASC");
			} else if (custId != 0 && !kapan.equalsIgnoreCase("0") && lot.equalsIgnoreCase("0")) {
				query = session.createQuery(
						"from WorkHistoryBean w  where not exists(from InvoiceLineBean c where c.workHistoryBean.work_history_id = w.work_history_id) and customerBean = '"
								+ custId + "' and kapan_name = '" + kapan
								+ "'  and parent_work_id = '0' and active = 1 and in_stock = 2 order by insert_date ASC");
			} else if (custId != 0 && !kapan.equalsIgnoreCase("0") && !lot.equalsIgnoreCase("0")) {
				query = session.createQuery(
						"from WorkHistoryBean w  where not exists(from InvoiceLineBean c where c.workHistoryBean.work_history_id = w.work_history_id) and customerBean = '"
								+ custId + "' and kapan_name = '" + kapan + "' and lot_name = '" + lot
								+ "' and  parent_work_id = '0' and active = 1 and in_stock = 2 order by insert_date ASC");
			}

			

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	public List<String> listOfKapanByCustomerIdByFilter(int custId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			query = session.createQuery("Select kapan_name from WorkHistoryBean  where customerBean = '" + custId
					+ "' and parent_work_id = '0' and active = 1 group by kapan_name");

			System.out.println("Query new: "+query);

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
			System.out.println("Query new: "+e.getMessage());
		} finally {
			session.close();
		}
		return listOfWork;
	}

	public List<String> listOfKapanByCustomerIdByFilter1(int custId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			query = session.createQuery("Select kapan_name from WorkHistoryBean  where customerBean = '" + custId
					+ "' and parent_work_id = '0' and active = 1 and in_stock = 0 group by kapan_name");

			

			listOfWork = query.list();
			System.out.println(listOfWork.size());
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	
	public List<String> listOfKapanByCustomerIdByFilterClearedStock(int custId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			query = session.createQuery("Select kapan_name from WorkHistoryBean  where customerBean = '" + custId
					+ "' and parent_work_id = '0' and active = 1 and in_stock = 2 group by kapan_name");

			

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	public List<String> listOfLotByCustomerIdByFilter(int custId, String kapan) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			query = session.createQuery("Select lot_name from WorkHistoryBean  where customerBean = '" + custId
					+ "' and kapan_name = '" + kapan + "' and  parent_work_id = '0' and active = 1 group by lot_name");

			

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	public List<String> listOfLotByCustomerIdByFilter1(int custId, String kapan) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			query = session.createQuery(
					"Select lot_name from WorkHistoryBean  where customerBean = '" + custId + "' and kapan_name = '"
							+ kapan + "' and  parent_work_id = '0' and active = 1 and in_stock = 0 group by lot_name");

			

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	
	public List<String> listOfStoneByCustomerIdByFilter1(int custId, String kapan , String lot) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			query = session.createQuery(
					"Select stone_name from WorkHistoryBean  where customerBean = '" + custId + "' and kapan_name = '"
							+ kapan + "' and lot_name = '"+ lot +"' and parent_work_id = '0' and active = 1 group by stone_name");

			
			System.out.println("Query :"+query);
			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}
	
	public List<String> stoneWeightByCustomerIdByFilter1(int custId, String kapan , String lot ,String stone_name) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			query = session.createQuery(
					"Select actual_weight from WorkHistoryBean  where customerBean = '" + custId + "' and kapan_name = '"
							+ kapan + "' and lot_name = '"+ lot +"' and stone_name = '"+ stone_name +"' and parent_work_id = '0' and active = 1 ");

			
			System.out.println("Query :"+query);
			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}
	
	
	public List<String> listOfLotByCustomerIdByFilter1Cleared(int custId, String kapan) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			query = session.createQuery(
					"Select lot_name from WorkHistoryBean  where customerBean = '" + custId + "' and kapan_name = '"
							+ kapan + "' and  parent_work_id = '0' and active = 1 and in_stock = 2 group by lot_name");

			

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}
	
	

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistoryByCustomerIdForChallanCreator(int custId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from WorkHistoryBean w where not exists(from ChallanLineBean c where c.workHistoryBean.work_history_id = w.work_history_id) and w.active = 1 and w.customerBean = '"
							+ custId + "' and parent_work_id = '0' order by w.insert_date DESC");

			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// List Of Work History
	public List<WorkHistoryBean> listOfPendingStockWorkHistoryByCustomerId(int custId, int stockStatus, String fromDate,
			String toDate, int userCustId, String lot, String kapan) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		
		
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			if (stockStatus != 100) {

				if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {
					if (custId == 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and customerBean.parent_customer_id = '"
										+ userCustId + "' and in_stock = '" + stockStatus
										+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
										+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
										+ "', 111)  )  order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and customerBean = '"
								+ custId + "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId == 0 && !lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and lot_name = '" + lot
								+ "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId == 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and customerBean = '" + custId + "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and customerBean = '" + custId + "' and lot_name = '" + lot + "' and in_stock = '"
								+ stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					}

				} else {
					if (custId == 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and customerBean.parent_customer_id = '"
										+ userCustId + "' and in_stock = '" + stockStatus
										+ "' and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and customerBean = '"
								+ custId + "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and lot_name = '" + lot + "' and in_stock = '"
										+ stockStatus + "' and parent_work_id = '0' order by insert_date DESC");
					} else if (custId == 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and  customerBean = '" + custId + "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' order by insert_date DESC");
					} else {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and  customerBean = '" + custId + "' and lot_name = '" + lot + "' and in_stock = '"
								+ stockStatus + "' and parent_work_id = '0' order by insert_date DESC");
					}

				}

			} else {

				if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {
					if (custId == 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and customerBean.parent_customer_id = '"
										+ userCustId
										+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
										+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
										+ "', 111)  )  order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and customerBean = '"
								+ custId
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId == 0 && !lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and lot_name = '" + lot
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId == 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and  customerBean = '" + custId
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and  customerBean = '" + custId + "' and lot_name = '" + lot
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					}

				} else {
					if (custId == 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and customerBean.parent_customer_id = '"
										+ userCustId + "'  and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and customerBean = '"
								+ custId + "'  and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and lot_name = '" + lot
								+ "'  and parent_work_id = '0' order by insert_date DESC");
					} else if (custId == 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "'  and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and customerBean = '" + custId
								+ "'  and parent_work_id = '0' order by insert_date DESC");
					} else {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and customerBean = '" + custId + "' and lot_name = '" + lot
								+ "'  and parent_work_id = '0' order by insert_date DESC");
					}

				}

			}
			

			listOfWork = query.list();

			System.out.println(listOfWork.size());
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}
	
	// List Of Work History
	public List<WorkHistoryBean> listOfPendingStockWorkHistoryByCustomerIdForUser(int custId, int stockStatus, String fromDate,
			String toDate, int userCustId, String lot, String kapan,String stone_name) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		
		
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;
			
			String condition = "";
			
			if(custId != 0) {
				if(condition.equalsIgnoreCase("")) {
					condition = condition + "customerBean="+custId;
				}else {
					condition = condition + " AND customerBean="+custId;
				}
			}
			if(!lot.equalsIgnoreCase("0")) {
				if(condition.equalsIgnoreCase("")) {
					condition = condition + "lot_name= '"+lot+"'";
				}else {
					condition = condition + " AND lot_name= '"+lot+"'";
				}
			}
			if(!kapan.equalsIgnoreCase("0")) {
				
				if(condition.equalsIgnoreCase("")) {
					condition = condition + "kapan_name='"+kapan+"'";
				}else {
					condition = condition + " AND kapan_name='"+kapan+"'";
				}
			}
			
			if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {
				
				if(condition.equalsIgnoreCase("")) {
					condition = condition + "( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10),'"+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate+ "', 111)  ) "; 
				}else {
					condition = condition + " AND ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10),'"+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate+ "', 111)  ) "; 
				}
				
			}

			if(!stone_name.equalsIgnoreCase("")) {
				
				if(condition.equalsIgnoreCase("")) {
					condition = condition+"stone_name = "+stone_name;
				}else {
					condition = condition+" AND stone_name = "+stone_name;
				}
				
			}
			
			if(!condition.equalsIgnoreCase("")) {
				condition = "AND "+condition;
			}
			
			query = session.createQuery("from WorkHistoryBean where active = 1 and parent_work_id = '0' "+condition+" order by insert_date DESC");
			
			listOfWork = query.list();

			System.out.println(listOfWork.size());
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}
	

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistoryByCustomerIdForChallanCreatorNew(int custId, int stockStatus,
			String fromDate, String toDate, int userCustId, String lot, String kapan) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = null;

			if (stockStatus != 100) {

				if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {
					if (custId == 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and customerBean.parent_customer_id = '"
										+ userCustId + "' and in_stock = '" + stockStatus
										+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
										+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
										+ "', 111)  )  order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and customerBean = '"
								+ custId + "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId == 0 && !lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and lot_name = '" + lot
								+ "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId == 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and customerBean = '" + custId + "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and customerBean = '" + custId + "' and lot_name = '" + lot + "' and in_stock = '"
								+ stockStatus
								+ "' and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					}

				} else {
					if (custId == 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and customerBean.parent_customer_id = '"
										+ userCustId + "' and in_stock = '" + stockStatus
										+ "' and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and customerBean = '"
								+ custId + "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and lot_name = '" + lot + "' and in_stock = '"
										+ stockStatus + "' and parent_work_id = '0' order by insert_date DESC");
					} else if (custId == 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and  customerBean = '" + custId + "' and in_stock = '" + stockStatus
								+ "' and parent_work_id = '0' order by insert_date DESC");
					} else {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and  customerBean = '" + custId + "' and lot_name = '" + lot + "' and in_stock = '"
								+ stockStatus + "' and parent_work_id = '0' order by insert_date DESC");
					}

				}

			} else {

				if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {
					if (custId == 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and customerBean.parent_customer_id = '"
										+ userCustId
										+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
										+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
										+ "', 111)  )  order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and customerBean = '"
								+ custId
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId == 0 && !lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and lot_name = '" + lot
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId == 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and  customerBean = '" + custId
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					} else {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and  customerBean = '" + custId + "' and lot_name = '" + lot
								+ "'  and parent_work_id = '0' and ( CONVERT(VARCHAR(10), insert_date, 111) between CONVERT(VARCHAR(10), '"
								+ fromDate + "', 111) and CONVERT(VARCHAR(10), '" + toDate
								+ "', 111)  )  order by insert_date DESC");
					}

				} else {
					if (custId == 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery(
								"from WorkHistoryBean where active = 1 and customerBean.parent_customer_id = '"
										+ userCustId + "'  and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and customerBean = '"
								+ custId + "'  and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and lot_name = '" + lot
								+ "'  and parent_work_id = '0' order by insert_date DESC");
					} else if (custId == 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "'  and parent_work_id = '0' order by insert_date DESC");
					} else if (custId != 0 && lot.equalsIgnoreCase("0") && !kapan.equalsIgnoreCase("0")) {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and customerBean = '" + custId
								+ "'  and parent_work_id = '0' order by insert_date DESC");
					} else {
						query = session.createQuery("from WorkHistoryBean where active = 1 and kapan_name = '" + kapan
								+ "' and customerBean = '" + custId + "' and lot_name = '" + lot
								+ "'  and parent_work_id = '0' order by insert_date DESC");
					}

				}

			}
			

			listOfWork = query.list();

			System.out.println(listOfWork.size());
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// Details Of Work history using work history id
	public WorkHistoryBean workHistoryId(String wId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		WorkHistoryBean workHistoryBean = new WorkHistoryBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from WorkHistoryBean where work_history_id = '" + wId + "'");
			workHistoryBean = (WorkHistoryBean) query.uniqueResult();
			System.out.println(workHistoryBean);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return workHistoryBean;
	}

	// Details Of Work history using customerId
	public WorkHistoryBean workHistoryCustId(int cId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		WorkHistoryBean workHistoryBean = new WorkHistoryBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from WorkHistoryBean where customerBean = '" + cId + "' order by insert_date DESC");
			query.setMaxResults(1);
			workHistoryBean = (WorkHistoryBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return workHistoryBean;
	}

	// Details Of Work history using parent customer code & kapan name & stone name
	public WorkHistoryBean workHistoryCustCodeStoneKapan(String cCode, String stoneName, String kapnName) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		WorkHistoryBean workHistoryBean = new WorkHistoryBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from WorkHistoryBean where customerBean.parent_customer_code = '" + cCode + "' and kapan_name = '"
							+ kapnName + "' and stone_name = '" + stoneName + "'  order by insert_date DESC");

			query.setMaxResults(1);
			workHistoryBean = (WorkHistoryBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return workHistoryBean;
	}

	// Details Of Work history using customerId
	public WorkHistoryBean workHistoryUserId(int uId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		WorkHistoryBean workHistoryBean = new WorkHistoryBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from WorkHistoryBean where userBean = '" + uId + "' order by insert_date DESC");
			query.setMaxResults(1);
			workHistoryBean = (WorkHistoryBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return workHistoryBean;
	}

	// List Of product Process
	public List<ProductProcessBean> listOfProductProcess(int id) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ProductProcessBean> listOfProcess = new ArrayList<ProductProcessBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from ProductProcessBean where active = 1 and productMasterBean = '" + id + "'");
			listOfProcess = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfProcess;
	}

	// Details Of Work history using work history id
	public ProductProcessBean detailsOfProcess(int ppId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		ProductProcessBean productProcessBean = new ProductProcessBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ProductProcessBean where product_process_id = '" + ppId + "'");
			productProcessBean = (ProductProcessBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return productProcessBean;
	}

	// List Of Customer product
	public List<Integer> listOfCustomerProductGroup(int custId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<Integer> listOfProdcut = new ArrayList<Integer>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"SELECT productMasterBean.product_master_id  from CustomerProductBean where active = 1 and customerBean = '"
							+ custId + "' group by productMasterBean");

			if (custId == 1) {
				query = session.createQuery("SELECT product_master_id  from ProductMasterBean where active = 1");
			}

			listOfProdcut = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfProdcut;
	}

	// List Of Customer product
	public List<String> listOfStoneGroup() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfProdcut = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("SELECT stone_name  from WorkHistoryBean where active = 1 group by stone_name");

			listOfProdcut = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfProdcut;
	}

	// List Of Customer product
	public List<String> listOfLotGroup() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfProdcut = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"SELECT lot_name  from WorkHistoryBean where active = 1 and lot_name != ''  group by lot_name");

			listOfProdcut = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfProdcut;
	}

	// List Of all cutomer product by product id
	public List<CustomerProductBean> listOfCustomerProduct(int cId, int pId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<CustomerProductBean> listOfProcess = new ArrayList<CustomerProductBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerProductBean where active = 1 and productMasterBean = '"
					+ pId + "' and customerBean = '" + cId + "'");
			listOfProcess = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfProcess;
	}

	// List Of all Workproduct
	public List<WorkProductBean> listOfWorkProduct(String wId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkProductBean> listOfWorkProduct = new ArrayList<WorkProductBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from WorkProductBean where workHistoryBean = '" + wId + "' and active = 1");
			listOfWorkProduct = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWorkProduct;
	}

	
	// List Of all Workproduct
		public List<Integer> listOfWorkProductGroupBy(String wId) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<Integer> listOfWorkProduct = new ArrayList<Integer>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session
						.createQuery("select productMasterBean.product_master_id from WorkProductBean where workHistoryBean = '" + wId + "' and active = 1 group by productMasterBean.product_master_id");
				listOfWorkProduct = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				 e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfWorkProduct;
		}
	
	// List Of all Workproduct
	public List<WorkProductProcessBean> listOfWorkProductProcess(String wId, String wpId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkProductProcessBean> listOfWorkProduct = new ArrayList<WorkProductProcessBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from WorkProductProcessBean where workHistoryBean.work_history_id = '"
					+ wId + "' and workProductBean.work_product_id = '" + wpId + "'");
			listOfWorkProduct = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWorkProduct;
	}

	// List Of all Workproduct by Produt
	public List<WorkProductProcessBean> listOfWorkProductProcessByProduct(int wpId, int cust_id) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkProductProcessBean> listOfWorkProduct = new ArrayList<WorkProductProcessBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from WorkProductProcessBean where productProcessBean.productMasterBean.product_master_id = '"
							+ wpId + "' and workHistoryBean.customerBean = '" + cust_id + "' and active = 1");
			query.setMaxResults(1);
			listOfWorkProduct = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWorkProduct;
	}

	// List Of all User
	public List<UserBean> listOfUser(int custId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<UserBean> listOfUser = new ArrayList<UserBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserBean where customer_id = '" + custId + "' and active = 1 ");
			listOfUser = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfUser;
	}

	// List Of all User
	public List<UserBean> listOfAllUser(int custId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<UserBean> listOfUser = new ArrayList<UserBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserBean where customer_id = '" + custId + "'");
			listOfUser = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfUser;
	}

	// List Of Customer Type
	public List<CustomerTypeBean> listOfCustomerType() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<CustomerTypeBean> listOfExpo = new ArrayList<CustomerTypeBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerTypeBean where active = 1");
			listOfExpo = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfExpo;
	}

	// Details Of Customer Type by id
	public CustomerTypeBean detailsOfCustomerType(int ctId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerTypeBean where customer_type_id = '" + ctId + "'");
			customerTypeBean = (CustomerTypeBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return customerTypeBean;
	}

	// Group of rate criteria
	public List<String> groupOfRateCrieria(int ctId, int userCustId, int prod_id) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<String> listOfRateCriteria = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("SELECT name from RateCriteriaBean where status = 1 and customerTypeBean = '" + ctId
							+ "' and customer_id = '" + userCustId + "' and productMasterBean = '" + prod_id
							+ "' group by name");
			
			listOfRateCriteria = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfRateCriteria;
	}

	// Group of rate criteria
	public List<String> groupOfRateCrieriaByCondition(int ctId, int userCustId, int prod_id, int cId) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<String> listOfRateCriteria = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"SELECT name from RateCriteriaBean r where not exists (from RateCriteriaBean rr where rr.name = r.name and rr.customer_id = '"
							+ cId + "' and rr.productMasterBean = '" + prod_id
							+ "') and r.status = 1 and r.customerTypeBean = '" + ctId + "' and r.customer_id = '"
							+ userCustId + "' and r.productMasterBean = '" + prod_id + "' group by r.name");

			listOfRateCriteria = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfRateCriteria;
	}

	// Details Of Last rate by ctid and name
	public RateCriteriaBean detailsOfLastRate(int ctId, String name, int userCustId, int prod_id) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		RateCriteriaBean rateCriteriaBean = new RateCriteriaBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from RateCriteriaBean where status = 1 and customer_type_id = '" + ctId
					+ "' and name = '" + name + "' and customer_id = '" + userCustId + "' and productMasterBean = '"
					+ prod_id + "'  order by effective_date desc");
			query.setMaxResults(1);
			rateCriteriaBean = (RateCriteriaBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return rateCriteriaBean;
	}

	// Details Of Last rate by ctid and name
	public RateCriteriaBean detailsOfLastRateByRateId(int rId) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		RateCriteriaBean rateCriteriaBean = new RateCriteriaBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from RateCriteriaBean where status = 1 and rate_criteria_id = '" + rId + "'");
			query.setMaxResults(1);
			rateCriteriaBean = (RateCriteriaBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return rateCriteriaBean;
	}

	// List Of History of rate criteria by ctid and name
	public List<RateCriteriaBean> historyOfRateCriteria(int ctId, String name, int userCustId, int prod_id) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<RateCriteriaBean> listOfRateHistory = new ArrayList<RateCriteriaBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from RateCriteriaBean where status = 1 and customer_type_id = '" + ctId
					+ "' and name = '" + name + "' and customer_id = '" + userCustId + "' and productMasterBean = '"
					+ prod_id + "' order by effective_date desc");
			listOfRateHistory = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfRateHistory;
	}

	// Find Rate
	public RateCriteriaBean findRateOfCarat(int ctId, double carat, int custId, int prod_id, String date) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		RateCriteriaBean rateCriteriaBean = new RateCriteriaBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from RateCriteriaBean where status = 1 and customer_type_id = '" + ctId
					+ "' and carat_size_from <= '" + carat + "' AND  carat_size_to >= '" + carat
					+ "' and customer_id = '" + custId + "' and productMasterBean = '" + prod_id
					+ "' and effective_date <= '" + date + "' order by insert_datetime DESC");
			
			query.setMaxResults(1);
			rateCriteriaBean = (RateCriteriaBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return rateCriteriaBean;
	}

	// Details Of User By User id
	public UserBean detailsOfUserByUserId(int uId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		UserBean userBean = new UserBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserBean where user_id = '" + uId + "'");
			userBean = (UserBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return userBean;
	}

	// List Of Invoice
	public List<InvoiceBean> listOfInvoice(int userCustId) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<InvoiceBean> listOfInvoice = new ArrayList<InvoiceBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from InvoiceBean where customerBean.parent_customer_id = '" + userCustId
					+ "' or customerBean = '"+userCustId+"' order by insert_date desc");
			
			listOfInvoice = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfInvoice;
	}
	
	
	// List Of Invoice
		public List<InvoiceBean> listOfInvoiceByIdByStatis(int userCustId,int billed) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<InvoiceBean> listOfInvoice = new ArrayList<InvoiceBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = null;
				if(billed != 100) {
					query = session.createQuery("from InvoiceBean where (customerBean.parent_customer_id = '" + userCustId
						+ "' or customerBean = '"+userCustId+"') and billed = '"+billed+"' order by insert_date desc");
				}else {
					 query = session.createQuery("from InvoiceBean where (customerBean.parent_customer_id = '" + userCustId
								+ "' or customerBean = '"+userCustId+"') order by insert_date desc");
				}
				listOfInvoice = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				// e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoice;
		}
		
		
		// List Of All Invoice
		public List<InvoiceBean> listOfInvoiceByIdAll(int userCustId) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<InvoiceBean> listOfInvoice = new ArrayList<InvoiceBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = null;
					 query = session.createQuery("from InvoiceBean where (customerBean.parent_customer_id = '" + userCustId
								+ "' or customerBean = '"+userCustId+"') order by insert_date desc");
				listOfInvoice = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				// e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoice;
		}
		
		public double sumOfInvoiceAmount(int userCustId) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			double amount = 0;
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = null;
					 query = session.createQuery("select sum(final_outstanding) from InvoiceBean where (customerBean.parent_customer_id = '" + userCustId
								+ "' or customerBean = '"+userCustId+"')");
					 amount = (Double) query.uniqueResult();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				 e.printStackTrace();
			} finally {
				session.close();
			}
			return amount;
		}
		
		

	// Details Of Invoice By invoice id
	public InvoiceBean detailsOfInvoice(String iId) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		InvoiceBean invoiceBean = new InvoiceBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from InvoiceBean where invoice_id = '" + iId + "'");
			
			invoiceBean = (InvoiceBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return invoiceBean;
	}

	// Details Of sltl Invoice By sltl invoice id
	public SltlinvoiceBean detailsOfSltlInvoice(String iId) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		SltlinvoiceBean sltlinvoiceBean = new SltlinvoiceBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from SltlinvoiceBean where invoiceBean = '" + iId + "'");
			sltlinvoiceBean = (SltlinvoiceBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return sltlinvoiceBean;
	}

	// List Of Invoice Line
	public List<InvoiceLineBean> listOfInvoiceLine(String iid) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<InvoiceLineBean> listOfInvoiceLine = new ArrayList<InvoiceLineBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			System.out.println("Start");
			Query query = session.createQuery("from InvoiceLineBean where invoiceBean = '" + iid + "' and active = 1");
			System.out.println("Start-1");
			listOfInvoiceLine = query.list();
			System.out.println("End");
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfInvoiceLine;
	}
	
	
	// List Of Invoice Line
	public List<InvoiceLineBean> listOfInvoiceLine() {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<InvoiceLineBean> listOfInvoiceLine = new ArrayList<InvoiceLineBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			System.out.println("Start");
			Query query = session.createQuery("from InvoiceLineBean");
			System.out.println("Start-1");
			listOfInvoiceLine = query.list();
			System.out.println("End");
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfInvoiceLine;
	}
	
	
	// List Of Invoice Line
		public List<Object[]> listOfInvoiceLineId(String iid) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<Object[]> listOfInvoiceLine = new ArrayList<Object[]>();
			try {
				tx = session.getTransaction();
				tx.begin();
				System.out.println("Start");
				Query query = session.createQuery("Select workHistoryBean.work_history_id,productMasterBean.product_master_id,invoice_line_id,min_rate_flag,rate,productMasterBean.product_name,perStoneRate from InvoiceLineBean where invoiceBean = '" + iid + "' and active = 1");
				System.out.println("Start-1");
				listOfInvoiceLine = query.list();
				System.out.println("End");
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				 e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoiceLine;
		}
		
		
		// List Of Invoice Line
		public List<Object[]> listOfInvoiceLineByRateKapnaLot(String iid,double rate) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<Object[]> listOfInvoiceLine = new ArrayList<Object[]>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("select workHistoryBean.kapan_name,workHistoryBean.lot_name from InvoiceLineBean where invoiceBean = '" + iid + "' and active = 1 and rate = '"+rate+"'");
				listOfInvoiceLine = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				// e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoiceLine;
		}

	
		
		// List Of Invoice Line
				public List<Object[]> listOfInvoiceLineByRateKapnaLot(String iid,double rate,String kapan,String lot) {
					Session session = HibernateUtilLive.openSession();
					Transaction tx = null;
					List<Object[]> listOfInvoiceLine = new ArrayList<Object[]>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("select workHistoryBean.kapan_name,workHistoryBean.lot_name from InvoiceLineBean where invoiceBean = '" + iid + "' and active = 1 and perStoneRate = '"+rate+"' and workHistoryBean.kapan_name = '"+kapan+"' and workHistoryBean.lot_name = '"+lot+"'");
						
						listOfInvoiceLine = query.list();
						tx.commit();
						System.out.println(listOfInvoiceLine.size());
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						// e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfInvoiceLine;
				}
	
	// List Of Invoice Line
		public List<Double> listOfInvoiceLineGroupByRate(String iid) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<Double> listOfInvoiceLine = new ArrayList<Double>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("select rate from InvoiceLineBean where invoiceBean = '" + iid + "'  and active = 1 group by rate");
				listOfInvoiceLine = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				// e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoiceLine;
		}
		
		
		// List Of Invoice Line
		public List<Double> listOfInvoiceLineKapanLotGroupByRate(String iid,String kapan,String lot) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<Double> listOfInvoiceLine = new ArrayList<Double>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("select perStoneRate from InvoiceLineBean where invoiceBean = '" + iid + "' and workHistoryBean.kapan_name = '"+kapan+"' and workHistoryBean.lot_name = '"+lot+"' and active = 1 group by perStoneRate");
				listOfInvoiceLine = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				// e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoiceLine;
		}
		
		// List Of Invoice Line
		public List<InvoiceLineBean> listOfInvoiceLineKapanLot(String iid,String kapan,String lot,double rate) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<InvoiceLineBean> listOfInvoiceLine = new ArrayList<InvoiceLineBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from InvoiceLineBean where invoiceBean = '" + iid + "' and workHistoryBean.kapan_name = '"+kapan+"' and workHistoryBean.lot_name = '"+lot+"' and active = 1 and rate = "+rate+"");
				listOfInvoiceLine = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				 e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoiceLine;
		}

		
		// List Of Invoice Line kapan
		public List<String> listOfInvoiceLineGroupByKapan(String iid) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<String> listOfInvoiceLine = new ArrayList<String>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("select workHistoryBean.kapan_name from InvoiceLineBean where invoiceBean = '" + iid + "' and active = 1 group by workHistoryBean.kapan_name");
				listOfInvoiceLine = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				// e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoiceLine;
		}
		
		
		// List Of Invoice Line kapan
				public List<String> listOfInvoiceLineGroupByLot(String iid,String kapan) {
					Session session = HibernateUtilLive.openSession();
					Transaction tx = null;
					List<String> listOfInvoiceLine = new ArrayList<String>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("select workHistoryBean.lot_name from InvoiceLineBean where invoiceBean = '" + iid + "' and workHistoryBean.kapan_name = '"+kapan+"' and active = 1 group by workHistoryBean.lot_name");
				
						listOfInvoiceLine = query.list();
						System.out.println("query :"+query);
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						// e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfInvoiceLine;
				}

		
		
		// List Of Invoice Line
		public List<InvoiceLineBean> listOfInvoiceLineByRate(String iid,double rate) {
			Session session = HibernateUtilLive.openSession();
			Transaction tx = null;
			List<InvoiceLineBean> listOfInvoiceLine = new ArrayList<InvoiceLineBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from InvoiceLineBean where invoiceBean = '" + iid + "' and active = 1 and rate = '"+rate+"'");
				listOfInvoiceLine = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				// e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfInvoiceLine;
		}

		
	// List Of Invoice Line
	public List<String> listOfInvoiceLineGroupByChallan(String iid) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<String> listOfInvoiceLine = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("select workHistoryBean.work_history_id from InvoiceLineBean where invoiceBean = '"
							+ iid + "' and active = 1 group by workHistoryBean.work_history_id");

			listOfInvoiceLine = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			//e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfInvoiceLine;
	}

	// List Of sltl Invoice Line
	public List<SltlInvoiceLineBean> listOfSltlInvoiceLine(String iid) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<SltlInvoiceLineBean> listOfSltlInvoiceLine = new ArrayList<SltlInvoiceLineBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from SltlInvoiceLineBean where invoiceLineBean.invoiceBean = '" + iid + "' and active = 1");
			listOfSltlInvoiceLine = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfSltlInvoiceLine;
	}
	
	
	// List Of Invoice Line
			public List<Object[]> listOfSltlInvoiceLineId(String iid) {
				Session session = HibernateUtilLive.openSession();
				Transaction tx = null;
				List<Object[]> listOfInvoiceLine = new ArrayList<Object[]>();
				try {
					tx = session.getTransaction();
					tx.begin();
					Query query = session.createQuery("Select invoiceLineBean.workHistoryBean.work_history_id,invoiceLineBean.productMasterBean.product_master_id,amount,invoiceLineBean.productMasterBean.product_name,sltl_mrgine,invoiceLineBean.rate from SltlInvoiceLineBean where invoiceLineBean.invoiceBean = '" + iid + "' and active = 1");
					listOfInvoiceLine = query.list();
					tx.commit();
				} catch (Exception e) {
					if (tx != null) {
						tx.rollback();
					}
					// e.printStackTrace();
				} finally {
					session.close();
				}
				return listOfInvoiceLine;
			}

	// Details Of Customer Product Rate
	public SltlInvoiceLineBean detailsOfSltlLineByInvoiceLine(String ilid) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		SltlInvoiceLineBean sltlInvoiceLineBean = new SltlInvoiceLineBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from SltlInvoiceLineBean where invoiceLineBean = '" + ilid + "'");
			sltlInvoiceLineBean = (SltlInvoiceLineBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return sltlInvoiceLineBean;
	}

	// Details Of Customer Product Rate
	public CustomerProductRateBean detailsOfCustomerProductRate(int cId, int pId, int ctId) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		CustomerProductRateBean customerProductRateBean = new CustomerProductRateBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerProductRateBean where customerTypeBean = '" + ctId
					+ "' and customerBean = '" + cId + "' and productMasterBean = '" + pId + "' and active = 1");
			customerProductRateBean = (CustomerProductRateBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return customerProductRateBean;
	}

	// Details Of Customer Product Rate
	public CustomerProductRateBean detailsOfCustomerProductRateByCustId(int cId, int pId) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		CustomerProductRateBean customerProductRateBean = new CustomerProductRateBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CustomerProductRateBean where customerBean = '" + cId
					+ "' and productMasterBean = '" + pId + "' and active = 1");
			customerProductRateBean = (CustomerProductRateBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return customerProductRateBean;
	}

	// List Of Currency
	public List<CurrencyBean> listOfCurrency(int custId) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		List<CurrencyBean> listOfCurrency = new ArrayList<CurrencyBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CurrencyBean where customer_id = '" + custId + "'");

			listOfCurrency = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfCurrency;
	}

	// Currency data by from and to and custid
	public CurrencyBean listOfCurrency(int custId, String from, String to) {
		Session session = HibernateUtilLive.openSession();
		Transaction tx = null;
		CurrencyBean currencyBean = new CurrencyBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from CurrencyBean where currency_from ='" + from
					+ "' and currency_to = '" + to + "' and customer_id = " + custId + "");

			currencyBean = (CurrencyBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return currencyBean;
	}

	// List Of Challan
	public List<ChallanBean> listOfChallan(int userCustId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ChallanBean> listOfChallan = new ArrayList<ChallanBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ChallanBean where (customerBean.parent_customer_id = '" + userCustId
					+ "' or customerBean = '" + userCustId + "') and status = 1 order by insert_date DESC");
			if (userCustId == 0) {
				query = session.createQuery("from ChallanBean where status = 1 order by insert_date DESC");
			}
			listOfChallan = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfChallan;
	}

	// List Of Challan Line
	public List<ChallanLineBean> listOfChallanLine(String challanId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ChallanLineBean> listOfChallanLine = new ArrayList<ChallanLineBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ChallanLineBean where challan_id = '" + challanId + "'");
			
			listOfChallanLine = query.list();
			System.err.println("DATABASE:" + listOfChallanLine.size());
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfChallanLine;
	}

	// List Of Challan Line
	public long listOfChallanLineCount(String challanId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		long count = 0;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"select count(challan_line_id) from ChallanLineBean where challan_id = '" + challanId + "'");
			
			count = (Long) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	// List Of Challan Line
	public List<ChallanLineBean> listOfChallanForOutChallanLine(String challanId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ChallanLineBean> listOfChallanLine = new ArrayList<ChallanLineBean>();

		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from ChallanLineBean cl where not exists(from ChallanOutLineBean co where cl.workHistoryBean.work_history_id = co.workHistoryBean.work_history_id) and cl.challanBean.challan_id = '"
							+ challanId + "'");
			
			listOfChallanLine = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfChallanLine;
	}
	
	// List Of Challan Line
		public ChallanLineBean detailOfChallanById(String wid) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			ChallanLineBean challanLineBean = new ChallanLineBean();

			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("from ChallanLineBean where workHistoryBean = '"+wid+"' ");
				query.setMaxResults(1);
				challanLineBean = (ChallanLineBean) query.uniqueResult();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			} finally {
				session.close();
			}
			return challanLineBean;
		}

	// Details Of Challan
	public ChallanBean detailsOfChallan(String challanId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		ChallanBean challanBean = new ChallanBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ChallanBean where challan_id ='" + challanId + "'");
			challanBean = (ChallanBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return challanBean;
	}

	// Details Of Challan Out
	public ChallanOutBean detailsOfOutChallan(String challanOutId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		ChallanOutBean challanOutBean = new ChallanOutBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ChallanOutBean where challan_out_id ='" + challanOutId + "'");
			challanOutBean = (ChallanOutBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return challanOutBean;
	}

	// List Of out Challan
	public List<ChallanOutBean> listOfOutChallan(String challanId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ChallanOutBean> listOfOutChallan = new ArrayList<ChallanOutBean>();

		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ChallanOutBean where challanBean = '" + challanId + "'");
			
			listOfOutChallan = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfOutChallan;
	}

	// List Of out Challan line
	public List<ChallanOutLineBean> listOfOutChallanLine(String challanOutId) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<ChallanOutLineBean> listOfOutChallanLine = new ArrayList<ChallanOutLineBean>();

		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from ChallanOutLineBean where challanOutBean = '" + challanOutId + "'");
			
			listOfOutChallanLine = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfOutChallanLine;
	}

	// List Of Work History
	public List<String> listOfWorkHistoryByCustomerByBundle(int count, int custId, int user_id) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("Select bundle_num from WorkHistoryBean where active = 1 and (userBean.customer_id ='"
							+ custId + "' or userBean = '" + user_id + "' or customerBean.parent_customer_id = '"
							+ custId + "') and parent_work_id = '0' and bundle_num !='0' group by bundle_num");
			if (count != 0) {
				query.setMaxResults(count);
			}
			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// List Of Work History
	public List<String> listOfWorkHistoryByBundle(int count) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWork = new ArrayList<String>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"Select bundle_num from WorkHistoryBean where active = 1 and parent_work_id = '0' and bundle_num != '0' group by bundle_num");
			if (count != 0) {
				query.setMaxResults(count);
			}
			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// Details Of Work history using work history id
	public WorkHistoryBean workHistoryIdByBundleId(String bnum) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		WorkHistoryBean workHistoryBean = new WorkHistoryBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from WorkHistoryBean where bundle_num = '" + bnum + "'");
			query.setMaxResults(1);
			workHistoryBean = (WorkHistoryBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return workHistoryBean;
	}

	// List Of Work History
	public List<WorkHistoryBean> listOfWorkHistoryByBundle(String bundle) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<WorkHistoryBean> listOfWork = new ArrayList<WorkHistoryBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from WorkHistoryBean where active = 1 and parent_work_id = '0' and bundle_num = '"
							+ bundle + "' order by insert_date DESC");
			
			listOfWork = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWork;
	}

	// List Of Log
	public List<BundleLogBean> listOfLogByBundle(String bundle) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<BundleLogBean> listOfBundle = new ArrayList<BundleLogBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from BundleLogBean where bundle_num = '" + bundle + "' order by insert_date DESC");
			listOfBundle = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfBundle;
	}

	// List Of handover
	public List<HandoverBean> listOfhandover() {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<HandoverBean> listOfHandover = new ArrayList<HandoverBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from HandoverBean order by handover_date DESC");
			listOfHandover = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfHandover;
	}

	// List Of handover stone
	public List<HandoverStoneBean> listOfhandoverStone(String handoverid) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<HandoverStoneBean> listOfHandoverStone = new ArrayList<HandoverStoneBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery(
					"from HandoverStoneBean where handoverBean = '" + handoverid + "'  order by insert_date_time DESC");
			listOfHandoverStone = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfHandoverStone;
	}
	
	
	// List Of handover stone
		public List<HandoverStoneBean> listOfhandoverStoneByWid(String wid) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<HandoverStoneBean> listOfHandoverStone = new ArrayList<HandoverStoneBean>();
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery(
						"from HandoverStoneBean where workHistoryBean = '" + wid + "'  order by insert_date_time DESC");
				listOfHandoverStone = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfHandoverStone;
		}
	

	// List Of handover stone
	public List<HandoverStoneBean> listOfhandoverStoneWithStatus(String handoverid, String status) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<HandoverStoneBean> listOfHandoverStone = new ArrayList<HandoverStoneBean>();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from HandoverStoneBean where handoverBean = '" + handoverid
					+ "' and  status = '" + status + "' order by insert_date_time DESC");
			listOfHandoverStone = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfHandoverStone;
	}

	// Details Of Handover
	public HandoverBean handoverDetails(String hid) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		HandoverBean handoverBean = new HandoverBean();
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from HandoverBean where handover_id = '" + hid + "'");
			
			handoverBean = (HandoverBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			// e.printStackTrace();
		} finally {
			session.close();
		}
		return handoverBean;
	}
	
	
	
	
	// List Of Challan Line
	public List<String> listOfCountByGroup(String column,int cust_id) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		List<String> listOfWorkhistory = new ArrayList<String>();
		
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("select "+column+" from WorkHistoryBean  where customerBean = '"+cust_id+"' and active = 1 and parent_work_id = '0' group by "+column+"");
			listOfWorkhistory = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listOfWorkhistory;
	}
	
	
	// List Of Challan Line
		public List<String> listOfCountByGroupBykapan(String column,int cust_id,String kapan) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			List<String> listOfWorkhistory = new ArrayList<String>();
			
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery("select "+column+" from WorkHistoryBean  where customerBean = '"+cust_id+"' and kapan_name = '"+kapan+"' and active = 1 and parent_work_id = '0' group by "+column+"");
				listOfWorkhistory = query.list();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			} finally {
				session.close();
			}
			return listOfWorkhistory;
		}

	
	// List Of Challan Line
		public long listOfStone(int custId, String status) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			long count = 0;
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery(
						"select count(work_history_id) from WorkHistoryBean where customerBean = '"+custId+"' and in_stock in ("+status+") and active = 1 and parent_work_id = '0'");
				
				count = (Long) query.uniqueResult();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			} finally {
				session.close();
			}
			return count;
		}
		
		// List Of Challan Line
				public Double listOfStoneCarat(int custId) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					Double count = 0.0;
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("select sum(CAST(actual_weight as float)) from WorkHistoryBean where customer_id = '"+custId+"'");
					
						System.err.println("query"+query);
						
						count = (Double) query.uniqueResult();
						System.err.println("count"+count);
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
						System.out.println(e.getMessage());
					} finally {
						session.close();
					}
					return count;
				}
				
		
				// List Of Challan Line
				public Double listOfclearedCarat(int custId ,String status) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					Double count = 0.0;
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("select sum(CAST(actual_weight as float)) from WorkHistoryBean where customer_id = '"+custId+"' and in_stock in ("+status+")");
						count = (Double) query.uniqueResult();
						
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
						System.out.println(e.getMessage());
					} finally {
						session.close();
					}
					return count;
				}
				
		// List Of Challan Line
		public long listOfStoneByKapan(int custId, String status,String kapan) {
			Session session = HibernateUtil.openSession();
			Transaction tx = null;
			long count = 0;
			try {
				tx = session.getTransaction();
				tx.begin();
				Query query = session.createQuery(
						"select count(work_history_id) from WorkHistoryBean where customerBean = '"+custId+"' and kapan_name = '"+kapan+"' and in_stock in ("+status+") and active = 1 and parent_work_id = '0' ");
				
				count = (Long) query.uniqueResult();
				tx.commit();
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
				e.printStackTrace();
			} finally {
				session.close();
			}
			return count;
		}
		
		
		// List Of Challan Line
				public long listOfStoneByKapanLot(int custId, String status,String kapan,String lot) {
					Session session = HibernateUtil.openSession();
					Transaction tx = null;
					long count = 0;
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery(
								"select count(work_history_id) from WorkHistoryBean where customerBean = '"+custId+"' and kapan_name = '"+kapan+"' and lot_name = '"+lot+"' and in_stock in ("+status+") and active = 1 and parent_work_id = '0'");
						count = (Long) query.uniqueResult();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
					} finally {
						session.close();
					}
					return count;
				}
				
				
				// List Of Challan Line
				public long listOfStoneInvoiced(int custId) {
					Session session = HibernateUtilLive.openSession();
					Transaction tx = null;
					long count = 0;
					
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery(
								"select count(invoice_line_id) from InvoiceLineBean where workHistoryBean.customerBean = '"+custId+"' and active = 1");
						count = (Long) query.uniqueResult();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
					} finally {
						session.close();
					}
					return count;
				}
				
				// List Of Challan Line
				public long listOfStoneInvoicedKapan(int custId,String kapan) {
					Session session = HibernateUtilLive.openSession();
					Transaction tx = null;
					long count = 0;
					
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery(
								"select count(invoice_line_id) from InvoiceLineBean where workHistoryBean.customerBean = '"+custId+"' and kapan_name = '"+kapan+"' and parent_work_id = '0'");
						count = (Long) query.uniqueResult();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
					} finally {
						session.close();
					}
					return count;
				}
				
				
				// List Of Challan Line
				public long listOfStoneInvoicedKapanLot(int custId,String kapan,String lot) {
					Session session = HibernateUtilLive.openSession();
					Transaction tx = null;
					long count = 0;
					
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery(
								"select count(invoice_line_id) from InvoiceLineBean where workHistoryBean.customerBean = '"+custId+"' and kapan_name = '"+kapan+"' and lot_name = '"+lot+"' and parent_work_id = '0'");
						count = (Long) query.uniqueResult();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
					} finally {
						session.close();
					}
					return count;
				}
				
				
				// List Of Payment History By Customer
				public List<PaymentBean> listOfPaymentHistory(int custId) {
					Session session = HibernateUtilLive.openSession();
					Transaction tx = null;
					List<PaymentBean> listOfPayment = new ArrayList<PaymentBean>();
					try {
						tx = session.getTransaction();
						tx.begin();
						Query query = session.createQuery("from PaymentBean where customerBean = '" + custId+"' order by insert_datetime DESC");
						listOfPayment = query.list();
						tx.commit();
					} catch (Exception e) {
						if (tx != null) {
							tx.rollback();
						}
						e.printStackTrace();
					} finally {
						session.close();
					}
					return listOfPayment;
				}


				
				
}
