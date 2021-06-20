package com.occura.controller;


import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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

import com.occura.bean.MasterChiefComplaintBean;
import com.occura.bean.PatientAppointmentBean;
import com.occura.bean.PatientBean;
import com.occura.bean.UserBean;
import com.occura.bean.UserProfileBean;
import com.occura.dao.AllInsertDao;
import com.occura.dao.AllListDao;
import com.occura.utility.CommonUtility;

@Controller
@RequestMapping(value = "health")
public class HealthController {
	AllListDao allListDao = new AllListDao();
	private static final DateFormat DATE_TIME_FORMAT = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss aa");
	SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	AllInsertDao allInserDao = new AllInsertDao();
	
	
	@RequestMapping(value="/startSession")
	public ModelAndView startSession(HttpServletRequest request,HttpServletResponse response) throws IOException
	{

		HttpSession session  = request.getSession(false);
		return new ModelAndView("Session");
	}
	@RequestMapping(value="/loadindex")
	public ModelAndView loadindex(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session  = request.getSession(false);
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/doctorprofile")
	public ModelAndView doctorprofile(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session  = request.getSession(false);
		return new ModelAndView("doctor-profile");
	}
	
	@RequestMapping(value="/loadappointment")
	public ModelAndView loadappointment(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session  = request.getSession(false);
		return new ModelAndView("appointment_user");
	}
	
	@RequestMapping(value="/loadcalendar")
	public ModelAndView loadcalendar(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session  = request.getSession(false);
		return new ModelAndView("fullcalendar");
	}
	
	@RequestMapping(value="/loaddepartment")
	public ModelAndView loaddepartment(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session  = request.getSession(false);
		return new ModelAndView("depa-add");
	}
	
	@RequestMapping(value="/loadtestsnapshot")
	public ModelAndView loadtestsnapshot(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session  = request.getSession(false);
		return new ModelAndView("testsnapshot");
	}
	
	@RequestMapping(value="/oldusersearch")
	public ModelAndView oldusersearch(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session  = request.getSession(false);
		String onPage = "2";
		
		if (request.getParameter("page") != null && !("").equalsIgnoreCase(request.getParameter("page"))) {
			onPage = request.getParameter("page");
		}
		request.setAttribute("onPage", onPage);
		
		String query="";
		if (request.getParameter("query") != null && !("").equalsIgnoreCase(request.getParameter("query"))) {
			query = request.getParameter("query");
		}
		
		List<PatientBean> listpatient = allListDao.findQueryOldCase(query);
		if(listpatient != null)
		{
			if(listpatient.size()>0)
			{
				request.setAttribute("listpatient", listpatient);
				request.setAttribute("search", "search");
			}
		}
		
		return new ModelAndView("appointment_user");
	}
	
	
	@RequestMapping(value="/saveAppointmenttime")
	public ModelAndView saveAppointmenttime(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session  = request.getSession(false);
		String onPage = "2";
		
		if (request.getParameter("page") != null && !("").equalsIgnoreCase(request.getParameter("page"))) {
			onPage = request.getParameter("page");
		}
		request.setAttribute("onPage", onPage);
		
		String appointmentTime = !CommonUtility.checkString(request.getParameter("hiddenappointmenttime"))?request.getParameter("hiddenappointmenttime"):"";
		String description = !CommonUtility.checkString(request.getParameter("hiddendescription"))?request.getParameter("hiddendescription"):"";
		String patientid = !CommonUtility.checkString(request.getParameter("patientid"))?request.getParameter("patientid"):"";
		
	  	String sightingDateString = appointmentTime;




		DateFormat outputformat24 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	  	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	  	Date date=null;
	  	try {
	  		date= formatter.parse(sightingDateString.replace("T"," "));
	  	}catch(Exception e)
	  	{
	  		System.out.println("Catch Exception-->"+e.getMessage());
	  	}
	  	
	  	boolean status = false;
	  	
	  	PatientBean patient_userid = new PatientBean();
	  	patient_userid.setPatient_id(Integer.valueOf(patientid));
	  	
	  	PatientAppointmentBean  saveappointment = new PatientAppointmentBean(patient_userid,date,new Date(),description);
	  	status =  AllInsertDao.save(saveappointment);
		

	  

	  	if(status)
	  	{
	  		request.setAttribute("msg", "success");
	  	}else
	  	{
	  		request.setAttribute("msg", "fail");
	  	}
		
		return new ModelAndView("appointment_user");
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/appointment_user") // Mapping for Call the controller
	public ModelAndView appointment_user(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("PatientBean")PatientBean patientbean) throws Exception
	{
		//,@RequestParam MultipartFile uploadfile
		//HttpSession session = request.getSession(false);

		String onPage = "1";
		
		if (request.getParameter("page") != null && !("").equalsIgnoreCase(request.getParameter("page"))) {
			onPage = request.getParameter("page");
		}
		request.setAttribute("onPage", onPage);
		
		
		if(patientbean.getAppointment_date_time() != null && !("").equals(patientbean.getAppointment_date_time()))
		{
//			if(patientbean.getUploadfile() != null && patientbean.getUploadfile().getBytes().length > 0)
//			{
//				String file_path=null;
//				String file_name = null;
//				MultipartFile file = patientbean.getUploadfile();
//
//				String fileName="",fileExtension="",DocumentName="",fileNameWithoutExtension="";
//				byte[] fileByteData=null;
//				boolean fileWriteFlag=true;
//				String filePath=CommonUtility.getFilePathFromcommonConfigVariable("TestUploadFile");
//				fileName=patientbean.getUploadfile().getOriginalFilename();
//				fileByteData=patientbean.getUploadfile().getBytes();
//
//				if(fileName != null && !("").equalsIgnoreCase(fileName)){
//					fileExtension=CommonUtility.getFileExtensionFromFileName(fileName);
//					fileNameWithoutExtension = CommonUtility.getFileNameWithoutExtension(fileName);
//				}
//
//				DocumentName=fileNameWithoutExtension+"_"+new SimpleDateFormat("dd-MM-yyyy-HH-mm-ss-SSS").format(Calendar.getInstance().getTime())+"."+fileExtension;
//
//				// write file in folder
//				fileWriteFlag=CommonUtility.writeDocument(fileByteData, filePath, DocumentName, fileExtension);
//
//			  	if(fileWriteFlag)
//			  	{
//			  		patientbean.setPhoto(DocumentName);
////				  	copyFileFromSharingToServer(response, request, DocumentName,"TestUploadFile");
//			  	}else
//			  	{
//			  		// File Not Exists..
//			  	}
//			}
			if(patientbean.getPatientpicturebase64() != null && !("").equalsIgnoreCase(patientbean.getPatientpicturebase64()))
			{
				String DocumentName="";
				DocumentName=patientbean.getFirst_name()+"_"+patientbean.getLast_name()+"_"+new SimpleDateFormat("dd-MM-yyyy-HH-mm-ss-SSS").format(Calendar.getInstance().getTime())+".png";
				
				Map<Integer, Object> map = new HashMap<Integer, Object>();
				map.put(1, patientbean.getPatientpicturebase64());
				map.put(2, "TestUploadFile");
				map.put(3, DocumentName);
				boolean fileupload=CommonUtility.uploadBase64WithDocumentNameAndMachineNumber(map);
				
			  	if(fileupload)
			  	{
			  		patientbean.setPhoto(DocumentName);
			  		patientbean.setPhotobase64(patientbean.getPatientpicturebase64());
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
	
	@RequestMapping(value="/checkdatetime")
	public void checkdatetime(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException
	{
		 String returnString="";
		 String appointmentdate = request.getParameter("appointmentdate");
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		//DateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//Date date= null;
		boolean value = false;
		
		try {
			
			appointmentdate = appointmentdate.replace("T"," ").concat(":00");
	  		//date= formatter.parse(appointmentdate.replace("T"," "));
	  		PatientAppointmentBean patient = AllListDao.findDateTimeByPatient(appointmentdate);
	  		
	  		if(patient != null)
			{
				returnString = "exist";
			}
			else
			{
				returnString = "not exist";
			}
	  		
	  	}catch(Exception e)
	  	{
	  		returnString = "error";
	  		System.out.println("Catch Exception-->"+e.getMessage());
	  	}
		
		
		response.getWriter().print(returnString);
	}

	
	@RequestMapping(value = "/listNotification", method = RequestMethod.POST)
	public void listNotification(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String json = "[";
		List<Object[]> patient = allListDao.getlistfromPatient();
		for(Object[] object : patient)
		{
		json = json + "{\"full_name\":\" "+object[2]+" \",\"appointment_time\":\" "+object[3]+" \"}";
		}
		json = json.replace("}{", "},{");
		json = json + "]";
	    response.getWriter().print(json);
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
		json = json + "{\"time\":\" "+object[0]+" \",\"description\":\" "+object[1]+" \",\"name\":\" "+object[2]+" \"}";
		//json = json + "{\"time\":\" "+object[0]+" \",\"description\":\" ADD DESCRIPTION \",\"name\":\" "+object[1]+" \"}";
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

	
	@RequestMapping(value = "/userProfileUpdate", method = RequestMethod.POST) // Mapping for Call the controller
	public void userProfileUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception
	{Date b_day = new Date();
	long mobile = 0;
		String user = request.getParameter("user_id");
		String f_name = request.getParameter("f_name");
		String lst_name = request.getParameter("lst_name");
		String gender = request.getParameter("gender");
		String add_1 = request.getParameter("add_1");
		String add_2 = request.getParameter("add_2");
		
		if(request.getParameter("b_day") != null && !request.getParameter("b_day").equalsIgnoreCase("NaN-NaN-NaN"))
		 b_day = SimpleDateFormat.parse(request.getParameter("b_day")) ;
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		System.err.print(request.getParameter("mobile"));
		if(request.getParameter("mobile") != null)
		mobile = Long.valueOf(request.getParameter("mobile"));
		UserProfileBean userProfileBean =  allListDao.findUserProfile(Integer.valueOf(user));
		UserBean userBean =  allListDao.findUser(Integer.valueOf(user));
		if(userProfileBean != null)
		{
			userProfileBean.setFirst_name(f_name);
			userProfileBean.setLast_name(lst_name);
			userProfileBean.setGender(gender);
			userProfileBean.setBirth_date(b_day);
			userProfileBean.setAddress_line_1(add_1);
			userProfileBean.setAddress_line_2(add_2);
			userProfileBean.setCity(city);
			userProfileBean.setState(state);
			userProfileBean.setCountry(country);
			userProfileBean.setUserBean(userBean);
			userProfileBean.setPhone_no((mobile));
		}
		else {
		 userProfileBean = new UserProfileBean(f_name, lst_name, gender, b_day, add_1, add_2, city, state, country, userBean,mobile);
		}
		boolean value =  allInserDao.save(userProfileBean);
		response.getWriter().print(value);
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST) // Mapping for Call the controller
	public void changePassword(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("PatientBean")PatientBean patientbean) throws Exception
	{
		String user = request.getParameter("user_id");
		UserBean userBean =  allListDao.findUser(Integer.valueOf(user));
		String pass = request.getParameter("newPass");
		userBean.setPassword(pass);
		boolean value = allInserDao.save(userBean);
		response.getWriter().print(value);
		
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
	
	@RequestMapping(value = "/selectionChiefComplaint", method = RequestMethod.POST) // Mapping for Call the controller
	public void selectionChiefComplaint(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<MasterChiefComplaintBean> masterChiefComplaintBean = allListDao.getChiefComplaintList();
		String json = "[";
		for(MasterChiefComplaintBean masterChiefComplaintBean2 : masterChiefComplaintBean)
		{
			json = json + "{\"id\":\"" +masterChiefComplaintBean2.getMaster_cc_id()+"\",\"value\":\"" +masterChiefComplaintBean2.getCc_description()+"\"}";
		}
		json = json.replace("}{", "},{");
		json = json + "]";
		response.getWriter().print(json);
	}
	
	@RequestMapping(value = "/chiefComplain") // Mapping for Call the controller
	public void chiefComplain(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
	String complaints[] = 	request.getParameterValues("chielfComplaintSelectName");
	String durations[] = 	request.getParameterValues("chiefDuration");
	String description[] =	request.getParameterValues("description");
	}
}
