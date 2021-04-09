<%@page import="com.di.bean.CurrencyBean"%>
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
<title>Currency Master</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
    String cId = request.getParameter("cId"); 
    int decodeCId = Integer.parseInt(new EncodeDecode().decodeString(cId));
    
    List<CurrencyBean> listOfCurrency = allListDAO.listOfCurrency(1);
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-diamond2"></i> Currency Master</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Currency Master</li>
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
			<!-- <ul class="nav nav-tabs nav-linetriangle no-hover-bg">
 					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=Y2hhbGxhbk1hc3Rlcg==" aria-expanded="true">Challan Entry</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=" aria-expanded="true">Customer Master</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" id="base-tab"  href="redirect?p=cHJvZHVjdE1hc3Rlcg==" aria-expanded="true">Product Master</a>
					</li>
			</ul>  -->
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-3">
									<h4 class="card-title" id="striped-label-layout-icons">Currency Master Master</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Amount</th>
						                                    <th style="padding: 5px;">From Currency</th>
						                                    <th style="padding: 5px;"></th>
						                                    <th style="padding: 5px;">Amount</th>
						                                    <th style="padding: 5px;">To Currency</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<!-- Get Method for list Of Product Master-->
						                            	<%
						                            		int count = 0;
						                            		for(CurrencyBean c : listOfCurrency){
						                            			
						                            			CurrencyBean currencyBean = allListDAO.listOfCurrency(decodeCId, c.getCurrency_from(), c.getCurrency_to());
						                            			double dValue = 0;
						                            			if(currencyBean != null){
						                            				dValue = currencyBean.getConversion();
						                            			}
						                            	%>  
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count%></td>
						                            		<td style="padding: 5px;">1</td>
						                            		<td style="padding: 5px;" id="from<%=c.getCurrency_id()%>"><%=c.getCurrency_from()%></td>
						                            		<td style="padding: 5px;">=</td>
						                            		<%if(userBean.getAuthority() != 1){ %>
						                            		<td style="padding: 5px;" class="pt-3-half" contenteditable="true" id="rate<%=c.getCurrency_id()%>" onkeyup="update(<%=c.getCurrency_id()%>,'rate')"><%=dValue%></td>
						                            		<%}else{%>
						                            		<td style="padding: 5px;" class="pt-3-half" contenteditable="true" id="rate<%=c.getCurrency_id()%>" onkeyup="update(<%=c.getCurrency_id()%>,'rate')"><%=dValue%></td>
						                            		<%} %>
						                            		<td style="padding: 5px;" id="to<%=c.getCurrency_id()%>"><%=c.getCurrency_to()%></td>
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
	
	$("#updateDiv").hide();
	$("#saveLoader").hide();
	$("#updateLoader").hide();
	$("#saveProcessLoader").hide();
	$("#updateProcessLoader").hide();
	
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
	
	
	
	
	 function update(currId,action){
	    	var val = $("#"+action+currId).text();
	    	var from = $("#from"+currId).text();
	    	var to = $("#to"+currId).text();
	    	
	    	
	    	$.ajax({
		   		 method: "POST",
		   		 url: 'currencyUpdate',
		   		data : {
		   			from : from,
		   			to : to,
		   			val : val,
		   			cId : <%=decodeCId%>
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