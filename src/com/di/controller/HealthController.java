package com.di.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "health")
public class HealthController {
	
	@RequestMapping(value="/getdatadashboard")
	public void getdatadashboard(HttpServletRequest request,HttpServletResponse response)
			throws Exception {
		try{
			
			JSONObject obj = new JSONObject();
			obj.put("total_patient", "250");
			obj.put("new_patient", "25");
			obj.put("doc_operation", "10");
			obj.put("doc_surgery", "8");
			obj.put("doc_treatment", "30");
			obj.put("total_visitors", "15k");
			obj.put("today_visitors", "150");
			obj.put("month_visitors", "3000");
			obj.put("doc_revenue", "$19000");
			obj.put("happy_client", "600");
			obj.put("smiley_faces", "3000");
			PrintWriter out = response.getWriter();
			out.print(obj);
	
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
