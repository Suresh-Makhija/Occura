
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
<title>New Challan</title>
<%@include file="header.jsp" %>
<style type="text/css">
	td{
		white-space: nowrap;
	}
</style>

</head>
<body>
<%
AllListDAO allListDAO = new AllListDAO();
List<CustomerBean> listOfCustomer =  allListDAO.listOfSubCustomer();
List<ProductMasterBean> listOfProduct =  allListDAO.listOfProduct();

List<WorkHistoryBean> listOfWork =  allListDAO.listOfWorkHistory(100);
List<Integer> listOfCustomerProductGroup = null;

if(auth != 1){
	listOfWork = allListDAO.listOfWorkHistoryByCustomer(50, userLoginCustId, user_id);
	listOfCustomer =  allListDAO.listOfCustomerByParentId(userLoginCustId);
	listOfCustomerProductGroup = allListDAO.listOfCustomerProductGroup(userLoginCustId);
}


WorkHistoryBean ww = allListDAO.workHistoryUserId(user_id);
int cid = 0;
if(ww != null){
	cid = ww.getCustomerBean().getCustomer_id();
}


List<String> listOfPriority = new ArrayList();
listOfPriority.add("High");
listOfPriority.add("Medium");
listOfPriority.add("Low");

int sizeOfChild = 0;
if(request.getParameter("wId") != null){ 
	String encodeWId = request.getParameter("wId");
	
	String decodeWId = new EncodeDecode().decodeString(String.valueOf(encodeWId));
	List<WorkHistoryBean> listOfChildWork1 =  allListDAO.listOfWorkHistoryByParentWorkId(decodeWId);
	sizeOfChild = listOfChildWork1.size();
}
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-pencil-square-o"></i> New Challan</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">New Challan</li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="javascript:window.location.href='redirect?p=YWRkU3RvbmU='" data-toggle="tooltip"
						data-original-title="Add New Challan">
						<i class="icon-plus"></i>
					</button>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>

			<br>
			<ul class="nav nav-tabs nav-linetriangle no-hover-bg">
 					<li class="nav-item">
						<a class="nav-link active" id="base-tab" href="redirect?p=Y2hhbGxhbk1hc3Rlcg==" aria-expanded="true">Stone Wise</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=YnVuZGxlV2lzZUNoYWxsYW4=" aria-expanded="true">Bundle Wise</a>
					</li>
			</ul>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							
							<div class="card-body collapse in">
								<div class="card-block">
								<div class="row insertPanel">
								<%if(request.getParameter("wId") == null){ %>
									<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="insertDiv">
											<form class="form" id="formSave" action="insertWork" method="post">
											<input type="hidden" name="uId" value="<%=user_id%>">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-6 col-xs-6">	
															<div class="form-group">
																<label for="userinput1">Customer</label> 
																<select class="select2 form-control border-primary" name="custId" id="custId" required onchange="setValue(this.value);checkStoneName();">
																	<option value="" selected="selected">---SELECT CUSTOMER---</option>
																	<%for(CustomerBean c : listOfCustomer){
																		if(cid == c.getCustomer_id()){%>
																			<option value="<%=c.getCustomer_id()%>" selected="selected"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																		<%}else{ %>
																			<option value="<%=c.getCustomer_id()%>"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																		<%} %>
																	<%}%>
																</select>
																
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Kapan Name</label> <input type="text"
																	id="kapanName" class="form-control border-primary"
																	placeholder="Kapan Name" name="kapanName" required onchange="checkStoneName();" >
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Lot Name</label> <input type="text"
																	id="lotName" class="form-control border-primary"
																	placeholder="Lot Name" name="lotName" required>
															</div>
														</div>
													</div>
														
												    <div class="row">		
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Stone Name</label> <input type="text"
																	id="stoneName" class="form-control border-primary"
																	placeholder="Stone Name" name="stoneName" required onchange="checkStoneName();" >
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Actual Weight</label> <input type="text"
																	id="actualWeight" class="form-control border-primary"
																	placeholder="Actual Weight" name="actualWeight" required>
															</div>
														</div>
														
														<%if(auth == 1){%>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
															<input type="hidden" id="PIDS" name="PIDS" value="">
																<label for="userinput1">Select Process</label> 
																<select class="selectize-multiple"  placeholder="----Select process----" name="pId" id="processId" multiple="multiple" required>
																	<%for(ProductMasterBean p : listOfProduct){%>
																		<option value="<%=p.getProduct_master_id()%>"><%=p.getProduct_name()%> (<%=p.getProduct_category()%>)</option>
																	<%} %>
																</select>
																
															</div>
														</div>
														<%}else{%>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
															<input type="hidden" id="PIDS" name="PIDS" value="">
																<label for="userinput1">Select Process</label> 
																<select class="selectize-multiple"  placeholder="----Select process----" name="pId" id="processId" multiple="multiple" required>
																	<%for(Integer id : listOfCustomerProductGroup){
																		ProductMasterBean p = allListDAO.productDetails(id);
																	%>
																		<option value="<%=p.getProduct_master_id()%>"><%=p.getProduct_name()%> (<%=p.getProduct_category()%>)</option>
																	<%} %>
																</select>
																
															</div>
														</div>
														<%} %>
													</div>
													
													<div class="row">	
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Priority</label> 
																<select class="form-control border-primary" id="priority" name="priority">
																	<option value="">---SELECT PRIORITY---</option>
																	<%for(String s : listOfPriority){ 
																		if(s.equalsIgnoreCase("Medium")){
																	%>
																		<option value="<%=s%>" selected="selected"><%=s%></option>
																		<%}else{ %>
																		<option value="<%=s%>"><%=s%></option>
																		<%} %>
																	<%} %>
																</select>
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Color</label> <input type="text"
																	id="color" class="form-control border-primary"
																	placeholder="Color" name="color">
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Stress Level</label> <input type="text"
																	id="clearity" class="form-control border-primary"
																	placeholder="Clearity" name="clearity">
															</div>
														</div>
														</div>
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Remarks</label> 
																<textarea id="remark" rows="" cols="" name="remark" class="form-control border-primary" placeholder="Max 500 words"></textarea>
															</div>
														</div>
														</div>
														<hr>
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">How May Child Stone Created?</label> 
																<input type="number"
																	id="num" class="form-control border-primary"
																	placeholder="Enter Number" name="stoneNum" onchange="setWeight(this.value)">
															</div>
														</div>
														
														<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12" id="childStone">
															
														</div>
														</div>
													</div>
												<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="saveBtn" onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary" id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="button" class="btn btn-warning mr-1" onclick="javascript:$('.insertPanel').hide();$('.tablePanel').show();">
														<i class="icon-cross2"></i> Go To List
													</button>
												</div>
											</form>
											</div>
										<%} %>
										
										<%if(request.getParameter("wId") != null){ 
										
											String encodeWId = request.getParameter("wId");
											
											String decodeWId = new EncodeDecode().decodeString(String.valueOf(encodeWId));
											
											WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(decodeWId);
										%>
											<form class="form" id="formUpdate" action="updateWork" method="post">
											<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
											<input type="hidden" name="uId" value="<%=user_id%>">
											<input type="hidden" name="wId" value="<%=decodeWId%>">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput1">Customer</label> 
																<select class="select2 form-control border-primary" name="custId" required>
																	<option value="" selected="selected">---SELECT CUSTOMER---</option>
																	<%for(CustomerBean c : listOfCustomer){
																	  if(c.getCustomer_id() == workHistoryBean.getCustomerBean().getCustomer_id()){
																	%>
																		<option value="<%=c.getCustomer_id()%>" selected="selected"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																	<%}else{ %>
																		<option value="<%=c.getCustomer_id()%>"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																	<%} %>
																	<%} %>
																</select>
																
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Kapan Name</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Kapan Name" name="kapanName" value="<%=workHistoryBean.getKapan_name()%>" required>
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Lot Name</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Lot Name" name="lotName" value="<%=workHistoryBean.getLot_name()%>" required>
															</div>
														</div>
														</div>
														
														
													<div class="row">	
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Stone Name</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Stone Name" name="stoneName" value="<%=workHistoryBean.getStone_name()%>" required>
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Actual Weight</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Actual Weight" value="<%=workHistoryBean.getActual_weight()%>" name="actualWeight" required>
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
															<input type="hidden" id="PIDS" name="PIDS" value="">
																<label for="userinput1">Select Process</label> 
																<select class="selectize-multiple"  placeholder="----Select process----" name="pId" id="processId" multiple="multiple" required>
																	<%
																	List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(decodeWId);
																	for(ProductMasterBean p : listOfProduct){
																		
																		boolean flag = false;
																		for(WorkProductBean w : listofWorkProduct){
																			if(p.getProduct_master_id() == w.getProductMasterBean().getProduct_master_id()){
																				flag = true;
																			}
																		}
																		
																		
																	%>
																		<%if(flag == true){%>
																			<option value="<%=p.getProduct_master_id()%>" selected="selected"><%=p.getProduct_name()%> (<%=p.getProduct_category()%>)</option>
																		<%}else{ %>
																			<option value="<%=p.getProduct_master_id()%>"><%=p.getProduct_name()%> (<%=p.getProduct_category()%>)</option>
																		<%} %>
																		
																	<%} %>
																</select>
																
															</div>
														</div>
														</div>
														
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Priority</label> 
																<select class="form-control border-primary" name="priority">
																	<option name="">---SELECT PRIORITY---</option>
																	<%for(String s : listOfPriority){
																		if(s.equalsIgnoreCase(workHistoryBean.getPriority())){
																	%>
																		<option value="<%=s%>" selected="selected"><%=s%></option>
																		<%}else{ %>
																		<option value="<%=s%>"><%=s%></option>
																		<%} %>
																	<%} %>
																</select>
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Color</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Color" name="color" value="<%=workHistoryBean.getColor()%>">
															</div>
														</div>
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Stress Level</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Clearity" name="clearity" value="<%=workHistoryBean.getClearity()%>">
															</div>
														</div>
														</div>
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Remarks</label> 
																<textarea id="address" rows="" cols="" name="remark" class="form-control border-primary" placeholder="Max 500 words"><%=workHistoryBean.getRemarks()%></textarea>
															</div>
														</div>
														</div>
													</div>
													<%-- <hr>
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Add New Child !!!</label> 
																<input type="number"
																	id="num" class="form-control border-primary"
																	placeholder="Enter Number" name="stoneNum" onchange="setWeight(this.value)">
															</div>
														</div>
														<%List<WorkHistoryBean> listOfChildWork1 =  allListDAO.listOfWorkHistoryByParentWorkId(decodeWId); %>
														<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12">
															<%
															int count = 0;
															for(WorkHistoryBean wwww : listOfChildWork1){
															%>
															<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
																<div class="form-group">
																	<label for="userinput2"><b>Stone-<%=++count%> Actual Weight</b></label>
																	<input type="hidden" name="cwId" value="<%=wwww.getWork_history_id()%>"> 
																	<input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Enter Weight" name="childWeightOrig" value="<%=wwww.getActual_weight()%>">
																</div>
															</div>
															<%} %>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
														</div>
														<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12" id="childStone">
														</div>
														</div> --%>
												

												<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="updateBtn" onclick="updateForm();">
														<i class="icon-check2"></i> Update
													</button>
													<button type="button" class="btn btn-primary" id="updateLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==">
													<button type="button" class="btn btn-warning mr-1">
														<i class="icon-cross2"></i> Go To List
													</button>
													</a>
												</div>
											</form>
											</div>
										</div>
										<%} %>
										</div>
									<div class="row tablePanel">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 11px;">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 3px;">No</th>
						                                    <th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;">Customer Name</th>
						                                    <th style="padding: 3px;">Company Name</th>
						                                    <th style="padding: 3px;">Kapan Name</th>
						                                    <th style="padding: 3px;">Lot Name</th>
						                                    <th style="padding: 3px;">Stone Name</th>
						                                    <th style="padding: 3px;">Actual Weight</th>
						                                    <th style="padding: 3px;">Added By</th>
						                                    <th style="padding: 3px;">Insert Date</th>
						                                    <th style="padding: 3px;">Stock</th>
						                                    <th style="padding: 3px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(WorkHistoryBean w : listOfWork){
					                            		String wId = w.getWork_history_id();
					                            		String encodeWork_id = new EncodeDecode().encodeString(wId);
					                            		
														List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(wId);
					                            		
						                            %>
						                            	<tr>
						                            		<td style="padding: 3px;"><%=++count%></td>
						                            		<td style="padding: 3px;"><font style="font-weight: bold;">Parent</font></td>
						                            		<td style="padding: 3px;"><%=w.getCustomerBean().getFullname()%></td>
						                            		<td style="padding: 3px;"><%=w.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;"><%=w.getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=w.getUserBean().getName()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(w.getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(w.getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(w.getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(w.getIn_stock_datetime())%></small>
						                            			<%}else if(w.getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(w.getIn_stock_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<%-- <%if(w.getIn_stock() == 0){ %> --%>
						                            				<a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==&wId=<%=encodeWork_id%>"><i class="icon-pencil2" title="Edit" onclick="editData('<%=w.getWork_history_id()%>');" style="cursor: pointer;color: green"></i></a>
						                            				<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteHistory('<%=w.getWork_history_id()%>')"></i>
						                            			<%-- <%} %> --%>
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            			<a href="redirect?p=cHJpbnRMZWJlbA==&wId=<%=encodeWork_id%>"><i class="icon-android-print" title="Print Lebel" style="color: blue;cursor: pointer;"></i></a>
						                            		</td>
						                            	</tr>
						                            	
						                            	<%for(WorkHistoryBean www : listOfChildWork){
						                            		
						                            		 wId = www.getWork_history_id();
					                            		 	encodeWork_id = new EncodeDecode().encodeString(wId);
					                            		%>
						                            		<tr>
						                            		<td style="padding: 3px;"><%=++count%></td>
						                            		<td style="padding: 3px;" align="right"><i class="icon-arrow-right4"></i></td>
						                            		<td style="padding: 3px;"><%=www.getCustomerBean().getFullname()%></td>
						                            		<td style="padding: 3px;"><%=www.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;"><%=www.getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=www.getUserBean().getName()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(www.getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(www.getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(www.getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(www.getIn_stock_datetime())%></small>
						                            			<%}else if(www.getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(www.getIn_stock_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<%if(w.getIn_stock() == 0){ %>
						                            				<a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==&wId=<%=encodeWork_id%>"><i class="icon-pencil2" title="Edit" onclick="editData('<%=www.getWork_history_id()%>');" style="cursor: pointer;color: green"></i></a>
						                            				<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteHistory('<%=www.getWork_history_id()%>')"></i>
						                            			<%} %>
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            			<a href="redirect?p=cHJpbnRMZWJlbA==&wId=<%=encodeWork_id%>"><i class="icon-android-print" title="Print Lebel" style="color: blue;cursor: pointer;"></i></a>
						                            		</td>
						                            		</tr>
						                            	<%} %>
						                            <%} %>	
						                            </tbody>
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
		</div>
	
	<script src="app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/scripts/forms/select/form-select2.min.js" type="text/javascript"></script>
     <script src="app-assets/vendors/js/forms/select/selectize.min.js" type="text/javascript"></script>
      <script src="app-assets/js/scripts/forms/select/form-selectize.min.js" type="text/javascript"></script>
      
      <script type="text/javascript">
	
      <%if(request.getParameter("wId") == null){%>    
   		 $(".insertPanel").hide();
  	  <%}else{%>
   		 $(".tablePanel").hide();
   	 <%}%>
   	 
   	<%if(request.getParameter("action") != null){%>    
		 $(".insertPanel").show();
		 $(".tablePanel").hide();
	 <%}%>
  
	$("#updateDiv").hide();
    $("#saveLoader").hide();
	$("#updateLoader").hide();
	
	
	$(document).ready(function(){
		
		//For Datatable initilization
		$(".file-export").DataTable({
			// for table structure
	         dom: "Bfrtip",
	         
	         //for disable ordering
	         "ordering": false,
			
	         //For page length in data tables
	         "pageLength": 20,
	         
	     	// for button show in data tables
	        buttons: [
            {
                extend: 'excel',
                filename: 'Product Master'
            }
        ]
	        
	    }),
	    
	  	//For Design of that button
	    $(".buttons-excel").addClass("btn btn-primary mr-1")
				
	});
	
	
	function checkStoneName(){
		
		var kapanName =  $("#kapanName").val();
		var stoneName = $("#stoneName").val();
		var custId = $("#custId").val();
		
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'checkStoneName',
		    //form send data
		    data:{custId : custId,kapanName:kapanName,stoneName:stoneName},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	if(data == 'true'){
		    		alert("Kapan Name & stone name are same in previous record.Please choose diffrent stone name!!!");
		    		 $("#stoneName").val("");
		    	}
		    	
		    }
		});
		
	}
	
	function submitForm(){
		
		var value = $("#processId").val();
		var stoneName = $("#stoneName").val();
		if(stoneName == ""){
			alert("Please Enter Stone name !!!");
		}else if(value == null){
			alert("Please Select atleast one process!!!");
		}else{
		
		$("#PIDS").val($("#processId").val());
		
		
		$("#saveBtn").hide();
		$("#saveLoader").show();
		$("#formSave").submit();
		
		}
	}
	
	function updateForm(){
		
		$("#PIDS").val($("#processId").val());
		
		$("#updateBtn").hide();
		$("#updateLoader").show();
		$("#formUpdate").submit();
	}
	
	function deleteHistory(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			location.href = "deactiveWorkHistory?wId="+value;
		}
		
	}
	
	function editData(value){
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'detailsOfWorkHistory',
		    //form send data
		    data:{wId : value},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
		    	$("#wId").val(json.work_history_id);
				$("#kapanName").val(json.kapan_name);
				$("#lotName").val(json.lot_name);
				$("#stoneName").val(json.stone_name);
				$("#actualWeight").val(json.actual_weight);
				$("#priority").val(json.priority);
				$("#color").val(json.color);
				$("#clearity").val(json.clearity);
				$("#pId").val(json.productMasterBean.product_master_id);
				$("#custId").val(json.customerBean.customer_id);
				
				
				
				$("#insertDiv").hide();
				$("#updateDiv").show();
		    	
		    }
		});
		
	}
	
	
	function showFullDetails(value){
		location.href = "redirectToDetails?wId="+value;
	}
	
	
	<%if(cid != 0){%>
		setValue(<%=cid%>);
	<%}%>
	
	function setValue(id){
		
		
		$("#kapanName").val("");
		$("#lotName").val("");
		$("#stoneName").val("");
		$("#actualWeight").val("");
		$("#priority").val("");
		$("#color").val("");
		$("#clearity").val("");
		$("#pId").val("");
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'detailsOfLastWorkHistory',
		    //form send data
		    data:{cId : id},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
				$("#kapanName").val(json.kapan_name);
				$("#lotName").val(json.lot_name);
				/* $("#stoneName").val(json.stone_name); */
				$("#actualWeight").val(json.actual_weight);
				$("#priority").val(json.priority);
				$("#color").val(json.color);
				$("#clearity").val(json.clearity);
				$("#pId").val(json.productMasterBean.product_master_id);
		    	
		    }
		});
		
	}
	
	
	function setWeight(value){
		$("#childStone").empty();
		
		var start = <%=sizeOfChild+1%>;
		var end = parseFloat(<%=sizeOfChild%>) + parseFloat(value);
		
		for(var i=start;i<=end;i++){
			var html = " <div class=\"col-md-6 col-lg-6 col-sm-12 col-xs-12\">\r\n" + 
			"		<div class=\"form-group\">\r\n" + 
			"			<label for=\"userinput2\"><b>Stone-"+i+"</b> Actual Weight</label> \r\n" + 
			"			<input type=\"text\"\r\n" + 
			"				id=\"num\" class=\"form-control border-primary\"\r\n" + 
			"				placeholder=\"Enter Weight\" name=\"childWeight\">\r\n" + 
			"		</div>\r\n" + 
			"	 </div>	"
			
		$("#childStone").append(html);
		}
		
		
	}
	
	</script>
</body>
</html>