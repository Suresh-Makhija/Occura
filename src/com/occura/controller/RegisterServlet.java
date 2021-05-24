package com.occura.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.occura.bean.UserBean;
import com.occura.dao.AllInsertDao;
import com.occura.dao.AllListDao;

@Controller
@RequestMapping(value="controller")
public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	
@RequestMapping(value="/register" , method = RequestMethod.POST)
public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
{
	 String returnString="";
	String email_id = 	request.getParameter("email");
	String password= 	request.getParameter("password");
	String userName =request.getParameter("user");
	boolean value = false;
	UserBean user = AllListDao.findUserByName(userName,email_id);
	if(user == null)
	{
	 user = new UserBean(userName,email_id,password,new Date());
	 value =  AllInsertDao.save(user);
	
	 if(value)
		{
		 returnString = "match";
		}
		else
		{
			returnString = "notmatch";
		}
	}
	else
	{
		returnString = "exist";
	}
	response.getWriter().print(returnString);
}



@RequestMapping(value="/login" , method = RequestMethod.POST)
public void login(HttpServletRequest request,HttpServletResponse response) throws IOException
{
	 String returnString="";
	String email_id = 	request.getParameter("email");
	String password= 	request.getParameter("password");
	UserBean user = AllListDao.findUserByLogin(email_id,email_id,password);
	
	if(user != null)
	{
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", user);
		returnString = "true";
	}
	else
	{
		returnString = "false";
	}
	response.getWriter().print(returnString);
}


@RequestMapping(value="/logout" , method = RequestMethod.POST)
public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException
{
	 HttpSession session  = request.getSession(false);
	 session.invalidate();
	response.getWriter().print("logout");
}



}
