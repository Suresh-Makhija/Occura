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
<title>Create Challan</title>
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
	
	List<String> listOfKapanByCustomer = allListDAO.listOfKapanByCustomerIdByFilter1(custId);
	List<String> listOfLotByCustomer = allListDAO.listOfLotByCustomerIdByFilter1(custId,kapan);
	List<WorkHistoryBean> listOfStoneByCustomer = allListDAO.listOfWorkHistoryByCustomerIdByFilterForChallan(custId,kapan,lot);
	List<ProductMasterBean> listOfProduct = allListDAO.listOfProduct();
	
	int size = listOfStoneByCustomer.size();
%>
<input type="hidden" id="size1" name ="size1" value="<%=size%>">
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-paper-stack"></i> Create Challan</h2>
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
						<a class="nav-link active" id="base-tab" href="redirect?p=Y2hhbGxhbkNyZWF0b3I=" aria-expanded="true">Create Challan</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=Y2hhbGxhbkxpc3Q=" aria-expanded="true">Challan List</a>
					</li>
			</ul>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-4">
									<h4 class="card-title" id="striped-label-layout-icons">Create Challan</h4>
								</div>
								<div class="col-md-4">
									<h4 class="card-title" id="striped-label-layout-icons">Selected Stone : <font class="count">0</font></h4>
									
								</div>
								<div class="col-md-4">
								<h4 class="card-title" id="striped-label-layout-icons">Remaining Stone : <font class="count1">0</font></h4>
								</div>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								<div class="row">
								<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<form action="javascript:;" id="formSave"> <!--  -->
										<input type="hidden" name="custId" value="<%=custId%>">
										<input type="hidden" name="userId" value="<%=user_id%>">
										<input type="hidden" name="userCustId" value="<%=userCustId%>">
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
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
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
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
														
														
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
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
														
														<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Stone Name</label> 
																<select
																	class="selectize-multiple"
																	placeholder="----Select Stone----" name="stone"
																	id="stoneId" multiple="multiple" onchange="setCount();" required>
																	<%for(WorkHistoryBean w : listOfStoneByCustomer){ %>
																		<option value="<%=w.getWork_history_id()%>"><%=w.getStone_name()%></option>
																	<%} %>
																</select>
																
															</div>
														</div>
												</div>
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
    	
    	
    	window.location.href = "redirect?p=Y2hhbGxhbkNyZWF0b3I=&custId="+custId+"&kapan="+kapan+"&lot="+lot;
    }
    
    var sizeNew = null;
    
   function setCount(){
	   var stoneId = $("#stoneId").val();
		$("#SIDS").val(stoneId);
		
		var stone = $("#SIDS").val();
		var temp = new Array();
		temp = stone.split(",");
		
		$(".count").html(temp.length);
		 sizeNew = $("#size1").val()- temp.length;
	
		   $(".count1").html(sizeNew);   
    }
   

    function submitForm() {

		var stoneId = $("#stoneId").val();

			$("#SIDS").val(stoneId);
			
			var custId = $("#custId").val();
	    	
	    	if(custId == "0"){
	    		alert("Please select customer !!!");
	    	}else if(stoneId == null){
	    		alert("Please select stone !!!");
	    	}else{
	    		
	    		var retVal = confirm("Are You sure for save this challan?");
	    		
	    		if(retVal == true){
	    			$("#saveBtn").hide();
					$("#saveLoader").show();
					
					$
					.ajax({
						//for specify Method
						method : "POST",
						//for call action
						url : "generateChallanNew",
						//form send data
						data : $("#formSave").serialize(),
						// action perform when successfully call action with specific method type
						success : function(data) {
			
							if(data == "error"){
								alert("There is some error please refresh the page & try again !!!");
								$("#saveBtn").show();
								$("#saveLoader").hide();
							}else{
								location.href = "redirect?p=Y2hhbGxhbkxpbmU=&cId="+data;
							}
							
						}
					});
					
					
	    		}
	    		
	    		
	    	}
			

			

		}
    
				
    </script>
</body>
</html>