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
<title>Product Rate Master</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	
	AllListDAO allListDAO = new AllListDAO();
	
	String cId = request.getParameter("cId");
	
	int decodeCustId = Integer.parseInt(new EncodeDecode().decodeString(cId));
	
	CustomerBean customerBean = allListDAO.customerDetails(decodeCustId);
	
	
	int parent_cust_id = customerBean.getParent_customer_id();
	List<Integer> listOfCustomerProductGroup = allListDAO.listOfCustomerProductGroup(parent_cust_id);
	CustomerBean c1 = allListDAO.customerDetails(parent_cust_id);
	
	String encodePid = new EncodeDecode().encodeString(String.valueOf(parent_cust_id));
	List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-inr"></i> <%=customerBean.getCompany()%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                	 <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
			                  <li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJTdWJNYXN0ZXI=&pId=<%=encodePid%>"><%=c1.getCompany()%></a></li>
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
								<div class="col-md-8">
									<h4 class="card-title" id="striped-label-layout-icons">Rate Criteria of <%=customerBean.getCompany()%></h4>
								</div>
								
								<div class="col-md-4" align="right">
									
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								
										<div class="row">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 12px;">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Product</th>
						                                     <th style="padding: 5px;">Discount</th>
						                                    <th style="padding: 5px;">Criteria</th>
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<!-- Get Method for list Of Product Master-->
						                            	<%
						                            	int count = 0;
						                            	for(Integer s : listOfCustomerProductGroup){
						                            		ProductMasterBean productMasterBean = allListDAO.productDetails(s);
						                            		
						                            		
						                            		CustomerProductRateBean customerProductRateBean1 = allListDAO.detailsOfCustomerProductRateByCustId(decodeCustId,s);
						                            		
						                            		int ctid = 0;
						                            		double dis = 0;
						                            		
						                            		if(customerProductRateBean1 != null){
						                            			dis = customerProductRateBean1.getDiscount();
						                            			ctid = customerProductRateBean1.getCustomerTypeBean().getCustomer_type_id();
						                            		}
						                            	%>  
						                            	<form action="setRateCriteriaForCustomer">
						                            	<tr>
						                            		<td style="padding: 5px;">
							                            		<input type="hidden" name="pId" value="<%=productMasterBean.getProduct_master_id()%>">
							                            		<input type="hidden" name="cId" value="<%=decodeCustId%>">
							                            		<input type="hidden" name="uId" value="<%=user_id%>">
							                            		<%=++count%>
						                            		</td>
						                            		<td style="padding: 5px;"><%=productMasterBean.getProduct_name()%></td>
						                            		<td style="padding: 5px;"><input type="text" value="<%=dis%>" class="form-control border-primary" name="discount" placeholder="Enter Discount"></td>
						                            		<td style="padding: 5px;">
						                            			<select class="form-control border-primary" name="ctId" required>
						                            			<option value="">---SELECT---</option>
																	<%for(CustomerTypeBean c : listOfCustomerType){ 
																		if(c.getCustomer_type_id() == ctid){
																	%>
																		<option value="<%=c.getCustomer_type_id()%>" selected="selected"><%=c.getType()%> : <%=c.getType_name()%></option>
																	<%} else{%>
																		<option value="<%=c.getCustomer_type_id()%>"><%=c.getType()%> : <%=c.getType_name()%></option>
																	<%}} %>
																</select>
						                            		</td>
						                            		<td style="padding: 5px;">
						                            			<input type="submit" name="SET" value="SET" class="btn btn-primary">
						                            		</td>
						                            	</tr>
						                            	</form>
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
    
    </script>
</body>
</html>