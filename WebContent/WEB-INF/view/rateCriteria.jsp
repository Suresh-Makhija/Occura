<%@page import="com.di.bean.CustomerBean"%>
<%@page import="com.di.bean.CustomerProductBean"%>
<%@page import="com.di.bean.RateCriteriaBean"%>
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
<title>Rate Master</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	String encodeCt_id = request.getParameter("ct_id");

	int decodeCt_id = Integer.parseInt(new EncodeDecode().decodeString(encodeCt_id));
	
	AllListDAO allListDAO = new AllListDAO();
	
	String cId = request.getParameter("cId");
	
	int decodeCustId = Integer.parseInt(new EncodeDecode().decodeString(cId));
	
	CustomerBean customerBean = allListDAO.customerDetails(decodeCustId);
	
	CustomerTypeBean customerTypeBean = allListDAO.detailsOfCustomerType(decodeCt_id);
	List<Integer> listOfCustomerProductGroup = allListDAO.listOfCustomerProductGroup(decodeCustId);
	
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-dollar"></i> <%=customerTypeBean.getType()%> : <%=customerTypeBean.getType_name()%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                 <li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=">Customer Master</a></li>
		                  <li class="breadcrumb-item">
		                  <%if(customerBean == null) {%>
		                 	Admin
		                  <%}else{%>
		                  	  <a href=" redirect?p=Y3VzdG9tZXJSYXRlQ3JpdGVyaWE=&c=<%=cId%>"><%=customerBean.getCompany()%></a>
		                  <%} %>
		                 </li>
		                
		                  <li class="breadcrumb-item active"><b><%=customerTypeBean.getType()%> : <%=customerTypeBean.getType_name()%></b></li>
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
								<div class="col-md-8">
									<h4 class="card-title" id="striped-label-layout-icons">Rate Criteria of <b><%=customerTypeBean.getType()%> : <%=customerTypeBean.getType_name()%></b></h4>
								</div>
								
								<div class="col-md-4" align="right">
									
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								
										<div class="row">
										<%for(Integer s : listOfCustomerProductGroup){
										          ProductMasterBean productMasterBean = allListDAO.productDetails(s);
										          int prod_id = productMasterBean.getProduct_master_id();
											%>
											<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
											
											<h3 style="border-bottom: dashed 1px;"><i class="icon-diamond2"></i> <%=productMasterBean.getProduct_name()%> 
											 &nbsp;&nbsp;<i class="icon-circle-plus" style="cursor: pointer;" title="Add New Rate" onclick="javascript:$('#insertDiv<%=productMasterBean.getProduct_master_id()%>').show();$('#tableDiv<%=productMasterBean.getProduct_master_id()%>').hide();"></i>
											<%if(decodeCustId != 1){ %>
											 &nbsp;<i class="icon-cloud-download" style="cursor: pointer;" title="Import Rate From Master" data-toggle="modal" data-target="#masterModal"  onclick="setMaster(<%=productMasterBean.getProduct_master_id()%> )"></i>
											 <%} %>
											 </h3>
											
											<div class="row">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 insertDiv" id="insertDiv<%=productMasterBean.getProduct_master_id()%>">
											<form class="form" id="formInsert<%=prod_id%>" action="addRateCriteria" method="post">
											<input type="hidden" name="ctId" id="ctId" value="<%=decodeCt_id%>">
											<input type="hidden" name="user_id" id="user_id" value="<%=user_id%>">
											<input type="hidden" name="userCutsId" id="userCutsId" value="<%=decodeCustId%>">
											<input type="hidden" name="pId" id="pId" value="<%=prod_id%>">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
														<div class="col-md-6 col-lg-6col-sm-12 col-xs-12">	
															<fieldset>
																<%if(decodeCt_id == 1){ %>
																<label for="userinput2">Carat From</label>
																<%}else if(decodeCt_id == 2){%>
																<label for="userinput2">Stone Number From</label>
																<%} %>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><b><=</b></span>
																	<input type="text" class="form-control" placeholder="From" aria-describedby="basic-addon1" name="sizeFrom" id="sizeFrom">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6col-sm-12 col-xs-12">	
															<fieldset>
																<%if(decodeCt_id == 1){ %>
																<label for="userinput2">Caret To</label>
																<%}else if(decodeCt_id == 2){%>
																<label for="userinput2">Stone Number To</label>
																<%} %>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><b>>=</b></span>
																	<input type="text" class="form-control" placeholder="To" aria-describedby="basic-addon1"  name="sizeTo" id="sizeTo">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">Rate / Carat</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-dollar"></i></span>
																	<input type="text" class="form-control" placeholder="Rate" aria-describedby="basic-addon1" name="rate" id="rate">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">Min Rate / Carat</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-dollar"></i></span>
																	<input type="text" class="form-control" placeholder="Min Rate" aria-describedby="basic-addon1" name="minRate" id="minRate">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">Rate / Stone</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-dollar"></i></span>
																	<input type="text" class="form-control" placeholder="Rate" aria-describedby="basic-addon1" name="rateStone" id="rate">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">Min Rate / Stone</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-dollar"></i></span>
																	<input type="text" class="form-control" placeholder="Min Rate" aria-describedby="basic-addon1" name="minRateStone" id="minRate">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">SLTL Margin</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1">%</span>
																	<input type="text" class="form-control" placeholder="SLTL Margin" aria-describedby="basic-addon1" name="sltlShare" id="sltlShare">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">Effective Date</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-android-calendar"></i></span>
																	<input type="text" class="form-control date" placeholder="dd/mm/yyyy" aria-describedby="basic-addon1" name="date" id="date<%=s%>" value="<%=ddmmyyyy.format(new Date())%>" readonly="readonly">
																</div>
															</fieldset>
														</div>
													</div>
												</div>

												<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="addBtn<%=prod_id%>" onclick="addForm(<%=prod_id%>);">
														<i class="icon-check2"></i> Add
													</button>
													<button type="button" class="btn btn-primary loader" id="addLoader<%=prod_id%>">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#insertDiv<%=productMasterBean.getProduct_master_id()%>').hide();$('#tableDiv<%=productMasterBean.getProduct_master_id()%>').show();">
														<i class="icon-cross2"></i> Cancel
													</button>
												</div>
											</form>
										</div>
										
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv<%=productMasterBean.getProduct_master_id()%>">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 12px;" id="tableData<%=productMasterBean.getProduct_master_id()%>">
						                            <thead>
						                                <tr>
					                               			<%if(decodeCt_id == 1){ %>
															 <th style="padding: 5px;">Carat From</th>
						                                    <th style="padding: 5px;">Carat To</th>
															<%}else if(decodeCt_id == 2){%>
															 <th style="padding: 5px;">Stone From</th>
						                                    <th style="padding: 5px;">Stone To</th>
															<%} %>
						                                   
						                                    <th style="padding: 5px;">Rate/Carat ($)</th>
						                                    <th style="padding: 5px;">Min Rate/Carat ($)</th>
						                                    <th style="padding: 5px;">Rate/Stone ($)</th>
						                                    <th style="padding: 5px;">Min Rate/Stone ($)</th>
						                                    <th style="padding: 5px;">SLTL Margin (%)</th>
						                                    <th style="padding: 5px;">Effective Date</th>
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<!-- Get Method for list Of Product Master-->
						                            	<%
						                            	int count = 0;
						                            	/* for Extract Data */ 
						                            	List<String> groupOfRateCrieria = allListDAO.groupOfRateCrieria(decodeCt_id,decodeCustId,prod_id);
						                            	for(String name : groupOfRateCrieria){
						                            		
						                            	 	RateCriteriaBean rateCriteriaBean = allListDAO.detailsOfLastRate(decodeCt_id,name,decodeCustId,prod_id);
						                            		List<RateCriteriaBean> listOfRateCriteria = allListDAO.historyOfRateCriteria(decodeCt_id, name,decodeCustId,prod_id);
						                            		
						                            		int id = rateCriteriaBean.getRate_criteria_id();
						                            		
						                            		String encodeName = new EncodeDecode().encodeString(name);
						                            		String encodePId = new EncodeDecode().encodeString(String.valueOf(prod_id));
						                            	%>  
						                            	 <tr>
						                            		<td class="pt-3-half" contenteditable="true" id="fromCarat<%=id%>" onkeyup="update(<%=id%>,'fromCarat')"  style="padding: 5px;"><%=rateCriteriaBean.getCarat_size_from()%></td>
						                            		<td class="pt-3-half" contenteditable="true" id="toCarat<%=id%>" onkeyup="update(<%=id%>,'toCarat')"  style="padding: 5px;"><%=rateCriteriaBean.getCarat_size_to()%></td>
						                            		<td class="pt-3-half" contenteditable="true" id="rate<%=id%>" onkeyup="update(<%=id%>,'rate')"  style="padding: 5px;"><%=rateCriteriaBean.getRate()%></td>
						                            		<td class="pt-3-half" contenteditable="true" id="minRate<%=id%>" onkeyup="update(<%=id%>,'minRate')"  style="padding: 5px;"><%=rateCriteriaBean.getMin_rate()%></td>
						                            		<td class="pt-3-half" contenteditable="true" id="rateStone<%=id%>" onkeyup="update(<%=id%>,'rateStone')"  style="padding: 5px;"><%=rateCriteriaBean.getRate_per_stone()%></td>
						                            		<td class="pt-3-half" contenteditable="true" id="minRateStone<%=id%>" onkeyup="update(<%=id%>,'minRateStone')"  style="padding: 5px;"><%=rateCriteriaBean.getMin_rate_per_stone()%></td>
						                            		<td class="pt-3-half" contenteditable="true" id="margine<%=id%>" onkeyup="update(<%=id%>,'margine')"  style="padding: 5px;"><%=rateCriteriaBean.getSltl_share()%></td>
						                            		<td style="padding: 5px;"><%=ddmmyyyy.format(rateCriteriaBean.getEffective_date())%></td>
						                            		<td style="padding: 5px;">
						                            			<i class="icon-trash" style="font-size: 15px;font-weight: bold;color: red;cursor: pointer;" title="delete" onclick="deleteData(<%=id%>,<%=prod_id%>)"></i>
						                            			<a href="redirect?p=cmF0ZUNyaXRlcmlhSGlzdG9yeQ==&name=<%=encodeName%>&ct_id=<%=encodeCt_id%>&cId=<%=cId%>&pId=<%=encodePId%>"><i class="icon-open" style="font-size: 15px;font-weight: bold;" title="Show History"></i></a>
						                            		</td>
						                            	</tr>
						                            	<%} %>
						                            </tbody>
						                            
					                        </table>
					                       </div> 
										</div>
										</div>
										</div>
										<%} %>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<div class="modal fade text-xs-left" id="masterModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
									  <div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
										  <div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											  <span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel1"><font id="productNameHeading">Master Of Rate</font></h4>
										  </div>
										  <div class="modal-body">
										  <div class="row">
								  			
								  				<!-- Design for List Sub Option -->
										  		<div class="col-md-12 col-lg-12 col-sm-12 col-sm-12" >
											  			<div class="table-responsive">
								 							<table class="table table-striped table-bordered" id="masterTable">
									                            <thead>
									                                <tr>
									                                    <th style="padding: 5px;">Carat From</th>
									                                    <th style="padding: 5px;">Carat To</th>
									                                    <th style="padding: 5px;">Rate/Carat</th>
									                                    <th style="padding: 5px;">Min Rate/Carat</th>
									                                    <th style="padding: 5px;">Rate/Stone</th>
									                                    <th style="padding: 5px;">Min Rate/Stone</th>
									                                    <th style="padding: 5px;">SLTL Margin</th>
									                                    <th style="padding: 5px;">Effective Date</th>
									                                    <th style="padding: 5px;">Action</th>
									                                </tr>
									                            </thead>
									                            
									                            <tbody>
									                            	
									                            </tbody>
								                        </table>
								                       </div> 
										  		</div>
										  		</div>
								  			</div>
								  			
										  <div class="modal-footer">
											<button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">Close</button>
										  </div>
										</div>
									  </div>
									</div>	
	
	
	<script type="text/javascript">
	
	$(".insertDiv").hide();
	$(".loader").hide();
	
	/* 	
		//For Datatable initilization
		$(".file-export").DataTable({
			// for table structure
	         dom: "Bfrtip",
	         
	         //for disable ordering
	         "ordering": false,
			
	         //For page length in data tables
	         "pageLength": 10,
	         
	     	// for button show in data tables
	        buttons: [
            {
                extend: 'excel',
                filename: 'Product Master'
            }
        ]
	        
	    }),
	    
	  	//For Design of that button
	    $(".buttons-excel").addClass("btn btn-primary mr-1");
	 */
	
	function addForm(prodId){
		$("#addBtn"+prodId).hide();
		$("#addLoader"+prodId).show();
		$("#formInsert"+prodId).submit();
	}
	
	</script>
	
	<script type="text/javascript">
    
    var datefield=document.createElement("input")
    datefield.setAttribute("type", "text")
    if (datefield.type!="date"){ //if browser doesn't support input type="date", load files for jQuery UI Date Picker
        document.write('<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"><\/script>\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"><\/script>\n')
    }
    </script>

