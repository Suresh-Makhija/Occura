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
@Table(name = "rate_criteria_tbl")
public class RateCriteriaBean implements Serializable {
	
	private int rate_criteria_id;
	private double carat_size_from;
	private double carat_size_to;
	private double count_form;
	private double count_to;
	private double rate;
	private Date effective_date;
	private Date insert_datetime;
	private String name;
	private int status;
	private int customer_id;
	private double sltl_share;
	private double per_discount;
	private double min_rate;
	private double rate_per_stone;
	private double min_rate_per_stone;
	
	private UserBean userBean;
	private CustomerTypeBean customerTypeBean;
	private ProductMasterBean productMasterBean;
	
	
	public RateCriteriaBean() {
		// TODO Auto-generated constructor stub
	}



	public RateCriteriaBean(double carat_size_from, double carat_size_to, double count_form, double count_to,
			double rate, Date effective_date, Date insert_datetime, UserBean userBean,
			CustomerTypeBean customerTypeBean,String name,int status,int customer_id,ProductMasterBean productMasterBean,
			double sltl_share,double per_discount,double min_rate,double rate_per_stone,double min_rate_per_stone) {
		super();
		this.carat_size_from = carat_size_from;
		this.carat_size_to = carat_size_to;
		this.count_form = count_form;
		this.count_to = count_to;
		this.rate = rate;
		this.effective_date = effective_date;
		this.insert_datetime = insert_datetime;
		this.userBean = userBean;
		this.customerTypeBean = customerTypeBean;
		this.name = name;
		this.status = status;
		this.customer_id = customer_id;
		this.productMasterBean = productMasterBean;
		this.sltl_share = sltl_share;
		this.per_discount = per_discount;
		this.min_rate = min_rate;
		this.rate_per_stone = rate_per_stone;
		this.min_rate_per_stone = min_rate_per_stone;
	}
	
	public RateCriteriaBean(int rate_criteria_id, double carat_size_from, double carat_size_to, double count_form,
			double count_to, double rate, Date effective_date, Date insert_datetime, UserBean userBean,
			CustomerTypeBean customerTypeBean,String name,int status,int customer_id,ProductMasterBean productMasterBean,
			double sltl_share,double per_discount,double min_rate,double rate_per_stone,double min_rate_per_stone) {
		super();
		this.rate_criteria_id = rate_criteria_id;
		this.carat_size_from = carat_size_from;
		this.carat_size_to = carat_size_to;
		this.count_form = count_form;
		this.count_to = count_to;
		this.rate = rate;
		this.effective_date = effective_date;
		this.insert_datetime = insert_datetime;
		this.userBean = userBean;
		this.customerTypeBean = customerTypeBean;
		this.name = name;
		this.status = status;
		this.customer_id = customer_id;
		this.productMasterBean = productMasterBean;
		this.sltl_share = sltl_share;
		this.per_discount = per_discount;
		this.min_rate = min_rate;
		this.rate_per_stone = rate_per_stone;
		this.min_rate_per_stone = min_rate_per_stone;
	}
	
	
	
	@Id
	@Column(name = "rate_criteria_id")
	public int getRate_criteria_id() {
		return rate_criteria_id;
	}
	public void setRate_criteria_id(int rate_criteria_id) {
		this.rate_criteria_id = rate_criteria_id;
	}
	public double getCarat_size_from() {
		return carat_size_from;
	}
	public void setCarat_size_from(double carat_size_from) {
		this.carat_size_from = carat_size_from;
	}
	public double getCarat_size_to() {
		return carat_size_to;
	}
	public void setCarat_size_to(double carat_size_to) {
		this.carat_size_to = carat_size_to;
	}
	public double getCount_form() {
		return count_form;
	}
	public void setCount_form(double count_form) {
		this.count_form = count_form;
	}
	public double getCount_to() {
		return count_to;
	}
	public void setCount_to(double count_to) {
		this.count_to = count_to;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public Date getEffective_date() {
		return effective_date;
	}
	public void setEffective_date(Date effective_date) {
		this.effective_date = effective_date;
	}
	public Date getInsert_datetime() {
		return insert_datetime;
	}
	public void setInsert_datetime(Date insert_datetime) {
		this.insert_datetime = insert_datetime;
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
	@JoinColumn(name = "customer_type_id")
	public CustomerTypeBean getCustomerTypeBean() {
		return customerTypeBean;
	}
	public void setCustomerTypeBean(CustomerTypeBean customerTypeBean) {
		this.customerTypeBean = customerTypeBean;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getCustomer_id() {
		return customer_id;
	}


	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}


	@ManyToOne
	@JoinColumn(name = "product_master_id")
	public ProductMasterBean getProductMasterBean() {
		return productMasterBean;
	}


	public void setProductMasterBean(ProductMasterBean productMasterBean) {
		this.productMasterBean = productMasterBean;
	}

	public double getSltl_share() {
		return sltl_share;
	}

	public void setSltl_share(double sltl_share) {
		this.sltl_share = sltl_share;
	}




	public double getPer_discount() {
		return per_discount;
	}




	public void setPer_discount(double per_discount) {
		this.per_discount = per_discount;
	}





	public double getMin_rate() {
		return min_rate;
	}




	public void setMin_rate(double min_rate) {
		this.min_rate = min_rate;
	}



	public double getRate_per_stone() {
		return rate_per_stone;
	}



	public void setRate_per_stone(double rate_per_stone) {
		this.rate_per_stone = rate_per_stone;
	}


	public double getMin_rate_per_stone() {
		return min_rate_per_stone;
	}


	public void setMin_rate_per_stone(double min_rate_per_stone) {
		this.min_rate_per_stone = min_rate_per_stone;
	}
	
	
	
	
	
	
	
	
	
	

}
