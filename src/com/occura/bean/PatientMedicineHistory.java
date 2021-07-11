package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name = "patient_medicine_history_tbl")
public class PatientMedicineHistory implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int patient_medicine_history_id;
	private int master_medicine_id;
	private int appointment_id;
	private int patient_id;
	
	private Double medicine_Qty;
	private Double total_price_per_medicine;
	private String description;
	private Date crt_date;
	private String eye;
	private String duration;
	private String crt_date_str;
	private String medicine_name;
	
	public PatientMedicineHistory() {
	}

	@Id
	public int getPatient_medicine_history_id() {
		return patient_medicine_history_id;
	}

	public void setPatient_medicine_history_id(int patient_medicine_history_id) {
		this.patient_medicine_history_id = patient_medicine_history_id;
	}

	public int getMaster_medicine_id() {
		return master_medicine_id;
	}

	public void setMaster_medicine_id(int master_medicine_id) {
		this.master_medicine_id = master_medicine_id;
	}

	public int getAppointment_id() {
		return appointment_id;
	}

	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}

	public int getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}

	public Double getMedicine_Qty() {
		return medicine_Qty;
	}

	public void setMedicine_Qty(Double medicine_Qty) {
		this.medicine_Qty = medicine_Qty;
	}

	public Double getTotal_price_per_medicine() {
		return total_price_per_medicine;
	}

	public void setTotal_price_per_medicine(Double total_price_per_medicine) {
		this.total_price_per_medicine = total_price_per_medicine;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCrt_date() {
		return crt_date;
	}

	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}

	

	public String getEye() {
		return eye;
	}

	public void setEye(String eye) {
		this.eye = eye;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	
	
	
	@Transient
	public String getCrt_date_str() {
		return crt_date_str;
	}

	public void setCrt_date_str(String crt_date_str) {
		this.crt_date_str = crt_date_str;
	}

	@Transient
	public String getMedicine_name() {
		return medicine_name;
	}

	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}

	public PatientMedicineHistory(int master_medicine_id, int appointment_id,
			int patient_id, Double medicine_Qty, Double total_price_per_medicine, String description, Date crt_date,
			 String eye,String duration) {
		super();
		this.master_medicine_id = master_medicine_id;
		this.appointment_id = appointment_id;
		this.patient_id = patient_id;
		this.medicine_Qty = medicine_Qty;
		this.total_price_per_medicine = total_price_per_medicine;
		this.description = description;
		this.crt_date = crt_date;
		this.eye = eye;
		this.duration =duration;
	}

	
	
	
	
	

	






	
	
	
	
}