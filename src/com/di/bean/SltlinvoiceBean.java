package com.di.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "sltl_invoice_tbl")
public class SltlinvoiceBean implements Serializable {

	private String sltl_invoice_id;
	private String sltl_invoice_num;
	private Date insert_date;
	private double sltl_gross_outstanding;
	private double sltl_discount_per;
	private double sltl_discount_amount;
	private double sltl_final_outstanding;
	private String currency_type;
	private double conversion;
	
	private UserBean userBean;
	private InvoiceBean invoiceBean;
	
	
	public SltlinvoiceBean() {
		// TODO Auto-generated constructor stub
	}
	
	



	public SltlinvoiceBean(String sltl_invoice_num, Date insert_date, double sltl_gross_outstanding,
			double sltl_discount_per, double sltl_discount_amount, double sltl_final_outstanding, UserBean userBean,
			InvoiceBean invoiceBean,String currency_type, double conversion) {
		super();
		this.sltl_invoice_num = sltl_invoice_num;
		this.insert_date = insert_date;
		this.sltl_gross_outstanding = sltl_gross_outstanding;
		this.sltl_discount_per = sltl_discount_per;
		this.sltl_discount_amount = sltl_discount_amount;
		this.sltl_final_outstanding = sltl_final_outstanding;
		this.userBean = userBean;
		this.invoiceBean = invoiceBean;
		this.currency_type = currency_type;
		this.conversion = conversion;
	}
	
	
	public SltlinvoiceBean(String sltl_invoice_id, String sltl_invoice_num, Date insert_date,
			double sltl_gross_outstanding, double sltl_discount_per, double sltl_discount_amount,
			double sltl_final_outstanding, UserBean userBean, InvoiceBean invoiceBean,String currency_type, double conversion) {
		super();
		this.sltl_invoice_id = sltl_invoice_id;
		this.sltl_invoice_num = sltl_invoice_num;
		this.insert_date = insert_date;
		this.sltl_gross_outstanding = sltl_gross_outstanding;
		this.sltl_discount_per = sltl_discount_per;
		this.sltl_discount_amount = sltl_discount_amount;
		this.sltl_final_outstanding = sltl_final_outstanding;
		this.userBean = userBean;
		this.invoiceBean = invoiceBean;
		this.currency_type = currency_type;
		this.conversion = conversion;
	}
	
	
	
	@Id
	@Column(name = "sltl_invoice_id")
	public String getSltl_invoice_id() {
		return sltl_invoice_id;
	}
	public void setSltl_invoice_id(String sltl_invoice_id) {
		this.sltl_invoice_id = sltl_invoice_id;
	}
	public String getSltl_invoice_num() {
		return sltl_invoice_num;
	}
	public void setSltl_invoice_num(String sltl_invoice_num) {
		this.sltl_invoice_num = sltl_invoice_num;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public double getSltl_gross_outstanding() {
		return sltl_gross_outstanding;
	}
	public void setSltl_gross_outstanding(double sltl_gross_outstanding) {
		this.sltl_gross_outstanding = sltl_gross_outstanding;
	}
	public double getSltl_discount_per() {
		return sltl_discount_per;
	}
	public void setSltl_discount_per(double sltl_discount_per) {
		this.sltl_discount_per = sltl_discount_per;
	}
	public double getSltl_discount_amount() {
		return sltl_discount_amount;
	}
	public void setSltl_discount_amount(double sltl_discount_amount) {
		this.sltl_discount_amount = sltl_discount_amount;
	}
	public double getSltl_final_outstanding() {
		return sltl_final_outstanding;
	}
	public void setSltl_final_outstanding(double sltl_final_outstanding) {
		this.sltl_final_outstanding = sltl_final_outstanding;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	public UserBean getUserBean() {
		return userBean;
	}
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "invoice_id")
	public InvoiceBean getInvoiceBean() {
		return invoiceBean;
	}
	public void setInvoiceBean(InvoiceBean invoiceBean) {
		this.invoiceBean = invoiceBean;
	}

	public String getCurrency_type() {
		return currency_type;
	}

	public void setCurrency_type(String currency_type) {
		this.currency_type = currency_type;
	}

	public double getConversion() {
		return conversion;
	}

	public void setConversion(double conversion) {
		this.conversion = conversion;
	}
	
	
	
	
	
}
