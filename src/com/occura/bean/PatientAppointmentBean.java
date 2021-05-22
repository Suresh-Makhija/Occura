package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity

@Table(name = "patient_appointment_tbl")

public class PatientAppointmentBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private int appointment_id;
	private int patient_id;
	private Date appointment_date_time;
	private Date crt_date;
	
	public PatientAppointmentBean() {
	}

	
	
	@Id
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



	


	public Date getAppointment_date_time() {
		return appointment_date_time;
	}



	public void setAppointment_date_time(Date appointment_date_time) {
		this.appointment_date_time = appointment_date_time;
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


	public PatientAppointmentBean( int patient_id, Date appointment_date_time, Date crt_date) {
		super();
		this.patient_id = patient_id;
		this.appointment_date_time = appointment_date_time;
		this.crt_date = crt_date;
	}

	

	
	

	






	
	
	
	
}