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
<title>Generate Bill</title>
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
	
	List<String> listOfKapanByCustomer = allListDAO.listOfKapanByCustomerIdByFilterClearedStock(custId);
	List<String> listOfLotByCustomer = allListDAO.listOfLotByCustomerIdByFilter1Cleared(custId,kapan);
	//List<WorkHistoryBean> listOfStoneByCustomer = allListDAO.listOfWorkHistoryByCustomerIdByFilterForInvoice(custId,kapan,lot);
	List<ProductMasterBean> listOfProduct = allListDAO.listOfProduct();
	
	if(request.getParameter("action") != null){
		listOfPendingChallans = allListDAO.listOfWorkHistoryByCustomerIdByFilterForInvoice(custId,kapan,lot);
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
					<h2 class="content-header-title mb-0"><i class="icon-coin-dollar"></i> Generate Bill</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Generate Bill</li>
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
									<h4 class="card-title" id="striped-label-layout-icons">Generate Bill</h4>
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
								
								<%if(request.getParameter("error") != null){ 
								   String error = request.getParameter("error");
								%>
									<div class="alert alert-danger alert-dismissible fade in mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<strong>Oh snap!</strong> <%=new EncodeDecode().decodeString(error)%>
								</div>
									
								<%} %>
								
								<div class="row">
								<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<form action="redirect">
										<input type="hidden" name="p" value="Z2VuZXJhdGVCaWxs=">
										<input type="hidden" name="action" value="show">
													<div class="row">
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Customer</label> 
																<select class="select2 form-control border-primary" name="custId" id="custId" onchange="setStone();" required>
																	<option value="" selected="selected">---SELECT CUSTOMER---</option>
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
																<label for="userinput1">Customer</label> 
																<select class="select2 form-control border-primary" name="lot" id="lot" required>
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
															<fieldset>
																<label for="userinput2"> Show Pending Challans</label>
																<button type="submit" class="btn btn-primary">
																	<i class="icon-check2"></i> Click to Show
																</button>
															</fieldset>
														</div>
												</div>
										</form>
								</div>
								</div>
								<%if(listOfPendingChallans != null){ %>
								<hr>
								<div class="row">
								<form action="generateBill" method="post">
								<input type="hidden" name="custId" value="<%=custId%>">
								<input type="hidden" name="userId" value="<%=user_id%>">
								<input type="hidden" name="userCustId" value="<%=userCustId%>">
								
								<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
								<button type="submit" class="btn btn-primary" id="saveBtn" onclick="javascript:$('#saveBtn').hide();$('#loaderBtn').show();">
									<i class="icon-check2"></i> Generate Bill
								</button>
								<button class="btn btn-primary" id="loaderBtn">
									<i class="icon-load-a spinner"></i> Generating Bill
								</button>
									<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 13px;">
						                            <thead>
						                                <tr>
						                                	<th style="padding: 3px;"><input type="checkbox" class="all" onclick="checkAllChk();"> All</th>
						                                	<th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;">Company Name</th>
						                                    <th style="padding: 3px;">Kapan Name</th>
						                                    <th style="padding: 3px;">Lot Name</th>
						                                    <th style="padding: 3px;">Stone Name</th>
						                                    <th style="padding: 3px;">Actual Weight</th>
						                                    <th style="padding: 3px;">Comment</th>
						                                    <th style="padding: 3px;">Insert Date</th>
						                                    <th style="padding: 3px;">Stock</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(WorkHistoryBean w : listOfPendingChallans){
					                            		String wId = w.getWork_history_id();
					                            		String encodeWork_id = new EncodeDecode().encodeString(String.valueOf(wId));
						                            
					                            		List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(wId);
						                            %>
						                            	<tr>
						                            		<td style="padding: 3px;"><input type="checkbox" name="wId" class="wId" value="<%=wId%>"></td>
						                            		<td style="padding: 3px;"><font style="font-weight: bold;">Parent</font></td>
						                            		<td style="padding: 3px;"><%=w.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;" onclick="showFullDetails('<%=encodeWork_id%>')"><%=w.getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=w.getRemarks()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(w.getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(w.getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else{ %>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(w.getCleared_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            	</tr>
						                            	
						                            	<%for(WorkHistoryBean www : listOfChildWork){ %>
						                            	<tr>
						                            		<td style="padding: 3px;"></td>
						                            		<td style="padding: 3px;" align="right"><i class="icon-arrow-right4"></i></td>
						                            		<td style="padding: 3px;"><%=www.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;" onclick="showFullDetails('<%=encodeWork_id%>')"><%=www.getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=www.getRemarks()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(www.getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(www.getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else{ %>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(www.getCleared_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            	</tr>
						                            	<%}%>
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

<script>
 $("#loaderBtn").hide();    
function setStone(){
    	
    	var custId = $("#custId").val();
    	var kapan = $("#kapan").val().replace("+","@@");
    	var lot = $("#lot").val().replace("+","@@");
    	
    	
    	window.location.href = "redirect?p=Z2VuZXJhdGVCaWxs=&custId="+custId+"&kapan="+kapan+"&lot="+lot;
    }
    
    
function checkAllChk(){
	
	if($(".all").prop('checked') == true){
		$('.wId').prop('checked', true);
	}else{
		$('.wId').prop('checked', false);
	}
	
}

function showFullDetails(value){
	location.href = "redirectToDetails?wId="+value;
}
    </script>
</body>
</html>