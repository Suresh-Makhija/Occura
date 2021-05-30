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
@Table(name = "patient_cc_history_tbl")
public class PatientCCHistory implements Serializable {

	private static final long serialVersionUID = 1L;
	private int patient_cc_history_id;
	private MasterChiefComplaintBean master_cc_id;
	private PatientAppointmentBean appointment_id;
	private PatientBean patient_id;
	private Date crt_date;
	private String eye;
	public PatientCCHistory(MasterChiefComplaintBean master_cc_id, PatientAppointmentBean appointment_id,
			PatientBean patient_id, Date crt_date, String eye) {
		super();
		this.master_cc_id = master_cc_id;
		this.appointment_id = appointment_id;
		this.patient_id = patient_id;
		this.crt_date = crt_date;
		this.eye = eye;
	}
	
	@Id
	public int getPatient_cc_history_id() {
		return patient_cc_history_id;
	}
	public void setPatient_cc_history_id(int patient_cc_history_id) {
		this.patient_cc_history_id = patient_cc_history_id;
	}
	
	@ManyToMany
	@JoinColumn(name="master_cc_id")
	public MasterChiefComplaintBean getMaster_cc_id() {
		return master_cc_id;
	}
	public void setMaster_cc_id(MasterChiefComplaintBean master_cc_id) {
		this.master_cc_id = master_cc_id;
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
	public String getEye() {
		return eye;
	}
	public void setEye(String eye) {
		this.eye = eye;
	}
	


}