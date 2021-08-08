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
import com.occura.bean.MasterMedicineBean;
import com.occura.bean.PatientAppointmentBean;
import com.occura.bean.PatientBean;
import com.occura.bean.PatientCCHistory;
import com.occura.bean.PatientDiagnoHistory;
import com.occura.bean.PatientMedicineHistory;
import com.occura.bean.StockEntry;
import com.occura.bean.UserBean;
import com.occura.bean.UserProfileBean;
import com.occura.dao.AllInsertDao;
import com.occura.dao.AllListDao;
import com.occura.utility.CommonUtility;

@Controller
@RequestMapping(value = "pharma")
public class PharmaController {
	AllListDao allListDao = new AllListDao();
	private static final DateFormat DATE_TIME_FORMAT = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss aa");
	SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	AllInsertDao allInserDao = new AllInsertDao();
	
	
	

	
	
	
	
}
