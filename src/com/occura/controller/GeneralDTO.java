package com.occura.controller;

import java.util.ArrayList;
import java.util.List;

import com.occura.bean.MasterMedicineBean;
import com.occura.bean.PatientCCHistory;
import com.occura.bean.PatientDiagnoHistory;
import com.occura.bean.PatientMedicineHistory;
import com.occura.bean.StockEntry;

public class GeneralDTO {
	
	
	List<PatientCCHistory> boPatientCCHistory=new ArrayList<>();

	public List<PatientCCHistory> getBoPatientCCHistory() {
		return boPatientCCHistory;
	}

	public void setBoPatientCCHistory(List<PatientCCHistory> boPatientCCHistory) {
		this.boPatientCCHistory = boPatientCCHistory;
	}
	
	List<PatientMedicineHistory> boPatientMedicine=new ArrayList<>();

	public List<PatientMedicineHistory> getBoPatientMedicine() {
		return boPatientMedicine;
	}

	public void setBoPatientMedicine(List<PatientMedicineHistory> boPatientMedicine) {
		this.boPatientMedicine = boPatientMedicine;
	}

	PatientDiagnoHistory boPatientDiagnos=new PatientDiagnoHistory();

	public PatientDiagnoHistory getBoPatientDiagnos() {
		return boPatientDiagnos;
	}

	public void setBoPatientDiagnos(PatientDiagnoHistory boPatientDiagnos) {
		this.boPatientDiagnos = boPatientDiagnos;
	}
	
	List<MasterMedicineBean> masterMedicineBeans=new ArrayList<>();

	public List<MasterMedicineBean> getMasterMedicineBeans() {
		return masterMedicineBeans;
	}
	
	public void setMasterMedicineBeans(List<MasterMedicineBean> masterMedicineBeans) {
		this.masterMedicineBeans = masterMedicineBeans;
	}

	List<StockEntry> stockEntries=new ArrayList<>();

	public List<StockEntry> getStockEntries() {
		return stockEntries;
	}

	public void setStockEntries(List<StockEntry> stockEntries) {
		this.stockEntries = stockEntries;
	}
	
}
