<%@page import="com.di.bean.CustomerTypeBean"%>
<%@page import="com.di.dao.AllListDAO"%>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sub Customers</title>
<%@include file="header.jsp" %>
</head>
<body>
<%
	AllListDAO allListDAO = new AllListDAO();
	

	String encodeParentId = request.getParameter("pId");
	
	int decodeParentId = Integer.parseInt(new EncodeDecode().decodeString(String.valueOf(encodeParentId)));
	List<CustomerBean> listOfCustomer =  allListDAO.listOfCustomerByParentId(decodeParentId);
	
	int maxCustomer = allListDAO.getMaxNumberOfCustomerByPId(decodeParentId);
	int nextNum = maxCustomer + 1;
	
	CustomerBean customerBean = allListDAO.customerDetails(decodeParentId);
	
	String number = String.format("%05d", nextNum);
	String custmorCode = "SC-"+number+"_"+customerBean.getCustomer_num();
	List<CustomerTypeBean> listOfCustomerType =  allListDAO.listOfCustomerType();

	
	
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<%if(auth == 1){ %>
				<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-user-tie"></i> <%=customerBean.getCompany()%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=">Customer Master</a></li>
		                  <li class="breadcrumb-item active"><%=customerBean.getCompany()%></li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="javascript:$('#insertDiv').show();$('#tableDiv').hide();$('#updateDiv').hide();" data-toggle="tooltip"
						data-original-title="Add New Customer">
						<i class="icon-plus"></i>
					</button>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>
			</div>
			<%}else if(auth == 2){ %>
				<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-user-tie"></i> <%=customerBean.getCompany()%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active"><%=customerBean.getCompany()%></li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="javascript:$('#insertDiv').show();$('#tableDiv').hide();$('#updateDiv').hide();" data-toggle="tooltip"
						data-original-title="Add New Customer">
						<i class="icon-plus"></i>
					</button>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>
			<%} %>
			
			

			<br>
			<!-- <ul class="nav nav-tabs nav-linetriangle no-hover-bg">
 					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=Y2hhbGxhbk1hc3Rlcg==" aria-expanded="true">Challan Entry</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" id="base-tab" href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=" aria-expanded="true">Customer Master</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="base-tab"  href="redirect?p=cHJvZHVjdE1hc3Rlcg==" aria-expanded="true">Product Master</a>
					</li>
			</ul> -->
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-3">
									<h4 class="card-title" id="striped-label-layout-icons"><%=customerBean.getCompany()%>'s Customers</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="insertDiv" >
											<form class="form" action="insertCustomer" id="formSave" method="post">
											<input type="hidden" name="uId" value="<%=user_id%>">
											<input type="hidden" name="parent_id" value="<%=decodeParentId%>">
											<input type="hidden" name="subRedirection" value="subClient">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Add Sub Customer</h4>
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Client Code</label> 
																<input type="text"  class="form-control border-primary"
																	placeholder="Client Code" name="cCode" value="<%=custmorCode%>" readonly="readonly">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Full Name</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="Full Name" name="fName" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Company Name</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="Company Name" name="cName" required>
															</div>
														</div>
													</div>
													
													<div class="row">	
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">GST Number</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="GST Number" name="gstNumber">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Vat Number</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="VAT Number" name="vatNumber">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Vat Rate (%)</label> <input type="text"
																	id="" class="form-control border-primary"
																	placeholder="VAT Rate" name="vatRate">
															</div>
														</div>
													</div>
													
													<div class="row">	
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">CGST (%)</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="CGST" name="cgst">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">SGST (%)</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="SGST" name="sgst">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">IGST (%)</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="IGST" name="igst">
															</div>
														</div>
													</div>
													
													<div class="row">	
													<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Contact No.1</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Contact No.1" name="cNoOne" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Contact No.2</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Contact No.2" name="cNoTwo">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Email-Id.1</label> <input type="email"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Email-Id.1" name="emailOne" required>
															</div>
														</div>
													</div>
													
													<div class="row">	
													<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Email-Id.2</label> <input type="email"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Email-Id.2" name="emailTwo">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Address</label> 
																<textarea rows="" cols="" name="address" class="form-control border-primary" placeholder="Max 500 words"></textarea>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Zip Code</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Zip Code" name="zipCode">
															</div>
														</div>
													</div>	
														
													<div class="row">	
													<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">City</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="City" name="city">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">State</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="State" name="state">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Country</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Country" name="country">
															</div>
														</div>
													</div>
													<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="saveBtn" onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary" id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#updateDiv').hide();$('#insertDiv').hide();$('#tableDiv').show();">
														<i class="icon-cross2"></i> Go To List
													</button>
												</div>
											</form>
												</div>

												
										</div>
										
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="updateDiv">
											<form class="form" id="formUpdate" action="updateCustomer" method="post">
											<input type="hidden" name="uId" value="<%=user_id%>">
											<input type="hidden" id="cId" name="cId" value="">
											<input type="hidden" id="parent_id" name="parent_id" value="">
											<input type="hidden" name="subRedirection" value="subClient">
											<input type="hidden" id="maxNum" name="maxNum" value="">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Update Customer</h4>
													<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Client Code</label> 
																<input type="text"
																	id="cCode" class="form-control border-primary "
																	placeholder="Customer Code" name="cCode" readonly="readonly">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Full Name</label> <input type="text"
																	id="fName" class="form-control border-primary"
																	placeholder="Full Name" name="fName" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Company Name</label> <input type="text"
																	id="cName" class="form-control border-primary"
																	placeholder="Company Name" name="cName" required>
															</div>
														</div>
														</div>
														
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">GST Number</label> <input type="text"
																	id="gstNumber" class="form-control border-primary"
																	placeholder="GST Number" name="gstNumber">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Vat Number</label> <input type="text"
																	id="vatNumber" class="form-control border-primary"
																	placeholder="VAT Number" name="vatNumber">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Vat Rate (%)</label> <input type="text"
																	id="vatRate" class="form-control border-primary"
																	placeholder="VAT Rate" name="vatRate">
															</div>
														</div>
														</div>
														
														
														<div class="row">	
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">CGST (%)</label> <input type="text"
																	id="cgst" class="form-control border-primary"
																	placeholder="CGST" name="cgst">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">SGST (%)</label> <input type="text"
																	id="sgst" class="form-control border-primary"
																	placeholder="SGST" name="sgst">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">IGST (%)</label> <input type="text"
																	id="igst" class="form-control border-primary"
																	placeholder="IGST" name="igst">
															</div>
														</div>
													</div>
														
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Contact No.1</label> <input type="text"
																	id="cNoOne" class="form-control border-primary"
																	placeholder="Contact No.1" name="cNoOne" required>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Contact No.2</label> <input type="text"
																	id="cNoTwo" class="form-control border-primary"
																	placeholder="Contact No.2" name="cNoTwo">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Email-Id.1</label> <input type="email"
																	id="emailOne" class="form-control border-primary"
																	placeholder="Email-Id.1" name="emailOne" required>
															</div>
														</div>
														
														</div>
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Email-Id.2</label> <input type="email"
																	id="emailTwo" class="form-control border-primary"
																	placeholder="Email-Id.2" name="emailTwo">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Address</label> 
																<textarea id="address" rows="" cols="" name="address" class="form-control border-primary" placeholder="Max 500 words"></textarea>
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Zip Code</label> <input type="text"
																	id="zipCode" class="form-control border-primary"
																	placeholder="Zip Code" name="zipCode">
															</div>
														</div>
														
														</div>
														
														<div class="row">
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">City</label> <input type="text"
																	id="city" class="form-control border-primary"
																	placeholder="City" name="city">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">State</label> <input type="text"
																	id="state" class="form-control border-primary"
																	placeholder="State" name="state">
															</div>
														</div>
														<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Country</label> <input type="text"
																	id="country" class="form-control border-primary"
																	placeholder="Country" name="country">
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
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#updateDiv').hide();$('#insertDiv').hide();$('#tableDiv').show();">
														<i class="icon-cross2"></i> Go To List
													</button>
												</div>
											</form>
												</div>

												
										</div>
										
										
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Code</th>
						                                    <th style="padding: 5px;">Name</th>
						                                    <th style="padding: 5px;">Company</th>
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(CustomerBean c : listOfCustomer){
					                            		int cust_id = c.getCustomer_id();
					                            		String encodeCust_id = new EncodeDecode().encodeString(String.valueOf(cust_id));
						                            %>
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count%></td>
						                            		<td style="padding: 5px;white-space: nowrap;"><%=c.getCustomer_code()%></td>
						                            		<td style="padding: 5px;"><%=c.getFullname()%></td>
						                            		<td style="padding: 5px;"><%=c.getCompany()%></td>
						                            		<td style="padding: 5px;">
						                            			<i class="icon-pencil2" title="Edit" onclick="editData(<%=c.getCustomer_id()%>);" style="cursor: pointer;color: green"></i>
						                            			<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteCustomer(<%=c.getCustomer_id()%>)"></i>
						                            			<a href="redirect?p=cHJvZHVjdFJhdGU==&cId=<%=encodeCust_id%>"><i class="icon-dollar" title="Set Rate Criteria" style="cursor: pointer;color: blue;"></i></a>
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
	$("#insertDiv").hide();
	$("#saveLoader").hide();
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
	
	
	
	function deleteCustomer(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			location.href = "deactiveCustomer?cId="+value+"&parent_id=<%=decodeParentId%>";
		}
		
	}

	function submitForm(){
		$("#saveBtn").hide();
		$("#saveLoader").show();
		$("#formSave").submit();
	}
	
	function updateForm(){
		$("#updateBtn").hide();
		$("#updateLoader").show();
		$("#formUpdate").submit();
	}
	
	function editData(value){
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'detailsOfCustomerMaster',
		    //form send data
		    data:{cId : value},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
		    	 
		    	$("#cId").val(json.customer_id);
				$("#cCode").val(json.customer_code);
				$("#cCodeTxt").html(json.customer_code);
				$("#fName").val(json.fullname);
				$("#cName").val(json.company);
				$("#gstNumber").val(json.gst_number);
				$("#cNoOne").val(json.contact_one);
				$("#cNoTwo").val(json.contact_two);
				$("#emailOne").val(json.email_one);
				$("#emailTwo").val(json.email_two);
				$("#address").val(json.address);
				$("#zipCode").val(json.zipcode);
				$("#city").val(json.city);
				$("#state").val(json.state);
				$("#country").val(json.country);
				$("#maxNum").val(json.customer_num);
				$("#vatNumber").val(json.vat_number);
				$("#vatRate").val(json.vat_rate);
				$("#parent_id").val(json.parent_customer_id);
				
				$("#cgst").val(json.cgst);
				$("#sgst").val(json.sgst);
				$("#igst").val(json.igst);
				
				$("#insertDiv").hide();
				$("#tableDiv").hide();
				$("#updateDiv").show();
		    	
		    }
		});
		
	}
	
	</script>
</body>
</html>