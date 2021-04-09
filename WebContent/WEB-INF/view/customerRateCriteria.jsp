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
<title>Customer Type Master</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
	int parent_id = 0;
	
	String cId = request.getParameter("c");
	
	int decodeParentId = Integer.parseInt(new EncodeDecode().decodeString(cId));
	CustomerBean customerBean = allListDAO.customerDetails(decodeParentId);
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-user-tie"></i> <%=customerBean.getCompany()%>'s Rate Criteria</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                   <li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=">Customer Master</a></li>
		                  <li class="breadcrumb-item active"><%=customerBean.getCompany()%>'s Rate Criteria</li>
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
									<h4 class="card-title" id="striped-label-layout-icons"><%=customerBean.getCompany()%>'s Rate Criteria</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								
								<div class="row">
									<%-- <div class="col-md-2 col-lg-2 col-sm-6 col-xs-6">	
										Select Customer
									</div>
									<div class="col-md-4 col-lg-4 col-sm-6 col-xs-6">	
															<div class="form-group">
																<select class="form-control border-primary" name="custId" onchange="setValue(this.value)">
																	<option value="" selected="selected">---SELECT CUSTOMER---</option>
																	<%for(CustomerBean c : listOfCustomer){
																		String encodeCustId = new EncodeDecode().encodeString(String.valueOf(c.getCustomer_id()));
																		if(encodeCustId.equalsIgnoreCase(cId)){
																	%>
																			<option value="<%=encodeCustId%>" selected="selected"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																		<%}else{ %>
																			<option value="<%=encodeCustId%>"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																		<%} %>
																	<%}%>
																</select>
																
															</div>
														</div>
													</div>	
													<hr> --%>
								
											<%if(request.getParameter("c") != null){ %>
												<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
							 						<div class="table-responsive">
							 							<table class="table table-striped table-bordered file-export">
								                            <thead>
								                                <tr>
								                                    <th style="padding: 5px;">No</th>
								                                    <th style="padding: 5px;">Type</th>
								                                    <th style="padding: 5px;">Name</th>
								                                    <th style="padding: 5px;">Description</th>
								                                    <th style="padding: 5px;">Action</th>
								                                </tr>
								                            </thead>
								                            <tbody>
								                            	<!-- Get Method for list Of Product Master-->
								                            	<%
								                            	List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();
								                            	int count = 0;
								                            	/* for Extract Data */ 
								                            	for(CustomerTypeBean c : listOfCustomerType){
								                            		String encodeCtId = new EncodeDecode().encodeString(String.valueOf(c.getCustomer_type_id()));
								                            	%>  
								                            	<tr>
								                            		<td style="padding: 5px;"><%=++count%></td>
								                            		<td style="padding: 5px;"><%=c.getType()%></td>
								                            		<td style="padding: 5px;"><%=c.getType_name()%></td>
								                            		<td style="padding: 5px;"><%=c.getDescription()%></td>
								                            		<td style="padding: 5px;">
								                            			<a href="redirect?p=cmF0ZUNyaXRlcmlh&ct_id=<%=encodeCtId%>&cId=<%=cId%>"><i class="icon-dollar" title="Rate Criteria" style="cursor: pointer;color: blue;font-size: 18px;"></i></a>
								                            		</td>
								                            	</tr>
								                            	<%} %>
								                            </tbody>
							                        </table>
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
	
	
	
	
	function setValue(value){
		location.href = 'redirect?p=Y3VzdG9tZXJSYXRlQ3JpdGVyaWE=&c='+value;
	}
	
	
	</script>
</body>
</html>