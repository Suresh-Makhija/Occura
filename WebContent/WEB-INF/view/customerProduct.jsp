<%@page import="com.di.bean.CustomerProductBean"%>
<%@page import="com.di.bean.ProductMasterBean"%>
<%@page import="com.di.dao.AllListDAO"%>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<%@include file="header.jsp" %>
</head>
<body>
<%
	AllListDAO allListDAO = new AllListDAO();
	String encodeParentId = request.getParameter("cId");

	int decodeParentId = Integer.parseInt(new EncodeDecode().decodeString(String.valueOf(encodeParentId)));
	List<ProductMasterBean> listOfProduct =  allListDAO.listOfProduct();
	List<Integer> listOfCustomerProductGroup = allListDAO.listOfCustomerProductGroup(decodeParentId);
	
	CustomerBean customerBean = allListDAO.customerDetails(decodeParentId);
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<%if(auth == 1){ %>
				<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-diamond2"></i> <%=customerBean.getCompany()%>'s Products</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                   <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=">Customer Master</a></li>
		                  <li class="breadcrumb-item active"><%=customerBean.getCompany()%>'s Products</li>
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
			<%}else if(auth == 2){ %>
				<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-diamond2"></i> <%=customerBean.getCompany()%>'s Products</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                   <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active"><%=customerBean.getCompany()%>'s Products</li>
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
									<h4 class="card-title" id="striped-label-layout-icons"><%=customerBean.getCompany()%>'s Products</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								<%if(auth == 1){ %>
										<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12" id="insertDiv" style="border-right: solid 2px;">
											<form class="form" id="formSave" action="customerProductInsert" method="post">
											<input type="hidden" name="cId" value="<%=decodeParentId%>">
											<input type="hidden" name="uId" value="<%=userBean.getUser_id()%>">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Add Products</h4>
													<div class="row">
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Product</label> 
																<select class="form-control border-primary" name="pId" id="pId">
																	<option value="" selected="selected">---SELECT Product---</option>
																	<%for(ProductMasterBean p : listOfProduct){%>
																		<option value="<%=p.getProduct_master_id()%>"><%=p.getProduct_name()%></option>
																	<%} %>
																</select>
																
															</div>
														</div>
														
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Quantity</label> 
																<input type="number"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Quantity" name="qty" onchange="addMachine(this.value)" required>
																
															</div>
														</div>
													</div>
													<div class="row machineData">	
															
													</div>
													<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="saveBtn" onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary" id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
												</div>
												</div>
											</form>
										</div>
										
										<%} %>
										
										<div class="col-md-7 col-lg-7 col-sm-12 col-xs-12">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Product</th>
						                                    <th style="padding: 5px;">Qty</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<%
						                            	int count = 0;
						                            	for(Integer s : listOfCustomerProductGroup){
						                            	
						                            		ProductMasterBean productMasterBean = allListDAO.productDetails(s);
						                            		List<CustomerProductBean> listOfProductByProductId = allListDAO.listOfCustomerProduct(decodeParentId, s);
						                            	
						                            	%>
						                            		<tr>
						                            			<td style="padding: 5px"><%=++count%></td>
						                            			<td style="padding: 5px"><%=productMasterBean.getProduct_name()%></td>
						                            			<td style="padding: 5px"><font id="count<%=s%>" data-toggle="modal" data-target="#productModal" onclick="listOfProduct(<%=decodeParentId%>,<%=s%>,'<%=productMasterBean.getProduct_name()%>')" style="cursor: pointer;font-weight: bold;"><%=listOfProductByProductId.size()%></font></td>
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
	
	<!-- Modal For sub option of specification of field -->
									<div class="modal fade text-xs-left" id="productModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
									  <div class="modal-dialog modal-md" role="document">
										<div class="modal-content">
										  <div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											  <span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel1"><font id="productNameHeading"></font></h4>
										  </div>
										  <div class="modal-body">
										  <div class="row">
										  		<div class="col-md-12 col-lg-12 col-sm-12 col-sm-12" >
											  			<div class="table-responsive">
								 							<table class="table table-striped table-bordered" id="processTable">
									                            <thead>
									                                <tr>
									                                    <th style="padding:5px;">Machine Number</th>
									                                    <th style="padding:5px;">Machine Size</th>
									                                    <th style="padding:5px;">Action</th>
									                                </tr>
									                            </thead>
									                            <tbody>
									                            	
									                            </tbody>
								                        </table>
								                       </div> 
										  		</div>
										  		</div>
								  			</div>
								  			
										  <div class="modal-footer">
											<button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">Close</button>
										  </div>
										</div>
									  </div>
									</div>	
	
	<script type="text/javascript">
	
	$("#updateDiv").hide();
	$("#saveLoader").hide();
	
	
	function addMachine(value){
		
		$(".machineData").html("");
		
		for(var i=0;i<value;i++){
			var html = "<div class=\"col-md-6 col-lg-6 col-sm-12 col-xs-12\">	\r\n" + 
			"															<div class=\"form-group\">\r\n" + 
			"																<label for=\"userinput1\">"+(i+1)+" - Machine Number</label> \r\n" + 
			"																<input type=\"text\"\r\n" + 
			"																	id=\"userinput2\" class=\"form-control border-primary\"\r\n" + 
			"																	placeholder=\"Machine Number\" name=\"mNumber\" required>\r\n" + 
			"																\r\n" + 
			"															</div>\r\n" + 
			"														</div>\r\n" + 
			"														\r\n" + 
			"														<div class=\"col-md-6 col-lg-6 col-sm-12 col-xs-12\">	\r\n" + 
			"															<div class=\"form-group\">\r\n" + 
			"																<label for=\"userinput1\">Machine Size</label> \r\n" + 
			"																<input type=\"text\"\r\n" + 
			"																	id=\"userinput2\" class=\"form-control border-primary\"\r\n" + 
			"																	placeholder=\"Machine Size\" name=\"mSize\" required>\r\n" + 
			"																\r\n" + 
			"															</div>\r\n" + 
			"														</div>";
			
			
			$(".machineData").append(html);
			
			
		}
	}
	
	
	function submitForm(){
		$("#saveBtn").hide();
		$("#saveLoader").show();
		$("#formSave").submit();
	}
	
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
			location.href = "deactiveCustomer?cId="+value;
		}
		
	}
	
	
	var gcId = '';
	var gpId = '';
	var gname = '';
	
	function listOfProduct(cId,pId,name){
		
		gcId = cId;
		gpId = pId;
		gname = name;
		
		$("#productNameHeading").html('Machine Number of <b>'+name+'</b>');
		$("#processTable tbody").empty();
		
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'customerProductList',
		    //form send data
		    data:{cId : cId,pId : pId},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
		    	//Extract Each json data from input
		    	 $.each(json, function(i, f) {
		    		 <%if(auth == 1){ %>
		    				var html = 	"<tr>"+
		    				  	"<td style=\"padding:5px;\">"+f.machine_number+"</td>"+
		    				  	"<td style=\"padding:5px;\">"+f.machine_size+"</td>"+
		    				  	"<td style=\"padding:5px;\">"+
					            "<i class=\"icon-cross\" title=\"Delete\" style=\"color: red;cursor: pointer;\" onclick=\"deleteCustomerMachine("+f.customer_product_id+")\"></i>"+
		    				  	"</td>"+
		    				  	"</tr>";
		    					$(html).appendTo("#processTable tbody");	
		    		<%}else{%>
					    		var html = 	"<tr>"+
							  	"<td style=\"padding:5px;\">"+f.machine_number+"</td>"+
							  	"<td style=\"padding:5px;\">"+f.machine_size+"</td>"+
							  	"<td style=\"padding:5px;\">"+
							  	"</td>"+
							  	"</tr>";
								$(html).appendTo("#processTable tbody");
		    		<%}%>
		    		  	
		    		 
		    	 });
		    	
		    	//For find length of json
		    	 var count = Object.keys(json).length;
		    	//For set length of json
		    	 $("#count"+pId).text(count);
		    	
		    }
		});
		
	}
	
	
	function deleteCustomerMachine(id){
		
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'customerProductDeactivate',
		    //form send data
		    data:{cpId : id},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	listOfProduct(gcId,gpId,gname);
		    	
		    }
		});
		
	}
	</script>
</body>
</html>