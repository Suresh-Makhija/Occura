package com.diSync.controller;

import java.util.List;

import org.springframework.cglib.core.Local;

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
import com.diSync.liveDAO.AllLiveInsertDAO;
import com.diSync.liveDAO.AllLiveListDAO;
import com.diSync.liveDAO.AllLiveUpdateDAO;
import com.diSync.localDAO.AllLocalInsertDAO;
import com.diSync.localDAO.AllLocalListDAO;
import com.diSync.localDAO.AllLocalUpdateDAO;

public class sync {

	
	AllLiveListDAO allLiveListDAO = new AllLiveListDAO();
	AllLiveUpdateDAO allLiveUpdateDAO = new AllLiveUpdateDAO();
	AllLiveInsertDAO allLiveInsertDAO = new AllLiveInsertDAO();
	
	
	AllLocalListDAO allLocalListDAO = new AllLocalListDAO();
	AllLocalUpdateDAO allLocalUpdateDAO = new AllLocalUpdateDAO();
	AllLocalInsertDAO allLocalInsertDAO = new AllLocalInsertDAO();
	
	public boolean userDataSync() {
		
		System.out.println("Syncing User....");
		
		List<UserBean> listOfUser = allLocalListDAO.listOfUser();
		for(UserBean u : listOfUser) {
			
			int userId = u.getUser_id();
			UserBean liveUserBean = allLiveListDAO.detailsOfUser(userId);
			
			if(userId != 1001) {
				
			if(liveUserBean != null) {
				
			liveUserBean.setPassword(u.getPassword());
			
			/*Update Live --> Local*/
			boolean updateLocalUser = allLocalUpdateDAO.userUpdate(liveUserBean);
			
			/*Update Local --> Live*/
			boolean updateLiveUser = allLiveUpdateDAO.userUpdate(liveUserBean);
			
			
			
			}
			}
			
		}
		
		System.out.println("Syncing User completed....");
		
		return false;
		
	}
	
	
	public boolean customerProductSync(String custId) {
		System.out.println("Syncing Customer Product....");
		
		/*Live ---> Local*/
		
		List<CustomerProductBean> listOfProduct = allLiveListDAO.listOfCustomerProduct(custId);
		
		for(CustomerProductBean c : listOfProduct) {
			
			/*Update Live --> Local*/
			boolean updateLocalCustomerProduct = allLocalUpdateDAO.customerProductUpdate(c);
			
			if(updateLocalCustomerProduct == false) {
				/*Insert Live --> Local*/
				boolean insertLocalCuSstomerProduct = allLocalInsertDAO.customerProductInsert(c);
			}
			
			
		}
		
		
		/*Local --> Live*/
		
		List<CustomerProductBean> listOfLocalProduct = allLocalListDAO.listOfCustomerProduct(custId);
		
		for(CustomerProductBean c : listOfLocalProduct) {
			
			/*Update Local --> Live*/
			boolean updateLocalCustomerProduct = allLiveUpdateDAO.customerProductUpdate(c);
			
			if(updateLocalCustomerProduct == false) {
				/*Insert Local --> Live*/
				boolean insertLocalCustomerProduct = allLiveInsertDAO.customerProductInsert(c);
			}
			
		}
		
		return false;
		
	}
	
	
	
	public boolean statusSync() {
		
		System.out.println("Syncing Status....");
		
		/*Live ---> Local*/
		List<StatusBean> listOfStatus = allLiveListDAO.listOfStatus();
		
		
		for(StatusBean s : listOfStatus) {
			
			/*Update Live --> Local*/	
			boolean updateLocalStatus = allLocalUpdateDAO.statusUpdate(s);
			
			
			if(updateLocalStatus == false) {
				/*Insert Live --> Local*/
				boolean insertLocalStatus = allLocalInsertDAO.statusInsert(s);
				
			}
			
		}
		
		
		return false;
	}
	
	
	
