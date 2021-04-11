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
@Table(name = "payment_tbl")
public class PaymentBean implements Serializable {

	private String payment_id;
	private Date insert_datetime;
	private double amount;
	private String remark;
	private Date recieve_date;
	
	private CustomerBean customerBean;

	
	public PaymentBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	public PaymentBean(Date insert_datetime, double amount, String remark, Date recieve_date,
			CustomerBean customerBean) {
		super();
		this.insert_datetime = insert_datetime;
		this.amount = amount;
		this.remark = remark;
		this.recieve_date = recieve_date;
		this.customerBean = customerBean;
	}

	public PaymentBean(String payment_id, Date insert_datetime, double amount, String remark, Date recieve_date,
			CustomerBean customerBean) {
		super();
		this.payment_id = payment_id;
		this.insert_datetime = insert_datetime;
		this.amount = amount;
		this.remark = remark;
		this.recieve_date = recieve_date;
		this.customerBean = customerBean;
	}


	@Id
	@Column(name = "payment_id")
	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public Date getInsert_datetime() {
		return insert_datetime;
	}

	public void setInsert_datetime(Date insert_datetime) {
		this.insert_datetime = insert_datetime;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getRecieve_date() {
		return recieve_date;
	}

	public void setRecieve_date(Date recieve_date) {
		this.recieve_date = recieve_date;
	}

	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}

	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}
	
	
	
	
}
