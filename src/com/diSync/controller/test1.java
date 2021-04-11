package com.diSync.controller;

import java.util.List;

import com.di.bean.UserBean;
import com.diSync.liveDAO.AllLiveInsertDAO;
import com.diSync.liveDAO.AllLiveListDAO;
import com.diSync.liveDAO.AllLiveUpdateDAO;
import com.diSync.localDAO.AllLocalInsertDAO;
import com.diSync.localDAO.AllLocalListDAO;
import com.diSync.localDAO.AllLocalUpdateDAO;

public class test1 {

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
		
		
		return false;
		
	}
	
	public static void main(String[] args) {
		
		sync sync = new sync();
		sync.userDataSync();
	
	
	}
}
