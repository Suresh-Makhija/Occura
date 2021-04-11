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
@Table(name = "customer_product_rate_tbl")
public class CustomerProductRateBean implements Serializable {

	private int customer_product_rate_id;
	private double discount;
	private Date insert_date;
	private Date deactive_datetime;
	private int active;
	
	private CustomerTypeBean customerTypeBean;
	private CustomerBean customerBean;
	private UserBean userBean;
	private ProductMasterBean productMasterBean;
	
	
	

	public CustomerProductRateBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	public CustomerProductRateBean(double discount, Date insert_date, CustomerTypeBean customerTypeBean,
			CustomerBean customerBean, UserBean userBean, ProductMasterBean productMasterBean,Date deactive_datetime, int active) {
		super();
		this.discount = discount;
		this.insert_date = insert_date;
		this.customerTypeBean = customerTypeBean;
		this.customerBean = customerBean;
		this.userBean = userBean;
		this.productMasterBean = productMasterBean;
		this.deactive_datetime = deactive_datetime;
		this.active = active;
	}
	
	
	public CustomerProductRateBean(int customer_product_rate_id, double discount, Date insert_date,
			CustomerTypeBean customerTypeBean, CustomerBean customerBean, UserBean userBean,
			ProductMasterBean productMasterBean,Date deactive_datetime, int active) {
		super();
		this.customer_product_rate_id = customer_product_rate_id;
		this.discount = discount;
		this.insert_date = insert_date;
		this.customerTypeBean = customerTypeBean;
		this.customerBean = customerBean;
		this.userBean = userBean;
		this.productMasterBean = productMasterBean;
		this.deactive_datetime = deactive_datetime;
		this.active = active;
	}
	
	
	
	@Id
	@Column(name = "customer_product_rate_id")
	public int getCustomer_product_rate_id() {
		return customer_product_rate_id;
	}
	public void setCustomer_product_rate_id(int customer_product_rate_id) {
		this.customer_product_rate_id = customer_product_rate_id;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "customer_type_id")
	public CustomerTypeBean getCustomerTypeBean() {
		return customerTypeBean;
	}
	public void setCustomerTypeBean(CustomerTypeBean customerTypeBean) {
		this.customerTypeBean = customerTypeBean;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
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


	public Date getDeactive_datetime() {
		return deactive_datetime;
	}


	public void setDeactive_datetime(Date deactive_datetime) {
		this.deactive_datetime = deactive_datetime;
	}


	public int getActive() {
		return active;
	}


	public void setActive(int active) {
		this.active = active;
	}
	
	
	
	
	
	
	
	
}
