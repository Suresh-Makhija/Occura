package com.occura.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.occura.Mailer.Mail;
import com.occura.dao.AllListDao;

@Controller
@RequestMapping(value="mail")
public class MailServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	
@RequestMapping(value="/forgotPassword" , method = RequestMethod.POST)
public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
{
	String email_id = 	request.getParameter("email");
	String pwd = AllListDao.findPassword(email_id);
	boolean value = Mail.forgotEmail(email_id, "System Password", pwd);
	response.getWriter().print(value);
}
}
