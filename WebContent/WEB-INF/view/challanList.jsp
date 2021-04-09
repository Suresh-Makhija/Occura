<%@page import="com.di.bean.ChallanLineBean"%>
<%@page import="com.di.bean.ChallanBean"%>
<%@page import="com.di.bean.InvoiceLineBean"%>
<%@page import="com.di.bean.InvoiceBean"%>
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
<title>Challan Line List</title>
<%@include file="header.jsp"%>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
	int icId = userCustId;
	if(request.getParameter("userCustId") != null){
		String val = request.getParameter("userCustId");
		icId = Integer.parseInt(new EncodeDecode().decodeString(val));
	}
	int parent_id = 0;
	List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomerByParentId(parent_id);
	if(auth != 1){
		listOfCustomer =  allListDAO.listOfCustomerByParentId(userLoginCustId);
	}
	List<ChallanBean> listOfChallan = allListDAO.listOfChallan(icId);
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-ios-list"></i> Challan List</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Challan List</li>
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
						<a class="nav-link" id="base-tab" href="redirect?p=Y2hhbGxhbkNyZWF0b3I=" aria-expanded="true">Create Challan</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" id="base-tab" href="redirect?p=Y2hhbGxhbkxpc3Q=" aria-expanded="true">Challan List</a>
					</li>
			</ul>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-3">
									<h4 class="card-title" id="striped-label-layout-icons">Challan List</h4>
								</div>
								<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">	
															<div class="form-group">
																<select class="select2 form-control border-primary" name="custId" onchange="setCustmoer(this.value)" required>
																	<option value="MA==" selected="selected">---ALL CUSTOMER---</option>
																	<%for(CustomerBean c : listOfCustomer){
																	 String encodeCid = new EncodeDecode().encodeString(String.valueOf(c.getCustomer_id()));	
																	if(icId == c.getCustomer_id()){
																	%>
																		<option value="<%=encodeCid%>" selected="selected"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																	<%}else{ %>
																		<option value="<%=encodeCid%>"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																	<%} %>	
																	<%} %>
																</select>
															</div>
														</div>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 12px;">
						                            <thead>
						                                <tr>
						                                	<th style="padding: 5px;">Challan Number</th>
						                                	<th style="padding: 5px;">Client Name</th>
						                                	<th style="padding: 5px;">Total</th>
						                                	<th style="padding: 5px;">Date</th>
						                                	<th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<!-- Get Method for list Of Product Master-->
						                            	<%
						                            	int count = 0;
						                            			long totalLine = 0;
						                            	/* for Extract Data */ 
						                            	for(ChallanBean c : listOfChallan){
						                            		String challanId = c.getChallan_id();
						                            		//List<ChallanLineBean> listOfChallanLine = allListDAO.listOfChallanLine(challanId);
						                            		
						                            		long listOfChallanLineCount = allListDAO.listOfChallanLineCount(challanId);
						                            		
						                            		String encodeCId = new EncodeDecode().encodeString(String.valueOf(challanId));
						                            		int parentid = c.getCustomerBean().getParent_customer_id();
						                            		CustomerBean parent = allListDAO.customerDetails(parentid);
						                            		totalLine = totalLine + listOfChallanLineCount;
						                            	%>  
						                            	
						                            	<tr>
						                            		<td style="padding: 5px;"><%=c.getChallan_number()%></td>
						                            		<td style="padding: 5px;"><%=c.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 5px;"><%=listOfChallanLineCount%></td> 
						                            		<td style="padding: 5px;"><%=ddmmyyyyhhmmss.format(c.getInsert_date())%></td>
						                            		<td style="padding: 5px;">
						                            			<a href="redirect?p=Y2hhbGxhbkxpbmU=&cId=<%=encodeCId%>"><i class="icon-open" style="font-size: 15px;font-weight: bold;"></i></a>
						                            			<%if(parent.getCustomer_code().trim().equalsIgnoreCase("C-00002")){%>
						                            			<a href="redirect?p=c3RhckdlbXNDaGFsbGFu&cId=<%=encodeCId%>" target="_blank"><i class="icon-printer4" style="font-size: 15px;font-weight: bold;" title="Print Challan"></i></a>
						                            			<%} %>
						                            		</td>
						                            	</tr>
						                            	
						                            	<%} %>
						                            </tbody>
						                            <div align="right">
						                            <h4>Total Stone : <b><%=totalLine%></b></h4>
						                            </div>
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
	
	$("#updateDiv").hide();
	$("#updateLoader").hide();
	
	$(document).ready(function(){
		
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
	});
	
	function setCustmoer(value){
		location.href = "redirect?p=Y2hhbGxhbkxpc3Q=&userCustId="+value;
	}
	
	</script>
</body>
</html>