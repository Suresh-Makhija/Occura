package com.di.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.di.dao.AllCountDAO;
import com.di.dao.AllDeleteDAO;
import com.di.dao.AllInsertDAO;
import com.di.dao.AllListDAO;
import com.di.dao.AllUpdateDAO;
import com.diSync.liveDAO.AllLiveUpdateDAO;

@Controller
public class controller {

	AllInsertDAO allInsertDAO = new AllInsertDAO();
	AllUpdateDAO allUpdateDAO = new AllUpdateDAO();
	AllListDAO allListDAO = new AllListDAO();
	AllDeleteDAO allDeleteDAO = new AllDeleteDAO();
	AllCountDAO allCountDAO = new AllCountDAO();

	AllLiveUpdateDAO allLiveUpdateDAO = new AllLiveUpdateDAO();

	
	@RequestMapping(value = "/deactiveInvoice", method = RequestMethod.GET) // Mapping for Call the controller
	public String deactiveInvoice(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("redirect?p=aW52b2ljZUxpc3Q=");
		return null;
	}
	
}
