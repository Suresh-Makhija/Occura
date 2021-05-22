package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "user_tbl")
public class UserBean implements Serializable {

	
	private static final long serialVersionUID = 1L;
	private int user_id;
	private String name;
	private String email;
	private String password;
	private Date crt_date;
	
	public UserBean() {
	}

	
	
	@Id
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCrt_date() {
		return crt_date;
	}

	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}

	public UserBean( String name, String email, String password, Date crt_date) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.crt_date = crt_date;
	}
	

	






	
	
	
	
}