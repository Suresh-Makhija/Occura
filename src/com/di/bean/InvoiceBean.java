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
@Table(name = "invoice_tbl")
public class InvoiceBean implements Serializable {

	private String invoice_id;
	private String invoice_num;
	private Date invoice_date;
	private Date insert_date;
	private double gross_outstanding;
	private double discount_per;
	private double discount_amount;
	private double final_outstanding;
	private String customer_code;
	private String main_customer_code;
	private String currency_type;
	private double conversion;
	private int posting;
	private Date posting_date;
	private int posting_by;
	private double vat_per;
	private double cgst_per;
	private double sgst_per;
	private double igst_per;
	private int billed;
	private Date bill_date;
	private String bill_ref;

	private CustomerBean customerBean;
	private UserBean userBean;
	private CustomerTypeBean customerTypeBean;

	public InvoiceBean() {
		// TODO Auto-generated constructor stub
	}
	

	public InvoiceBean(String invoice_num, Date invoice_date, Date insert_date, double gross_outstanding,
			double discount_per, double discount_amount, double final_outstanding, String customer_code,
			String main_customer_code, CustomerBean customerBean, UserBean userBean, CustomerTypeBean customerTypeBean,
			String currency_type, double conversion, int posting, Date posting_date, int posting_by, double vat_per,
			double cgst_per, double sgst_per, double igs_per,int billed, Date bill_date, String bill_ref) {
		super();
		this.invoice_num = invoice_num;
		this.invoice_date = invoice_date;
		this.insert_date = insert_date;
		this.gross_outstanding = gross_outstanding;
		this.discount_per = discount_per;
		this.discount_amount = discount_amount;
		this.final_outstanding = final_outstanding;
		this.customer_code = customer_code;
		this.main_customer_code = main_customer_code;
		this.customerBean = customerBean;
		this.userBean = userBean;
		this.customerTypeBean = customerTypeBean;
		this.currency_type = currency_type;
		this.conversion = conversion;
		this.posting = posting;
		this.posting_date = posting_date;
		this.posting_by = posting_by;
		this.vat_per = vat_per;
		this.cgst_per = cgst_per;
		this.sgst_per = sgst_per;
		this.igst_per = igs_per;
		this.billed = billed;
		this.bill_date = bill_date;
		this.bill_ref = bill_ref;
	}

	public InvoiceBean(String invoice_id, String invoice_num, Date invoice_date, Date insert_date,
			double gross_outstanding, double discount_per, double discount_amount, double final_outstanding,
			String customer_code, String main_customer_code, CustomerBean customerBean, UserBean userBean,
			CustomerTypeBean customerTypeBean, String currency_type, double conversion, int posting, Date posting_date,
			int posting_by, double vat_per, double cgst_per, double sgst_per, double igs_per,int billed, Date bill_date, String bill_ref) {
		super();
		this.invoice_id = invoice_id;
		this.invoice_num = invoice_num;
		this.invoice_date = invoice_date;
		this.insert_date = insert_date;
		this.gross_outstanding = gross_outstanding;
		this.discount_per = discount_per;
		this.discount_amount = discount_amount;
		this.final_outstanding = final_outstanding;
		this.customer_code = customer_code;
		this.main_customer_code = main_customer_code;
		this.customerBean = customerBean;
		this.userBean = userBean;
		this.customerTypeBean = customerTypeBean;
		this.currency_type = currency_type;
		this.conversion = conversion;
		this.posting = posting;
		this.posting_date = posting_date;
		this.posting_by = posting_by;
		this.vat_per = vat_per;
		this.cgst_per = cgst_per;
		this.sgst_per = sgst_per;
		this.igst_per = igs_per;
		this.billed = billed;
		this.bill_date = bill_date;
		this.bill_ref = bill_ref;
	}

	@Id
	@Column(name = "invoice_id")
	public String getInvoice_id() {
		return invoice_id;
	}

	public void setInvoice_id(String invoice_id) {
		this.invoice_id = invoice_id;
	}

	public String getInvoice_num() {
		return invoice_num;
	}

	public void setInvoice_num(String invoice_num) {
		this.invoice_num = invoice_num;
	}

	public Date getInvoice_date() {
		return invoice_date;
	}

	public void setInvoice_date(Date invoice_date) {
		this.invoice_date = invoice_date;
	}

	public Date getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}

	public double getGross_outstanding() {
		return gross_outstanding;
	}

	public void setGross_outstanding(double gross_outstanding) {
		this.gross_outstanding = gross_outstanding;
	}

	public double getDiscount_per() {
		return discount_per;
	}

	public void setDiscount_per(double discount_per) {
		this.discount_per = discount_per;
	}

	public double getDiscount_amount() {
		return discount_amount;
	}

	public void setDiscount_amount(double discount_amount) {
		this.discount_amount = discount_amount;
	}

	public double getFinal_outstanding() {
		return final_outstanding;
	}

	public void setFinal_outstanding(double final_outstanding) {
		this.final_outstanding = final_outstanding;
	}

	public String getCustomer_code() {
		return customer_code;
	}

	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}

	public String getMain_customer_code() {
		return main_customer_code;
	}

	public void setMain_customer_code(String main_customer_code) {
		this.main_customer_code = main_customer_code;
	}

	@ManyToOne
	@JoinColumn(name = "customer_id")
	public CustomerBean getCustomerBean() {
		return customerBean;
	}

	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
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
	@JoinColumn(name = "customer_type_id")
	public CustomerTypeBean getCustomerTypeBean() {
		return customerTypeBean;
	}

	public void setCustomerTypeBean(CustomerTypeBean customerTypeBean) {
		this.customerTypeBean = customerTypeBean;
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

	public int getPosting() {
		return posting;
	}

	public void setPosting(int posting) {
		this.posting = posting;
	}

	public Date getPosting_date() {
		return posting_date;
	}

	public void setPosting_date(Date posting_date) {
		this.posting_date = posting_date;
	}

	public int getPosting_by() {
		return posting_by;
	}

	public void setPosting_by(int posting_by) {
		this.posting_by = posting_by;
	}

	public double getVat_per() {
		return vat_per;
	}

	public void setVat_per(double vat_per) {
		this.vat_per = vat_per;
	}

	public double getCgst_per() {
		return cgst_per;
	}

	public void setCgst_per(double cgst_per) {
		this.cgst_per = cgst_per;
	}

	public double getSgst_per() {
		return sgst_per;
	}

	public void setSgst_per(double sgst_per) {
		this.sgst_per = sgst_per;
	}

	public double getIgst_per() {
		return igst_per;
	}

	public void setIgst_per(double igst_per) {
		this.igst_per = igst_per;
	}

	public int getBilled() {
		return billed;
	}

	public void setBilled(int billed) {
		this.billed = billed;
	}

	public Date getBill_date() {
		return bill_date;
	}

	public void setBill_date(Date bill_date) {
		this.bill_date = bill_date;
	}

	public String getBill_ref() {
		return bill_ref;
	}

	public void setBill_ref(String bill_ref) {
		this.bill_ref = bill_ref;
	}

}
