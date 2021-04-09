<%@page import="com.di.bean.WorkProductProcessBean"%>
<%@page import="com.di.bean.WorkProductBean"%>
<%@page import="com.di.bean.WorkHistoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.di.bean.ProductMasterBean"%>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@page import="com.di.dao.AllListDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Work History</title>
<%@include file="header.jsp" %>
</head>
<body>
<%
AllListDAO allListDAO = new AllListDAO();

String encodeWId = request.getParameter("wId");

String wId = new EncodeDecode().decodeString(String.valueOf(encodeWId));
WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId);

%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-clipboard"></i> <%=workHistoryBean.getCustomerBean().getCompany()%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Challan Deatils</li>
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
							<div class="card-body collapse in">
								<div class="card-block">
									<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="insertDiv">
										<h3 style="border-bottom: dashed 2px;"><i class="icon-android-clipboard"></i> Basic Information</h3>
										<table class="table table-bordered">
											<tr bgcolor="#002266">
												<td style="padding: 3px;color: white;" colspan="4" align="center"><b>Input Parameter</b></td>
											</tr>
											<%
											
											CustomerBean c = allListDAO.customerDetails(workHistoryBean.getCustomerBean().getParent_customer_id());%>
											<%-- <tr>
												<th style="padding: 3px;">Main Customer Code</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;">
												<%=c.getCustomer_code()%></td>
											</tr> --%>
											<tr>
												<th style="padding: 3px;">Main Company Name</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;">
												<%=c.getCompany()%></td>
												
												<th style="padding: 3px;">Sub Company Name</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getCustomerBean().getCompany()%></td>
											</tr>
											
											<%-- <tr>
												<th style="padding: 3px;">Customer Code</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getCustomerBean().getCustomer_code()%></td>
											</tr> --%>
											
											
											<tr>
												<th style="padding: 3px;">Kapan Name</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getKapan_name()%></td>
												
												<th style="padding: 3px;">Lot Name</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getLot_name()%></td>
											</tr>
											
											
											<tr>
												<th style="padding: 3px;">Stone Name</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getStone_name()%></td>
												
												<th style="padding: 3px;">Actual Weight</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getActual_weight()%></td>
											</tr>

											<tr>
												<th style="padding: 3px;">Priority</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getPriority()%></td>
												
												<th style="padding: 3px;">Color</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getColor()%></td>
											</tr>
											
											<tr>
												<th style="padding: 3px;">Stress Level</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=workHistoryBean.getClearity()%></td>
												
												<th style="padding: 3px;">Insert Date</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(workHistoryBean.getInsert_date())%></td>
											</tr>
											<tr>
												<th style="padding: 3px;">Remarks</th>
												<!-- <th style="padding: 3px;">:</th> -->
												<td style="padding: 3px;white-space: pre-wrap;"><%if(workHistoryBean.getRemarks() != null){ %><%=workHistoryBean.getRemarks()%><%}else{ %>-<%} %>
												</td>
											</tr>
										</table>
									</div>
										
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<h3 style="border-bottom: dashed 2px;"><i class="icon-android-settings"></i> Processes</h3>
											<table class="table table-bordered">
												<%
												List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(wId); 
													for(WorkProductBean w : listofWorkProduct){
														String wpId = w.getWork_product_id();
														List<WorkProductProcessBean> listOfProcess = allListDAO.listOfWorkProductProcess(wId, wpId);
												%>
													<tr bgcolor="#5572ab">
														<td style="padding: 5px;color: white;" colspan="6" align="center"><b><%=w.getProductMasterBean().getProduct_name()%></b></td>
													</tr>
													<tr>
														<th style="padding: 5px">Status</th>
														<th style="padding: 5px">Process</th>
														<th style="padding: 5px">Rough Weight</th>
														<th style="padding: 5px">Insert Date</th>
														<th style="padding: 5px">Start Date</th>
														<th style="padding: 5px">End Date</th>
													</tr>
													<%for(WorkProductProcessBean wp : listOfProcess){%>
													
													<tr>
														<td style="padding: 5px">
															<%if(wp.getStatus() == 1){ %>
																<font style="font-weight: bold;color: blue">Pending</font>
															<%} else%>
															<%if(wp.getStatus() == 2){ %>
																<font style="font-weight: bold;color: orange">In Work</font>
															<%} else%>
															<%if(wp.getStatus() == 3){ %>
																<font style="font-weight: bold;color: green">Completed</font>
															<%} %>
															<%if(wp.getStatus() == 4){ %>
																<font style="font-weight: bold;color: red">Failed</font>
															<%} %>
														</td>
														<td style="padding: 5px"><%=wp.getProductProcessBean().getProduct_process_name()%></td>
														<td style="padding: 5px"><%=wp.getRough_weight()%></td>
														<td style="padding: 5px"><%=ddmmyyyyhhmmss.format(wp.getInsert_datetime())%></td>
														<td style="padding: 5px">
															<%if(yyyymmdd.format(wp.getStart_datetime()).equalsIgnoreCase("1900-01-01")){ %>
																-
															<%}else{ %>
																<%=ddmmyyyyhhmmss.format(wp.getStart_datetime())%>
															<%} %>
														</td>
														<td style="padding: 5px">
															<%if(yyyymmdd.format(wp.getEnd_datetime()).equalsIgnoreCase("1900-01-01")){ %>
																-
															<%}else{ %>
																<%=ddmmyyyyhhmmss.format(wp.getEnd_datetime())%>
															<%} %>
														</td>
													</tr>
													<%} %>
												<%} %>
											</table>
										</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	
	<script src="app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/scripts/forms/select/form-select2.min.js" type="text/javascript"></script>
</body>
</html>