package com.occura.controller;

import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;

import com.occura.bean.UserBean;
import com.occura.dao.AllInsertDao;

public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request,HttpServletResponse response)
{
	String email_id = 	request.getParameter("email");
	String password= 	request.getParameter("password");
	String userName =request.getParameter("user");
	AllInsertDao allInsertDao = new AllInsertDao();
	UserBean user = new UserBean(userName,email_id,password,new Date());
	boolean value =  allInsertDao.insertUser(user);
	if(value)
	{
		
	}
	else
	{
		
	}
}
}
