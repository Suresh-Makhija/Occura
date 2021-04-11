package com.di.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "handover_stone_tbl")
public class HandoverStoneBean implements Serializable {

	private String handover_stone_id;
	private String status;
	private Date insert_date_time;
	private Date return_date_time;
	private String remark;
	
	private WorkHistoryBean workHistoryBean;
	private HandoverBean handoverBean;
	
	
	
	public HandoverStoneBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public HandoverStoneBean(String status, Date insert_date_time, Date return_date_time,
			WorkHistoryBean workHistoryBean, HandoverBean handoverBean,String remark) {
		super();
		this.status = status;
		this.insert_date_time = insert_date_time;
		this.return_date_time = return_date_time;
		this.workHistoryBean = workHistoryBean;
		this.handoverBean = handoverBean;
		this.remark = remark;
	}
	public HandoverStoneBean(String handover_stone_id, String status, Date insert_date_time, Date return_date_time,
			WorkHistoryBean workHistoryBean, HandoverBean handoverBean,String remark) {
		super();
		this.handover_stone_id = handover_stone_id;
		this.status = status;
		this.insert_date_time = insert_date_time;
		this.return_date_time = return_date_time;
		this.workHistoryBean = workHistoryBean;
		this.handoverBean = handoverBean;
		this.remark = remark;
	}
	
	
	@Id
	@Column(name = "handover_stone_id")
	public String getHandover_stone_id() {
		return handover_stone_id;
	}
	public void setHandover_stone_id(String handover_stone_id) {
		this.handover_stone_id = handover_stone_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "work_history_id")
	public WorkHistoryBean getWorkHistoryBean() {
		return workHistoryBean;
	}
	public void setWorkHistoryBean(WorkHistoryBean workHistoryBean) {
		this.workHistoryBean = workHistoryBean;
	}
	
	@ManyToOne
	@JoinColumn(name = "handover_id")
	public HandoverBean getHandoverBean() {
		return handoverBean;
	}
	public void setHandoverBean(HandoverBean handoverBean) {
		this.handoverBean = handoverBean;
	}
	public Date getInsert_date_time() {
		return insert_date_time;
	}
	public void setInsert_date_time(Date insert_date_time) {
		this.insert_date_time = insert_date_time;
	}
	public Date getReturn_date_time() {
		return return_date_time;
	}
	public void setReturn_date_time(Date return_date_time) {
		this.return_date_time = return_date_time;
	}



	public String getRemark() {
		return remark;
	}



	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	
	
}
