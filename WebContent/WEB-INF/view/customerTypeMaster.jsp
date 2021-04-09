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
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-user-tie"></i> Customer Type Master</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Customer Type Master</li>
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
									<h4 class="card-title" id="striped-label-layout-icons">Customer Type Master</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="updateDiv">
											<form class="form" id="formUpdate" action="updateCutomerTypeMaster" method="post">
											<input type="hidden" name="ctId" id="ctId" value="">
											<input type="hidden" name="user_id" id="user_id" value="<%=user_id%>">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Update Customer Type Basic Details</h4>
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Type</label> <input type="text"
																	id="type" class="form-control border-primary"
																	placeholder="Type" name="type" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Name</label> <input type="text"
																	id="name" class="form-control border-primary"
																	placeholder="Name" name="name" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Description</label> <input type="text"
																	id="description" class="form-control border-primary"
																	placeholder="Description" name="description" required>
															</div>
														</div>
													</div>
												</div>

												<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="updateBtn" onclick="updateForm();">
														<i class="icon-check2"></i> Update
													</button>
													<button type="button" class="btn btn-primary" id="updateLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#updateDiv').hide();$('#tableDiv').show();">
														<i class="icon-cross2"></i> Cancel
													</button>
												</div>
											</form>
										</div>
										
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
						                            	
						                            	String encodeCId = new EncodeDecode().encodeString("1");
						                            	
						                            	for(CustomerTypeBean c : listOfCustomerType){
						                            		String encodeCtId = new EncodeDecode().encodeString(String.valueOf(c.getCustomer_type_id()));
						                            	%>  
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count%></td>
						                            		<td style="padding: 5px;"><%=c.getType()%></td>
						                            		<td style="padding: 5px;"><%=c.getType_name()%></td>
						                            		<td style="padding: 5px;"><%=c.getDescription()%></td>
						                            		<td style="padding: 5px;">
						                            			<i class="icon-pencil2" title="Edit" onclick="editData(<%=c.getCustomer_type_id()%>);" style="cursor: pointer;color: green;font-size: 18px;"></i>
						                            			<a href="redirect?p=cmF0ZUNyaXRlcmlh&ct_id=<%=encodeCtId%>&cId=<%=encodeCId%>"><i class="icon-dollar" title="Rate Criteria" style="cursor: pointer;color: blue;font-size: 18px;"></i></a>
						                            		</td>
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
	
	
	
	
	function editData(value){
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'detailsOfCustomerTypeMaster',
		    //form send data
		    data:{ctId : value},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
		    	$("#ctId").val(json.customer_type_id);
		    	$("#type").val(json.type);
		    	$("#name").val(json.type_name);
		    	$("#description").val(json.description);
		    	
				
				$("#tableDiv").hide();
				$("#updateDiv").show();
		    	
		    }
		});
		
	}
	
	
	function updateForm(){
		$("#updateBtn").hide();
		$("#updateLoader").show();
		$("#formUpdate").submit();
	}
	
	
	</script>
</body>
</html>