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
@Table(name = "work_product_process_tbl")
public class WorkProductProcessBean implements Serializable {

	private String work_product_process_id;
	private String customer_code;
	private Date insert_datetime;
	private Date start_datetime;
	private Date end_datetime;
	private String rough_weight;
	private String total_time;
	private int status;
	private String remarks;
	private String kapan_name;
	private String lot_name;
	private String stone_name;
	private String process_name;
	private int active;	
	private String actual_weight;
	private String priority;
	private String color;
	private String clearity;
	
	private WorkHistoryBean workHistoryBean;
	private WorkProductBean workProductBean;
	private ProductProcessBean productProcessBean;
	
	
	public WorkProductProcessBean() {
		// TODO Auto-generated constructor stub
	}
	
	


	public WorkProductProcessBean(String customer_code, Date insert_datetime, Date start_datetime, Date end_datetime,
			String rough_weight, String total_time, int status, String remarks, WorkHistoryBean workHistoryBean,
			WorkProductBean workProductBean, ProductProcessBean productProcessBean,
			String kapan_name, String lot_name, String stone_name, String process_name,int active,
			String actual_weight, String priority, String color, String clearity) {
		super();
		this.customer_code = customer_code;
		this.insert_datetime = insert_datetime;
		this.start_datetime = start_datetime;
		this.end_datetime = end_datetime;
		this.rough_weight = rough_weight;
		this.total_time = total_time;
		this.status = status;
		this.remarks = remarks;
		this.workHistoryBean = workHistoryBean;
		this.workProductBean = workProductBean;
		this.productProcessBean = productProcessBean;
		this.kapan_name = kapan_name;
		this.lot_name = lot_name;
		this.stone_name = stone_name;
		this.process_name = process_name;
		this.active = active;
		this.actual_weight = actual_weight;
		this.priority = priority;
		this.color = color;
		this.clearity = clearity;
	}
	
	
	public WorkProductProcessBean(String work_product_process_id, String customer_code, Date insert_datetime,
			Date start_datetime, Date end_datetime, String rough_weight, String total_time, int status, String remarks,
			WorkHistoryBean workHistoryBean, WorkProductBean workProductBean, ProductProcessBean productProcessBean,
			String kapan_name, String lot_name, String stone_name, String process_name,int active,
			String actual_weight, String priority, String color, String clearity) {
		super();
		this.work_product_process_id = work_product_process_id;
		this.customer_code = customer_code;
		this.insert_datetime = insert_datetime;
		this.start_datetime = start_datetime;
		this.end_datetime = end_datetime;
		this.rough_weight = rough_weight;
		this.total_time = total_time;
		this.status = status;
		this.remarks = remarks;
		this.workHistoryBean = workHistoryBean;
		this.workProductBean = workProductBean;
		this.productProcessBean = productProcessBean;
		this.kapan_name = kapan_name;
		this.lot_name = lot_name;
		this.stone_name = stone_name;
		this.process_name = process_name;
		this.active = active;
		this.actual_weight = actual_weight;
		this.priority = priority;
		this.color = color;
		this.clearity = clearity;
	}
	
	
	
	@Id
	@Column(name = "work_product_process_id")
	public String getWork_product_process_id() {
		return work_product_process_id;
	}
	public void setWork_product_process_id(String work_product_process_id) {
		this.work_product_process_id = work_product_process_id;
	}
	public String getCustomer_code() {
		return customer_code;
	}
	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}
	public Date getInsert_datetime() {
		return insert_datetime;
	}
	public void setInsert_datetime(Date insert_datetime) {
		this.insert_datetime = insert_datetime;
	}
	public Date getStart_datetime() {
		return start_datetime;
	}
	public void setStart_datetime(Date start_datetime) {
		this.start_datetime = start_datetime;
	}
	public Date getEnd_datetime() {
		return end_datetime;
	}
	public void setEnd_datetime(Date end_datetime) {
		this.end_datetime = end_datetime;
	}
	public String getRough_weight() {
		return rough_weight;
	}
	public void setRough_weight(String rough_weight) {
		this.rough_weight = rough_weight;
	}
	public String getTotal_time() {
		return total_time;
	}
	public void setTotal_time(String total_time) {
		this.total_time = total_time;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@ManyToOne
	@JoinColumn(name = "work_history_id")
	public WorkHistoryBean getWorkHistoryBean() {
		return workHistoryBean;
	}
	public void setWorkHistoryBean(WorkHistoryBean workHistoryBean) {
		this.workHistoryBean = workHistoryBean;
	}
	
	@ManyToOne
	@JoinColumn(name = "work_product_id")
	public WorkProductBean getWorkProductBean() {
		return workProductBean;
	}
	public void setWorkProductBean(WorkProductBean workProductBean) {
		this.workProductBean = workProductBean;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "product_process_id")
	public ProductProcessBean getProductProcessBean() {
		return productProcessBean;
	}
	public void setProductProcessBean(ProductProcessBean productProcessBean) {
		this.productProcessBean = productProcessBean;
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


	public String getStone_name() {
		return stone_name;
	}


	public void setStone_name(String stone_name) {
		this.stone_name = stone_name;
	}


	public String getProcess_name() {
		return process_name;
	}


	public void setProcess_name(String process_name) {
		this.process_name = process_name;
	}
	
	public int getActive() {
		return active;
	}


	public void setActive(int active) {
		this.active = active;
	}


	public String getActual_weight() {
		return actual_weight;
	}


	public void setActual_weight(String actual_weight) {
		this.actual_weight = actual_weight;
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
	
	
	
	
	
}
