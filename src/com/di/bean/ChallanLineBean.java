package com.di.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "challan_line_tbl")
public class ChallanLineBean implements Serializable {

	private String challan_line_id;
	private double per_carat_rate;
	private double final_rate;
	
	
	private ProductMasterBean productMasterBean;
	private ChallanBean challanBean;
	private WorkHistoryBean workHistoryBean;
	
	public ChallanLineBean() {
		// TODO Auto-generated constructor stub
	}
	
	

	public ChallanLineBean(String challan_line_id, ChallanBean challanBean, WorkHistoryBean workHistoryBean,double per_carat_rate, double final_rate, ProductMasterBean productMasterBean) {
		super();
		this.challan_line_id = challan_line_id;
		this.challanBean = challanBean;
		this.workHistoryBean = workHistoryBean;
		this.per_carat_rate = per_carat_rate;
		this.final_rate = final_rate;
		this.productMasterBean = productMasterBean;
	}


	public ChallanLineBean(ChallanBean challanBean, WorkHistoryBean workHistoryBean,double per_carat_rate, double final_rate, ProductMasterBean productMasterBean) {
		super();
		this.challanBean = challanBean;
		this.workHistoryBean = workHistoryBean;
		this.per_carat_rate = per_carat_rate;
		this.final_rate = final_rate;
		this.productMasterBean = productMasterBean;
	}


	@Id
	@Column(name = "challan_line_id")
	public String getChallan_line_id() {
		return challan_line_id;
	}
	public void setChallan_line_id(String challan_line_id) {
		this.challan_line_id = challan_line_id;
	}
	
	@ManyToOne
	@JoinColumn(name = "challan_id")
	public ChallanBean getChallanBean() {
		return challanBean;
	}
	public void setChallanBean(ChallanBean challanBean) {
		this.challanBean = challanBean;
	}
	
	@ManyToOne
	@JoinColumn(name = "work_history_id")
	public WorkHistoryBean getWorkHistoryBean() {
		return workHistoryBean;
	}
	public void setWorkHistoryBean(WorkHistoryBean workHistoryBean) {
		this.workHistoryBean = workHistoryBean;
	}

	public double getPer_carat_rate() {
		return per_carat_rate;
	}

	public void setPer_carat_rate(double per_carat_rate) {
		this.per_carat_rate = per_carat_rate;
	}

	public double getFinal_rate() {
		return final_rate;
	}

	public void setFinal_rate(double final_rate) {
		this.final_rate = final_rate;
	}

	@ManyToOne
	@JoinColumn(name = "product_master_id")
	public ProductMasterBean getProductMasterBean() {
		return productMasterBean;
	}

	public void setProductMasterBean(ProductMasterBean productMasterBean) {
		this.productMasterBean = productMasterBean;
	}
	
	
	
	
}
