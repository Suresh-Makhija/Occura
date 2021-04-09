<%@page import="com.di.bean.PaymentBean"%>
<%@page import="java.util.ArrayList"%>
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
<title>Invoice List</title>
<%@include file="header.jsp"%>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
	int icId = userCustId;
	String status = "";
	if(request.getParameter("userCustId") != null){
		String val = request.getParameter("userCustId");
		icId = Integer.parseInt(new EncodeDecode().decodeString(val));
		
		status = request.getParameter("status");
	}
	int parent_id = 0;
	
	
	List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomerByParentId(parent_id);
	
	if(auth != 1){
		listOfCustomer =  allListDAO.listOfCustomerByParentId(userLoginCustId);
	}
	

	if(icId == 0){
		icId = userCustId;
	}
	
	
	int billed = 100; //default value
	
	if(status.equalsIgnoreCase("Billed")){
		billed = 1;
	}else if(status.equalsIgnoreCase("Un-Billed")){
		billed = 0;
	}
	List<InvoiceBean> listOfInvoice = allListDAO.listOfInvoiceByIdByStatis(icId,billed);
	
	
	List<String> listOfBillingStatus = new ArrayList();
	listOfBillingStatus.add("Billed");
	listOfBillingStatus.add("Un-Billed");
	
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-ios-list"></i> Invoice List</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Invoice List</li>
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
									<h4 class="card-title" id="striped-label-layout-icons">Invoice List</h4>
								</div>
								<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">	
															<div class="form-group">
																<select class="select2 form-control border-primary" name="custId" id="custId" onchange="setData()" required>
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
														
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">	
															<div class="form-group">
																<select class="select2 form-control border-primary" name="status" id="status" onchange="setData()" required>
																	<option value="MA==" selected="selected">---All Billing Status---</option>
																	<%for(String b : listOfBillingStatus){ 
																	if(status.equals(b)){
																	%>
																		<option value="<%=b%>" selected="selected"><%=b%></option>
																	<%}else{ %>
																		<option value="<%=b%>"><%=b%></option>
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
									
									<%
										String invoice = "active";
										String payment = "";
										
										if(request.getParameter("paymentFlag") != null){
											 invoice = "";
											 payment = "active";
										}
									%>
								
										<ul class="nav nav-tabs">
											<li class="nav-item">
												<a class="nav-link <%=invoice%>" id="base-tab1" data-toggle="tab" aria-controls="tab1" href="#tab1" aria-expanded="true">Invoice List</a>
											</li>
											<li class="nav-item">
												<a class="nav-link <%=payment%>" id="base-tab2" data-toggle="tab" aria-controls="tab2" href="#tab2" aria-expanded="false">Payment History</a>
											</li>
										</ul>
										<div class="tab-content px-1 pt-1">
											<div role="tabpanel" class="tab-pane <%=invoice%>" id="tab1" aria-expanded="true" aria-labelledby="base-tab1">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 12px;">
						                            <thead>
						                                <tr>
						                                	<th style="padding: 5px;">Invoice Number</th>
						                                	<th style="padding: 5px;">Client Name</th>
						                                	<th style="padding: 5px;">Total Stone</th>
						                                    <th style="padding: 5px;">Invoice Date</th>
						                                    <th style="padding: 5px;">Basic Amount</th>
						                                   <!--  <th style="padding: 5px;">Discount</th>
						                                    <th style="padding: 5px;">Discount</th> -->
						                                    <th style="padding: 5px;">CGST</th>
						                                    <th style="padding: 5px;">SGST</th>
						                                    <th style="padding: 5px;">IGST</th>
						                                    <th style="padding: 5px;">Final Outstanding</th>
						                                     <th style="padding: 5px;">Status</th>
						                                     <th style="padding: 5px;">Billing</th>
						                                     <th style="padding: 5px;">Bill Ref.</th>
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<!-- Get Method for list Of Product Master-->
						                            	<%
						                            	int count = 0;
						                            	double totalInvoice = 0;
						                            	/* for Extract Data */ 
						                            	for(InvoiceBean i : listOfInvoice){
						                            		
						                            		String iid = i.getInvoice_id();
						                            		String encodeIid = new EncodeDecode().encodeString(String.valueOf(iid));
						                            		
						                            		List<String> listOfInvoiceLine = allListDAO.listOfInvoiceLineGroupByChallan(iid);
						                            		
						                            		CustomerBean cb = allListDAO.customerDetails(i.getCustomerBean().getParent_customer_id());
						                            		
						                            		double cgst = 0;
						                            		double sgst = 0;
						                            		double igst = 0;
						                            		if(i.getCgst_per() != 0){ 
						                            			 cgst = (i.getFinal_outstanding() * i.getCgst_per()) / 100;
						                            		}
						                            		if(i.getSgst_per() != 0){ 
						                            			sgst = (i.getFinal_outstanding() * i.getSgst_per()) / 100;
						                            		}
						                            		if(i.getIgst_per() != 0){ 
						                            			igst = (i.getFinal_outstanding() * i.getIgst_per()) / 100;
						                            		}
						                            		
						                            		double finalOutStanding = i.getFinal_outstanding() + cgst + sgst + igst;
						                            		
						                            		totalInvoice = totalInvoice + finalOutStanding;
						                            		
						                            	%>  
						                            	<tr>
						                            		<td style="padding: 5px;"><%=i.getInvoice_num()%></td>
						                            		<td style="padding: 5px;"><%=i.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 5px;"><%=listOfInvoiceLine.size()%></td>
						                            		<td style="padding: 5px;"><%=ddmmyyyyhhmmss.format(i.getInvoice_date())%></td>
						                            		<td style="padding: 5px;"><%=String.format("%.2f", i.getGross_outstanding())%> <small><%=i.getCurrency_type()%></small></td>
						                            		<%-- <td style="padding: 5px;"><%=String.format("%.2f", i.getDiscount_per())%> %</td>
						                            		<td style="padding: 5px;"><%=String.format("%.2f", i.getDiscount_amount())%> <small><%=i.getCurrency_type()%></small></td> --%>
						                            		<td style="padding: 5px;"><%=String.format("%.2f", cgst)%> </td>
						                            		<td style="padding: 5px;"><%=String.format("%.2f", sgst)%> </td>
						                            		<td style="padding: 5px;"><%=String.format("%.2f", igst)%> </td>
						                            		<td style="padding: 5px;"><%=String.format("%.2f", finalOutStanding)%> <small><%=i.getCurrency_type()%></small></td>
						                            		<td style="padding: 5px;white-space: nowrap;">
						                            			<%if(i.getPosting() == 0){%>
																	<font style="font-weight: bold;color: red;">Un-Post</font>
																<%}else{%>
																	<font style="font-weight: bold;color: green;">Posted</font>
																	<br>
																	<small class="text-muted"><%=ddmmyyyyhhmmss.format(i.getPosting_date())%></small>
																<%} %>
						                            		</td>
						                            		<td style="padding: 5px;white-space: nowrap;">
						                            			<%if(i.getBilled() == 0){%>
																	<font style="font-weight: bold;color: red;cursor: pointer;" onclick="setBillingDetail('<%=iid%>','<%=i.getInvoice_num()%>');">Un-Billed</font>
																<%}else{%>
																	<font style="font-weight: bold;color: green;">Billed</font>
																	<br>
																	<small class="text-muted"><%=ddmmyyyy.format(i.getBill_date())%></small>
																<%} %>
						                            		</td>
						                            		<td style="padding: 5px;white-space: nowrap;"><%=i.getBill_ref()%></td>
						                            		<td style="padding: 5px;">
						                            			<a href="redirect?p=aW52b2ljZURldGFpbHM=&iId=<%=encodeIid%>"><i class="icon-open" style="font-size: 15px;font-weight: bold;"></i></a>
						                            				<%if(i.getPosting() == 0){%>
						                            		<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;font-weight: bold;font-size: 15px;" onclick="deleteInvoice('<%=i.getInvoice_id()%>')"></i>
						                            			<%} %>
						                            		</td>
						                            	</tr>
						                            	<%} %>
						                            </tbody>
						                            
						                             <div align="right">
						                            <h4>Total Amount : <b><%=String.format("%.2f", totalInvoice)%></b></h4>
						                            </div>
					                        </table>
					                       </div> 
										</div>
													
											</div>
											
											<div class="tab-pane <%=payment%>" id="tab2" aria-labelledby="base-tab2">
											
											<%if(icId != userCustId){ %>
											
											<%List<PaymentBean> listOfPayment = allListDAO.listOfPaymentHistory(icId);%>
												
												<div class="row">
												<form action="insertPayment" method="post">
													<input type="hidden" name="custId"
														value="<%=icId%>">
													<div class="row">
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<fieldset>
																<label for="userinput2">Payment Receive Date</label>
																<div class="input-group">
																	<span class="input-group-addon" id="basic-addon1"><i
																		class="icon-android-calendar"></i></span> <input type="text"
																		class="form-control" placeholder="dd/mm/yyyy"
																		aria-describedby="basic-addon1" name="receiveDate"
																		id="receiveDate" value="" readonly="readonly" required>
																</div>
															</fieldset>
														</div>
														<div class="col-md- col-lg-3 col-sm-12 col-xs-12">
															<fieldset>
																<label for="userinput2">Amount</label>
																<div class="input-group">
																	<input type="text" class="form-control"
																		placeholder="Enter Amount"
																		aria-describedby="basic-addon1" name="amount"
																		id="amount" value="" required>
																</div>
															</fieldset>
														</div>
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<fieldset>
																<label for="userinput2">Remarks</label>
																<div class="input-group">
																	<input type="text" class="form-control"
																		placeholder="Enter Remarks"
																		aria-describedby="basic-addon1" name="remark"
																		id="remark" value="">
																</div>
															</fieldset>
														</div>
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<fieldset>
																<label for="userinput2">Action</label>
																<div class="input-group">
																	<button type="submit" class="btn btn-primary" id="saveBtn">
																		<i class="icon-check2"></i> Save
																	</button>
																</div>
															</fieldset>
														</div>
													</div>
												</form>
												</div>
												<hr>
												<div class="row">
												<table class="table table-striped table-bordered file-export" style="font-size: 12px;">
													<thead>
														<tr>
															<th style="padding: 5px;">Received Date</th>
															<th style="padding: 5px;">Amount</th>
															<th style="padding: 5px;">Remark</th>
															<th style="padding: 5px;">Action</th>
														</tr>
													</thead>
													
													<tbody>
														<%
														double totalPayment = 0;
														for(PaymentBean p : listOfPayment){
															totalPayment = totalPayment + p.getAmount();
														%>
														<tr>
															<td style="padding: 5px;"><%=ddmmyyyy.format(p.getRecieve_date())%></td>
															<td style="padding: 5px;"><%=String.format("%.2f", p.getAmount())%> </td>
															<td style="padding: 5px;white-space: pre-wrap;"><%=p.getRemark()%></td>
															<td style="padding: 5px;"><i class="icon icon-trash" style="cursor: pointer;color: red" title="Delete Payment" onclick="deletePayment('<%=p.getPayment_id()%>');"></i></td>
														</tr>
														<%} %>
													</tbody>
													
													<div align="right">
						                            <h4>Total Payment : <b><%=String.format("%.2f", totalPayment)%></b></h4>
						                            </div>
												</table>
												</div>
												
												<%
													double allTotalInvoice = 0;
												 	List<InvoiceBean> listOfAllInvoice = allListDAO.listOfInvoiceByIdAll(icId);
													for(InvoiceBean i : listOfAllInvoice){
														
					                            		
					                            		double cgst = 0;
					                            		double sgst = 0;
					                            		double igst = 0;
					                            		if(i.getCgst_per() != 0){ 
					                            			 cgst = (i.getFinal_outstanding() * i.getCgst_per()) / 100;
					                            		}
					                            		if(i.getSgst_per() != 0){ 
					                            			sgst = (i.getFinal_outstanding() * i.getSgst_per()) / 100;
					                            		}
					                            		if(i.getIgst_per() != 0){ 
					                            			igst = (i.getFinal_outstanding() * i.getIgst_per()) / 100;
					                            		}
					                            		
					                            		double finalOutStanding = i.getFinal_outstanding() + cgst + sgst + igst;
					                            		
					                            		allTotalInvoice = allTotalInvoice + finalOutStanding;
														
													}
												%>
												
												<table class="table table-striped table-bordered" style="font-size: 12px;">
													<thead>
														<tr>
															<th style="padding: 5px;">Invoice Amount</th>
															<th style="padding: 5px;">Payment Amount</th>
															<th style="padding: 5px;">Remaining Amount</th>
														</tr>
													</thead>
													
													<tbody>
														<tr>
															<td style="padding: 5px;font-size: 18px;""><%=allTotalInvoice%></td>
															<td style="padding: 5px;font-size: 18px;""><%=totalPayment%></td>
															<td style="padding: 5px;font-size: 18px;font-weight: bold;"><%=allTotalInvoice - totalPayment%></td>
														</tr>
													</tbody>
													
												</table>
												
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
	</div>
	
	
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
          <form id="billForm">
          <input type="hidden" name="iid" id="iid" value="">
          	<div class="row">
          		<div class="col-md-6">
          			<label>Bill Date</label>
          			<input type="text" class="form-control" name="bDate" id="bDate" value="" onchange="checkDate();" placeholder="dd/MM/yyyy">
          		</div>
          		<div class="col-md-6">
          			<label>Bill Ref. Num</label>
          			<input type="text" class="form-control" name="bRef" id="bRef" value="" placeholder="Enter Bill Reference Number">
          		</div>
          		
          		</div>
          		<!-- <div class="col-md-12" align="center" style="padding-top: 5px;">
          			<input type="button" class="btn btn-primary" name="SAVE" value="SAVE" onclick="saveBillDetail();">
          		</div> -->
          	
          
          </form>
        </div>
        <div class="modal-footer">
        <input type="button" class="btn btn-primary" name="SAVE" value="SAVE" onclick="saveBillDetail();">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
<script src="app-assets/js/core/libraries/jquery.min.js" type="text/javascript"></script>
<script src="app-assets/js/core/libraries/bootstrap.min.js" type="text/javascript"></script>

	<script type="text/javascript">
   

    //For Datatable initilization
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
            $('#receiveDate').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: "-5:+1", // last five years
            });
		
           

        
        })
    }
    
	
    </script>
	
	<script type="text/javascript">
	
	$("#updateDiv").hide();
	$("#updateLoader").hide();
	
	function setData(){
		
		var custName = $("#custId").val();
		var status = $("#status").val();
		
		location.href = "redirect?p=aW52b2ljZUxpc3Q=&userCustId="+custName+"&status="+status;
	}
	
	
	function setBillingDetail(iid,inum){
		
		$("#iid").val(iid);
		$(".modal-title").text(inum);
		$("#myModal").modal()
	}
	
	function saveBillDetail(){
		
		var date = $("#bDate").val();
		var bref = $("#bRef").val();
		
		var flag = false;
		
		if(date == ""){
			alert("Please enter date.");
			flag = true;
		}
		
		if(bref == ""){
			alert("Please enter bill ref number.");
			flag = true;
		}
		
		if(flag == false){
		
		var ratVal = confirm("Are You Sure?");
		
		if(ratVal == true){
			$
			.ajax({
				//for specify Method
				method : "POST",
				//for call action
				url : 'updateBillDetail',
				//form send data
				data : $("#billForm").serialize(),
				// action perform when successfully call action with specific method type
				success : function(data) {
					location.reload();
				}
			});
		}
		}
		
	}
	
	
	function checkDate(){
		
		var date = $("#bDate").val();
		
		$
		.ajax({
			//for specify Method
			method : "POST",
			//for call action
			url : 'checkDate',
			//form send data
			data : {date:date},
			// action perform when successfully call action with specific method type
			success : function(data) {
				if(data == "true"){
					alert("Please insert date with proper format in dd/mm/yyyy !!!");
					$("#bDate").val("");
				}
			}
		});
	}
	
	
	function deletePayment(pid){
		
var ratVal = confirm("Are You Sure?");
		
		if(ratVal == true){
			$
			.ajax({
				//for specify Method
				method : "GET",
				//for call action
				url : 'deletePaymentData',
				//form send data
				data : {pid : pid},
				// action perform when successfully call action with specific method type
				success : function(data) {
					location.reload();
				}
			});
		}
		
	}
	
	
function deleteInvoice(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			
			$.ajax({
				//for specify Method
			    method: "POST",
			    //for call action
			    url: 'deactiveInvoice',
			    //form send data
			    data:{invoiceId : value},
			    // action perform when successfully call action with specific method type
			    success: function (data) {
			    	
			    	location.reload();
			    	
			    }
			});
			
			//location.href = "deactiveWorkHistory?wId="+value;
		}
		
	}	
	
	</script>
</body>
</html>