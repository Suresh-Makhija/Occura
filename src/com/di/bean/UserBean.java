package com.di.bean;


/*Created by 	: Akash Ramani
  Date 		    : 29-06-2019 */


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
@Table(name = "user_tbl")
public class UserBean implements Serializable {

	private int user_id;
	private String name;
	private String username;
	private String password;
	private Date creation_date;
	private int active;
	private String customer_code;
	private int authority;
	private int customer_id;
	
	
	public UserBean() {
		// TODO Auto-generated constructor stub
	}


	public UserBean(String name, String username, String password, Date creation_date, int active, String customer_code,
			int authority,int customer_id) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.creation_date = creation_date;
		this.active = active;
		this.customer_code = customer_code;
		this.authority = authority;
		this.customer_id = customer_id;
	}







	public UserBean(int user_id, String name, String username, String password, Date creation_date, int active,
			String customer_code, int authority,int customer_id) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.creation_date = creation_date;
		this.active = active;
		this.customer_code = customer_code;
		this.authority = authority;
		this.customer_id = customer_id;
	}






	@Id
	@Column(name = "user_id")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getCustomer_code() {
		return customer_code;
	}
	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	
	
	
	
	
}
