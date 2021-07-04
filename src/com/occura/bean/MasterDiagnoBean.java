package com.occura.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "master_diagno_tbl")
public class MasterDiagnoBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private int master_diagno_id;
	private String diagno_description;
	private Date crt_date;
	
	@Id
	public int getMaster_diagno_id() {
		return master_diagno_id;
	}
	public void setMaster_diagno_id(int master_diagno_id) {
		this.master_diagno_id = master_diagno_id;
	}
	public String getDiagno_description() {
		return diagno_description;
	}
	public void setDiagno_description(String diagno_description) {
		this.diagno_description = diagno_description;
	}
	public Date getCrt_date() {
		return crt_date;
	}
	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public MasterDiagnoBean( String diagno_description, Date crt_date) {
		super();
		this.diagno_description = diagno_description;
		this.crt_date = crt_date;
	}
	
	
	
	

	
	
	
	
}