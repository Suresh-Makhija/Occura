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
@Table(name = "sltl_invoice_line_tbl")
public class SltlInvoiceLineBean implements Serializable {

	private int sltl_invoice_line_id;
	private double sltl_mrgine;
	private double amount;
	private Date insert_date;
	private int active;
	
	private InvoiceLineBean invoiceLineBean;
	private UserBean userBean;
	private SltlinvoiceBean sltlinvoiceBean;
	
	
	
	public SltlInvoiceLineBean() {
		// TODO Auto-generated constructor stub
	}
	
	


	public SltlInvoiceLineBean(double sltl_mrgine, double amount, Date insert_date, InvoiceLineBean invoiceLineBean,
			UserBean userBean, SltlinvoiceBean sltlinvoiceBean,int active) {
		super();
		this.sltl_mrgine = sltl_mrgine;
		this.amount = amount;
		this.insert_date = insert_date;
		this.invoiceLineBean = invoiceLineBean;
		this.userBean = userBean;
		this.sltlinvoiceBean = sltlinvoiceBean;
		this.active = active;
	}



	public SltlInvoiceLineBean(int sltl_invoice_line_id, double sltl_mrgine, double amount, Date insert_date,
			InvoiceLineBean invoiceLineBean, UserBean userBean, SltlinvoiceBean sltlinvoiceBean,int active) {
		super();
		this.sltl_invoice_line_id = sltl_invoice_line_id;
		this.sltl_mrgine = sltl_mrgine;
		this.amount = amount;
		this.insert_date = insert_date;
		this.invoiceLineBean = invoiceLineBean;
		this.userBean = userBean;
		this.sltlinvoiceBean = sltlinvoiceBean;
		this.active = active;
	}






	@Id
	@Column(name = "sltl_invoice_line_id")
	public int getSltl_invoice_line_id() {
		return sltl_invoice_line_id;
	}
	public void setSltl_invoice_line_id(int sltl_invoice_line_id) {
		this.sltl_invoice_line_id = sltl_invoice_line_id;
	}
	public double getSltl_mrgine() {
		return sltl_mrgine;
	}
	public void setSltl_mrgine(double sltl_mrgine) {
		this.sltl_mrgine = sltl_mrgine;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	
	@ManyToOne
	@JoinColumn(name = "invoice_line_id")
	public InvoiceLineBean getInvoiceLineBean() {
		return invoiceLineBean;
	}
	public void setInvoiceLineBean(InvoiceLineBean invoiceLineBean) {
		this.invoiceLineBean = invoiceLineBean;
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
	@JoinColumn(name = "sltl_invoice_id")
	public SltlinvoiceBean getSltlinvoiceBean() {
		return sltlinvoiceBean;
	}




	public void setSltlinvoiceBean(SltlinvoiceBean sltlinvoiceBean) {
		this.sltlinvoiceBean = sltlinvoiceBean;
	}




	public int getActive() {
		return active;
	}




	public void setActive(int active) {
		this.active = active;
	}
	
	
	
	
	
}
