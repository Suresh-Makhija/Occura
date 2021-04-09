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
<title>Product Master</title>
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
					<h2 class="content-header-title mb-0"><i class="icon-diamond2"></i> Product Master</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Product Master</li>
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
									<h4 class="card-title" id="striped-label-layout-icons">Product Master</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								
										<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12" id="insertDiv">
											<form class="form" id="formSave" action="insertProduct" method="post">
											
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Add Product</h4>
													<div class="row">
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Product Name</label> <input type="text"
																	id="userinput1" class="form-control border-primary"
																	placeholder="Product Name" name="pName" required>
															</div>
														</div>
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Category</label> <input type="text"
																	id="userinput2" class="form-control border-primary"
																	placeholder="Product Category" name="pCategory" required>
															</div>
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
												</div>
											</form>
										</div>
										
										<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12" id="updateDiv">
											<form class="form" id="formUpdate" action="updateProduct" method="post">
											<input type="hidden" name="pId" id="pId" value="">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Update Product</h4>
													<div class="row">
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Product Name</label> <input type="text"
																	id="productName" class="form-control border-primary"
																	placeholder="Product Name" name="pName" required>
															</div>
														</div>
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Category</label> <input type="text"
																	id="productCategory" class="form-control border-primary"
																	placeholder="Product Category" name="pCategory" required>
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
													<button type="reset" class="btn btn-warning mr-1" onclick="javascript:$('#updateDiv').hide();$('#insertDiv').show();">
														<i class="icon-cross2"></i> Cancel
													</button>
												</div>
											</form>
										</div>
										
										<div class="col-md-7 col-lg-7 col-sm-12 col-xs-12" style="border-left: solid 2px;">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 5px;">No</th>
						                                    <th style="padding: 5px;">Product Name</th>
						                                    <th style="padding: 5px;">Category</th>
						                                    <th style="padding: 5px;">Process</th>
						                                    <th style="padding: 5px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<!-- Get Method for list Of Product Master-->
						                            	<%
						                            	List<ProductMasterBean> listOfProduct =  allListDAO.listOfProduct();
						                            	int count = 0;
						                            	/* for Extract Data */ 
						                            	for(ProductMasterBean p : listOfProduct){
						                            		List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(p.getProduct_master_id());
						                            	%>  
						                            	<tr>
						                            		<td style="padding: 5px;"><%=++count%></td>
						                            		<td style="padding: 5px;"><%=p.getProduct_name()%></td>
						                            		<td style="padding: 5px;"><%=p.getProduct_category()%></td>
						                            		<td style="padding: 5px;"><font id="countOfProcess<%=p.getProduct_master_id()%>"><%=listOfProcess.size()%></font> <i class="icon icon-plus-circle" style="cursor: pointer;" data-toggle="modal" data-target="#productProcessModal" onclick="listOfProcess(<%=p.getProduct_master_id()%>,'<%=p.getProduct_name()%>')"></i></td>
						                            		<td style="padding: 5px;">
						                            			<i class="icon-pencil2" title="Edit" onclick="editData(<%=p.getProduct_master_id()%>);" style="cursor: pointer;color: green"></i>
						                            			<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteProduct(<%=p.getProduct_master_id()%>)"></i>
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
	
		<!-- Modal For sub option of specification of field -->
									<div class="modal fade text-xs-left" id="productProcessModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
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
										  		<!-- Design for Insert Sub Option -->
										  		<div class="col-md-5 col-lg-5 col-sm-12 col-sm-12" id="insertProcess" style="border-right : solid 1px;">
										  				<form id="productProcessForm">
										  					
										  					<!-- This Hidden field shiow the status which action perform in servlet -->
															<input type="hidden" name="action" id="action_f" value="insert">
															
															<!-- This is the foreign key of field Master id for Insert data 
																value fill using getDataForSpecification() function
															-->
															<input type="hidden" name="p_id" id="p_id_f" value="">
															
																<div class="form-body">
																	<h4 class="form-section">Add Process</h4>
																	<div class="row">
																		<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">	
																			<div class="form-group">
																				<label for="userinput1">Process Name</label> <input type="text" class="form-control border-primary"
																					placeholder="Process Name" name="processName" required>
																			</div>
																		</div>
																	</div>
																</div>
				
																<div class="form-actions right">
																	<button type="button" class="btn btn-primary" id="saveProcessBtn" onclick="insertProductProcess();">
																		<i class="icon-check2"></i> Save
																	</button>
																	<button type="button" class="btn btn-primary" id="saveProcessLoader">
																		<i class="icon-load-a spinner"></i> Waiting...
																	</button>
																</div>
														</form>
										  		</div>
										  		
										  		
										  		<!-- Design for Update Sub Option -->
										  		<div class="col-md-5 col-lg-5 col-sm-12 col-sm-12" id="updateProcess" style="border-right : solid 1px;">
										  				<form id="productProcessUpdateForm">
										  				
										  				<!-- This Hidden field shiow the status which action perform in servlet -->
															<input type="hidden" name="action" id="action_ff" value="update">
															
															<!-- This is the Primary key of field master id for Update data 
																value fill using editFieldMasterData() function
															-->
															<input type="hidden" name="p_id" id="p_id_ff" value="">
															<input type="hidden" name="pp_id" id="pp_id_ff" value="">
															
																<div class="form-body">
																	<h4 class="form-section">Update Process</h4>
																	<div class="row">
																		<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">	
																			<div class="form-group">
																				<label for="userinput1">Process Name</label> <input type="text"
																					id="processName" class="form-control border-primary"
																					placeholder="Process Name" name="processName" required>
																			</div>
																		</div>
																	</div>
																</div>
				
																<div class="form-actions right">
																	<button type="button" class="btn btn-primary" id="updateProcessBtn" onclick="updateProductProcess();">
																		<i class="icon-check2"></i> Update
																	</button>
																	<button type="button" class="btn btn-primary" id="updateProcessLoader">
																		<i class="icon-load-a spinner"></i> Waiting...
																	</button>
																	<button type="button" class="btn btn-warning mr-1" onclick="javascript: $('#insertProcess').show(); $('#updateProcess').hide();">
																		<i class="icon-cross2"></i> Cancel
																	</button>
																</div>
														</form>
										  		</div>
								  			
								  				<!-- Design for List Sub Option -->
										  		<div class="col-md-7 col-lg-7 col-sm-12 col-sm-12" >
											  			<div class="table-responsive">
								 							<table class="table table-striped table-bordered" id="processTable">
									                            <thead>
									                                <tr>
									                                    <th style="padding:5px;">Name</th>
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
	
	
	function deleteProduct(value){
		
		var ratval = confirm("Are you sure?");
		
		if(ratval == true){
			location.href = "deactiveProduct?pId="+value;
		}
		
	}
	
	function editData(value){
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'detailsOfProductMaster',
		    //form send data
		    data:{pId : value},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
		    	$("#pId").val(json.product_master_id);
				$("#productName").val(json.product_name);
				$("#productCategory").val(json.product_category);
				
				$("#insertDiv").hide();
				$("#updateDiv").show();
		    	
		    }
		});
		
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
	
	
	var gName = '';
	var gId = '';
	function listOfProcess(id,name){
		
		gName = name;
		gId = id;
		$("#p_id_f").val(id);
		$("#productNameHeading").html('Process of <b>'+name+'</b>');
		$("#processTable tbody").empty();
		$("#insertProcess").show();
		$("#updateProcess").hide();
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'listOfProcessByProductId',
		    //form send data
		    data:{pId : id},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	//parse data into json format
		    	 var json = JSON.parse(data);
		    	
		    	//Extract Each json data from input
		    	 $.each(json, function(i, f) {
		    	
		    		var html = 	"<tr>"+
		    				  	"<td style=\"padding:5px;\">"+f.product_process_name+"</td>"+
		    				  	"<td style=\"padding:5px;\">"+
		    				  	"<i class=\"icon-pencil2\" title=\"Edit\" onclick=\"getProcessData("+f.product_process_id+");\" style=\"cursor: pointer;color: green\"></i>&nbsp;&nbsp;"+
					            "<i class=\"icon-cross\" title=\"Delete\" style=\"color: red;cursor: pointer;\" onclick=\"deleteProcessData("+f.product_process_id+")\"></i>"+
		    				  	"</td>"+
		    				  	"</tr>";
		    				 
		    		$(html).appendTo("#processTable tbody");		  	
		    		 
		    	 });
		    	
		    	//For find length of json
		    	 var count = Object.keys(json).length;
		    	//For set length of json
		    	 $("#countOfProcess"+id).text(count)
		    	
		    }
		});
		
		
	}
	
	
	
	//Function for insert Process
	function insertProductProcess(){
		$("#saveProcessBtn").hide();
		$("#saveProcessLoader").show();
		
	//Ajax for get data using Specification Field  id
	$.ajax({
		//for specify Method
	    method: "POST",
	    //for call action
	    url: 'productProcessInsert',
	    //form send data
	    data: $('#productProcessForm').serialize(),
	    // action perform when successfully call action with specific method type
	    success: function (data) {
	    	
	    	$("#processTable tbody").empty();
	    	
	    	$("#saveProcessBtn").show();
			$("#saveProcessLoader").hide();
			
	    	//call function for list Of Field Master
	    	listOfProcess(gId,gName);
	    	
	    	//for reset form
	    	$("#productProcessForm")[0].reset();
	    	
	    	//set value
	    	$("#p_id_f").val(id);
	    	$("#action_f").val('insert');
	    	
	    	
	    	
	    }
	});
	
	}
	
	function deleteProcessData(id){
		var ratval = confirm("Are You Sure?");
		
		if(ratval == true){
			$.ajax({
				//for specify Method
			    method: "POST",
			    //for call action
			    url: 'productProcessDelete',
			    //form send data
			    data: {ppId : id},
			    // action perform when successfully call action with specific method type
			    success: function (data) {
			    	
			    	$("#processTable tbody").empty();
			    	
			    	//call function for list Of Field Master
			    	listOfProcess(gId,gName);
			    	
			    }
			});
		}
		
	}
	
	
	
	function getProcessData(id){
		//Ajax for get data using Specification Field  id
		
		
			$.ajax({
				//for specify Method
			    method: "POST",
			    //for call action
			    url: 'productProcessDetails',
			    //form send data
			    data: {ppId : id},
			    // action perform when successfully call action with specific method type
			    success: function (data) {
			    	
			    	//parse data into json format
			    	var json = JSON.parse(data);
			    	$("#processName").val(json.product_process_name);
			    	$("#pp_id_ff").val(json.product_process_id);
			    	$("#p_id_ff").val(json.productMasterBean.product_master_id);
			    	
			    	$("#insertProcess").hide();
					$("#updateProcess").show();
					
					
			    }
			});
		
	}
	
	
	
	//Function for Update Process
	function updateProductProcess(){
		$("#updateProcessBtn").hide();
		$("#updateProcessLoader").show();
		
	//Ajax for get data using Specification Field  id
	$.ajax({
		//for specify Method
	    method: "POST",
	    //for call action
	    url: 'productProcessUpdate',
	    //form send data
	    data: $('#productProcessUpdateForm').serialize(),
	    // action perform when successfully call action with specific method type
	    success: function (data) {
	    	
	    	$("#processTable tbody").empty();
	    	
	    	$("#updateProcessBtn").show();
			$("#updateProcessLoader").hide();
	    	
	    	//call function for list Of Field Master
	    	listOfProcess(gId,gName);
	    	
	    	
	    	
	    	
	    }
	});
	
	}
	
	</script>
</body>
</html>