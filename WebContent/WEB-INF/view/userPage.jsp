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
<title>Add Child Stone</title>
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
	
	List<WorkHistoryBean> listOfStoneByCustomer = allListDAO.listOfWorkHistoryByCustomerIdByFilterAll(custId,kapan,lot);
	
%>

	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-paper-stack"></i> Add Child Stone</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active"> Add Child Stone</li>
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
								<div class="col-md-4">
									<h4 class="card-title" id="striped-label-layout-icons"> Add Child Stone</h4>
								</div>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								<div class="row">
								<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<form action="javascript:;"> <!--  -->
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
														
														<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">	
															<div class="form-group">
																<label for="userinput1">Stone Name</label> 
																<select
																	class="select2 form-control border-primary"
																	placeholder="----Select Stone----" name="stone"
																	id="stoneId" onchange="getStoneDetail(this.value);" required>
																	<option value="0" selected="selected">---Select Stone---</option>
																	<%for(WorkHistoryBean w : listOfStoneByCustomer){ %>
																		<option value="<%=w.getWork_history_id()%>"><%=w.getStone_name()%></option>
																	<%} %>
																</select>
																
																<input type="hidden" name="stoneWId" id="stoneWId">
															</div>
														</div>
														
														<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 stoneDetail">	
															<div class="form-group">
																<label for="userinput1"><b>Stone Detail</b></label><br> 
																<font>Weight : </font> <font class="weight" style="font-weight: bold;"></font> |
																<font>Color : </font> <font class="color" style="font-weight: bold;"></font> |
																<font>Remarks : </font> <font class="remark" style="font-weight: bold;"></font>
															</div>
														</div>
												</div>
												
												</form>
												
												
												<div class="row insertPanel">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12"
											id="insertDiv">
											<form class="form" id="formSave" action="#"
												method="post">
												<input type="hidden" name="uId" value="<%=user_id%>">
												<input type="hidden" name="parentId" id="parentId" value="">
												<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">How Many Child Stone
																	Created?</label> <input type="number" id="num"
																	class="form-control border-primary"
																	placeholder="Enter Number" name="stoneNum"
																	onchange="setWeight(this.value)">
															</div>
														</div>

														<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12"
															id="childStone"></div>
													</div>
												</div>
												<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="saveBtn"
														onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary"
														id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="button" class="btn btn-warning mr-1"
														onclick="javascript:window.location.href='redirect?p=Y2hhbGxhbk1hc3Rlcg=='">
														<i class="icon-cross2"></i> Go To List
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
$(".insertPanel").hide();
$(".stoneDetail").hide();
    function setStone(){
    	var custId = $("#custId").val();
    	var kapan = $("#kapan").val().replace("+","@@");
    	var lot = $("#lot").val().replace("+","@@");
    	
    	window.location.href = "redirect?p=dXNlclBhZ2U==&custId="+custId+"&kapan="+kapan+"&lot="+lot;
    }
    
    var aWeight;
    function getStoneDetail(wid){
    	$("#stoneWId").val(wid);
    	var id = $("#stoneWId").val();
    	
    	$(".stoneDetail").hide();
    	$(".insertPanel").hide();
    	
    	$
		.ajax({
			//for specify Method
			method : "GET",
			//for call action
			url : "stoneDetail",
			//form send data
			data : {id:id},
			// action perform when successfully call action with specific method type
			success : function(data) {
				//parse data into json format
				var json = JSON.parse(data);
				
				
				$(".weight").html(json.actual_weight);
				$(".color").html(json.color);
				$(".remark").html(json.remarks);
				$("#parentId").val(json.work_history_id);
				
				aWeight = json.actual_weight;
				
				$(".stoneDetail").show();
				$(".insertPanel").show();
				
				
			}
		});
    	
    }
   
    
    $("#updateDiv").hide();
	$("#saveLoader").hide();
	$("#updateLoader").hide();
	
	function setWeight(value) {
		$("#childStone").empty();

		var start = 1 ;
		var end = parseFloat(value);

		for (var i = start; i <= end; i++) {
			var html = " <div class=\"col-md-6 col-lg-6 col-sm-12 col-xs-12\">\r\n"
					+ "		<div class=\"form-group\">\r\n"
					+ "			<label for=\"userinput2\"><b>Stone-"
					+ i
					+ "</b> Actual Weight</label> \r\n"
					+ "			<input type=\"text\"\r\n" + 
	"				id=\"childWeight\" class=\"form-control border-primary childWeight\"\r\n" + 
	"				placeholder=\"Enter Weight\" name=\"childWeight\" oninput=\"countWeight()\">\r\n"
					+ "		</div>\r\n" + "	 </div>	"

			$("#childStone").append(html);
		}

	}
	
	
	function countWeight(){
		
		var total = 0;
		$('input.childWeight').each(function() {
		    var num = parseFloat(this.value);
		    if (!isNaN(num)) {
		        total += num;
		    }
		});
		
		total = total.toFixed(2);
		aWeight = parseFloat(aWeight)
		
		if(total > aWeight){
			alert("Please check the Weight! because weight of child more that parent weight.");
		}
			
	}
	
	
	function submitForm(){
		$("#saveBtn").hide();
		$("#saveLoader").show();
		//Ajax for get data using Specification Field  id
		$
				.ajax({
					//for specify Method
					method : "POST",
					//for call action
					url : 'insertChildWork',
					//form send data
					data : $("#formSave").serialize(),
					// action perform when successfully call action with specific method type
					success : function(data) {
						alert("Child Stone Added Successfully !!!");
						location.reload();
						
					}
				});
		
		
		
	}
    
				
    </script>
</body>
</html>