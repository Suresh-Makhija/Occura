package com.di.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "currency_tbl")
public class CurrencyBean implements Serializable {

	
	private int currency_id;
	private String currency_from;
	private String currency_to;
	private double conversion;
	private Date insert_date;
	private int customer_id;
	
	
	public CurrencyBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	public CurrencyBean(String currency_from, String currency_to, double conversion, Date insert_date,
			int customer_id) {
		super();
		this.currency_from = currency_from;
		this.currency_to = currency_to;
		this.conversion = conversion;
		this.insert_date = insert_date;
		this.customer_id = customer_id;
	}


	public CurrencyBean(int currency_id, String currency_from, String currency_to, double conversion, Date insert_date,
			int customer_id) {
		super();
		this.currency_id = currency_id;
		this.currency_from = currency_from;
		this.currency_to = currency_to;
		this.conversion = conversion;
		this.insert_date = insert_date;
		this.customer_id = customer_id;
	}
	
	
	@Id
	@Column(name = "currency_id")
	public int getCurrency_id() {
		return currency_id;
	}
	public void setCurrency_id(int currency_id) {
		this.currency_id = currency_id;
	}
	public String getCurrency_from() {
		return currency_from;
	}
	public void setCurrency_from(String currency_from) {
		this.currency_from = currency_from;
	}
	public String getCurrency_to() {
		return currency_to;
	}
	public void setCurrency_to(String currency_to) {
		this.currency_to = currency_to;
	}
	public double getConversion() {
		return conversion;
	}
	public void setConversion(double conversion) {
		this.conversion = conversion;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	
	
	
	
}
