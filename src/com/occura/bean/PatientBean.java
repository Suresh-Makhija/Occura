package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name = "patient_tbl")
public class PatientBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int patient_id;
	private String first_name;
	private String last_name;
	private String gender;
	private String age;
	private String full_name;
	private String mobile_no;
	private String email_address;
	private String photo;
	private Date crt_date;
	
	@Transient
	private MultipartFile uploadfile;
	@Transient
	private String appointment_date_time;
	
	public PatientBean() {
	}

	
	
	@Id
	public int getPatient_id() {
		return patient_id;
	}



	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}



	public String getFirst_name() {
		return first_name;
	}



	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}



	public String getLast_name() {
		return last_name;
	}



	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getAge() {
		return age;
	}



	public void setAge(String age) {
		this.age = age;
	}



	public String getFull_name() {
		return full_name;
	}



	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}



	public String getMobile_no() {
		return mobile_no;
	}



	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}



	public String getEmail_address() {
		return email_address;
	}



	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}



	public String getPhoto() {
		return photo;
	}



	public void setPhoto(String photo) {
		this.photo = photo;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Date getCrt_date() {
		return crt_date;
	}

	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}


	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}



	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}



	



	public String getAppointment_date_time() {
		return appointment_date_time;
	}



	public void setAppointment_date_time(String appointment_date_time) {
		this.appointment_date_time = appointment_date_time;
	}



	public PatientBean(int patient_id, String first_name, String last_name, String gender, String age, String full_name,
			String mobile_no, String email_address, String photo, Date crt_date) {
		super();
		this.patient_id = patient_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.age = age;
		this.full_name = full_name;
		this.mobile_no = mobile_no;
		this.email_address = email_address;
		this.photo = photo;
		this.crt_date = crt_date;
	}

	

	






	
	
	
	
}