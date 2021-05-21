package com.occura.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "master_operation_tbl")
public class MasterOperationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int master_operation_id;
	private String operation_description;
	private long operation_price;
	public MasterOperationBean(int master_operation_id, String operation_description, long operation_price) {
		super();
		this.master_operation_id = master_operation_id;
		this.operation_description = operation_description;
		this.operation_price = operation_price;
	}
	
	@Id	
	public int getMaster_operation_id() {
		return master_operation_id;
	}
	public void setMaster_operation_id(int master_operation_id) {
		this.master_operation_id = master_operation_id;
	}
	public String getOperation_description() {
		return operation_description;
	}
	public void setOperation_description(String operation_description) {
		this.operation_description = operation_description;
	}
	public long getOperation_price() {
		return operation_price;
	}
	public void setOperation_price(long operation_price) {
		this.operation_price = operation_price;
	}
	
	
	
	
}