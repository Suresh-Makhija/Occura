package com.occura.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.occura.bean.PatientBean;
import com.occura.utility.CommonUtility;

@Controller
@RequestMapping(value = "health")
public class HealthController {

	@RequestMapping(value = "/appointment_user", method = RequestMethod.POST) // Mapping for Call the controller
	public String login(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("PatientBean")PatientBean patientbean) throws Exception 
	{
	
		
		
		if(patientbean.getUploadfile() != null && patientbean.getUploadfile().getBytes().length > 0)
		{
			String file_path=null;
			String file_name = null;
			MultipartFile file = patientbean.getUploadfile();
			
			String fileName="",fileExtension="",DocumentName="",fileNameWithoutExtension="";
			byte[] fileByteData=null;
			boolean fileWriteFlag=true;
			String filePath=CommonUtility.getFilePathFromcommonConfigVariable("TestUploadFile");
			fileName=patientbean.getUploadfile().getOriginalFilename();
			fileByteData=patientbean.getUploadfile().getBytes();
			
			if(fileName != null && !("").equalsIgnoreCase(fileName)){
				fileExtension=CommonUtility.getFileExtensionFromFileName(fileName);
				fileNameWithoutExtension = CommonUtility.getFileNameWithoutExtension(fileName);
			}
			
			DocumentName=fileNameWithoutExtension+"_"+new SimpleDateFormat("dd-MM-yyyy-HH-mm-ss-SSS").format(Calendar.getInstance().getTime())+"."+fileExtension;
			
			// write file in folder
			fileWriteFlag=CommonUtility.writeDocument(fileByteData, filePath, DocumentName, fileExtension);
			
		  	
		  	if(fileWriteFlag) 
		  	{
		  		patientbean.setPhoto(DocumentName);
			  	copyFileFromSharingToServer(response, request, DocumentName,"TestUploadFile");	
		  	}else
		  	{
		  		// File Not Exists..
		  	}
		
		}
		
		String page = "";
		//HttpSession session = request.getSession(false);
		
		
		
		page = "appointment_user";
		
		
		return page;
	}
	
}
