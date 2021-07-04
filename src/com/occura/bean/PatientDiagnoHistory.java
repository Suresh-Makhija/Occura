package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "patient_diagno_history_tbl")
public class PatientDiagnoHistory implements Serializable {

	private static final long serialVersionUID = 1L;
	private int Patient_diagno_History_id;
	private String master_diagno_id;
	private PatientAppointmentBean appointment_id;
	private PatientBean patient_id;
	private Date crt_date;
	public PatientDiagnoHistory(int patient_diagno_History_id, String master_diagno_id, 
			PatientAppointmentBean appointment_id, PatientBean patient_id,Date crt_date) {
		super();
		Patient_diagno_History_id = patient_diagno_History_id;
		this.master_diagno_id = master_diagno_id;
		this.appointment_id = appointment_id;
		this.patient_id = patient_id;
		this.crt_date = crt_date;
	}




	
	public PatientDiagnoHistory() {
	}

	@Id
	public int getPatient_diagno_History_id() {
		return Patient_diagno_History_id;
	}

	public void setPatient_diagno_History_id(int patient_diagno_History_id) {
		Patient_diagno_History_id = patient_diagno_History_id;
	}

//	@ManyToMany
//	@JoinColumn(name="master_diagno_id")
	public String getMaster_diagno_id() {
		return master_diagno_id;
	}

	public void setMaster_diagno_id(String master_diagno_id) {
		this.master_diagno_id = master_diagno_id;
	}

	@ManyToOne
	@JoinColumn(name="appointment_id")
	public PatientAppointmentBean getAppointment_id() {
		return appointment_id;
	}
	
	public void setAppointment_id(PatientAppointmentBean appointment_id) {
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

	public Date getCrt_date() {
		return crt_date;
	}

	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}



}