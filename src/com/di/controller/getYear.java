package com.di.controller;

import java.util.Calendar;

public class getYear {

	

	private static int getPreviousYear() {
		int year = 0;
		Calendar calendar = Calendar.getInstance(); 
		 year = calendar.get(Calendar.YEAR);
	    for (int i = 0; i <= 10; i++ ) {	    	 
	    	 year = year - 1;
	    	 System.out.println(year);
	       
	    	 //System.out.println(year);
	    }
	
		return year;
	   
	}
}
