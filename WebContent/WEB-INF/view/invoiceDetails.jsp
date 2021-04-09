<%@page import="com.di.bean.WorkHistoryBean"%>
<%@page import="org.ibex.nestedvm.util.InodeCache"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.di.bean.CurrencyBean"%>
<%@page import="com.di.bean.CustomerProductRateBean"%>
<%@page import="com.di.bean.SltlInvoiceLineBean"%>
<%@page import="com.di.bean.SltlinvoiceBean"%>
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
<title>Invoice Details</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();

	String iId = request.getParameter("iId");
	
	String decodeIid = new EncodeDecode().decodeString(iId);
	
	InvoiceBean invoiceBean = allListDAO.detailsOfInvoice(decodeIid);
	SltlinvoiceBean sltlinvoiceBean = allListDAO.detailsOfSltlInvoice(decodeIid);
	
	//List<InvoiceLineBean> listOfInvoiceLine = allListDAO.listOfInvoiceLine(decodeIid);
	
	List<Object[]> listOfLine = allListDAO.listOfInvoiceLineId(decodeIid);
	
	List<Object[]> listOfSltlInvoiceLine = null;
	if(sltlinvoiceBean.getSltl_gross_outstanding() != 0){
	 listOfSltlInvoiceLine = allListDAO.listOfSltlInvoiceLineId(decodeIid);
	}
	
	int custId = invoiceBean.getCustomerBean().getCustomer_id();
	int parentid = invoiceBean.getCustomerBean().getParent_customer_id();
	List<CurrencyBean> listOfCurrency = allListDAO.listOfCurrency(1);
	String encodeParentId = new EncodeDecode().encodeString(String.valueOf(parentid));
	
	CustomerBean parent = allListDAO.customerDetails(parentid);
	
	CustomerBean cb = allListDAO.customerDetails(invoiceBean.getCustomerBean().getParent_customer_id());
	
