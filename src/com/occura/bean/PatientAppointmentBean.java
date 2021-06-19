package com.occura.bean;

import java.beans.Transient;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity

@Table(name = "patient_appointment_tbl")

public class PatientAppointmentBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private int appointment_id;
	private PatientBean patient_id;
	private Date appointment_date_time;
	private Date crt_date;
	private String description;
	
	
	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public PatientAppointmentBean() {
	}

	
	
	@Id
	public int getAppointment_id() {
		return appointment_id;
	}



	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}


	@ManyToOne
	@JoinColumn(name="patient_id")
	public PatientBean getPatient_id() {
		return patient_id;
	}



	public void setPatient_id(PatientBean patient_id) {
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
	


	public PatientAppointmentBean( PatientBean patient_id, Date appointment_date_time, Date crt_date,String description) {
		super();
		this.patient_id = patient_id;
		this.appointment_date_time = appointment_date_time;
		this.crt_date = crt_date;
		this.description = description;
	}

	

	
	

	






	
	
	
	
}