<%@page import="java.util.Calendar"%>
<%@page import="com.di.bean.CustomerProductRateBean"%>
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
<%@include file="header.jsp"%>
</head>
<body>

	<%
	String encodeCt_id = request.getParameter("ct_id");

	int decodeCt_id = Integer.parseInt(new EncodeDecode().decodeString(encodeCt_id));
	
	AllListDAO allListDAO = new AllListDAO();
	
	String cId = request.getParameter("cId");
	
	int decodeCustId = Integer.parseInt(new EncodeDecode().decodeString(cId));
	
	CustomerBean customerBean = allListDAO.customerDetails(decodeCustId);
	
	int parentCustId = customerBean.getParent_customer_id();
	
	CustomerTypeBean customerTypeBean = allListDAO.detailsOfCustomerType(decodeCt_id);
	
	String encodeProd_id = request.getParameter("pId");
	
	int decodeProdId = Integer.parseInt(new EncodeDecode().decodeString(encodeProd_id));
	
	ProductMasterBean productMasterBean = allListDAO.productDetails(decodeProdId);
	
	CustomerProductRateBean customerProductRateBean1 = allListDAO.detailsOfCustomerProductRate(decodeCustId,decodeProdId,decodeCt_id);
	
	Calendar cal = Calendar.getInstance();
	
	cal.add(Calendar.DAY_OF_YEAR, -120);
	String date = ddmmyyyy.format(cal.getTime());
	
	
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0">
						<i class="icon-inr"></i>
						<%=customerTypeBean.getType()%>
						:
						<%=customerTypeBean.getType_name()%></h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
								<li class="breadcrumb-item"><a
									href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=">Customer Master</a></li>
								<li class="breadcrumb-item"><a
									href=" redirect?p=Y3VzdG9tZXJSYXRlQ3JpdGVyaWE=&c=<%=cId%>"><%=customerBean.getCompany()%></a></li>

								<li class="breadcrumb-item active"><b><%=customerTypeBean.getType()%>
										: <%=customerTypeBean.getType_name()%></b></li>
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
									<h4 class="card-title" id="striped-label-layout-icons">
										Rate Criteria of <b><%=customerTypeBean.getType()%> : <%=customerTypeBean.getType_name()%></b>
									</h4>
								</div>

								<div class="col-md-4" align="right"></div>

								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">

									<div class="row">
										<%int prod_id = productMasterBean.getProduct_master_id();%>
										<h3 style="border-bottom: dashed 1px;">
											<i class="icon-diamond2"></i>
											<%=productMasterBean.getProduct_name()%>
											<i class="icon-circle-plus" style="cursor: pointer;" title="Add New Rate" onclick="javascript:$('#insertDiv<%=productMasterBean.getProduct_master_id()%>').show();$('#tableDiv<%=productMasterBean.getProduct_master_id()%>').hide();"></i>
											</h3>

										<div class="row">
											
											<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 insertDiv" id="insertDiv<%=productMasterBean.getProduct_master_id()%>">
											<form class="form" id="formInsert<%=prod_id%>" action="addRateCriteriaForSubCustomer" method="post">
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
																	<input type="text" class="form-control date" placeholder="dd/mm/yyyy" aria-describedby="basic-addon1" name="date" id="date" value="<%=date%>" readonly="readonly">
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
										
										
											<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12"
												id="tableDiv<%=productMasterBean.getProduct_master_id()%>">
												<div class="table-responsive">
													<table
														class="table table-striped table-bordered file-export"
														style="font-size: 12px;">
														<thead>
															<tr>
																<th style="padding: 5px;">No</th>
																<%if(decodeCt_id == 1){ %>
																 <th style="padding: 5px;">Carat From</th>
							                                    <th style="padding: 5px;">Carat To</th>
																<%}else if(decodeCt_id == 2){%>
																 <th style="padding: 5px;">Stone From</th>
							                                    <th style="padding: 5px;">Stone To</th>
																<%} %>
																<th style="padding: 5px;">Rate/Carat ($)</th>
																<th style="padding: 5px;">Rate/Stone ($)</th>
																<th style="padding: 5px;">Discount (%)</th>
																<th style="padding: 5px;">Final Rate/Carat ($)</th>
																<th style="padding: 5px;">Final Rate/Stone ($)</th>
																<th style="padding: 5px;">SLTL Margin (%)</th>
																<th style="padding: 5px;">SLTL Rate/Carat ($)</th>
																<th style="padding: 5px;">SLTL Rate/Stone ($)</th>
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
						                            		RateCriteriaBean parentRateCriteriaBean = allListDAO.detailsOfLastRate(decodeCt_id,name,parentCustId,prod_id);
						                            		
						                            		int id = rateCriteriaBean.getRate_criteria_id();
						                            		
						                            		String encodeName = new EncodeDecode().encodeString(name);
						                            		String encodePId = new EncodeDecode().encodeString(String.valueOf(prod_id));
						                            		
						                            		double discount = customerProductRateBean1.getDiscount();
						                            		double finalRate = rateCriteriaBean.getRate() - ((rateCriteriaBean.getRate() * discount) / 100);
						                            		double finalRatePerStone = rateCriteriaBean.getRate_per_stone() - ((rateCriteriaBean.getRate_per_stone() * discount) / 100);
						                            		double sltlrate = ((finalRate * rateCriteriaBean.getSltl_share()) / 100);
						                            		double sltlratePerStone = ((finalRatePerStone * rateCriteriaBean.getSltl_share()) / 100);
						                            		
						                            	%>
															<tr>
																<td style="padding: 5px;"><%=++count%></td>
																<td class="pt-3-half" style="padding: 5px;"><%=rateCriteriaBean.getCarat_size_from()%></td>
																<td class="pt-3-half" style="padding: 5px;"><%=rateCriteriaBean.getCarat_size_to()%></td>
																<td class="pt-3-half" contenteditable="true" id="rate<%=id%>" onkeyup="update(<%=id%>,'rate')"
																	style="padding: 5px;"><%=rateCriteriaBean.getRate()%></td>
																<td class="pt-3-half" contenteditable="true" id="rateStone<%=id%>" onkeyup="update(<%=id%>,'rateStone')"
																style="padding: 5px;"><%=rateCriteriaBean.getRate_per_stone()%></td>
																<%-- <%if(auth == 1){ %>
																<td class="pt-3-half" contenteditable="true" id="rate<%=id%>" onkeyup="update(<%=id%>,'rate')"
																	style="padding: 5px;"><%=rateCriteriaBean.getRate()%></td>
																<td class="pt-3-half" contenteditable="true" id="rateStone<%=id%>" onkeyup="update(<%=id%>,'rateStone')"
																style="padding: 5px;"><%=rateCriteriaBean.getRate_per_stone()%></td>
																<%}else{ %>
																<td class="pt-3-half" id="rate<%=id%>"
																style="padding: 5px;"><%=rateCriteriaBean.getRate()%></td>
																<td class="pt-3-half" id="rate<%=id%>"
																style="padding: 5px;"><%=rateCriteriaBean.getRate_per_stone()%></td>
																<%} %> --%>
																<%-- onkeyup="update(<%=id%>,'rate')"  contenteditable="true"--%>
																<td class="pt-3-half" style="padding: 5px;"><%=discount%>
																	%</td>
																<td class="pt-3-half" style="padding: 5px;"><%=String.format("%.2f", finalRate)%></td>
																<td class="pt-3-half" style="padding: 5px;"><%=String.format("%.2f", finalRatePerStone)%></td>
																<%if(auth == 1){ %>
																<td class="pt-3-half" style="padding: 5px;" contenteditable="true" id="margine<%=id%>" onkeyup="update(<%=id%>,'margine')"><%=rateCriteriaBean.getSltl_share()%>
																	</td>
																<%}else{ %>
																<td class="pt-3-half" style="padding: 5px;"><%=rateCriteriaBean.getSltl_share()%>
																	</td>
																<%} %>
																
																<td class="pt-3-half" style="padding: 5px;"><%=String.format("%.2f", sltlrate)%></td>
																<td class="pt-3-half" style="padding: 5px;"><%=String.format("%.2f", sltlratePerStone)%></td>
																<td style="padding: 5px;"><%=ddmmyyyy.format(rateCriteriaBean.getEffective_date())%></td>
																<td style="padding: 5px;">
						                            			<i class="icon-trash" style="font-size: 15px;font-weight: bold;color: red;cursor: pointer;" title="delete" onclick="deleteData(<%=id%>,<%=prod_id%>)"></i>
						                            		</td>
															</tr>

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
    if (datefield.type!="date"){ //if browser doesn't support input type="date", initialize date picker widget:
        jQuery(function($){ //on document.ready
            $('#date').datepicker({
                dateFormat: 'dd/mm/yy'
            });

        })
    }
    
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
    
    
    function deleteData(id,pid){
    	var ratVal = confirm("Are you sureasdsads?");
    	
    	if(ratVal == true){
    		$.ajax({
    		    //for call action
    		    url: 'deleteRate',
    		    //for specify Method
    		    method: "GET",
    		    //form send data
    		    data:{id : id},
    		    success: function (data) {
    		    	location.reload();
    		    }
    		});
    	}
    	
    }
    
    </script>
</body>
</html>