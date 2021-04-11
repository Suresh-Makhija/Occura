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
@Table(name = "challan_out_tbl")
public class ChallanOutBean implements Serializable {

	private String challan_out_id;
	private String challan_out_number;
	private Date insert_date;
	
	private UserBean userBean;
	private ChallanBean challanBean;
	
	
	public ChallanOutBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ChallanOutBean(String challan_out_number, Date insert_date, UserBean userBean, ChallanBean challanBean) {
		super();
		this.challan_out_number = challan_out_number;
		this.insert_date = insert_date;
		this.userBean = userBean;
		this.challanBean = challanBean;
	}

	public ChallanOutBean(String challan_out_id, String challan_out_number, Date insert_date, UserBean userBean,
			ChallanBean challanBean) {
		super();
		this.challan_out_id = challan_out_id;
		this.challan_out_number = challan_out_number;
		this.insert_date = insert_date;
		this.userBean = userBean;
		this.challanBean = challanBean;
	}
	
	@Id
	@Column(name ="challan_out_id")
	public String getChallan_out_id() {
		return challan_out_id;
	}
	public void setChallan_out_id(String challan_out_id) {
		this.challan_out_id = challan_out_id;
	}
	public String getChallan_out_number() {
		return challan_out_number;
	}
	public void setChallan_out_number(String challan_out_number) {
		this.challan_out_number = challan_out_number;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
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
	@JoinColumn(name = "challan_id")
	public ChallanBean getChallanBean() {
		return challanBean;
	}
	public void setChallanBean(ChallanBean challanBean) {
		this.challanBean = challanBean;
	}
	
	
	
	
}
