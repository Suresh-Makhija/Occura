package com.occura.controller;

import java.util.ArrayList;
import java.util.List;

import com.occura.bean.PatientCCHistory;
import com.occura.bean.PatientDiagnoHistory;
import com.occura.bean.PatientMedicineHistory;

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
	
	
}
