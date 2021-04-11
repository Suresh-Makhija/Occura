package com.di.controller;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;

public class checkInternet {

	 private static final String HOST = "192.168.182.181";
	
		public static void main(String[] args) throws UnsupportedEncodingException, ParseException {
		
	    boolean isConnected = false;
		try {
			
			isConnected = !HOST.equals(InetAddress.getLocalHost().getHostAddress().toString());
			System.out.println("is" +InetAddress.getLocalHost());
			System.out.println("is" +InetAddress.getLocalHost().getHostAddress());
			System.out.println("is" +InetAddress.getLocalHost().getHostAddress().toString());
			System.out.println(isConnected);
		
			} 
		
		catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}

        	if (isConnected) System.out.println("Connected");
        	else System.out.println("Not connected");

		
	}
	
}
