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
@Table(name = "challan_tbl")
public class ChallanBean implements Serializable {

	private String challan_id;
	private String challan_number;
	private Date insert_date;
	private int status;
	
	private UserBean userBean;
	private CustomerBean customerBean;
	
	public ChallanBean() {
		// TODO Auto-generated constructor stub
	}
	

	

	public ChallanBean(String challan_id, String challan_number, Date insert_date, UserBean userBean,
			CustomerBean customerBean,int status) {
		super();
		this.challan_id = challan_id;
		this.challan_number = challan_number;
		this.insert_date = insert_date;
		this.userBean = userBean;
		this.customerBean = customerBean;
		this.status = status;
	}




	public ChallanBean(String challan_number, Date insert_date, UserBean userBean, 
			CustomerBean customerBean,int status) {
		super();
		this.challan_number = challan_number;
		this.insert_date = insert_date;
		this.userBean = userBean;
		this.customerBean = customerBean;
		this.status = status;
	}
	
	
	@Id
	@Column(name = "challan_id")
	public String getChallan_id() {
		return challan_id;
	}
	public void setChallan_id(String challan_id) {
		this.challan_id = challan_id;
	}
	public String getChallan_number() {
		return challan_number;
	}

	public void setChallan_number(String challan_number) {
		this.challan_number = challan_number;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
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
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}




	public int getStatus() {
		return status;
	}




	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
}
