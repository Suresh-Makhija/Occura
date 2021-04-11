package com.di.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "handover_tbl")
public class HandoverBean implements Serializable {

	
	private String handover_id;
	private Date handover_date;
	private String person_name;
	private String process;
	
	private CustomerBean customerBean;
	
	
	public HandoverBean() {
		// TODO Auto-generated constructor stub
	}

	public HandoverBean(Date handover_date, String person_name, CustomerBean customerBean,String process) {
		super();
		this.handover_date = handover_date;
		this.person_name = person_name;
		this.customerBean = customerBean;
		this.process = process;
	}

	public HandoverBean(String handover_id, Date handover_date, String person_name, CustomerBean customerBean,String process) {
		super();
		this.handover_id = handover_id;
		this.handover_date = handover_date;
		this.person_name = person_name;
		this.customerBean = customerBean;
		this.process = process;
	}

	@Id
	@Column(name = "handover_id")
	public String getHandover_id() {
		return handover_id;
	}

	public void setHandover_id(String handover_id) {
		this.handover_id = handover_id;
	}

	public Date getHandover_date() {
		return handover_date;
	}

	public void setHandover_date(Date handover_date) {
		this.handover_date = handover_date;
	}

	public String getPerson_name() {
		return person_name;
	}

	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}

	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}

	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}
	
	
	
	
	
	
	
	
}