	public boolean productSync() {
		
		System.out.println("Syncing Product....");
		
		/*Live ---> Local*/
		List<ProductMasterBean> listOfProduct = allLiveListDAO.listOfProduct();
		
		
		for(ProductMasterBean p : listOfProduct) {
			
			/*Update Live --> Local*/	
			boolean updateLocalProduct = allLocalUpdateDAO.productUpdate(p);
			
			if(updateLocalProduct == false) {
				/*Insert Live --> Local*/
				boolean insertLocalStatus = allLocalInsertDAO.productInsert(p);
			}
			
		}
		
		return false;
	}
	
	
	public boolean productProcessSync() {
		
		System.out.println("Syncing Product Process....");
		
		/*Live ---> Local*/
		List<ProductProcessBean> listOfProductProcess = allLiveListDAO.listOfProductProcess();
		
		
		for(ProductProcessBean p : listOfProductProcess) {
			System.out.println(p.getProduct_process_id());
			/*Update Live --> Local*/	
			boolean updateLocalProductProcess = allLocalUpdateDAO.productProcessUpdate(p);
			
			if(updateLocalProductProcess == false) {
				/*Insert Live --> Local*/
				boolean insertLocalStatus = allLocalInsertDAO.productProcessInsert(p);
			}
			
		}
		
		return false;
	}
		
	
	
	
	public boolean customerSync(String custId) {
		
		System.out.println("Syncing Customer....");
		
		/*Local ---> Live*/
		List<CustomerBean> listOfCustomerLocal = allLocalListDAO.listOfCustomer(custId);
		System.out.println(listOfCustomerLocal.size());
		
		for(CustomerBean c : listOfCustomerLocal) {
			
			/*Update Local --> Live*/	
			boolean updateLocalCustomer = allLiveUpdateDAO.customerUpdate(c);
			
			if(updateLocalCustomer == false) {
				/*Insert Live --> Local*/
				boolean insertLocalCustomer = allLiveInsertDAO.customerInsert(c);
			}
			
		}
		
		
		/*Live ---> Local*/
		List<CustomerBean> listOfCustomer = allLiveListDAO.listOfCustomer(custId);
		
		
		for(CustomerBean c : listOfCustomer) {
			
			/*Update Live --> Local*/	
			boolean updateLocalCustomer = allLocalUpdateDAO.customerUpdate(c);
			
			
			if(updateLocalCustomer == false) {
				/*Insert Live --> Local*/
				boolean insertLocalCustomer = allLocalInsertDAO.customerInsert(c);
			}
			
		}
		
		customerProductSync(custId);
		
		return false;
	}
	
	
	
	public boolean workHistorySync(String custId) {
		
		
		
		/*Local ---> Live*/
		List<WorkHistoryBean> listOfWorkHistory = allLocalListDAO.listOfWorkHistory(custId);
		
		System.out.println("Syncing Work History...."+listOfWorkHistory.size());
		for(WorkHistoryBean w : listOfWorkHistory) {
			
			/*Update Local --> Live*/	
			boolean updateLocalWorkHistory = allLiveUpdateDAO.workHistoryUpdate(w);
			System.out.println("updateLocalWorkHistory :"+updateLocalWorkHistory);
			if(updateLocalWorkHistory == false) {
				/*Insert Local --> Live*/
				boolean insertLocalStatus = allLiveInsertDAO.workHistoryInsert(w);
				System.out.println("insertLocalStatus :"+insertLocalStatus);
			}
			
		}
		
		
		
		/*Live ---> Local*/
		List<WorkHistoryBean> listOfWorkHistoryLive = allLiveListDAO.listOfWorkHistory(custId);
		
		
		for(WorkHistoryBean w : listOfWorkHistoryLive) {
			
			/*Update Live --> Local*/	
			boolean updateLocalWorkHistory = allLocalUpdateDAO.workHistoryUpdate(w);
			
			if(updateLocalWorkHistory == false) {
				/*Insert Local --> Live*/
				boolean insertLocalWorkHistory = allLocalInsertDAO.workHistoryInsert(w);
			}
			
		}

		/* workHistoryProductProcessSync(custId);  */ // by chirag 17/06/2020
		workHistoryProductSync(custId);
		
		return false;
	}
	
	
	
