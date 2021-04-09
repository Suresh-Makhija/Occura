<%@page import="java.util.ArrayList"%>
<%@page import="com.di.bean.WorkHistoryBean"%>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="com.di.bean.CustomerTypeBean"%>
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
<title>Stock History</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
	List<CustomerBean> listOfCustomer =  allListDAO.listOfSubCustomer();
	if(auth != 1){
		listOfCustomer =  allListDAO.listOfCustomerByParentId(userLoginCustId);
	}
	
	int custId = 0;
	String kapan = "0";
	String lot = "0";
	
	if(request.getParameter("custId") != null){
		custId = Integer.parseInt(request.getParameter("custId"));
	}
	if(request.getParameter("kapan") != null){
		kapan = request.getParameter("kapan");
	}
	if(request.getParameter("lot") != null){
		lot = request.getParameter("lot");
	}
	
	kapan = kapan.replace("@@", "+");
	lot = lot.replace("@@", "+");
	
	List<String> listOfKapanByCustomer = allListDAO.listOfKapanByCustomerIdByFilter(custId);
	List<String> listOfLotByCustomer = allListDAO.listOfLotByCustomerIdByFilter(custId,kapan);
	List<WorkHistoryBean> listOfStoneByCustomer = allListDAO.listOfWorkHistoryByCustomerIdByFilter(custId,kapan,lot);
	List<ProductMasterBean> listOfProduct = allListDAO.listOfProduct();
	
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-paper-stack"></i> Stock History</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Stock History</li>
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
			<ul class="nav nav-tabs nav-linetriangle no-hover-bg">
 					<li class="nav-item">
						<a class="nav-link active" id="base-tab" href="redirect?p=aGFuZG92ZXJQcm9jZXNz" aria-expanded="true">Handover</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=aGFuZG92ZXJQcm9jZXNzTGlzdA==" aria-expanded="true">Handover List</a>
					</li>
			</ul>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-6">
									<h4 class="card-title" id="striped-label-layout-icons">Handover Process</h4>
								</div>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								<div class="row">
								<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<form action="handoverInsert" method="post" id="formSave">
										<input type="hidden" name="userCustId" value="<%=userCustId%>">
													<div class="row">
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Customer</label> 
																<select class="select2 form-control border-primary" name="custId" id="custId" onchange="setStone();" required>
																	<option value="0" selected="selected">---All CUSTOMER---</option>
																	<%for(CustomerBean c : listOfCustomer){
																	if(custId == c.getCustomer_id()){
																	%>
																		<option value="<%=c.getCustomer_id()%>" selected="selected"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																	<%}else{ %>
																		<option value="<%=c.getCustomer_id()%>"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																	<%} %>	
																	<%} %>
																</select>
																
															</div>
														</div>
														
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Kapan Name</label> 
																<select class="select2 form-control border-primary" name="kapan" id="kapan" onchange="setStone();" required>
																	<option value="0" selected="selected">---All Kapan---</option>
																	<%
																	  for(String s : listOfKapanByCustomer){
																	  if(kapan.equalsIgnoreCase(s)){
																	%>
																		<option value="<%=s%>" selected="selected"><%=s%></option>
																	<%}else{ %>
																		<option value="<%=s%>"><%=s%></option>
																	<%} %>	
																	<%} %>
																</select>
																
															</div>
														</div>
														
														
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Lot Name</label> 
																<select class="select2 form-control border-primary" name="lot" id="lot" onchange="setStone();" required>
																	<option value="0" selected="selected">---All Lot---</option>
																	<%
																	  for(String s : listOfLotByCustomer){
																	  if(lot.equalsIgnoreCase(s)){
																	%>
																		<option value="<%=s%>" selected="selected"><%=s%></option>
																	<%}else{ %>
																		<option value="<%=s%>"><%=s%></option>
																	<%} %>	
																	<%} %>
																</select>
																
															</div>
														</div>
														
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Person Name</label> 
																<input type="text" name="name" placeholder="name" class="form-control" required> 
															</div>
														</div>
														
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Process</label> 
																<select
																	class="selectize-multiple"
																	placeholder="----Select process----" name="pId"
																	id="processId" multiple="multiple" required>
																	<%
																			for (ProductMasterBean p : listOfProduct) {

																	%>
																	<option value="<%=p.getProduct_name()%>"><%=p.getProduct_name()%>
																		(<%=p.getProduct_category()%>)
																	</option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>
														
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Stone Name</label> 
																<select
																	class="selectize-multiple"
																	placeholder="----Select Stone----" name="stone"
																	id="stoneId" multiple="multiple" required>
																	<%for(WorkHistoryBean w : listOfStoneByCustomer){ %>
																		<option value="<%=w.getWork_history_id()%>"><%=w.getStone_name()%></option>
																	<%} %>
																</select>
																
															</div>
														</div>
												</div>
												
												<input type="hidden" id="PIDS" name="PIDS" value="">
														<input type="hidden" id="SIDS" name="SIDS" value="">
														<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="saveBtn"
														onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary"
														id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
												</div>
										</form>
								</div>
								</div>
								<hr>
								<div class="row">
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
      
      <!-- <script type="text/javascript">
      
    //For Datatable initilization
		$(".file-export").DataTable({
			// for table structure
	         dom: "Bfrtip",
	         
	         //for disable ordering
	         //"ordering": false,
			
	         "paging": false,
	         
	     	// for button show in data tables
	        buttons: [
          {
              extend: 'excel',
              filename: 'Stock History'
          }
      ]
	        
	    }),
	    
	  	//For Design of that button
	    $(".buttons-excel").addClass("btn btn-primary mr-1")
	    
    var datefield=document.createElement("input")
    datefield.setAttribute("type", "text")
    if (datefield.type!="date"){ //if browser doesn't support input type="date", load files for jQuery UI Date Picker
        document.write('<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"><\/script>\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"><\/script>\n')
    }
    </script> -->

<script>
    
$("#saveLoader").hide();
    function setStone(){
    	
    	var custId = $("#custId").val();
    	var kapan = $("#kapan").val().replace("+","@@");
    	var lot = $("#lot").val().replace("+","@@");
    	
    	window.location.href = "redirect?p=aGFuZG92ZXJQcm9jZXNz&custId="+custId+"&kapan="+kapan+"&lot="+lot;
    }
    
  
    function submitForm() {

		var processId = $("#processId").val();
		var stoneId = $("#stoneId").val();

			$("#PIDS").val(processId);
			$("#SIDS").val(stoneId);

			$("#saveBtn").hide();
			$("#saveLoader").show();
			$("#formSave").submit();

		}
    
				
    </script>
</body>
</html>