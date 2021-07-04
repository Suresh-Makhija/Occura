package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;



@Entity
@Table(name = "master_medicine_tbl")
public class MasterMedicineBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private int master_medicine_id;
	private String medicine_description;
	private Date crt_date;
	private Double medicine_price;
	
	private MasterDiagnoBean masterDiagnoBean;
	@Id
	public int getMaster_medicine_id() {
		return master_medicine_id;
	}

	public void setMaster_medicine_id(int master_medicine_id) {
		this.master_medicine_id = master_medicine_id;
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

	@ManyToMany
	@JoinColumn(name = "master_diagno_id")
	public MasterDiagnoBean getMasterDiagnoBean() {
		return masterDiagnoBean;
	}

	public void setMasterDiagnoBean(MasterDiagnoBean masterDiagnoBean) {
		this.masterDiagnoBean = masterDiagnoBean;
	}

	public MasterMedicineBean(String medicine_description, Date crt_date, Double medicine_price,
			MasterDiagnoBean masterDiagnoBean) {
		super();
		this.medicine_description = medicine_description;
		this.crt_date = crt_date;
		this.medicine_price = medicine_price;
		this.masterDiagnoBean = masterDiagnoBean;
	}

	
	
	
	
	
	
}