<script>
<%for(Integer s : listOfCustomerProductGroup){%>
    if (datefield.type!="date"){ //if browser doesn't support input type="date", initialize date picker widget:
        jQuery(function($){ //on document.ready
            $('#date'+<%=s%>).datepicker({
                dateFormat: 'dd/mm/yy'
            });

        })
    }
    <%}%>
    function update(rateId,action){
    	var val = $("#"+action+rateId).text();
    	
    	
    	$.ajax({
	   		 method: "POST",
	   		 url: 'rateCriteriaUpdate',
	   		data : {
	   			rateId : rateId,
	   			action : action,
	   			value : val
	   		},
	   		success : function(data) {
	   			if(data == 'false'){
	   				alert("There is some problem for update data.Please try again!!!");
	   			}
	   		} 
	 	});	
    }
    
    
    
function setMaster(id){
    
	    $("#masterTable tbody").empty();
    	//Ajax for get data using Specification Field  id
		$.ajax({
		    //for call action
		    url: 'getRateMaster',
		    //for specify Method
		    method: "GET",
		    //form send data
		    data:{pId : id,
	   			ctId : <%=decodeCt_id%>,
	   			cId : <%=decodeCustId%>},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
		    	//Extract Each json data from input
		    	 $.each(json, function(i, f) {
		    	
		    		var html = 	"<tr>"+
		    				  	"<td style=\"padding:5px;\">"+f.sizeFrom+"</td>"+
		    				  	"<td style=\"padding:5px;\">"+f.sizeTo+"</td>"+
		    				  	"<td style=\"padding:5px;\">"+f.rate+"</td>"+
		    				  	"<td style=\"padding:5px;\">"+f.min_rate+"</td>"+
		    					"<td style=\"padding:5px;\">"+f.rate_per_stone+"</td>"+
		    				  	"<td style=\"padding:5px;\">"+f.min_rate_per_stone+"</td>"+
		    				  	"<td style=\"padding:5px;\">"+f.sltlShare+" %</td>"+
		    				  	"<td style=\"padding:5px;\">"+f.date+"</td>"+
		    				  	"<td style=\"padding:5px;\"><i class=\"icon-circle-down\" style=\"cursor:pointer\" onclick=\"upload("+id+","+f.id+")\"></td>"+
		    				  	"</tr>";
		    				 
		    		$(html).appendTo("#masterTable tbody");		  	
		    		 
		    	 });
		    	
		    	
		    }
		});
    	
    }
    
    
