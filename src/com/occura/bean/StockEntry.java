package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "stock_entry_tbl")
public class StockEntry implements Serializable {

	private static final long serialVersionUID = 1L;
	private int stock_entry_id;
	private String medicine_description;
	private Date crt_date;
	private Double medicine_price;
	private int count_per_tab;
	private String medicine_type;
	private String medicine_qty;
	private String medicine_name;
	@Id
	public int getStock_entry_id() {
		return stock_entry_id;
	}

	public void setStock_entry_id(int stock_entry_id) {
		this.stock_entry_id = stock_entry_id;
	}

	public String getMedicine_description() {
		return medicine_description;
	}

	public void setMedicine_description(String medicine_description) {
		this.medicine_description = medicine_description;
	}

	public Date getCrt_date() {
		return crt_date;
	}

	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}

	public Double getMedicine_price() {
		return medicine_price;
	}

	public void setMedicine_price(Double medicine_price) {
		this.medicine_price = medicine_price;
	}

	public int getCount_per_tab() {
		return count_per_tab;
	}

	public void setCount_per_tab(int count_per_tab) {
		this.count_per_tab = count_per_tab;
	}

	public String getMedicine_type() {
		return medicine_type;
	}

	public void setMedicine_type(String medicine_type) {
		this.medicine_type = medicine_type;
	}
	
	public String getMedicine_qty() {
		return medicine_qty;
	}

	public void setMedicine_qty(String medicine_qty) {
		this.medicine_qty = medicine_qty;
	}

	public String getMedicine_name() {
		return medicine_name;
	}

	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}
}