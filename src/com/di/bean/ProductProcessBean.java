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
@Table(name = "product_process_tbl")
public class ProductProcessBean implements Serializable {

	private int product_process_id;
	private String product_process_name;
	private int active;
	private Date insert_date;
	
	private ProductMasterBean productMasterBean;

	public ProductProcessBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ProductProcessBean(int product_process_id, String product_process_name, int active, Date insert_date,
			ProductMasterBean productMasterBean) {
		super();
		this.product_process_id = product_process_id;
		this.product_process_name = product_process_name;
		this.active = active;
		this.insert_date = insert_date;
		this.productMasterBean = productMasterBean;
	}

	public ProductProcessBean(String product_process_name, int active, Date insert_date,
			ProductMasterBean productMasterBean) {
		super();
		this.product_process_name = product_process_name;
		this.active = active;
		this.insert_date = insert_date;
		this.productMasterBean = productMasterBean;
	}

	
	@Id
	@Column(name = "product_process_id")
	public int getProduct_process_id() {
		return product_process_id;
	}

	public void setProduct_process_id(int product_process_id) {
		this.product_process_id = product_process_id;
	}

	public String getProduct_process_name() {
		return product_process_name;
	}

	public void setProduct_process_name(String product_process_name) {
		this.product_process_name = product_process_name;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public Date getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
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
