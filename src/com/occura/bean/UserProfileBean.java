package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import net.sf.libusb.usb_bus;



@Entity
@Table(name = "user_profile_tbl")
public class UserProfileBean implements Serializable {

	
	private static final long serialVersionUID = 1L;
	private int user_profile_id;
	private String first_name;
	private String last_name;
	private String gender;
	private Date birth_date;
	private String address_line_1;
	private String address_line_2;
	public String getAddress_line_1() {
		return address_line_1;
	}

	public void setAddress_line_1(String address_line_1) {
		this.address_line_1 = address_line_1;
	}

	public String getAddress_line_2() {
		return address_line_2;
	}

	public void setAddress_line_2(String address_line_2) {
		this.address_line_2 = address_line_2;
	}

	private String city;
	private String state;
	private String country;
	private long phone_no;
	private int exp;
	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	private UserBean userBean;
	
	@OneToOne
	@JoinColumn(name="user_id")
	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	@Id
	public int getUser_profile_id() {
		return user_profile_id;
	}

	public void setUser_profile_id(int user_profile_id) {
		this.user_profile_id = user_profile_id;
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

	public Date getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}



	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public long getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(long phone_no) {
		this.phone_no = phone_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public UserProfileBean() {
	}

	
	
	


	
	

	






	
	
	
	
}