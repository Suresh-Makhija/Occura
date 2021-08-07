package com.occura.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "patient_eyesight_history_tbl")
public class PatientEyeSightHistory {

	private int patient_eye_history_id;
	private int appointment_id;
	private int patient_id;
	private Date crt_date;
	private String sphere_r;
	private String sphere_l;
	private String cylinder_r;
	private String cylinder_l;
	private String axis_r;
	private String axis_l;
	private String vn_r;
	private String vn_l;
	private String crt_date_str;
	
	public PatientEyeSightHistory() {
	}
	
	@Id
	@Column(name="patient_eye_history_id")
	public int getPatient_eye_history_id() {
		return patient_eye_history_id;
	}
	public void setPatient_eye_history_id(int patient_eye_history_id) {
		this.patient_eye_history_id = patient_eye_history_id;
	}
	
	@Column(name="appointment_id")
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	
	@Column(name="patient_id")
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	
	@Column(name="crt_date")
	public Date getCrt_date() {
		return crt_date;
	}
	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}
	
	@Column(name="sphere_r")
	public String getSphere_r() {
		return sphere_r;
	}
	public void setSphere_r(String sphere_r) {
		this.sphere_r = sphere_r;
	}
	
	@Column(name="sphere_l")
	public String getSphere_l() {
		return sphere_l;
	}
	public void setSphere_l(String sphere_l) {
		this.sphere_l = sphere_l;
	}
	
	@Column(name="cylinder_r")
	public String getCylinder_r() {
		return cylinder_r;
	}
	public void setCylinder_r(String cylinder_r) {
		this.cylinder_r = cylinder_r;
	}
	
	@Column(name="cylinder_l")
	public String getCylinder_l() {
		return cylinder_l;
	}
	public void setCylinder_l(String cylinder_l) {
		this.cylinder_l = cylinder_l;
	}
	
	@Column(name="axis_r")
	public String getAxis_r() {
		return axis_r;
	}
	public void setAxis_r(String axis_r) {
		this.axis_r = axis_r;
	}
	
	@Column(name="axis_l")
	public String getAxis_l() {
		return axis_l;
	}
	public void setAxis_l(String axis_l) {
		this.axis_l = axis_l;
	}
	
	
	@Column(name="vn_r")
	public String getVn_r() {
		return vn_r;
	}

	public void setVn_r(String vn_r) {
		this.vn_r = vn_r;
	}

	@Column(name="vn_l")
	public String getVn_l() {
		return vn_l;
	}

	public void setVn_l(String vn_l) {
		this.vn_l = vn_l;
	}

	@Transient
	public String getCrt_date_str() {
		return crt_date_str;
	}

	public void setCrt_date_str(String crt_date_str) {
		this.crt_date_str = crt_date_str;
	}

	public PatientEyeSightHistory(int appointment_id, int patient_id, Date crt_date,
			String sphere_r, String sphere_l, String cylinder_r, String cylinder_l, String axis_r, String axis_l) {
		super();
		this.appointment_id = appointment_id;
		this.patient_id = patient_id;
		this.crt_date = crt_date;
		this.sphere_r = sphere_r;
		this.sphere_l = sphere_l;
		this.cylinder_r = cylinder_r;
		this.cylinder_l = cylinder_l;
		this.axis_r = axis_r;
		this.axis_l = axis_l;
	}
	
	
	
	
	
	
}
