package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "patient_medicine_history_tbl")
public class PatientMedicineHistory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int patient_medicine_history_id;
	private int master_medicine_id;
	private int appointment_id;
	private int patient_id;
	
	private double medicine_Qty;
	private double total_price_per_medicine;
	private String description;
	private Date crt_date;
	
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

	public double getMedicine_Qty() {
		return medicine_Qty;
	}

	public void setMedicine_Qty(double medicine_Qty) {
		this.medicine_Qty = medicine_Qty;
	}

	public double getTotal_price_per_medicine() {
		return total_price_per_medicine;
	}

	public void setTotal_price_per_medicine(double total_price_per_medicine) {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public PatientMedicineHistory(int patient_medicine_history_id, int master_medicine_id, int appointment_id,
			int patient_id, double medicine_Qty, double total_price_per_medicine, String description, Date crt_date) {
		super();
		this.patient_medicine_history_id = patient_medicine_history_id;
		this.master_medicine_id = master_medicine_id;
		this.appointment_id = appointment_id;
		this.patient_id = patient_id;
		this.medicine_Qty = medicine_Qty;
		this.total_price_per_medicine = total_price_per_medicine;
		this.description = description;
		this.crt_date = crt_date;
	}

	
	
	
	
	

	






	
	
	
	
}