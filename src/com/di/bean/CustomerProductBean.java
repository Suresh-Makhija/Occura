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
@Table(name = "customer_product_tbl")
public class CustomerProductBean implements Serializable {

	private int customer_product_id;
	private String machine_number;
	private String machine_size;
	private int active;
	private Date insert_datetime;
	
	private ProductMasterBean productMasterBean;
	private CustomerBean customerBean;
	private UserBean userBean;
	
	
	public CustomerProductBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CustomerProductBean(int customer_product_id, String machine_number, String machine_size, int active,
			Date insert_datetime, ProductMasterBean productMasterBean, CustomerBean customerBean, UserBean userBean) {
		super();
		this.customer_product_id = customer_product_id;
		this.machine_number = machine_number;
		this.machine_size = machine_size;
		this.active = active;
		this.insert_datetime = insert_datetime;
		this.productMasterBean = productMasterBean;
		this.customerBean = customerBean;
		this.userBean = userBean;
	}
	
	



	public CustomerProductBean(String machine_number, String machine_size, int active, Date insert_datetime,
			ProductMasterBean productMasterBean, CustomerBean customerBean, UserBean userBean) {
		super();
		this.machine_number = machine_number;
		this.machine_size = machine_size;
		this.active = active;
		this.insert_datetime = insert_datetime;
		this.productMasterBean = productMasterBean;
		this.customerBean = customerBean;
		this.userBean = userBean;
	}






	@Id
	@Column(name = "customer_product_id")
	public int getCustomer_product_id() {
		return customer_product_id;
	}
	public void setCustomer_product_id(int customer_product_id) {
		this.customer_product_id = customer_product_id;
	}
	public String getMachine_number() {
		return machine_number;
	}
	public void setMachine_number(String machine_number) {
		this.machine_number = machine_number;
	}
	public String getMachine_size() {
		return machine_size;
	}
	public void setMachine_size(String machine_size) {
		this.machine_size = machine_size;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
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


	public Date getInsert_datetime() {
		return insert_datetime;
	}


	public void setInsert_datetime(Date insert_datetime) {
		this.insert_datetime = insert_datetime;
	}
	
	
	
	
	
}
