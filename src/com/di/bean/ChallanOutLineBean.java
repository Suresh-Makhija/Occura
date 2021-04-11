package com.di.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "challan_out_line_tbl")
public class ChallanOutLineBean implements Serializable {

	private String challan_out_line_id;
	
	private ChallanOutBean challanOutBean;
	private WorkHistoryBean workHistoryBean;
	
	
	public ChallanOutLineBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public ChallanOutLineBean(String challan_out_line_id,
			ChallanOutBean challanOutBean, WorkHistoryBean workHistoryBean) {
		super();
		this.challan_out_line_id = challan_out_line_id;
		this.challanOutBean = challanOutBean;
		this.workHistoryBean = workHistoryBean;
	}




	public ChallanOutLineBean(ChallanOutBean challanOutBean,
			WorkHistoryBean workHistoryBean) {
		super();
		this.challanOutBean = challanOutBean;
		this.workHistoryBean = workHistoryBean;
	}




	@Id
	@Column(name = "challan_out_line_id")
	public String getChallan_out_line_id() {
		return challan_out_line_id;
	}
	public void setChallan_out_line_id(String challan_out_line_id) {
		this.challan_out_line_id = challan_out_line_id;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "challan_out_id")
	public ChallanOutBean getChallanOutBean() {
		return challanOutBean;
	}
	public void setChallanOutBean(ChallanOutBean challanOutBean) {
		this.challanOutBean = challanOutBean;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "work_history_id")
	public WorkHistoryBean getWorkHistoryBean() {
		return workHistoryBean;
	}
	public void setWorkHistoryBean(WorkHistoryBean workHistoryBean) {
		this.workHistoryBean = workHistoryBean;
	}
	
	
	
	
	
}
