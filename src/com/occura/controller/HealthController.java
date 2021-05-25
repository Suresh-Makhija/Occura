package com.occura.controller;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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
import com.occura.dao.AllListDao;
import com.occura.utility.CommonUtility;

@Controller
@RequestMapping(value = "health")
public class HealthController {
	AllListDao allListDao = new AllListDao();
	private static final DateFormat DATE_TIME_FORMAT = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss aa");
	
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
//			  	copyFileFromSharingToServer(response, request, DocumentName,"TestUploadFile");	
		  	}else
		  	{
		  		// File Not Exists..
		  	}
		  	
		  	patientbean.setAppointment_date(DATE_TIME_FORMAT.parse(patientbean.getAppointment_date_time()));
		  	System.out.println(patientbean.getAppointment_date());
		  	patientbean.setCrt_date(new Date());
		  	
		  	
		  	
		  	
		}
		
		String page = "";
		//HttpSession session = request.getSession(false);
		
		
		
		page = "appointment_user";
		
		
		return page;
	}
	
	
	@RequestMapping(value = "/patientCount", method = RequestMethod.POST)
	public void patientCount(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String json = "[";
		List<Object[]> patientCount = allListDao.findPatientChart();
		for(Object[] object : patientCount)
		{
		json = json + "{\"timeZone\":\"" +object[0]+"\",\"count\":\"" +object[1]+"\"}";
		}
		json = json.replace("}{", "},{");
		json = json + "]";
			response.getWriter().print(json);
	}
	
	@RequestMapping(value = "/toDoGraph", method = RequestMethod.POST)
	public void toDoGraph(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String json = "[";
		List<Object[]> patientCount = allListDao.toDograph();
		for(Object[] object : patientCount)
		{
		json = json + "{\"time\":\"" +object[0]+"\",\"description\":\"" +object[1]+"\",\"name\":\"" +object[2]+"\"}";
		}
		json = json.replace("}{", "},{");
		json = json + "]";
			response.getWriter().print(json);
	}
	
	@RequestMapping(value = "/operationHistoryCharts", method = RequestMethod.POST)
	public void operationHistoryCharts(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String json = "[";
		List<Object[]> patientCount = new ArrayList<Object[]>();
		String year = request.getParameter("year");
		String from = year+"-01-01";
		String to = year+"-12-31";
		String type = request.getParameter("type");
				if(type.equalsIgnoreCase("operation"))
					patientCount = 	allListDao.OperationHistoryOperationCount(from,to,"month");
				else
				{
					patientCount = allListDao.OperationHistoryPatientCount(from,to,"month");
				}
		for(Object[] object : patientCount)
		{
		json = json + "{\"month\":\"" +object[0]+"\",\"amount\":\"" +object[1]+"\"}";
		}
		json = json.replace("}{", "},{");
		json = json + "]";
			response.getWriter().print(json);
	}
	
	@RequestMapping(value = "/basicDetails", method = RequestMethod.POST) // Mapping for Call the controller
	public void basicDetails(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
	
	String json = "[";	
	HashMap<String, Integer> basicDetails = allListDao.dashboardBasicDetails();
	json = json + "{\"pharmacy_income\":\"" +basicDetails.get("pharmacy_income")+"\",\"operation_income\":\"" +basicDetails.get("operation_income")+"\",\"total_operation\":\"" +basicDetails.get("total_operation")+"\",\"total_patient\":\"" +basicDetails.get("total_patient")+"\",\"today_patient\":\"" +basicDetails.get("today_patient")+"\",\"revenue\":\"" +basicDetails.get("revenue")+"\"}";
	json = json.replace("}{", "},{");
	json = json + "]";
		response.getWriter().print(json);
	}
	
	@RequestMapping(value = "/revenueGraph", method = RequestMethod.POST) // Mapping for Call the controller
	public void revenueGraph(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("PatientBean")PatientBean patientbean) throws Exception 
	{
		List<Object[]> basicDetails = new ArrayList<Object[]>();
		String from = "";
		String to = "";
String type = 	request.getParameter("type");
String year = 	request.getParameter("year");
String grpah = request.getParameter("graph");
if(type.equalsIgnoreCase("yearlyRevenue"))
{
	from = year+"-01-01";
	to = year+"-12-31";
	if(grpah.equalsIgnoreCase("operation"))
	basicDetails = allListDao.findRevenueChart(from,to,"month");
	if(grpah.equalsIgnoreCase("medicine"))
		basicDetails = allListDao.findRevenueChartMedicine(from,to,"month");
}

if(type.equalsIgnoreCase("monthlyRevenue"))
{
	from = "2021-05-01";
	to = "2021-05-31";
	if(grpah.equalsIgnoreCase("operation"))
	basicDetails = allListDao.findRevenueChart(from,to,"day");
	if(grpah.equalsIgnoreCase("medicine"))
		basicDetails = allListDao.findRevenueChartMedicine(from,to,"day");
}
	String json = "[";	
	 
	for(Object[] object : basicDetails)
	{
	json = json + "{\"month\":\"" +object[0]+"\",\"amount\":\"" +object[1]+"\"}";
	}
	json = json.replace("}{", "},{");
	json = json + "]";
		response.getWriter().print(json);
	}
}
