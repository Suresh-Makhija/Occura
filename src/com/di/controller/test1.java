package com.di.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import com.diSync.controller.sync;

public class test1 {

	public static void main(String[] args) throws Exception {
	
/*		String pass = "311";
		  String encode1  = null;
		String encode = new AESEncrypt().encrypt(pass).trim();
		 System.out.println(encode);
		if(encode.contains("+")) {
			System.err.println("avayu");
			   encode1 = encode.replaceAll("[!@#$%^&*()+=|]","+");
			  System.out.println(encode1);
		}
			
	
		//String decode1 = encode1.replaceAll("+", "+");
		
		String decode = new AESEncrypt().decrypt(encode).toString();
		
		System.out.println(decode);*/
	
		
		//new sync().workHistorySync("1301"); 

	/*	//For Sync Challan
		new sync().challanSync("1301");
		//For Sync Challan Out
		new sync().challanOutSync("1301");*/
		
		 //System.out.println(getPreviousYear());
		 
		getPreviousYear();
	/*	int i=0;
		List<Integer> list1 =  new ArrayList<Integer>();
		for(Integer i : list1) {
			
			int chirag = list1.get(i);
			System.out.println("chirag :"+chirag);
			
		}
		*/
	
		}

		  
		
	

	private static List<Integer> getPreviousYear() {
		int year = 0;
		Calendar calendar = Calendar.getInstance(); 
		 year = calendar.get(Calendar.YEAR);
		 List<Integer> list = new ArrayList<Integer>();
	    for (int i = 0; i <= 10; i++ ) {	    	 
	    	 year = year - 1;
	    	 System.out.println(year);
	    	 //System.out.println(year);
	    	 list.add(year);
	    }
	
		return list;
	   
	}
	
}


