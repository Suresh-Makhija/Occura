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
@Table(name = "customer_type_tbl")
public class CustomerTypeBean implements Serializable {

	private int customer_type_id;
	private String type;
	private String type_name;
	private String description;
	private Date date_time;
	private int active;
	
	private UserBean userBean;
	
	
	
	public CustomerTypeBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public CustomerTypeBean(String type, String type_name, String description, Date date_time, int active,
			UserBean userBean) {
		super();
		this.type = type;
		this.type_name = type_name;
		this.description = description;
		this.date_time = date_time;
		this.active = active;
		this.userBean = userBean;
	}






	public CustomerTypeBean(int customer_type_id, String type, String type_name, String description, Date date_time,
			int active, UserBean userBean) {
		super();
		this.customer_type_id = customer_type_id;
		this.type = type;
		this.type_name = type_name;
		this.description = description;
		this.date_time = date_time;
		this.active = active;
		this.userBean = userBean;
	}






	@Id
	@GeneratedValue
	@Column(name = "customer_type_id")
	public int getCustomer_type_id() {
		return customer_type_id;
	}

	public void setCustomer_type_id(int customer_type_id) {
		this.customer_type_id = customer_type_id;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate_time() {
		return date_time;
	}

	public void setDate_time(Date date_time) {
		this.date_time = date_time;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	
	@ManyToOne
	@JoinColumn(name = "user_id")
	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}




	public String getType() {
		return type;
	}




	public void setType(String type) {
		this.type = type;
	}


	
	
}
