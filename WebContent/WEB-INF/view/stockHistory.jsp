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
	
	List<WorkHistoryBean> listOfPendingChallans = null;
	int custId = 0;
	int stockStatus = 0;
	String lot = "";
	String fromDate = "";
	String toDate = "";
	String kapan = "0";
	
	if(request.getParameter("custId") != null){
		custId = Integer.parseInt(request.getParameter("custId"));
	}
	if(request.getParameter("kapan") != null){
		kapan = request.getParameter("kapan");
	}
	if(request.getParameter("lot") != null){
		lot = request.getParameter("lot");
	}
	
	if(request.getParameter("stockStatus") != null){
		stockStatus = Integer.parseInt(request.getParameter("stockStatus"));
	}
	
	kapan = kapan.replace("@@", "+");
	lot = lot.replace("@@", "+");
	
	List<String> listOfKapanByCustomer = allListDAO.listOfKapanByCustomerIdByFilter(custId);
	List<String> listOfLotByCustomer = allListDAO.listOfLotByCustomerIdByFilter(custId,kapan);
	
	if(request.getParameter("fromDate") != null){
		fromDate = request.getParameter("fromDate");
	}
	
	if(request.getParameter("toDate") != null){
		toDate = request.getParameter("toDate");
	}
	
	if(request.getAttribute("listOfPendingCallans") != null){
		
		listOfPendingChallans = (ArrayList) request.getAttribute("listOfPendingCallans");
	}
	
	
	
	
	double totalWeight = 0;
	int childStoneSize = 0;
	double childWeignt = 0;
	
	if(listOfPendingChallans != null){ 
	for(WorkHistoryBean ww : listOfPendingChallans){
		totalWeight = totalWeight + Double.parseDouble(ww.getActual_weight());
		
		List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(ww.getWork_history_id()); 
		
		for(WorkHistoryBean www : listOfChildWork){
			childStoneSize++;
			childWeignt = childWeignt + Double.parseDouble(www.getActual_weight());
					
		}
		
	}
	}
	
	
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
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-2">
									<h4 class="card-title" id="striped-label-layout-icons">Stock History</h4>
								</div>
								<div class="col-md-8">
									<%if(listOfPendingChallans != null){ %>
										( Stone : <b><%=listOfPendingChallans.size()%></b>  & Weight : <b><%=String.format("%.2f", totalWeight)%></b> )
										&nbsp;&nbsp;
										( Child Stone : <b><%=childStoneSize%></b>  & Weight : <b><%=String.format("%.2f", childWeignt)%></b> )
									<%} %>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								<div class="row">
						<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<form action="stockHistory" method="post">
										<input type="hidden" name="userCustId" value="<%=userCustId%>">
													<div class="row">
														<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">	
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
														<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">	
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
														<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Lot Name</label> 
																<select class="select2 form-control border-primary" name="lot" id="lot" onchange="setStone();" required>
																	<option value="0" selected="selected">---All Lot---</option>
																	<%for(String s : listOfLotByCustomer){
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
														<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Stock Status</label> 
																<select class="form-control border-primary" name="stockStatus" required>
																	<option value="100" selected="selected">All Stock</option>
																	<%if(stockStatus == 0){ %>
																		<option value="0" selected="selected">In Stock</option>
																	<%}else{ %>
																		<option value="0">In Stock</option>
																	<%} %>
																	
																	<%if(stockStatus == 1){ %>
																		<option value="1" selected="selected">Process Done</option>
																	<%}else{ %>
																		<option value="1">Process Done</option>
																	<%} %>
																	
																	<%if(stockStatus == 2){ %>
																		<option value="2" selected="selected">Cleared Stock</option>
																	<%}else{ %>
																		<option value="2">Cleared Stock</option>
																	<%} %>
																	
																	
																</select>
																
															</div>
														</div>
														<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">From Date</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-android-calendar"></i></span>
																	<input type="text" class="form-control" placeholder="dd/mm/yyyy" aria-describedby="basic-addon1" name="fromDate" id="fromDate" value="<%=fromDate%>" readonly="readonly">
																</div>
															</fieldset>
														</div>
														<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">	
															<fieldset>
																<label for="userinput2">To Date</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i class="icon-android-calendar"></i></span>
																	<input type="text" class="form-control" placeholder="dd/mm/yyyy" aria-describedby="basic-addon1" name="toDate" id="toDate" value="<%=toDate%>" readonly="readonly">
																</div>
															</fieldset>
														</div>
												</div>
												<hr>
												<div align="right">
													<button type="submit" class="btn btn-primary" id="saveBtn" onclick="submitForm();">
																	<i class="icon-check2"></i> Click to Show
																</button>
												</div>
												
										</form>
								</div>
								</div>
								<%if(listOfPendingChallans != null){ %>
								<hr>
								<div class="row">
								<form action="updateStcokStatus" method="post">
								<input type="hidden" name="custId" value="<%=custId%>">
								<input type="hidden" name="userId" value="<%=user_id%>">
								<input type="hidden" name="stockStatus" value="<%=stockStatus%>">
								<input type="hidden" name="fromDate" value="<%=fromDate%>">
								<input type="hidden" name="toDate" value="<%=toDate%>">
								<input type="hidden" name="userCustId" value="<%=userCustId%>">
								
								
								<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
								
								<div align="right">
								<%if(stockStatus == 0){ %>
									<input type="hidden" name="action" value="1">
									<button type="submit" class="btn btn-success" id="saveBtn">
										<i class="icon-check2"></i> Process Done
									</button>
								<%}else if(stockStatus == 1){%>
									<input type="hidden" name="action" value="2">
									<button type="submit" class="btn btn-success" id="saveBtn">
										<i class="icon-check2"></i> Clear Stock
									</button>
								<%} %>
								</div>
									<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 13px;">
						                            <thead>
						                                <tr>
						                                	<th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;">Company</th>
						                                    <th style="padding: 3px;">Kapan Name</th>
						                                    <th style="padding: 3px;">Lot Name</th>
						                                    <th style="padding: 3px;">Stone Name</th>
						                                    <th style="padding: 3px;">Actual Weight </th>
						                                    <th style="padding: 3px;">Color</th>
						                                    <th style="padding: 3px;">Remarks</th>
						                                    <th style="padding: 3px;">Insert Date</th>
						                                    <th style="padding: 3px;">Status</th>
						                                    <th style="padding: 3px;">Process Done</th>
						                                    <th style="padding: 3px;">Clear Stock</th>
						                                    <th style="padding: 3px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(WorkHistoryBean w : listOfPendingChallans){
					                            		String wId = w.getWork_history_id();
					                            		String encodeWork_id = new EncodeDecode().encodeString(wId);
					                            		
														 List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(wId); 
						                            %>
						                            	<tr>
						                            		<td style="padding: 3px;"><%if(stockStatus != 2){ %><input type="checkbox" name="wId" value="<%=wId%>"><%} %></td>
						                            		<td style="padding: 3px;"><font style="font-weight: bold;">Parent</font></td>
						                            		<td style="padding: 3px;"><%=w.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;"><%=w.getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=w.getColor()%></td>
						                            		<td style="padding: 3px;white-space: pre-wrap;"><%=w.getRemarks()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(w.getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(w.getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(w.getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            			<%}else if(w.getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
							                            		<%if(w.getIn_stock() == 1 || w.getIn_stock() == 2){ %>
							                            			<%=ddmmyyyyhhmmss.format(w.getIn_stock_datetime())%>
							                            		<%} else {%>
							                            			-
							                            		<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<%if(w.getIn_stock() == 2){ %>
							                            			<%=ddmmyyyyhhmmss.format(w.getCleared_datetime())%>
							                            		<%} else {%>
							                            			-
							                            		<%} %>
						                            			
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<a href="redirect?p=YWRkQ2hpbGRTdG9uZQ===&wId=<%=encodeWork_id%>" target="_blank"><i class="icon-code-fork" title="Add Child Stone" style="cursor: pointer;color: blue;font-size: 20px;"></i></a>     <!-- // done by chirag 09-06-2020 -->
						                            			
						                            			<%if(w.getIn_stock() == 0){ %>
						                            				<%-- <a href="redirect?p=YWRkQ2hpbGRTdG9uZQ===&wId=<%=encodeWork_id%>" target="_blank"><i class="icon-code-fork" title="Add Child Stone" style="cursor: pointer;color: blue;font-size: 20px;"></i></a> --%>
						                            				<a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==&wId=<%=encodeWork_id%>"><i class="icon-pencil2" title="Edit" onclick="editData('<%=w.getWork_history_id()%>');" style="cursor: pointer;color: green"></i></a>
						                            				<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteHistory('<%=w.getWork_history_id()%>')"></i>
						                            			<%} %>
						                            			
						                            			<a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==&wId=<%=encodeWork_id%>"><i class="icon-pencil2" title="Edit" onclick="editData('<%=w.getWork_history_id()%>');" style="cursor: pointer;color: green"></i></a>
						                            			
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            		</td>
						                            	</tr>
						                            	
						                            	<%for(WorkHistoryBean www : listOfChildWork){ %>
						                            		<tr>
						                            		<td style="padding: 3px;"></td>
						                            		<td style="padding: 3px;" align="right"><i class="icon-arrow-right4"></i>Child</td>
						                            		<td style="padding: 3px;"><%=www.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;"><%=www.getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=www.getColor()%></td>
						                            		<td style="padding: 3px;white-space: pre-wrap;"><%=www.getRemarks()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(www.getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(www.getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(www.getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            			<%}else if(www.getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
							                            		<%if(www.getIn_stock() == 1 || www.getIn_stock() == 2){ %>
							                            			<%=ddmmyyyyhhmmss.format(www.getIn_stock_datetime())%>
							                            		<%} else {%>
							                            			-
							                            		<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<%if(www.getIn_stock() == 2){ %>
							                            			<%=ddmmyyyyhhmmss.format(www.getCleared_datetime())%>
							                            		<%} else {%>
							                            			-
							                            		<%} %>
						                            			
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<%if(www.getIn_stock() == 0){ %>
						                            				<a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==&wId=<%=encodeWork_id%>"><i class="icon-pencil2" title="Edit" onclick="editData('<%=w.getWork_history_id()%>');" style="cursor: pointer;color: green"></i></a>
						                            				<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteHistory('<%=w.getWork_history_id()%>')"></i>
						                            			<%} %>
						                            			
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            		</td>
						                            		
						                            	</tr>
						                            	<%} %>
						                            <%} %>	
						                            </tbody>
					                        </table>
					                       </div> 
								</div>
								</form>
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
	
	<script src="app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/scripts/forms/select/form-select2.min.js" type="text/javascript"></script>
     <script src="app-assets/vendors/js/forms/select/selectize.min.js" type="text/javascript"></script>
      <script src="app-assets/js/scripts/forms/select/form-selectize.min.js" type="text/javascript"></script>
      
      <script type="text/javascript">
      
    //For Datatable initilization
		$(".file-export").DataTable({
			// for table structure
	         dom: "Bfrtip",
	         
	         //for disable ordering
	         "ordering": false,
			
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
    </script>

<script>

function setStone(){
	
	var custId = $("#custId").val();
	var kapan = $("#kapan").val().replace("+","@@");
	var lot = $("#lot").val().replace("+","@@");
	
	window.location.href = "redirect?p=c3RvY2tIaXN0b3J5&custId="+custId+"&kapan="+kapan+"&lot="+lot;
}

    if (datefield.type!="date"){ //if browser doesn't support input type="date", initialize date picker widget:
        jQuery(function($){ //on document.ready
            $('#fromDate').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: "-5:+1", // last five years
            });
		
            $('#toDate').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: "-5:+1", // last five years
            });

        
        })
    }
    
function deleteHistory(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			
			$.ajax({
				//for specify Method
			    method: "POST",
			    //for call action
			    url: 'deactiveWorkHistory',
			    //form send data
			    data:{wId : value},
			    // action perform when successfully call action with specific method type
			    success: function (data) {
			    	
			    	location.reload();
			    	
			    }
			});
			
			//location.href = "deactiveWorkHistory?wId="+value;
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
		
		window.open("redirectToDetails?wId="+value);
	}
	
    </script>
</body>
</html>