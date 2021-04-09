<%@page import="java.text.DecimalFormat"%>
<%@page import="com.di.bean.WorkHistoryBean"%>
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
<title>summary Report</title>
<%@include file="header.jsp"%>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
	int icId = 0;
	if(request.getParameter("userCustId") != null){
		String val = request.getParameter("userCustId");
		icId = Integer.parseInt(new EncodeDecode().decodeString(val));
	}
	int parent_id = 0;
	List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomerByParentId(parent_id);
	if(auth != 1){
		listOfCustomer =  allListDAO.listOfCustomerByParentId(userLoginCustId);
	}
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-ios-list"></i> summary Report</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">summary Report</li>
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
									<h4 class="card-title" id="striped-label-layout-icons">summary Report</h4>
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
						                                	<th style="padding: 5px;">Customer Name</th>
						                                	<th style="padding: 5px;">Total Kapan</th>
						                                	<th style="padding: 5px;">Total Lot</th>
						                                	<th style="padding: 5px;">Total Stone</th>
						                                	<th style="padding: 5px;">Total Carat</th>
						                                	<th style="padding: 5px;">Cleared Stone</th>
						                                		<th style="padding: 5px;">Cleared Carat</th>
						                                	<th style="padding: 5px;">Remaining Stock</th>
						                                		<th style="padding: 5px;">Remaining Carat</th>
						                                	<th style="padding: 5px;">Invoiced</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<%for(CustomerBean c : listOfCustomer){
						                            		int custId = c.getCustomer_id();
						                            		if(icId == custId || icId == 0){
						                            			
						                            		List<String> listOfKapan = allListDAO.listOfCountByGroup("kapan_name",c.getCustomer_id());
						                            		List<String> listOfLot = allListDAO.listOfCountByGroup("lot_name",c.getCustomer_id());
						                            		
						                            		long totalStone = allListDAO.listOfStone(custId, "0,1,2");
						                            		
						                            		Double totalCarat = allListDAO.listOfStoneCarat(custId);
						                            		DecimalFormat df = new DecimalFormat("#.##");
						                            		double p = Double.parseDouble(df.format(totalCarat));
						                            		
						                            		long clearedStone = allListDAO.listOfStone(custId, "2");
						                             		Double clearedCarat = allListDAO.listOfclearedCarat(custId, "2");
						                            	
						                            	if(clearedCarat == null){
						                            		clearedCarat = 0.0;
						                            	}
						                            	double cc = Double.parseDouble(df.format(clearedCarat)); 
						                            	long invoiced = allListDAO.listOfStoneInvoiced(custId);
						                            		
						                            	double r = p - cc;
						                            	double ccc = Double.parseDouble(df.format(r)); 
						                            	%>
						                            	 <tr>
						                            	 	<td style="padding: 5px;"><a href="redirect?p=Z2xvYmFsUmVwb3J0RGV0YWls&custId=<%=new EncodeDecode().encodeString(String.valueOf(custId))%>"><%=c.getCompany()%></a></td>
						                            	 	<td style="padding: 5px;"><%=listOfKapan.size()%></td>
						                            	 	<td style="padding: 5px;"><%=listOfLot.size()%></td>
						                            	 	<td style="padding: 5px;"><%=totalStone%></td>
						                            	 	<td style="padding: 5px;"><%=p%></td>
						                            	 	<td style="padding: 5px;"><%=clearedStone%></td>
						                            	 	<td style="padding: 5px;"><%=cc%></td>
						                            	 	<td style="padding: 5px;">
						                            	 		<%long stock = totalStone -clearedStone;%>
						                            	 		
						                            	 		<%if(stock != 0){ %>
						                            	 			<font style="color: red;font-size: 13px;font-weight: bold;"><%=stock%></font>
						                            	 		<%}else{%>
						                            	 			0
						                            	 		<%} %>
						                            	 	</td>
						                            	 		<td style="padding: 5px;"><%=ccc %></td>
						                            	 	<td style="padding: 5px;"><%=invoiced%></td>
						                            	 </tr>
						                            	<%} }%>
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
		location.href = "redirect?p=Z2xvYmFsUmVwb3J0=&userCustId="+value;
	}
	
	</script>
</body>
</html>