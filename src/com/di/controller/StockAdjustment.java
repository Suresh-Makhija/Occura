package com.di.controller;

import java.util.Date;
import java.util.List;

import com.di.bean.ChallanLineBean;
import com.di.bean.HandoverStoneBean;
import com.di.bean.WorkHistoryBean;
import com.di.dao.AllListDAO;
import com.di.dao.AllUpdateDAO;

public class StockAdjustment {

	public void adjust() {
		
		AllListDAO allListDAO = new AllListDAO();
		AllUpdateDAO allUpdateDAO = new AllUpdateDAO();
		List<WorkHistoryBean> listOfworkhistory = allListDAO.listOfWorkHistory(0);
		System.out.println(listOfworkhistory.size());
		for(WorkHistoryBean workHistoryBean : listOfworkhistory) {
			String wid = workHistoryBean.getWork_history_id();                                                                                                                                               
			//System.out.println(wid);
			ChallanLineBean challanLineBean = allListDAO.detailOfChallanById(wid);
			if(challanLineBean != null) {
				System.err.println(challanLineBean.getWorkHistoryBean().getWork_history_id());
				boolean update = allUpdateDAO.updateWorkStockStatus(wid, workHistoryBean.getUserBean().getUser_id(), 2);
				//System.out.println("true");
			}else {
				System.out.println(wid);
				boolean update = allUpdateDAO.updateWorkStockStatus(wid, workHistoryBean.getUserBean().getUser_id(), 0);
			}
			
			/*List<HandoverStoneBean> listOfStone = allListDAO.listOfhandoverStoneByWid(wid);
			if(listOfStone.size() != 0) {
				for(HandoverStoneBean h : listOfStone) {
					//System.err.println(h.getStatus());
					if(h.getStatus().equalsIgnoreCase("assign")) {
						//boolean updateStatus = allUpdateDAO.handoverStatusUpdateUsingwid(wid, "return", new Date());
					}
				}
			}*/
			
		}
		
	}
	
}
