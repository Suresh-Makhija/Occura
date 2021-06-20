package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "master_cc_tbl")
public class MasterChiefComplaintBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public MasterChiefComplaintBean() {
		// TODO Auto-generated constructor stub
	}
	public MasterChiefComplaintBean(String cc_description, Date crt_date) {
		super();
		this.cc_description = cc_description;
		this.crt_date = crt_date;
	}
	
	@Id
	public int getMaster_cc_id() {
		return master_cc_id;
	}
	public void setMaster_cc_id(int master_cc_id) {
		this.master_cc_id = master_cc_id;
	}
	public String getCc_description() {
		return cc_description;
	}
	public void setCc_description(String cc_description) {
		this.cc_description = cc_description;
	}
	public Date getCrt_date() {
		return crt_date;
	}
	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private int master_cc_id;
	private String cc_description;
	private Date crt_date;
	
	
	
	

	
	
	
	
}