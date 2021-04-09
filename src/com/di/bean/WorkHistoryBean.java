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
@Table(name = "work_history_tbl")
public class WorkHistoryBean implements Serializable {

	private String work_history_id;
	private String kapan_name;
	private String lot_name;
	private String actual_weight;
	private String stone_name;
	private String priority;
	private String color;
	private String clearity;
	private Date insert_date;
	private Date start_date;
	private Date completion_date;
	private String rough_weight;
	private int active;
	private Date deactive_date;
	private String total_time;
	private String remarks;
	private int in_stock;
	private Date in_stock_datetime;
	private int in_stock_by;
	private String parent_work_id;
	private Date cleared_datetime;
	private String bundle_num;
	
	
	private ProductMasterBean productMasterBean;
	private CustomerBean customerBean;
	private StatusBean statusBean;
	private UserBean userBean;
	

	public WorkHistoryBean() {
		// TODO Auto-generated constructor stub
	}
	


	public WorkHistoryBean(String kapan_name, String lot_name, String actual_weight, String stone_name, String priority,
			String color, String clearity, Date insert_date, Date start_date, Date completion_date, String rough_weight,
			ProductMasterBean productMasterBean, CustomerBean customerBean,
			int active,Date deactive_date,String total_time,StatusBean statusBean,String remarks,UserBean userBean,
			int in_stock, Date in_stock_datetime,int in_stock_by,String parent_work_id,Date cleared_datetime,String bundle_num) {
		super();
		this.kapan_name = kapan_name;
		this.lot_name = lot_name;
		this.actual_weight = actual_weight;
		this.stone_name = stone_name;
		this.priority = priority;
		this.color = color;
		this.clearity = clearity;
		this.insert_date = insert_date;
		this.start_date = start_date;
		this.completion_date = completion_date;
		this.rough_weight = rough_weight;
		this.productMasterBean = productMasterBean;
		this.customerBean = customerBean;
		this.active = active;
		this.deactive_date = deactive_date;
		this.total_time = total_time;
		this.statusBean = statusBean;
		this.remarks = remarks;
		this.userBean = userBean;
		this.in_stock = in_stock;
		this.in_stock_datetime = in_stock_datetime;
		this.in_stock_by = in_stock_by;
		this.parent_work_id = parent_work_id;
		this.cleared_datetime = cleared_datetime;
		this.bundle_num = bundle_num;
	}
	
	public WorkHistoryBean(String work_history_id, String kapan_name, String lot_name, String actual_weight,
			String stone_name, String priority, String color, String clearity, Date insert_date, Date start_date,
			Date completion_date, String rough_weight, ProductMasterBean productMasterBean, CustomerBean customerBean,int active
			,Date deactive_date,String total_time,StatusBean statusBean,String remarks,UserBean userBean,
			int in_stock, Date in_stock_datetime,int in_stock_by,String parent_work_id,Date cleared_datetime,String bundle_num) {
		super();
		this.work_history_id = work_history_id;
		this.kapan_name = kapan_name;
		this.lot_name = lot_name;
		this.actual_weight = actual_weight;
		this.stone_name = stone_name;
		this.priority = priority;
		this.color = color;
		this.clearity = clearity;
		this.insert_date = insert_date;
		this.start_date = start_date;
		this.completion_date = completion_date;
		this.rough_weight = rough_weight;
		this.productMasterBean = productMasterBean;
		this.customerBean = customerBean;
		this.active = active;
		this.deactive_date = deactive_date;
		this.total_time = total_time;
		this.statusBean = statusBean;
		this.remarks = remarks;
		this.userBean = userBean;
		this.in_stock = in_stock;
		this.in_stock_datetime = in_stock_datetime;
		this.in_stock_by = in_stock_by;
		this.parent_work_id = parent_work_id;
		this.cleared_datetime = cleared_datetime;
		this.bundle_num = bundle_num;
	}
	
	
	
	@Id
	@Column(name = "work_history_id")
	public String getWork_history_id() {
		return work_history_id;
	}
	public void setWork_history_id(String work_history_id) {
		this.work_history_id = work_history_id;
	}
	public String getKapan_name() {
		return kapan_name;
	}
	public void setKapan_name(String kapan_name) {
		this.kapan_name = kapan_name;
	}
	public String getLot_name() {
		return lot_name;
	}
	public void setLot_name(String lot_name) {
		this.lot_name = lot_name;
	}
	public String getActual_weight() {
		return actual_weight;
	}
	public void setActual_weight(String actual_weight) {
		this.actual_weight = actual_weight;
	}
	public String getStone_name() {
		return stone_name;
	}
	public void setStone_name(String stone_name) {
		this.stone_name = stone_name;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getClearity() {
		return clearity;
	}
	public void setClearity(String clearity) {
		this.clearity = clearity;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getCompletion_date() {
		return completion_date;
	}
	public void setCompletion_date(Date completion_date) {
		this.completion_date = completion_date;
	}
	public String getRough_weight() {
		return rough_weight;
	}
	public void setRough_weight(String rough_weight) {
		this.rough_weight = rough_weight;
	}
	
	@ManyToOne
	@JoinColumn(name = "product_master_id")
	public ProductMasterBean getProductMasterBean() {
		return productMasterBean;
	}
	public void setProductMasterBean(ProductMasterBean productMasterBean) {
		this.productMasterBean = productMasterBean;
	}
	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}
	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public Date getDeactive_date() {
		return deactive_date;
	}
	public void setDeactive_date(Date deactive_date) {
		this.deactive_date = deactive_date;
	}
	public String getTotal_time() {
		return total_time;
	}
	public void setTotal_time(String total_time) {
		this.total_time = total_time;
	}
	@ManyToOne
	@JoinColumn(name = "status_id")
	public StatusBean getStatusBean() {
		return statusBean;
	}

	public void setStatusBean(StatusBean statusBean) {
		this.statusBean = statusBean;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	@ManyToOne
	@JoinColumn(name = "user_id")
	public UserBean getUserBean() {
		return userBean;
	}
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}


	public int getIn_stock() {
		return in_stock;
	}


	public void setIn_stock(int in_stock) {
		this.in_stock = in_stock;
	}


	public Date getIn_stock_datetime() {
		return in_stock_datetime;
	}


	public void setIn_stock_datetime(Date in_stock_datetime) {
		this.in_stock_datetime = in_stock_datetime;
	}


	public int getIn_stock_by() {
		return in_stock_by;
	}


	public void setIn_stock_by(int in_stock_by) {
		this.in_stock_by = in_stock_by;
	}


	public String getParent_work_id() {
		return parent_work_id;
	}


	public void setParent_work_id(String parent_work_id) {
		this.parent_work_id = parent_work_id;
	}


	public Date getCleared_datetime() {
		return cleared_datetime;
	}


	public void setCleared_datetime(Date cleared_datetime) {
		this.cleared_datetime = cleared_datetime;
	}


	public String getBundle_num() {
		return bundle_num;
	}


	public void setBundle_num(String bundle_num) {
		this.bundle_num = bundle_num;
	}
	
	



	
	
}
