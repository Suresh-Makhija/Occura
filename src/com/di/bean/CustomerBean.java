package com.di.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "customer_tbl")
public class CustomerBean implements Serializable {

	private int customer_id;
	private String fullname;
	private String company;
	private String gst_number;
	private String contact_one;
	private String contact_two;
	private String email_one;
	private String email_two;
	private String address;
	private String zipcode;
	private String city;
	private String state;
	private String country;
	private Date creation_date;
	private int active;
	private Date deactive_date;
	private String customer_code;
	private int customer_num;
	private String vat_number;
	private int parent_customer_id;
	private String parent_customer_code;
	private double vat_rate;
	private String invoice_seq;
	private String challan_seq;
	private double cgst;
	private double sgst;
	private double igst;

	private UserBean userBean;

	public CustomerBean() {
		// TODO Auto-generated constructor stub
	}

	public CustomerBean(String fullname, String company, String gst_number, String contact_one, String contact_two,
			String email_one, String email_two, String address, String zipcode, String city, String state,
			String country, Date creation_date, int active, Date deactive_date, String customer_code, int customer_num,
			String vat_number, int parent_customer_id, String parent_customer_code, UserBean userBean, double vat_rate,
			String invoice_seq, String challan_seq, double cgst, double sgst, double igst) {
		super();
		this.fullname = fullname;
		this.company = company;
		this.gst_number = gst_number;
		this.contact_one = contact_one;
		this.contact_two = contact_two;
		this.email_one = email_one;
		this.email_two = email_two;
		this.address = address;
		this.zipcode = zipcode;
		this.city = city;
		this.state = state;
		this.country = country;
		this.creation_date = creation_date;
		this.active = active;
		this.deactive_date = deactive_date;
		this.customer_code = customer_code;
		this.customer_num = customer_num;
		this.vat_number = vat_number;
		this.parent_customer_id = parent_customer_id;
		this.parent_customer_code = parent_customer_code;
		this.userBean = userBean;
		this.vat_rate = vat_rate;
		this.invoice_seq = invoice_seq;
		this.challan_seq = challan_seq;
		this.cgst = cgst;
		this.sgst = sgst;
		this.igst = igst;
	}

	public CustomerBean(int customer_id, String fullname, String company, String gst_number, String contact_one,
			String contact_two, String email_one, String email_two, String address, String zipcode, String city,
			String state, String country, Date creation_date, int active, Date deactive_date, String customer_code,
			int customer_num, String vat_number, int parent_customer_id, String parent_customer_code, UserBean userBean,
			double vat_rate, String invoice_seq, String challan_seq, double cgst, double sgst, double igst) {
		super();
		this.customer_id = customer_id;
		this.fullname = fullname;
		this.company = company;
		this.gst_number = gst_number;
		this.contact_one = contact_one;
		this.contact_two = contact_two;
		this.email_one = email_one;
		this.email_two = email_two;
		this.address = address;
		this.zipcode = zipcode;
		this.city = city;
		this.state = state;
		this.country = country;
		this.creation_date = creation_date;
		this.active = active;
		this.deactive_date = deactive_date;
		this.customer_code = customer_code;
		this.customer_num = customer_num;
		this.vat_number = vat_number;
		this.parent_customer_id = parent_customer_id;
		this.parent_customer_code = parent_customer_code;
		this.userBean = userBean;
		this.vat_rate = vat_rate;
		this.invoice_seq = invoice_seq;
		this.challan_seq = challan_seq;
		this.cgst = cgst;
		this.sgst = sgst;
		this.igst = igst;
	}

	@Id
	@Column(name = "customer_id")
	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getContact_one() {
		return contact_one;
	}

	public void setContact_one(String contact_one) {
		this.contact_one = contact_one;
	}

	public String getContact_two() {
		return contact_two;
	}

	public void setContact_two(String contact_two) {
		this.contact_two = contact_two;
	}

	public String getEmail_one() {
		return email_one;
	}

	public void setEmail_one(String email_one) {
		this.email_one = email_one;
	}

	public String getEmail_two() {
		return email_two;
	}

	public void setEmail_two(String email_two) {
		this.email_two = email_two;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public Date getDeactive_date() {
		return deactive_date;
	}

	public void setDeactive_date(Date deactive_date) {
		this.deactive_date = deactive_date;
	}

	public String getCustomer_code() {
		return customer_code;
	}

	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}

	public String getGst_number() {
		return gst_number;
	}

	public void setGst_number(String gst_number) {
		this.gst_number = gst_number;
	}

	public int getCustomer_num() {
		return customer_num;
	}

	public void setCustomer_num(int customer_num) {
		this.customer_num = customer_num;
	}

	public String getVat_number() {
		return vat_number;
	}

	public void setVat_number(String vat_number) {
		this.vat_number = vat_number;
	}

	public int getParent_customer_id() {
		return parent_customer_id;
	}

	public void setParent_customer_id(int parent_customer_id) {
		this.parent_customer_id = parent_customer_id;
	}

	public String getParent_customer_code() {
		return parent_customer_code;
	}

	public void setParent_customer_code(String parent_customer_code) {
		this.parent_customer_code = parent_customer_code;
	}

	@ManyToOne
	@JoinColumn(name = "user_id")
	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public double getVat_rate() {
		return vat_rate;
	}

	public void setVat_rate(double vat_rate) {
		this.vat_rate = vat_rate;
	}

	public String getInvoice_seq() {
		return invoice_seq;
	}

	public void setInvoice_seq(String invoice_seq) {
		this.invoice_seq = invoice_seq;
	}

	public String getChallan_seq() {
		return challan_seq;
	}

	public void setChallan_seq(String challan_seq) {
		this.challan_seq = challan_seq;
	}

	public double getCgst() {
		return cgst;
	}

	public void setCgst(double cgst) {
		this.cgst = cgst;
	}

	public double getSgst() {
		return sgst;
	}

	public void setSgst(double sgst) {
		this.sgst = sgst;
	}

	public double getIgst() {
		return igst;
	}

	public void setIgst(double igst) {
		this.igst = igst;
	}

}
