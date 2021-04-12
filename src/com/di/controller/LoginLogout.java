package com.di.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.di.bean.UserBean;
import com.di.dao.AllListDAO;
import com.di.dao.AllUpdateDAO;
import com.diSync.controller.sync;
import com.diSync.controller.test1;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class LoginLogout extends HttpServlet {
	
	AllListDAO allListDAO = new AllListDAO();
	AllUpdateDAO allupdateDAO = new AllUpdateDAO();
	
	//This is use for convert data into json format
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
	
	 String responseData = "";
	 String jsonArray= "" ;
	 int statusCode = 0;
	 String msg = "";
	
	@RequestMapping(value = "/login", method = RequestMethod.POST) // Mapping for Call the controller
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
	
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
	        
      String encodeText = new AESEncrypt().encrypt(password);
      // String encodeText = new EncodeDecode().encodeString(password);
		
//		UserBean userBean = allListDAO.checkLogin(userName, encodeText);
		
		String page = "";
		HttpSession session = request.getSession();
		
//		if(userBean != null) {
			
//			final String custId = String.valueOf(userBean.getCustomer_id());
			
			String diamondSession = new EncodeDecode().encodeString("diamondSession");
//			session.setAttribute(diamondSession, new Us);
			
				
			/*Syncing process for local to live & live to local*/
			
			//String url = request.getRequestURL().toString();
			 
		/*	new Thread(new Runnable() {
			    public void run() {
			    	//For adjust stock
			    	
			    	new sync().challanOutLineSync(custId);
					new sync().challanOutSync(custId);
					new sync().challanSync(custId);
					
					new sync().workHistoryProductSync(custId);
					new sync().workHistoryProductProcessSync(custId);
			    	
			    	System.err.println("--------------------------111111");
			    	new StockAdjustment().adjust();
					//For Sync user data live --> local and locat --> live 
			    	System.err.println("--------------------------222222");
			    	new sync().userDataSync();
			    	System.err.println("--------------------------333333");
			    	 //For Sync Status live --> local 
			    	new sync().statusSync();
			    	System.err.println("--------------------------444444");
			    	 //For Sync Product live --> local 
			    	new sync().productSync();
			    	System.err.println("--------------------------555555");
			    	 //For Sync Product Process live --> local 
			    	new sync().productProcessSync();
			    	System.err.println("--------------------------666666");
			    	//For Sync customer
			    	new sync().customerSync(custId);
			    	System.err.println("--------------------------777777");
					//For Sync Customer Type
					new sync().customerTypeSync();
					System.err.println("--------------------------888888");
					//For Sync Challan
					//new sync().challanSync(custId);
					//For Sync Challan Out
					//new sync().challanOutSync(custId);
					//For Sync Work history
					new sync().workHistorySync(custId);
			    
					
			    
			    }
			}).start();*/
		
		//	Latest
			 
/*			new Thread(new Runnable() {
			    public void run() {
			    	//For adjust stock
			    	new StockAdjustment().adjust();
					//For Sync user data live --> local and locat --> live 
			    	new sync().userDataSync();
			    	 //For Sync Status live --> local 
			    	new sync().statusSync();
			    	 //For Sync Product live --> local 
			    	new sync().productSync();
			    	 //For Sync Product Process live --> local 
			    	new sync().productProcessSync();
			    	//For Sync customer
			    	new sync().customerSync(custId);
					//For Sync Customer Type
					new sync().customerTypeSync();
					//For Sync Challan
					new sync().challanSync(custId);
					//For Sync Challan Out
					new sync().challanOutSync(custId);
					//For Sync Work history
					new sync().workHistorySync(custId);
			    }
			}).start();
			*/
			
//			if(userBean.getAuthority() == 4) {
//				
//			page = "userPage";
//			
//			}else {
//				page = "challanMaster";
//			}
//		}else {
//			request.setAttribute("loginError","Username & Password not match.");
//			page = "login";
//		}
		
		return "dashboard";
	}
	
	
	@RequestMapping(value = "/androidLogin", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String androidLogin(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
	
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String jsonArray = null;
	        
       String encodeText = new AESEncrypt().encrypt(password);
		
		UserBean userBean = allListDAO.checkLogin(userName, encodeText);
		
		String page = "";
		HttpSession session = request.getSession();
		
		if(userBean != null) {
			
			 jsonArray = gson.toJson(userBean);
			 statusCode  = 200; //ok
			 msg = "success";
			
		}else {
			statusCode = 403;     // not authorised
			msg = "You are not authorised to use this Application.";
		}
		
		
		 responseData  = "{";
		 responseData += "\"statusCode\" : \""+statusCode+"\",";
		 responseData += "\"msg\" : \""+msg+"\",";
		 responseData += "\"data\" : "+jsonArray;
		 responseData += "}";
		 
		// response.getWriter().print(responseData);
		 return responseData;
		
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET) // Mapping for Call the controller
	public String logout(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException 
	{
	
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "login";
	}
	
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for send data
	public String changePassword(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
	
		String password = request.getParameter("pass");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		
		UserBean userBean = allListDAO.detailsOfUserByUserId(user_id);
		
		String cCode = userBean.getCustomer_code();
		String encodePass = new AESEncrypt().encrypt(password);
		
		boolean changePass = allupdateDAO.changePassword(user_id, encodePass);
		if(userBean.getAuthority() == 2) {
			//boolean nebulaUserPassUpdate = allNebulaUpdateDAO.updatePassword(cCode, password);
			String urlStr = "http://103.11.117.101:6018/Nebula/servlet/updatePassword?customer_code="+cCode+"&password="+password; //just a string
			String str = "";
			String output = "";
			try {
				URL url = new URL(urlStr);
				BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
				
				while (null != (str = br.readLine())) {
				//	System.out.println(str);
					output = output + str.trim();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		
		
		return null;
	}

}
