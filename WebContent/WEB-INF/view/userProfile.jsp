<%@page import="com.di.bean.CurrencyBean"%>
<%@page import="com.di.bean.ProductProcessBean"%>
<%@page import="com.di.dao.AllListDAO"%>
<%@page import="com.di.bean.ProductMasterBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Company Profile</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
	CustomerBean customerBean = allListDAO.customerDetails(userCustId);
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-building-o"></i> Company Profile</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Company Profile</li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>

			<br>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-3">
									<h4 class="card-title" id="striped-label-layout-icons">Company Profile</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								
									<table class="table">
										<tr>
											<th>Company Name</th>
											<td>:</td>
											<td><%=customerBean.getCompany()%></td>
										</tr>
										<tr>
											<th>Person Name</th>
											<td>:</td>
											<td><%=customerBean.getFullname()%></td>
										</tr>
										<tr>
											<th>GST Number</th>
											<td>:</td>
											<td><%=customerBean.getGst_number()%></td>
										</tr>
										<tr>
											<th>Vat Number</th>
											<td>:</td>
											<td><%=customerBean.getVat_number()%></td>
										</tr>
										<tr>
											<th>Tax (%)</th>
											<td>:</td>
											<td><%=customerBean.getVat_rate()%></td>
										</tr>
										<tr>
											<th>Contact-1</th>
											<td>:</td>
											<td><%=customerBean.getContact_one()%></td>
										</tr>
										<tr>
											<th>Contact-2</th>
											<td>:</td>
											<td><%=customerBean.getContact_two()%></td>
										</tr>
										<tr>
											<th>Email-1</th>
											<td>:</td>
											<td><%=customerBean.getEmail_one()%></td>
										</tr>
										<tr>
											<th>Email-2</th>
											<td>:</td>
											<td><%=customerBean.getEmail_two()%></td>
										</tr>
										<tr>
											<th>Address</th>
											<td>:</td>
											<td style="white-space: pre-wrap;"><%=customerBean.getAddress()%></td>
										</tr>
										<tr>
											<th>Zip Code</th>
											<td>:</td>
											<td><%=customerBean.getZipcode()%></td>
										</tr>
										<tr>
											<th>City</th>
											<td>:</td>
											<td><%=customerBean.getCity()%></td>
										</tr>
										<tr>
											<th>State</th>
											<td>:</td>
											<td><%=customerBean.getState()%></td>
										</tr>
										<tr>
											<th>Country</th>
											<td>:</td>
											<td><%=customerBean.getCountry()%></td>
										</tr>
										
									</table>
								
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	
</body>
</html>