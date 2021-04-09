package com.di.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product_master_tbl")
public class ProductMasterBean implements Serializable {

	private int product_master_id;
	private String product_name;
	private String product_category;
	private Date insert_date;
	private int active;
	
	
	public ProductMasterBean() {
		// TODO Auto-generated constructor stub
	}
	



	public ProductMasterBean(String product_name, String product_category, Date insert_date, int active) {
		super();
		this.product_name = product_name;
		this.product_category = product_category;
		this.insert_date = insert_date;
		this.active = active;
	}



	public ProductMasterBean(int product_master_id, String product_name, String product_category, Date insert_date,
			int active) {
		super();
		this.product_master_id = product_master_id;
		this.product_name = product_name;
		this.product_category = product_category;
		this.insert_date = insert_date;
		this.active = active;
	}




	@Id
	@Column(name = "product_master_id")
	public int getProduct_master_id() {
		return product_master_id;
	}
	public void setProduct_master_id(int product_master_id) {
		this.product_master_id = product_master_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}


	public int getActive() {
		return active;
	}


	public void setActive(int active) {
		this.active = active;
	}
	
	
	
}
