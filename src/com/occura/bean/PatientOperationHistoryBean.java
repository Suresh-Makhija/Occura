package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "patient_operation_history_tbl")
public class PatientOperationHistoryBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int Patient_operation_history_id;
	private int master_operation_id;
	private int appointment_id;
	private int patient_id;
	private String total_price_per_operation;
	private Date crt_date;
	
	public PatientOperationHistoryBean() {
	}

	@Id
	public int getPatient_operation_history_id() {
		return Patient_operation_history_id;
	}

	public void setPatient_operation_history_id(int patient_operation_history_id) {
		Patient_operation_history_id = patient_operation_history_id;
	}

	public int getMaster_operation_id() {
		return master_operation_id;
	}

	public void setMaster_operation_id(int master_operation_id) {
		this.master_operation_id = master_operation_id;
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

	public String getTotal_price_per_operation() {
		return total_price_per_operation;
	}

	public void setTotal_price_per_operation(String total_price_per_operation) {
		this.total_price_per_operation = total_price_per_operation;
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

	public PatientOperationHistoryBean(int patient_operation_history_id, int master_operation_id, int appointment_id,
			int patient_id, String total_price_per_operation, Date crt_date) {
		super();
		Patient_operation_history_id = patient_operation_history_id;
		this.master_operation_id = master_operation_id;
		this.appointment_id = appointment_id;
		this.patient_id = patient_id;
		this.total_price_per_operation = total_price_per_operation;
		this.crt_date = crt_date;
	}

	
	
	
	
}