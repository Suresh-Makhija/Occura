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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


  <title>Global Report Detail</title>
<%@include file="header.jsp"%>
</head>
<body>

<%
	
	AllListDAO allListDAO = new AllListDAO();
	String encode = request.getParameter("custId");
	int custId = Integer.parseInt(new EncodeDecode().decodeString(encode));
	
	CustomerBean customerBean = allListDAO.customerDetails(custId);
	
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-ios-list"></i> <%=customerBean.getCompany()%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                   <li class="breadcrumb-item"><a href="redirect?p=Z2xvYmFsUmVwb3J0">summary Report</a></li>
		                  <li class="breadcrumb-item active"><%=customerBean.getCompany()%></li>
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
								<div class="col-md-6">
									<h4 class="card-title" id="striped-label-layout-icons"><%=customerBean.getCompany()%></h4>
								</div>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" >
					 						<div class="table-responsive">
					 							<table class="table table-bordered table-striped file-export" style="font-size: 12px;">
						                            <thead>
						                                <tr>
						                                	<th style="padding: 5px;"></th>
						                                	<th style="padding: 5px;">Kapan Name</th>
						                                	<th style="padding: 5px;">Total Lot</th>
						                                	<th style="padding: 5px;">Total Stone</th>
						                                	<th style="padding: 5px;">Cleared Stone</th>
						                                	<th style="padding: 5px;">Remaining Stock</th>
						                                	<th style="padding: 5px;">Invoiced</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
						                            		List<String> listOfKapan = allListDAO.listOfCountByGroup("kapan_name",custId);
						                            
						                            		int count = 0;
						                            		long finalTotalStone = 0;
						                            		long finalClearedStone = 0;
						                            		long finalStock = 0;
						                            		long finalInvoice = 0;
						                            		
						                            		for(String kapan : listOfKapan){
						                            			count++;
						                            			List<String> listOfLot = allListDAO.listOfCountByGroupBykapan("lot_name",custId,kapan);
							                            		long totalStone = allListDAO.listOfStoneByKapan(custId, "0,1,2",kapan);
							                            		long clearedStone = allListDAO.listOfStoneByKapan(custId, "2",kapan);
							                            		long invoiced = allListDAO.listOfStoneInvoicedKapan(custId,kapan);
							                            		
							                            		finalTotalStone = finalTotalStone + totalStone;
							                            		finalClearedStone = finalClearedStone + clearedStone;
							                            		finalInvoice = finalInvoice + invoiced; 
						                            			
						                            	%>
						                            	 <tr>
						                            	 	<td style="padding: 5px;"><i class="icon icon-plus-circle" onclick="show('<%=count%>')" style="cursor: pointer;"></i></td>
						                            	 	<td style="padding: 5px;"><%=kapan%></td>
						                            	 	<td style="padding: 5px;"><%=listOfLot.size()%></td>
						                            	 	<td style="padding: 5px;"><%=totalStone%></td>
						                            	 	<td style="padding: 5px;"><%=clearedStone%></td>
						                            	 	<td style="padding: 5px;">
						                            	 		<%long stock = totalStone -clearedStone;
						                            	 		finalStock = finalStock + stock;
						                            	 		%>
						                            	 		
						                            	 		<%if(stock != 0){ %>
						                            	 			<font style="color: red;font-size: 13px;font-weight: bold;"><%=stock%></font>
						                            	 		<%}else{%>
						                            	 			0
						                            	 		<%} %>
						                            	 	</td>
						                            	 	<td style="padding: 5px;"><%=invoiced%></td>
						                            	 </tr>
						                            	 
						                            	 <tr class="hide" id="show<%=count%>">
						                            	 	<td colspan="7">
						                            	 		<table class="table">
						                            	 			<thead>
						                            	 				<tr>
						                            	 					<th style="padding: 5px;">Lot Name</th>
						                            	 					<th style="padding: 5px;">Total Stone</th>
						                            	 					<th style="padding: 5px;">Cleared Stone</th>
						                            	 					<th style="padding: 5px;">Remaining Stock</th>
						                            	 					<th style="padding: 5px;">Invoiced</th>
						                            	 				</tr>
						                            	 			</thead>
						                            	 			<%for(String lot : listOfLot){ 
						                            	 			
						                            	 				long totalStoneByLot = allListDAO.listOfStoneByKapanLot(custId, "0,1,2",kapan,lot);
									                            		long clearedStoneByLot = allListDAO.listOfStoneByKapanLot(custId, "2",kapan,lot);
									                            		long invoicedByLot = allListDAO.listOfStoneInvoicedKapanLot(custId,kapan,lot);
						                            	 			%>
						                            	 				 <tr>
										                            	 	<td style="padding: 5px;"><%=lot%></td>
										                            	 	<td style="padding: 5px;"><%=totalStoneByLot%></td>
										                            	 	<td style="padding: 5px;"><%=clearedStoneByLot%></td>
										                            	 	<td style="padding: 5px;">
											                            	 		<%long stockLot = totalStoneByLot -clearedStoneByLot;%>
											                            	 		
											                            	 		<%if(stockLot != 0){ %>
											                            	 			<font style="color: red;font-size: 13px;font-weight: bold;"><%=stockLot%></font>
											                            	 		<%}else{%>
											                            	 			0
											                            	 		<%} %>
											                            	 	</td>
										                            	 	<td style="padding: 5px;"><%=invoicedByLot%></td>
										                            	 </tr>
						                            	 			<%} %>
						                            	 		</table>
						                            	 	</td>	
						                            	 </tr>
						                            	 <%} %>
						                            	 
						                            	 <tr>
						                            	 	<td style="padding: 5px;"></td>
						                            	 	<td style="padding: 5px;"></td>
						                            	 	<td style="padding: 5px;">Total</td>
						                            	 	<td style="padding: 5px;font-weight: bold;font-size: 15px;"><%=finalTotalStone%></td>
						                            	 	<td style="padding: 5px;font-weight: bold;font-size: 15px;"><%=finalClearedStone%></td>
						                            	 	<td style="padding: 5px;font-weight: bold;font-size: 15px;"><%=finalStock%></td>
						                            	 	<td style="padding: 5px;font-weight: bold;font-size: 15px;"><%=finalInvoice%></td>
						                            	 </tr>
						                            	 
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
	
	$(".hide").hide();
	

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


	
	function show(kapan){
		$(".hide").hide();
		$("#show"+kapan).show();
		
	}
	
	function setCustmoer(value){
		location.href = "redirect?p=Y2hhbGxhbkxpc3Q=&userCustId="+value;
	}
	
	</script>
</body>
</html>