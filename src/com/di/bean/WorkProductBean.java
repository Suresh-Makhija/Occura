package com.di.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "work_product_tbl")
public class WorkProductBean implements Serializable {

	private String work_product_id;
	private Date insert_datetime;
	private String customer_code;
	private int active;
	
	private ProductMasterBean productMasterBean;
	private WorkHistoryBean workHistoryBean;
	
	
	public WorkProductBean() {
		// TODO Auto-generated constructor stub
	}
	
	public WorkProductBean(Date insert_datetime, String customer_code, ProductMasterBean productMasterBean,
			WorkHistoryBean workHistoryBean,int active) {
		super();
		this.insert_datetime = insert_datetime;
		this.customer_code = customer_code;
		this.productMasterBean = productMasterBean;
		this.workHistoryBean = workHistoryBean;
		this.active = active;
	}
	
	public WorkProductBean(String work_product_id, Date insert_datetime, String customer_code,
			ProductMasterBean productMasterBean, WorkHistoryBean workHistoryBean,int active) {
		super();
		this.work_product_id = work_product_id;
		this.insert_datetime = insert_datetime;
		this.customer_code = customer_code;
		this.productMasterBean = productMasterBean;
		this.workHistoryBean = workHistoryBean;
		this.active = active;
	}
	
	
	@Id
	@Column(name = "work_product_id")
	public String getWork_product_id() {
		return work_product_id;
	}

	public void setWork_product_id(String work_product_id) {
		this.work_product_id = work_product_id;
	}
	
	public Date getInsert_datetime() {
		return insert_datetime;
	}

	public void setInsert_datetime(Date insert_datetime) {
		this.insert_datetime = insert_datetime;
	}
	public String getCustomer_code() {
		return customer_code;
	}
	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}
	
	@ManyToOne
	@JoinColumn(name = "product_master_id")
	public ProductMasterBean getProductMasterBean() {
		return productMasterBean;
	}
	public void setProductMasterBean(ProductMasterBean productMasterBean) {
		this.productMasterBean = productMasterBean;
	}
	
	@ManyToOne
	@JoinColumn(name = "work_history_id")
	public WorkHistoryBean getWorkHistoryBean() {
		return workHistoryBean;
	}
	public void setWorkHistoryBean(WorkHistoryBean workHistoryBean) {
		this.workHistoryBean = workHistoryBean;
	}


	public int getActive() {
		return active;
	}


	public void setActive(int active) {
		this.active = active;
	}
	
	
	
	
	
	
}
