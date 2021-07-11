package com.occura.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

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
	private String master_diagno_id;
	private int count_per_tab;
	private String medicine_type;
	
	//private Set<MasterDiagnoBean> masterDiagnoBean;
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

	
	
//	@ManyToMany
//	@JoinColumn(name = "master_diagno_id")
//	public Set<MasterDiagnoBean>  getMasterDiagnoBean() {
//		return masterDiagnoBean;
//	}
//
//	public void setMasterDiagnoBean(Set<MasterDiagnoBean> masterDiagnoBean) {
//		this.masterDiagnoBean = masterDiagnoBean;
//	}

	public String getMaster_diagno_id() {
		return master_diagno_id;
	}

	public void setMaster_diagno_id(String master_diagno_id) {
		this.master_diagno_id = master_diagno_id;
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

	

	
	public MasterMedicineBean(String medicine_description, Date crt_date, Double medicine_price,
			String master_diagno_id, int count_per_tab, String medicine_type) {
		super();
		this.medicine_description = medicine_description;
		this.crt_date = crt_date;
		this.medicine_price = medicine_price;
		this.master_diagno_id = master_diagno_id;
		this.count_per_tab = count_per_tab;
		this.medicine_type = medicine_type;
	}

	public MasterMedicineBean() {
		super();
	}
	
	
	
	
}