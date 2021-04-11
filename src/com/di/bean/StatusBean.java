package com.di.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "status_tbl")
public class StatusBean implements Serializable {

	
	private int status_id;
	private String status;
	
	public StatusBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public StatusBean(int status_id, String status) {
		super();
		this.status_id = status_id;
		this.status = status;
	}




	@Id
	@Column(name = "status_id")
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
