package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name = "patient_cc_history_tbl")
public class PatientCCHistory implements Serializable {

	private static final long serialVersionUID = 1L;
	private int patient_cc_history_id;
	private int master_cc_id;
	private int appointment_id;
	private int patient_id;
	private Date crt_date;
	private String eye;
	private String duration;
	private String crt_date_str;
	private String cc_name;
	
	public PatientCCHistory() {
	}
	
	public PatientCCHistory(int master_cc_id, int appointment_id,
			int patient_id, Date crt_date, String eye,String duration) {
		super();
		this.master_cc_id = master_cc_id;
		this.appointment_id = appointment_id;
		this.patient_id = patient_id;
		this.crt_date = crt_date;
		this.eye = eye;
		this.duration=duration;
	}
	
	@Id
	public int getPatient_cc_history_id() {
		return patient_cc_history_id;
	}
	public void setPatient_cc_history_id(int patient_cc_history_id) {
		this.patient_cc_history_id = patient_cc_history_id;
	}
	
	
	@Transient
	public String getCc_name() {
		return cc_name;
	}

	public void setCc_name(String cc_name) {
		this.cc_name = cc_name;
	}

	@Transient
	public String getCrt_date_str() {
		return crt_date_str;
	}

	public void setCrt_date_str(String crt_date_str) {
		this.crt_date_str = crt_date_str;
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

	//	@ManyToMany
//	@JoinColumn(name="master_cc_id")
	public int getMaster_cc_id() {
		return master_cc_id;
	}
	public void setMaster_cc_id(int master_cc_id) {
		this.master_cc_id = master_cc_id;
	}
	
//	@ManyToOne
//	@JoinColumn(name="appointment_id")
//	public PatientAppointmentBean getAppointment_id() {
//		return appointment_id;
//	}
//	
//	public void setAppointment_id(PatientAppointmentBean appointment_id) {
//		this.appointment_id = appointment_id;
//	}
	
//	@ManyToOne
//	@JoinColumn(name="patient_id")
//	public PatientBean getPatient_id() {
//		return patient_id;
//	}
//	public void setPatient_id(PatientBean patient_id) {
//		this.patient_id = patient_id;
//	}
	
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
	


}