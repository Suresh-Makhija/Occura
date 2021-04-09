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
<title>Rate Criteria History</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	String encodeCt_id = request.getParameter("ct_id");
	String encodeName = request.getParameter("name");

	int decodeCt_id = Integer.parseInt(new EncodeDecode().decodeString(encodeCt_id));
	String decodeName = new EncodeDecode().decodeString(encodeName);
	
	AllListDAO allListDAO = new AllListDAO();
	
	
	String cId = request.getParameter("cId");
	String pId = request.getParameter("pId");
	
	int decodeCustId = Integer.parseInt(new EncodeDecode().decodeString(cId));
	int decodeProdId = Integer.parseInt(new EncodeDecode().decodeString(pId));
	
	CustomerTypeBean customerTypeBean = allListDAO.detailsOfCustomerType(decodeCt_id);
	List<RateCriteriaBean> listOfRateCriteria = allListDAO.historyOfRateCriteria(decodeCt_id, decodeName,decodeCustId,decodeProdId);
	RateCriteriaBean rateCriteriaBean = allListDAO.detailsOfLastRate(decodeCt_id,decodeName,decodeCustId,decodeProdId);
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-dollar"></i> <%=decodeName%> (Type <%=customerTypeBean.getType()%> : <%=customerTypeBean.getType_name()%>)</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJUeXBlTWFzdGVy">Customer Type Master</a></li>
		                  <li class="breadcrumb-item"><a href="redirect?p=cmF0ZUNyaXRlcmlh&ct_id=<%=encodeCt_id%>&cId=<%=cId%>">Type <%=customerTypeBean.getType()%> : <%=customerTypeBean.getType_name()%></a></li>
		               	  <li class="breadcrumb-item active"><%=decodeName%></li>
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
									<i class="icon-circle-plus" style="font-size: 35px;cursor: pointer;" title="Add New Rate" onclick="javascript:$('#insertDiv').show();$('#tableDiv').hide();"></i>
								</div>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="insertDiv">
											<form class="form" id="formInsert" action="addRateCriteria" method="post">
											<input type="hidden" name="ctId" id="ctId" value="<%=decodeCt_id%>">
											<input type="hidden" name="user_id" id="user_id" value="<%=user_id%>">
											<input type="hidden" name="userCutsId" id="userCutsId" value="<%=decodeCustId%>">
											<input type="hidden" name="pId" id="pId" value="<%=decodeProdId%>">
											<input type="hidden" name="redirect"  value="redirect?p=cmF0ZUNyaXRlcmlhSGlzdG9yeQ==&name=<%=encodeName%>&ct_id=<%=encodeCt_id%>&cId=<%=cId%>&pId=<%=pId%>">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Add Rate Criteria</h4>
													<div class="row">
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<fieldset>
																<%if(decodeCt_id == 1){ %>
																<label for="userinput2">Carat From</label>
																<%}else if(decodeCt_id == 2){%>
																<label for="userinput2">Stone Number From</label>
																<%} %>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><b><=</b></span>
																	<input type="text" class="form-control" placeholder="Size from" aria-describedby="basic-addon1" name="sizeFrom" id="sizeFrom" value="<%=rateCriteriaBean.getCarat_size_from()%>" readonly="readonly">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<fieldset>
																<%if(decodeCt_id == 1){ %>
																<label for="userinput2">Carat Size To</label>
																<%}else if(decodeCt_id == 2){%>
																<label for="userinput2">Stone Number To</label>
																<%} %>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><b>>=</b></span>
																	<input type="text" class="form-control" placeholder="Size to" aria-describedby="basic-addon1"  name="sizeTo" id="sizeTo" value="<%=rateCriteriaBean.getCarat_size_to()%>" readonly="readonly">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">Rate</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-dollar"></i></span>
																	<input type="text" class="form-control" placeholder="Rate" aria-describedby="basic-addon1" name="rate" id="rate">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">Min Rate</label>
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
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">SLTL Margin</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1">%</span>
																	<input type="text" class="form-control" placeholder="SLTL Margin" aria-describedby="basic-addon1" name="sltlShare" id="sltlShare">
																</div>
															</fieldset>
														</div>
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">Effective Date</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-android-calendar"></i></span>
																	<input type="text" class="form-control" placeholder="dd/mm/yyyy" aria-describedby="basic-addon1" name="date" id="date" value="<%=ddmmyyyy.format(new Date())%>" readonly="readonly">
																</div>
															</fieldset>
														</div>
													</div>
												</div>

												<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="addBtn" onclick="addForm();">
														<i class="icon-check2"></i> Add
													</button>
													<button type="button" class="btn btn-primary" id="addLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#insertDiv').hide();$('#tableDiv').show();">
														<i class="icon-cross2"></i> Cancel
													</button>
												</div>
											</form>
										</div>
										
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Rate/Carat</th>
						                                    <th style="padding: 5px;">Min Rate/Carat</th>
						                                     <th style="padding: 5px;">Rate/Stone</th>
						                                    <th style="padding: 5px;">Min Rate/Stone</th>
						                                    <th style="padding: 5px;">SLTL Margin</th>
						                                    <th style="padding: 5px;">Effective Date</th>
						                                    <th style="padding: 5px;">User</th>
						                                    <th style="padding: 5px;">Insert Date & Time</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<!-- Get Method for list Of Product Master-->
						                            	<%
						                            	int count = 0;
						                            	/* for Extract Data */ 
						                            	for(RateCriteriaBean r : listOfRateCriteria){
						                            		int id = rateCriteriaBean.getRate_criteria_id();
						                            	%>  
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count%></td>
						                            		<td style="padding: 5px;"><%=r.getRate()%></td>
						                            		<td style="padding: 5px;"><%=r.getMin_rate()%></td>
						                            		<td style="padding: 5px;"><%=r.getRate_per_stone()%></td>
						                            		<td style="padding: 5px;"><%=r.getMin_rate_per_stone()%></td>
						                            		<td style="padding: 5px;"><%=r.getSltl_share()%></td>
						                            		<td style="padding: 5px;"><%=ddmmyyyy.format(r.getEffective_date())%></td>
						                            		<td style="padding: 5px;"><%=r.getUserBean().getName()%></td>
						                            		<td style="padding: 5px;"><%=ddmmyyyyhhmmss.format(r.getInsert_datetime())%></td>
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
	
	
	<script type="text/javascript">
	
	$("#insertDiv").hide();
	$("#addLoader").hide();
	
		
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
	    $(".buttons-excel").addClass("btn btn-primary mr-1")
				
	function addForm(){
		$("#addBtn").hide();
		$("#addLoader").show();
		$("#formInsert").submit();
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
    
    </script>
</body>
</html>