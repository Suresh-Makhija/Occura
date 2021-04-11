package com.di.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "bundle_log_tbl")
public class BundleLogBean implements Serializable {

	@Id
	private String bundle_log;
	private String assign_name;
	private Date insert_date;
	private String bundle_num;
	
	
	
	
	public BundleLogBean() {
		// TODO Auto-generated constructor stub
	}
	
	public BundleLogBean(String bundle_log, String assign_name, Date insert_date, String bundle_num) {
		super();
		this.bundle_log = bundle_log;
		this.assign_name = assign_name;
		this.insert_date = insert_date;
		this.bundle_num = bundle_num;
	}
	
	
	@Column(name = "bundle_log")
	public String getBundle_log() {
		return bundle_log;
	}
	public void setBundle_log(String bundle_log) {
		this.bundle_log = bundle_log;
	}
	
	@Column(name = "assign_name")
	public String getAssign_name() {
		return assign_name;
	}
	public void setAssign_name(String assign_name) {
		this.assign_name = assign_name;
	}
	
	@Column(name = "insert_date")
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	
	@Column(name = "bundle_num")
	public String getBundle_num() {
		return bundle_num;
	}
	public void setBundle_num(String bundle_num) {
		this.bundle_num = bundle_num;
	}
	
	
	
	
}
