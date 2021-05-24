package com.occura.controller;


import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
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
import org.springframework.web.servlet.ModelAndView;

import com.occura.bean.PatientBean;
import com.occura.bean.UserBean;
import com.occura.dao.AllInsertDao;
import com.occura.dao.AllListDao;
import com.occura.utility.CommonUtility;

@Controller
@RequestMapping(value = "health")
public class HealthController extends HttpServlet{

	private static final DateFormat DATE_TIME_FORMAT = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
	
	@RequestMapping(value = "/appointment_user") // Mapping for Call the controller
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("PatientBean")PatientBean patientbean) throws Exception
	{
		//,@RequestParam MultipartFile uploadfile
		//HttpSession session = request.getSession(false);
		
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
//			  	copyFileFromSharingToServer(response, request, DocumentName,"TestUploadFile");	
		  	}else
		  	{
		  		// File Not Exists..
		  	}
		}
		
		DateFormat outputformat24 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	  	//DateFormat outputformat12 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss aa");
	  	String sightingDateString = patientbean.getAppointment_date_time();
	  	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	  	
	  	//DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); 
	  	//LocalDateTime dateTime = LocalDateTime.parse(sightingDateString.replace("T"," "), format); 
	  	Date date=null;
	  	//String output=null;
	  	try {
	  		date= formatter.parse(sightingDateString.replace("T"," "));
	  		//date= outputformat24.parse(patientbean.getAppointment_date_time());
	  		//output = outputformat24.format(date);
	  	}catch(Exception e)
	  	{
	  		//e.printStackTrace();
	  		System.out.println("Catch Exception-->"+e.getMessage());
	  	}
	  	
	  	patientbean.setAppointment_date(date);
	  	patientbean.setCrt_date(new Date());
	  	patientbean.setFull_name(patientbean.getFirst_name()+" "+patientbean.getLast_name());
	  	boolean value = false;
	  	value =  AllInsertDao.savepatient(patientbean);
	  //	String page = "appointment_user";
	  	
	  	if(value)
	  	{
	  		request.setAttribute("msg", "success");
	  	}else
	  	{
	  		request.setAttribute("msg", "fail");
	  	}
	  	

	  	return new ModelAndView("appointment_user");
//	  	response.sendRedirect(request.getContextPath() + "/view/appointment_user.jsp");
	}
	
	
//	@RequestMapping(value = "/testing") // Mapping for Call the controller
//	public void testing(HttpServletRequest request, HttpServletResponse response) throws Exception,ServletException,IOException
//	{
//		
//	  	request.setAttribute("msg", "success");
//	  	
//	  	RequestDispatcher rd = request.getRequestDispatcher("/view/appointment_user.jsp");
//	    rd.forward(request, response);
//	  	//return new ModelAndView("appointment_user");
////	  	response.sendRedirect(request.getContextPath() + "/view/appointment_user.jsp");
//	}
	
	@RequestMapping(value="/checkemail")
	public void checkemail(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		 String returnString="";
		String email_id = 	request.getParameter("email");
		boolean value = false;
		PatientBean patient = AllListDao.findEmailByPatient(email_id);
		if(patient != null)
		{
			returnString = "exist";
		}
		else
		{
			returnString = "not exist";
		}
		response.getWriter().print(returnString);
	}
	
}