function getData(id){
    var cId = '<%=cId%>';
    $("#tableData"+id+" tbody").empty();
	//Ajax for get data using Specification Field  id
	$.ajax({
	    //for call action
	    url: 'getRateData',
	    //for specify Method
	    method: "GET",
	    //form send data
	    data:{pId : id,
   			ctId : <%=decodeCt_id%>,
   			cId : <%=decodeCustId%>},
	    // action perform when successfully call action with specific method type
	    success: function (data) {
	    	
	    	//parse data into json format
	    	 var json = JSON.parse(data);
	    	
	    	//Extract Each json data from input
	    	 $.each(json, function(i, f) {
	    	
	    		var html = 	"<tr>"+
	    				  	"<td class=\"pt-3-half\" contenteditable=\"true\" id=\"fromCarat"+f.id+"\" onkeyup=\"update("+f.id+",'fromCarat')\" style=\"padding:5px;\">"+f.sizeFrom+"</td>"+
	    				  	"<td class=\"pt-3-half\" contenteditable=\"true\" id=\"toCarat"+f.id+"\" onkeyup=\"update("+f.id+",'toCarat')\" style=\"padding:5px;\">"+f.sizeTo+"</td>"+
	    				  	"<td class=\"pt-3-half\" contenteditable=\"true\" id=\"rate"+f.id+"\" onkeyup=\"update("+f.id+",'rate')\" style=\"padding:5px;\">"+f.rate+"</td>"+
	    				  	"<td class=\"pt-3-half\" contenteditable=\"true\" id=\"minRate"+f.id+"\" onkeyup=\"update("+f.id+",'minRate')\" style=\"padding:5px;\">"+f.min_rate+"</td>"+
	    				  	"<td class=\"pt-3-half\" contenteditable=\"true\" id=\"rateStone"+f.id+"\" onkeyup=\"update("+f.id+",'rateStone')\" style=\"padding:5px;\">"+f.rate_per_stone+"</td>"+
	    				  	"<td class=\"pt-3-half\" contenteditable=\"true\" id=\"minRateStone"+f.id+"\" onkeyup=\"update("+f.id+",'minRateStone')\" style=\"padding:5px;\">"+f.min_rate_per_stone+"</td>"+
	    				  	"<td class=\"pt-3-half\" contenteditable=\"true\" id=\"margine"+f.id+"\" onkeyup=\"update("+f.id+",'margine')\" style=\"padding:5px;\">"+f.sltlShare+"</td>"+
	    				  	"<td style=\"padding:5px;\">"+f.date+"</td>"+
	    				  	"<td style=\"padding:5px;\"><i class=\"icon-trash\" style=\"font-size: 15px;font-weight: bold;color: red;cursor: pointer;\" title=\"delete\" onclick=\"deleteData("+f.id+","+id+")\"></i><a href=\"redirect?p=cmF0ZUNyaXRlcmlhSGlzdG9yeQ==&name="+f.encodeName+"&ct_id="+f.encodeCtId+"&cId="+cId+"&pId="+f.encodePId+"\"> <i class=\"icon-open\" style=\"font-size: 15px;font-weight: bold;\"></i></a></td>"+
	    				  	"</tr>";
	    				 
	    		$(html).appendTo("#tableData"+id+" tbody");		  	
	    		 
	    	 });
	    }
	});
	
}
    
    
    function upload(pid,rid){
    	$.ajax({
		    //for call action
		    url: 'uploadRate',
		    //for specify Method
		    method: "GET",
		    //form send data
		    data:{pId : pid,
	   			ctId : <%=decodeCt_id%>,
	   			cId : <%=decodeCustId%>,
	   			rId : rid,
	   			uId : <%=user_id%>},
		    success: function (data) {
		    	setMaster(pid);
		    	getData(pid);
		    }
		});
    }
    
    
    function deleteData(id,pid){
    	var ratVal = confirm("Are you sure?");
    	
    	if(ratVal == true){
    		$.ajax({
    		    //for call action
    		    url: 'deleteRate',
    		    //for specify Method
    		    method: "GET",
    		    //form send data
    		    data:{id : id},
    		    success: function (data) {
    		    	getData(pid);
    		    	
    		    	
    		    }
    		});
    	}
    	
    }
    
    
    </script>
</body>
</html>