	public boolean workHistoryProductSync(String custId) {
		
		System.out.println("Syncing Work History Product....");
		
		/*Local --> Live*/
		List<WorkProductBean> listOfWorkProduct = allLocalListDAO.listOfWorkProduct(custId);
		
		
		for(WorkProductBean w : listOfWorkProduct) {
			
			/*Update Local --> Live*/	
			boolean updateLocalWorkHistory = allLiveUpdateDAO.workHistoryproductUpdate(w);
			
			
			if(updateLocalWorkHistory == false) {
				/*Insert Local --> Live*/
				boolean insertLocalStatus = allLiveInsertDAO.workHistoryProductInsert(w);
				System.out.println("Syncing Work History Product Insert");
			}
			
		}
		
		System.out.println("Syncing Work History Product Completed....");
		
		/*Live --> Local*/
		List<WorkProductBean> listOfWorkProductLive = allLiveListDAO.listOfWorkProduct(custId);
		
		
		for(WorkProductBean w : listOfWorkProductLive) {
			
			/*Update Live --> Local*/	
			boolean updateLocalWorkHistory = allLocalUpdateDAO.workHistoryproductUpdate(w);
			
			
			if(updateLocalWorkHistory == false) {
				/*Insert Live --> Local*/
				boolean insertLocalStatus = allLocalInsertDAO.workHistoryProductInsert(w);
			}
			
		}
		
		System.out.println("Syncing Work ProductBean Completed....");
		
		workHistoryProductProcessSync(custId);
		
		return false;
	}
	
	
	
