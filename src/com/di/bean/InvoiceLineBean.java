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
@Table(name = "invoice_line_tbl")
public class InvoiceLineBean implements Serializable {

	private String invoice_line_id;
	private String carat;
	private double rate;
	private Date insert_date_time;
	private int min_rate_flag;
	private int active;
	private double perStoneRate;
	
	private WorkHistoryBean workHistoryBean;
	private InvoiceBean invoiceBean;
	private UserBean userBean;
	private ProductMasterBean productMasterBean;
	
	
	
	public InvoiceLineBean() {
		// TODO Auto-generated constructor stub
	}


	public InvoiceLineBean(int active) {
		super();
		
	}

	

	public InvoiceLineBean(String carat, double rate, Date insert_date_time, WorkHistoryBean workHistoryBean,
			InvoiceBean invoiceBean, UserBean userBean,
			ProductMasterBean productMasterBean,int min_rate_flag,int active,double perStoneRate) {
		super();
		this.carat = carat;
		this.rate = rate;
		this.insert_date_time = insert_date_time;
		this.workHistoryBean = workHistoryBean;
		this.invoiceBean = invoiceBean;
		this.userBean = userBean;
		this.productMasterBean = productMasterBean;
		this.min_rate_flag = min_rate_flag;
		this.active = active;
		this.perStoneRate = perStoneRate;
	}
	
	
	public InvoiceLineBean(String invoice_line_id, String carat, double rate, Date insert_date_time,
			WorkHistoryBean workHistoryBean, InvoiceBean invoiceBean, UserBean userBean,
			ProductMasterBean productMasterBean,int min_rate_flag,int active,double perStoneRate) {
		super();
		this.invoice_line_id = invoice_line_id;
		this.carat = carat;
		this.rate = rate;
		this.insert_date_time = insert_date_time;
		this.workHistoryBean = workHistoryBean;
		this.invoiceBean = invoiceBean;
		this.userBean = userBean;
		this.productMasterBean = productMasterBean;
		this.min_rate_flag = min_rate_flag;
		this.active = active;
		this.perStoneRate = perStoneRate;
	}
	
	
	@Id
	@Column(name = "invoice_line_id")
	public String getInvoice_line_id() {
		return invoice_line_id;
	}
	public void setInvoice_line_id(String invoice_line_id) {
		this.invoice_line_id = invoice_line_id;
	}
	public String getCarat() {
		return carat;
	}
	public void setCarat(String carat) {
		this.carat = carat;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public Date getInsert_date_time() {
		return insert_date_time;
	}
	public void setInsert_date_time(Date insert_date_time) {
		this.insert_date_time = insert_date_time;
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
	@JoinColumn(name = "invoice_id")
	public InvoiceBean getInvoiceBean() {
		return invoiceBean;
	}
	public void setInvoiceBean(InvoiceBean invoiceBean) {
		this.invoiceBean = invoiceBean;
	}
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	public UserBean getUserBean() {
		return userBean;
	}
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}


	@ManyToOne
	@JoinColumn(name = "product_master_id")
	public ProductMasterBean getProductMasterBean() {
		return productMasterBean;
	}


	public void setProductMasterBean(ProductMasterBean productMasterBean) {
		this.productMasterBean = productMasterBean;
	}


	public int getMin_rate_flag() {
		return min_rate_flag;
	}

	public void setMin_rate_flag(int min_rate_flag) {
		this.min_rate_flag = min_rate_flag;
	}


	public int getActive() {
		return active;
	}



	public void setActive(int active) {
		this.active = active;
	}


	public double getPerStoneRate() {
		return perStoneRate;
	}


	public void setPerStoneRate(double perStoneRate) {
		this.perStoneRate = perStoneRate;
	}


	
	
}