%>

	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-user-tie"></i> Invoice Details</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                   <li class="breadcrumb-item"><a href="redirect?p=aW52b2ljZUxpc3Q=">Invoice List</a></li>
		                  <li class="breadcrumb-item active">Invoice Details</li>
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
							<%if(request.getParameter("error") != null){ 
								   String error = request.getParameter("error");
								   if(!error.equalsIgnoreCase("")){
								%>
									<div class="alert alert-danger alert-dismissible fade in mb-2" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<strong>Oh snap!</strong> <%=new EncodeDecode().decodeString(error)%>
								</div>
									
								<%}} %>
			<br>
			<font style="font-weight: bold;color: red;">Note : If you want to Re-calculate the Invoice Or Delete the Challan please first convert currency in USD</font>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-2">
									<h4 class="card-title" id="striped-label-layout-icons">Invoice Details</h4>
								</div>
								<%if(invoiceBean.getPosting() == 1){
									%>
									<%if(parent.getCustomer_code().trim().equalsIgnoreCase("C-00001")){%>
									<div class="col-md-4" align="center">
										<a href="redirect?p=c2x0bEludm9pY2U=&iId=<%=iId%>" target="_blank"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-printer4"></i> Print Invoice (SLTL)</button></a>
										<a href="redirect?p=c2x0bGludm9pY2VTaHJlZWpp&iId=<%=iId%>" target="_blank"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-printer4"></i> Print Invoice (Shreeji)</button></a>
									</div>
									<%}else if(parent.getCustomer_code().trim().equalsIgnoreCase("C-00002") ){ %>
									<div class="col-md-6">
										<a href="redirect?p=c3RhckdlbXNJbnZvaWNl&iId=<%=iId%>" target="_blank"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-printer4"></i> Print Invoice</button></a>
										<a href="redirect?p=c3RhckdlbXNJbnZvaWNlQ29uc3VsdGFudA==&iId=<%=iId%>" target="_blank"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-printer4"></i> Print Invoice (Consultantant)</button></a>
									</div>
									<%} %>
									<%}%>
								
								<div class="col-md-4" align="right">
									<%if(invoiceBean.getPosting() == 0){%>
										<button class="btn btn-primary" onclick="invoicePosting()"><i class="icon icon-check"></i> Post</button>
										<%if(invoiceBean.getCurrency_type().equalsIgnoreCase("USD")){%>
										<button class="btn btn-primary" onclick="invoiceRecalculate()" id="reCal"><i class="icon icon-check"></i> Re-Calculate</button>
										<button class="btn btn-primary" id="reCalLoader"><i class="icon-load-a spinner"></i> Re-Calculating...</button>
										<%} %>
									<%}else{%>
										<font style="font-weight: bold;color: green;">Posted on <%=ddmmyyyyhhmmss.format(invoiceBean.getPosting_date())%></font> <button class="btn btn-primary" onclick="invoiceUnPosting()"><i class="icon icon-check"></i> UnPost</button>
									<%} %>
								</div>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								
								<table class="table table-bordered">
									<tr bgcolor="#F2F3F4">
										<th style="padding: 3px;">Company Name</th>
										<th style="padding: 3px;">Client Name</th>
										<th style="padding: 3px;">GST Number</th>
										<th style="padding: 3px;">VAT Number</th>
									</tr>
									<tr>
										<td style="padding: 3px;"><%=invoiceBean.getCustomerBean().getCompany()%></td>
										<td style="padding: 3px;"><%=invoiceBean.getCustomerBean().getFullname()%></td>
										<td style="padding: 3px;"><%=invoiceBean.getCustomerBean().getGst_number()%></td>
										<td style="padding: 3px;"><%=invoiceBean.getCustomerBean().getVat_number()%></td>
									</tr>
									
								</table>
									
							<ul class="nav nav-tabs nav-left nav-border-left">
								<li class="nav-item">
									<a class="nav-link active" id="baseVerticalLeft3-tab1" data-toggle="tab" aria-controls="tabVerticalLeft31" href="#tabVerticalLeft31" aria-expanded="true"><%=invoiceBean.getInvoice_num()%> (Stone : <b><%=listOfLine.size()%></b>)</a>
								</li>
								<%if(sltlinvoiceBean.getSltl_gross_outstanding() != 0){ %>
								<li class="nav-item">
									<a class="nav-link" id="baseVerticalLeft3-tab2" data-toggle="tab" aria-controls="tabVerticalLeft32" href="#tabVerticalLeft32" aria-expanded="false"><%=sltlinvoiceBean.getSltl_invoice_num()%></a>
								</li>
								<%} %>
							</ul>
							<div class="tab-content px-1">
								<div role="tabpanel" class="tab-pane active" id="tabVerticalLeft31" aria-expanded="true" aria-labelledby="baseVerticalLeft3-tab1">
									<br>
									<div class="row">
									<div class="col-md-4">
										<h4>Invoice No : <%=invoiceBean.getInvoice_num()%></h4>
									</div>
									<%if(invoiceBean.getPosting() == 0){%>
									<div class="col-md-6" align="left" id="curr">
										<select name="currency" onchange="conversionOfAmount(this.value)">
											<% for(CurrencyBean c : listOfCurrency){
											   if(c.getCurrency_to().equalsIgnoreCase(invoiceBean.getCurrency_type())){
											%>
												<option value="<%=c.getCurrency_to()%>" selected="selected"><%=c.getCurrency_to()%></option>
											<%}else{ %>
												<option value="<%=c.getCurrency_to()%>"><%=c.getCurrency_to()%></option>
											<%} %>
											<%} %>
										</select>
										<a href="redirect?p=Y3VycmVuY3lNYXN0ZXI=&cId=<%=encodeParentId%>" target="_blank" title="Update Currency Master"><i class="icon-list2"></i></a>
									</div>
									<div class="col-md-6" align="left" id="currLoader">
										<i class="icon-load-a spinner"></i> Currency Converting...
									</div>
									
									<%} %>
									</div>
									
									<%
										double finalOustanding = 0;
									%>
									<div class="row">
										<div class="col-md-5">
											<table class="table table-bordered">
												<tr>
													<th>Total Outstanding </th>
													<td><font style="font-size: 20px;"><%=String.format("%.2f", invoiceBean.getGross_outstanding())%></font> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small> </td>
												</tr>
												<tr>
													<th>Extra Discount (%) </th>
													<td>
													<%if(invoiceBean.getPosting() == 0){%>
													<input type="text" class="form-control" name="disPer" id="disPer" value="<%=String.format("%.2f", invoiceBean.getDiscount_per())%>" oninput="disPerSet(this.value);">
													<%}else{ %>
													<%=String.format("%.2f", invoiceBean.getDiscount_per())%>
													<%} %>
													</td>
												</tr>
												<tr>
													<th>Discount (<%=invoiceBean.getCurrency_type()%>) </th>
													<td>
													<%if(invoiceBean.getPosting() == 0){%>
													<input type="text" class="form-control" name="disRs" id="disRs" value="<%=String.format("%.2f", invoiceBean.getDiscount_amount())%>" oninput="disAmtSet(this.value);">
													<%}else{ %>
													<%=String.format("%.2f", invoiceBean.getDiscount_per())%>
													<%} %>
													</td>
												</tr>
												<tr>
													<%finalOustanding = invoiceBean.getFinal_outstanding();%>
													<th>Final Outstanding </th>
													<td><font style="font-size: 20px;font-weight: bold;" id="payableAmount"><%=String.format("%.2f", invoiceBean.getFinal_outstanding())%></font> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small></td>
												</tr>
												<%if(invoiceBean.getCgst_per() != 0){ 
												double cgst = (invoiceBean.getFinal_outstanding() * invoiceBean.getCgst_per()) / 100;
												finalOustanding = finalOustanding + cgst;
												%>
												<tr>
													<th>CGST (<%=invoiceBean.getCgst_per()%> %)</th>
													<td><%=String.format("%.2f",cgst)%> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small></td>
												</tr>
												<%} %>
												<%if(invoiceBean.getSgst_per() != 0){ 
													double sgst = (invoiceBean.getFinal_outstanding() * invoiceBean.getSgst_per()) / 100;
													finalOustanding = finalOustanding + sgst;
												%>
												<tr>
													<th>SGST (<%=invoiceBean.getSgst_per()%> %)</th>
													<td><%=String.format("%.2f",sgst)%> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small> </td>
												</tr>
												<%} %>
												<%if(invoiceBean.getIgst_per() != 0){ 
													double igst = (invoiceBean.getFinal_outstanding() * invoiceBean.getIgst_per()) / 100;
													finalOustanding = finalOustanding + igst;
												%>
												<tr>
													<th>IGST (<%=invoiceBean.getIgst_per()%> %)</th>
													<td><%=String.format("%.2f",igst)%> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small></td>
												</tr>
												<%} %>
												<tr>
													<th>Final Payable Amount </th>
													<td><font style="font-size: 20px;font-weight: bold;" id="payableAmount"><%=String.format("%.2f", finalOustanding)%></font> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small></td>
												</tr>
											</table>
										</div>
										<div class="col-md-7" style="border-left: dotted 1px;">
											<table class="table table-striped table-bordered file-export" style="font-size: 12px;">
											<thead>
											<tr bgcolor="#F2F3F4">
												<th style="padding: 3px;">No</th>
												<th style="padding: 3px;">Kapan Name</th>
												<th style="padding: 3px;">Stone Name</th>
												<th style="padding: 3px;">Product</th>
												<th style="padding: 3px;">Weight</th>
												<th style="padding: 3px;">Discount</th>
												<th style="padding: 3px;">Rate</th>
												<th style="padding: 3px;">Amount</th>
												<th style="padding: 3px;">Action</th>
											</tr>
											</thead>
											<tbody>
											<%
											int count = 0;
											for(int i=0;i<listOfLine.size();i++) {
												
												Object[] o = listOfLine.get(i);
												
												String wid = (String) o[0];
												
												int prod_id = (Integer) o[1];
												
												String ilid =(String)  o[2];
												int minrate = (Integer) o[3];
												double rate = (Double) o[4];
												String pname = (String) o[5];
												double perStoneRate = (Double) o[6];
												
												CustomerProductRateBean customerProductRateBean = allListDAO.detailsOfCustomerProductRateByCustId(custId, prod_id);
												String encodeWork_id = new EncodeDecode().encodeString(wid);
												
												WorkHistoryBean w = allListDAO.workHistoryId(wid);
												
											%>
												<tr>
													<td style="padding: 3px;"><%=++count%></td>
													<td style="padding: 3px;"><%=w.getKapan_name()%></td>
													<td style="padding: 3px;"><a href="redirectToDetails?wId=<%=encodeWork_id%>" target="_blank" onclick="javascript:"><%=w.getStone_name()%></a></td>
													<td style="padding: 3px;"><%=pname%></td>
													<td style="padding: 3px;"><%=w.getActual_weight()%></td>
													<td style="padding: 3px;"><%=customerProductRateBean.getDiscount()%> %</td>
													<td style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", perStoneRate)%> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small> <%if(minrate == 1){%><i class="icon-information-circled" style="color: red;cursor: pointer;" title="This product exceed the minimum rate of SLTL criteria !!!"></i><%} %></td>
													<td style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", rate)%> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small> <%if(minrate == 1){%><i class="icon-information-circled" style="color: red;cursor: pointer;" title="This product exceed the minimum rate of SLTL criteria !!!"></i><%} %></td>
													<td style="padding: 3px;"><%if(invoiceBean.getPosting() == 0){%><%if(invoiceBean.getCurrency_type().equalsIgnoreCase("USD")){%><i class="icon icon-trash" style="cursor: pointer;color: red;" title="Remove Challan From Invoice" onclick="removeChallan('<%=ilid%>')"></i><%}%><%} %></td>
												</tr>
											<%} %>
											</tbody>
											</table>
											
										</div>
									</div>
									
								</div>
								<%if(listOfSltlInvoiceLine != null){ %>
								<div class="tab-pane" id="tabVerticalLeft32" aria-labelledby="baseVerticalLeft3-tab2">
									<br>
									<div class="row">
									<div class="col-md-4">
										<h4>Invoice No : <%=sltlinvoiceBean.getSltl_invoice_num()%></h4>
									</div>
									<%-- <%if(invoiceBean.getPosting() == 0){%>
									<div class="col-md-6" align="left">
										<select name="currency" onchange="conversionOfAmount(this.value)">
											<% for(CurrencyBean c : listOfCurrency){
											   if(c.getCurrency_to().equalsIgnoreCase(invoiceBean.getCurrency_type())){
											%>
												<option value="<%=c.getCurrency_to()%>" selected="selected"><%=c.getCurrency_to()%></option>
											<%}else{ %>
												<option value="<%=c.getCurrency_to()%>"><%=c.getCurrency_to()%></option>
											<%} %>
											<%} %>
										</select>
										<a href="redirect?p=Y3VycmVuY3lNYXN0ZXI=&cId=<%=encodeParentId%>" target="_blank" title="Update Currency Master"><i class="icon-list2"></i></a>
									</div>
									<%} %> --%>
									</div>
									
									<div class="row">
										<div class="col-md-5">
											<table class="table table-bordered">
												<tr>
													<th>Total Outstanding </th>
													<td><font style="font-size: 20px;"><%=String.format("%.2f", sltlinvoiceBean.getSltl_gross_outstanding())%></font> <small class="text-muted"><%=sltlinvoiceBean.getCurrency_type()%></small></td>
												</tr>
												<tr>
													<th>Extra Discount (%) </th>
													<td id="sltlDis"><%=String.format("%.2f", sltlinvoiceBean.getSltl_discount_per())%></td>
												</tr>
												<tr>
													<th>Discount (<%=invoiceBean.getCurrency_type()%>) </th>
													<td id="sltlDisAmt"><%=String.format("%.2f", sltlinvoiceBean.getSltl_discount_amount())%></td>
												</tr>
												<tr>
													<th>Final Outstanding </th>
													<td><font style="font-size: 20px;font-weight: bold;" id="sltlPayableAmt"><%=String.format("%.2f", sltlinvoiceBean.getSltl_final_outstanding())%></font> <small class="text-muted"><%=sltlinvoiceBean.getCurrency_type()%></small></td>
												</tr>
											</table>
										</div>
										<div class="col-md-7" style="border-left: dotted 1px;">
											<table class="table table-bordered" style="font-size: 13px;">
											<tr bgcolor="#F2F3F4">
												<th style="padding: 3px;">Kapan Name</th>
												<th style="padding: 3px;">Stone Name</th>
												<th style="padding: 3px;">Product</th>
												<th style="padding: 3px;">Weight</th>
												<th style="padding: 3px;">Rate</th>
												<th style="padding: 3px;">SLTL Margine</th>
												<th style="padding: 3px;">Final Amount</th>
											</tr>
											<%
											String fromCurr = sltlinvoiceBean.getCurrency_type();
											CurrencyBean currencyCurrent = allListDAO.listOfCurrency(parentid, fromCurr, invoiceBean.getCurrency_type());
										
											 count = 0;
											for(int i=0;i<listOfSltlInvoiceLine.size();i++) {
												
												Object[] o = listOfLine.get(i);
												
												String wid = (String) o[0];
												
												int prod_id = (Integer) o[1];
												double amount = (Double) o[2];
												String pname = (String) o[3];
												double slt_margin = (Double) o[4];
												double rRate = (Double) o[5];
											
												WorkHistoryBean w = allListDAO.workHistoryId(wid);
												
												/*Convert to USD*/
												double rate = (rRate * 1) / currencyCurrent.getConversion();
												
												%>
												<tr>
													<td style="padding: 3px;"><%=w.getKapan_name()%></td>
													<td style="padding: 3px;"><%=w.getStone_name()%></td>
													<td style="padding: 3px;"><%=pname%></td>
													<td style="padding: 3px;"><%=w.getActual_weight()%></td>
													<td style="padding: 3px;"><%=String.format("%.2f", rate)%> <small class="text-muted"><%=sltlinvoiceBean.getCurrency_type()%></small></td>
													<td style="padding: 3px;"><%=slt_margin%> %</td>
													<td style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", amount)%> <small class="text-muted"><%=sltlinvoiceBean.getCurrency_type()%></small></td>
												</tr>
											<%} %>
											<tr>
												<th style="padding: 3px;"></th>
												<th style="padding: 3px;"></th>
												<th style="padding: 3px;"></th>
												<th style="padding: 3px;"></th>
												<th style="padding: 3px;"></th>
												<th style="padding: 3px;"></th>
												<th style="padding: 3px;">
													<font style="font-size: 20px;font-weight: bold;" id="sltlInvoiceFinalOutstanding"><%=String.format("%.2f", sltlinvoiceBean.getSltl_gross_outstanding())%></font>
													<small class="text-muted"><%=sltlinvoiceBean.getCurrency_type()%></small>
												</th>
											</tr>
											</table>
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
	
	
	<script type="text/javascript">
	
	$("#buttonSave").hide();
	
	$(document).ready(function(){
		
		//For Datatable initilization
		$(".file-export").DataTable({
			// for table structure
	         dom: "Bfrtip",
	         
	         //for disable ordering
	         //"ordering": false,
			
	         //For page length in data tables
	         "pageLength": 10,
	         
	     	// for button show in data tables
	        buttons: [
            {
                extend: 'excel',
                filename: 'Invoice Detail - <%=invoiceBean.getInvoice_num()%>'
                
            }
        ]
	        
	    }),
	    
	  	//For Design of that button
	    $(".buttons-excel").addClass("btn btn-primary mr-1")
	});
	
	
	
	function disPerSet(per){
		
		
		/* Company Invoice */
		var invoiceFinalOutstanding = $("#invoiceFinalOutstanding").text();
		var discountVal = (invoiceFinalOutstanding * per) / 100;
		$("#disRs").val(discountVal.toFixed(2));
		var payableAmount = invoiceFinalOutstanding - discountVal;
		$("#payableAmount").text(payableAmount.toFixed(2));
		
		if(invoiceFinalOutstanding != payableAmount){
			$("#buttonSave").show();
		}
		
		sltlInvoiceUpdate(per);
		updateInvoiceDiscount(per);
		
	}
	
	function disAmtSet(discountVal){
		/* Company Invoice */
		var invoiceFinalOutstanding = $("#invoiceFinalOutstanding").text();
		var discountPer = (100 * discountVal) / invoiceFinalOutstanding;
		$("#disPer").val(discountPer.toFixed(2));
		var payableAmount = invoiceFinalOutstanding - discountVal;
		$("#payableAmount").text(payableAmount.toFixed(2));
		
		sltlInvoiceUpdate(discountPer.toFixed(2));
		
	}
	
	function sltlInvoiceUpdate(per){
		
		/* SLTL Invoice */
		$("#sltlDis").text(per);
		var sltlInvoiceFinalOutstanding = $("#sltlInvoiceFinalOutstanding").text();
		var sltldiscountVal = (sltlInvoiceFinalOutstanding * per) / 100;
		$("#sltlDisAmt").text(sltldiscountVal.toFixed(2));
		var sltlpayableAmount = sltlInvoiceFinalOutstanding - sltldiscountVal;
		$("#sltlPayableAmt").text(sltlpayableAmount.toFixed(2));
	}
	
	
	
	function updateInvoiceDiscount(per){
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'updateInvoiceDiscountValue',
		    //form send data
		    data:{iId : '<%=invoiceBean.getInvoice_id()%>',per : per},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    }
		});
	}
	
	
	$("#currLoader").hide();
	function conversionOfAmount(curr){
		var ratVal = confirm("Are you sure ?");
		
		if(ratVal == true){
			
			$("#currLoader").show();
			$("#curr").hide();
			
			//Ajax for get data using Specification Field  id
			$.ajax({
				//for specify Method
			    method: "POST",
			    //for call action
			    url: 'crrencyConversionInvoice',
			    //form send data
			    data:{iId : '<%=invoiceBean.getInvoice_id()%>',curr : curr,cId : <%=parentid%>},
			    // action perform when successfully call action with specific method type
			    success: function (data) {
			    	var id = '<%=iId%>';
			    	location.href = "redirect?p=aW52b2ljZURldGFpbHM=&iId="+id;
			    	
			    }
			});
		}
		
	}
	
	function invoicePosting(){
	var ratVal = confirm("Are you sure ?");
		
		if(ratVal == true){
			//Ajax for get data using Specification Field  id
			$.ajax({
				//for specify Method
			    method: "POST",
			    //for call action
			    url: 'invoicePosting',
			    //form send data
			    data:{iId : '<%=invoiceBean.getInvoice_id()%>',user_id: <%=user_id%>},
			    // action perform when successfully call action with specific method type
			    success: function (data) {
			    	var id = '<%=iId%>';
			    	location.href = "redirect?p=aW52b2ljZURldGFpbHM=&iId="+id;
			    	
			    }
			});
		}

	}
	
	function invoiceUnPosting(){
		var ratVal = confirm("Are you sure ?");
			
			if(ratVal == true){
				//Ajax for get data using Specification Field  id
				$.ajax({
					//for specify Method
				    method: "POST",
				    //for call action
				    url: 'invoiceUnPosting',
				    //form send data
				    data:{iId : '<%=invoiceBean.getInvoice_id()%>',user_id: <%=user_id%>},
				    // action perform when successfully call action with specific method type
				    success: function (data) {
				    	var id = '<%=iId%>';
				    	location.href = "redirect?p=aW52b2ljZURldGFpbHM=&iId="+id;
				    	
				    }
				});
			}

		}
	
	
	$("#reCalLoader").hide();
	function invoiceRecalculate(){
		var ratVal = confirm("Are you sure you want to recalculate ?");
			
			if(ratVal == true){
				$("#reCalLoader").show();
				$("#reCal").hide();
				//Ajax for get data using Specification Field  id
				$.ajax({
					//for specify Method
				    method: "POST",
				    //for call action
				    url: 'reCalculateInvoice',
				    //form send data
				    data:{iId : '<%=invoiceBean.getInvoice_id()%>',user_id: <%=user_id%>},
				    // action perform when successfully call action with specific method type
				    success: function (data) {
				    	var id = '<%=iId%>';
				    	location.href = "redirect?p=aW52b2ljZURldGFpbHM=&iId="+id;
				    	
				    }
				});
			}

		}
	
	function removeChallan(ilId){
		var ratVal = confirm("Are you sure ?");
			
			if(ratVal == true){
				//Ajax for get data using Specification Field  id
				$.ajax({
					//for specify Method
				    method: "POST",
				    //for call action
				    url: 'removeChallanFromInvoice',
				    //form send data
				    data:{ilId : ilId},
				    // action perform when successfully call action with specific method type
				    success: function (data) {
				    	invoiceRecalculate();
				    }
				});
			}

		}
	
	</script>
</body>
</html>