	public boolean workHistoryProductProcessSync(String custId) {
		
		System.out.println("Syncing Work History Product Process....");
		System.err.println("Local to Live");
		/*Local --> Live*/
		List<WorkProductProcessBean> listOfWorkProductProcessLocal = allLocalListDAO.listOfWorkproductProcess(custId);
		System.out.println("===================="+listOfWorkProductProcessLocal.size());
		for(WorkProductProcessBean w : listOfWorkProductProcessLocal) {
			System.out.println(w.getWork_product_process_id());
			/*Update Local --> Live	*/
			boolean updateLocalWorkHistoryProcess = allLiveUpdateDAO.workProductProcessUpdate(w);
			//System.out.println(updateLocalWorkHistoryProcess);
			List<WorkProductProcessBean> listOfData = allLiveListDAO.listOfWorkProductProcessByWorkProductProcessId(w.getWork_product_process_id());
			if(listOfData.size() == 0) {
				if(updateLocalWorkHistoryProcess == false) {
					/*Insert Local --> Live*/
					boolean insertLocalWorkProcess = allLiveInsertDAO.workProductProcessInsert(w);
			}
			}
		}
		
		
		System.err.println("Live to local");
		
		/*Live --> Local*/
		List<WorkProductProcessBean> listOfWorkProductProcessLive = allLiveListDAO.listOfWorkproductProcess(custId);
		System.out.println(listOfWorkProductProcessLive.size());
		for(WorkProductProcessBean w : listOfWorkProductProcessLive) {
			/*Update Live --> Local	*/
			boolean updateLiveWorkHistoryProcess = allLocalUpdateDAO.workProductProcessUpdate(w);
			System.out.println(updateLiveWorkHistoryProcess);
			List<WorkProductProcessBean> listOfData = allLocalListDAO.listOfWorkProductProcessByWorkProductProcessId(w.getWork_product_process_id());
			if(listOfData.size() == 0) {
			if(updateLiveWorkHistoryProcess == false) {
				/*Insert Live --> Local*/
				boolean insertLocalWorkProcess = allLocalInsertDAO.workProductProcessInsert(w);
			}
			}
		}
		
		return false;
	}
	
	
	
	
	public boolean customerTypeSync() {
		
		/*Live ---> Local*/
		List<CustomerTypeBean> listOfCustomerType = allLiveListDAO.listOfCustomerType();
		
		
		for(CustomerTypeBean c : listOfCustomerType) {
			
			/*Update Live --> Local*/	
			boolean updateLocalCustomer = allLocalUpdateDAO.customerTypeUpdate(c);
			
			System.out.println(updateLocalCustomer);
			
			if(updateLocalCustomer == false) {
				/*Insert Live --> Local*/
				boolean insertLocalStatus = allLocalInsertDAO.customerTypeInsert(c);
				
			}
			
		}
		
		
		return false;
	}
	
	
	public boolean challanSync(String custId) {
		
		System.out.println("===START Challan Sync");
		
		/*Local --> Live*/
		List<ChallanBean> listOfChallan = allLocalListDAO.listOfChallan(custId);
		
		System.out.println(listOfChallan.size());
		
		for(ChallanBean c : listOfChallan) {
			System.out.println(c.getChallan_id());
			/*Update Local --> Live	*/
			boolean updateLocalChallan = allLiveUpdateDAO.updateChallan(c);
			
				if(updateLocalChallan == false) {
					/*Insert Local --> Live*/
					boolean insertLocalWorkProcess = allLiveInsertDAO.chllanInsert(c);
				}
		}
		
		
		/*Live --> Local*/
		List<ChallanBean> listOfChallanLive = allLiveListDAO.listOfChallan(custId);
		
		
		for(ChallanBean c : listOfChallanLive) {
			System.out.println(c.getChallan_id());
			/*Update Live --> Local	*/
			boolean updateLocalChallan = allLocalUpdateDAO.updateChallan(c);
			
				if(updateLocalChallan == false) {
					/*Insert Local --> Live*/
					boolean insertLocalWorkProcess = allLocalInsertDAO.chllanInsert(c);
				}
		}
		
		challanLineSync(custId);
		
		return false;
	}
	
	
	public boolean challanLineSync(String custId) {
		
		System.out.println("===START Challan Line Sync");
		
		/*Local --> Live*/
		List<ChallanLineBean> listOfChallanLine = allLocalListDAO.listOfChallanLine(custId);
		
		
		for(ChallanLineBean c : listOfChallanLine) {
			System.out.println(c.getChallan_line_id());
			/*Update Local --> Live	*/
			boolean updateLocalChallanLine = allLiveUpdateDAO.updateChallanLine(c);
			
				if(updateLocalChallanLine == false) {
					/*Insert Local --> Live*/
					boolean insertLocalWorkProcess = allLiveInsertDAO.chllanLineInsert(c);
				}
		}
		
		
		/*Live --> Local*/
		List<ChallanLineBean> listOfChallanLineLive = allLiveListDAO.listOfChallanLine(custId);
		
		
		for(ChallanLineBean c : listOfChallanLineLive) {
			System.out.println(c.getChallan_line_id());
			/*Update Live --> Local	*/
			boolean updateLocalChallan = allLocalUpdateDAO.updateChallanLine(c);
			
				if(updateLocalChallan == false) {
					/*Insert Local --> Live*/
					boolean insertLocalWorkProcess = allLocalInsertDAO.chllanLineInsert(c);
				}
		}
		
		return false;
	}
	
	
	public boolean challanOutSync(String custId) {
			
		System.out.println("===START Challan out Sync");	
		
			/*Local --> Live*/
			List<ChallanOutBean> listOfChallanOut = allLocalListDAO.listOfChallanOut(custId);
			
			
			for(ChallanOutBean c : listOfChallanOut) {
				
				/*Update Local --> Live	*/
				boolean updateLocalChallanOut = allLiveUpdateDAO.updateChallanOut(c);
				
					if(updateLocalChallanOut == false) {
						/*Insert Local --> Live*/
						boolean insertLocalWorkProcess = allLiveInsertDAO.chllanOutInsert(c);
					}
			}
			
			
			/*Live --> Local*/
			List<ChallanOutBean> listOfChallanOutLive = allLiveListDAO.listOfChallanOut(custId);
			
			
			for(ChallanOutBean c : listOfChallanOutLive) {
				
				/*Update Live --> Local	*/
				boolean updateLocalChallan = allLocalUpdateDAO.updateChallanOut(c);
				
					if(updateLocalChallan == false) {
						/*Insert Local --> Live*/
						boolean insertLocalWorkProcess = allLocalInsertDAO.chllanOutInsert(c);
					}
			}
			
			challanOutLineSync(custId);
			
			return false;
		}
	
	
	public boolean challanOutLineSync(String custId) {
		
		System.out.println("===START Challan out Line Sync");
		
		/*Local --> Live*/
		List<ChallanOutLineBean> listOfChallanOutLine = allLocalListDAO.listOfChallanOutLine(custId);
		
		
		for(ChallanOutLineBean c : listOfChallanOutLine) {
			
			/*Update Local --> Live	*/
			boolean updateLocalChallanLine = allLiveUpdateDAO.updateChallanOutLine(c);
			
				if(updateLocalChallanLine == false) {
					/*Insert Local --> Live*/
					boolean insertLocalWorkProcess = allLiveInsertDAO.chllanOutLineInsert(c);
				}
		}
		
		
		/*Live --> Local*/
		List<ChallanOutLineBean> listOfChallanLineLive = allLiveListDAO.listOfChallanOutLine(custId);
		
		
		for(ChallanOutLineBean c : listOfChallanLineLive) {
			
			/*Update Live --> Local	*/
			boolean updateLocalChallan = allLocalUpdateDAO.updateChallanOutLine(c);
			
				if(updateLocalChallan == false) {
					/*Insert Local --> Live*/
					boolean insertLocalWorkProcess = allLocalInsertDAO.chllanOutLineInsert(c);
				}
		}
		
		return false;
	}
	
	
}
