
<%@page import="com.di.bean.WorkProductBean"%>
<%@page import="com.di.bean.WorkHistoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.di.bean.ProductMasterBean"%>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@page import="com.di.dao.AllListDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Stone</title>
<%@include file="header.jsp"%>
<style type="text/css">
td {
	white-space: nowrap;
}
</style>

</head>
<body>
	<%
		AllListDAO allListDAO = new AllListDAO();
		List<CustomerBean> listOfCustomer = allListDAO.listOfSubCustomer();
		List<ProductMasterBean> listOfProduct = allListDAO.listOfProduct();

		List<WorkHistoryBean> listOfWork = allListDAO.listOfWorkHistory(50);
		List<Integer> listOfCustomerProductGroup = null;

		if (auth != 1) {
			listOfWork = allListDAO.listOfWorkHistoryByCustomer(50, userLoginCustId, user_id);
			listOfCustomer = allListDAO.listOfCustomerByParentId(userLoginCustId);
			listOfCustomerProductGroup = allListDAO.listOfCustomerProductGroup(userLoginCustId);
		}

		WorkHistoryBean ww = allListDAO.workHistoryUserId(user_id);

		int cid = 0;
		String wid = "0";
		if (ww != null) {
			cid = ww.getCustomerBean().getCustomer_id();
			wid = ww.getWork_history_id();
		}	

		List<String> listOfPriority = new ArrayList();
		listOfPriority.add("High");
		listOfPriority.add("Medium");
		listOfPriority.add("Low");

		int sizeOfChild = 0;
		if (request.getParameter("wId") != null) {
			String encodeWId = request.getParameter("wId");

			String decodeWId = new EncodeDecode().decodeString(String.valueOf(encodeWId));
			List<WorkHistoryBean> listOfChildWork1 = allListDAO.listOfWorkHistoryByParentWorkId(decodeWId);
			sizeOfChild = listOfChildWork1.size();
		}
	%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0">
						<i class="icon-pencil-square-o"></i> New Challan
					</h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
								<li class="breadcrumb-item active">New Challan</li>
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
						<a class="nav-link active" id="base-tab" href="redirect?p=Y2hhbGxhbk1hc3Rlcg==" aria-expanded="true">Challan Entry</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=" aria-expanded="true">Customer Master</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="base-tab"  href="redirect?p=cHJvZHVjdE1hc3Rlcg==" aria-expanded="true">Product Master</a>
					</li>
			</ul> -->
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">

							<div class="card-body collapse in">
								<div class="card-block">
									<div class="row insertPanel">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12"
											id="insertDiv">
											<form class="form" id="formSave" action="insertWork"
												method="post">
												<input type="hidden" name="uId" value="<%=user_id%>">
												<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<div class="row">
														<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
															<div class="form-group">
																<label for="userinput1">Customer</label> <select
																	class="select2 form-control border-primary"
																	name="custId" id="custId" required
																	onchange="setValue(this.value);checkStoneName(this.value);">
																	<option value="" selected="selected">---SELECT
																		CUSTOMER---</option>
																	<%
																		for (CustomerBean c : listOfCustomer) {
																			if (cid == c.getCustomer_id()) {
																	%>
																	<option value="<%=c.getCustomer_id()%>"
																		selected="selected"><%=c.getFullname()%> (<%=c.getCompany()%>)
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=c.getCustomer_id()%>"><%=c.getFullname()%>
																		(<%=c.getCompany()%>)
																	</option>
																	<%
																		}
																	%>
																	<%
																		}
																	%>
																</select>

															</div>
														</div>
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Kapan Name</label> <input
																	type="text" id="kapanName"
																	class="form-control border-primary"
																	placeholder="Kapan Name" name="kapanName" required">
															</div>
														</div>

														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Lot Name</label> <input
																	type="text" id="lotName"
																	class="form-control border-primary"
																	placeholder="Lot Name" name="lotName" required>
															</div>
														</div>
													</div>

													<div class="row">
														<%
															if (auth == 1) {
														%>
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
															<div class="form-group">
																<input type="hidden" id="PIDS" name="PIDS" value="">
																<label for="userinput1">Select Process</label> <select
																	class="selectize-multiple"
																	placeholder="----Select process----" name="pId"
																	id="processId" multiple="multiple" required>
																	<%
																		List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(wid);
																			for (ProductMasterBean p : listOfProduct) {

																				boolean flag = false;
																				for (WorkProductBean w : listofWorkProduct) {
																					if (p.getProduct_master_id() == w.getProductMasterBean().getProduct_master_id()) {
																						flag = true;
																					}
																				} 
																	%>
																	<%
																		if (flag == true) {
																	%>
																	<option value="<%=p.getProduct_master_id()%>"
																		selected="selected"><%=p.getProduct_name()%>
																		(<%=p.getProduct_category()%>)
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=p.getProduct_master_id()%>"><%=p.getProduct_name()%>
																		(<%=p.getProduct_category()%>)
																	</option>
																	<%
																		}
																	%>

																	<%
																		}
																	%>
																</select>

															</div>
														</div>
														<%
															} else {
														%>
														<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
															<div class="form-group">
																<input type="hidden" id="PIDS" name="PIDS" value="">
																<label for="userinput1">Select Process</label> <select
																	class="selectize-multiple"
																	placeholder="----Select process----" name="pId"
																	id="processId" multiple="multiple" required>
																	<%
																		List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(wid);
																			for (Integer id : listOfCustomerProductGroup) {
																				ProductMasterBean p = allListDAO.productDetails(id);

																				boolean flag = false;
																				 for (WorkProductBean w : listofWorkProduct) {
																					if (p.getProduct_master_id() == w.getProductMasterBean().getProduct_master_id()) {
																						flag = true;
																					}
																				} 
																	%>
																	<%
																		if (flag == true) {
																	%>
																	<option value="<%=p.getProduct_master_id()%>"
																		selected="selected"><%=p.getProduct_name()%>
																		(<%=p.getProduct_category()%>)
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=p.getProduct_master_id()%>"><%=p.getProduct_name()%>
																		(<%=p.getProduct_category()%>)
																	</option>
																	<%
																		}
																	%>

																	<%
																		}
																	%>

																</select>

															</div>
														</div>
														<%
															}
														%>

														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Priority</label> <select
																	class="form-control border-primary" id="priority"
																	name="priority">
																	<option value="">---SELECT PRIORITY---</option>
																	<%
																		for (String s : listOfPriority) {
																			if (s.equalsIgnoreCase("Medium")) {
																	%>
																	<option value="<%=s%>" selected="selected"><%=s%></option>
																	<%
																		} else {
																	%>
																	<option value="<%=s%>"><%=s%></option>
																	<%
																		}
																	%>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>


														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Stress Level</label> <input
																	type="text" id="clearity"
																	class="form-control border-primary"
																	placeholder="Clearity" name="clearity">
															</div>
														</div>

													</div>

													<div class="stoneData">
													<div class="row">
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Stone Name</label> <input
																	type="text" id="stoneName0"
																	class="form-control border-primary"
																	placeholder="Stone Name" name="stoneName" required
																	onchange="checkStoneName(this.value);">
															</div>
														</div>

														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Actual Weight</label> <input
																	type="text" id="actualWeight0"
																	class="form-control border-primary tWeight"
																	placeholder="Actual Weight" name="actualWeight" onkeyup="enterListener(this.id,0);"
																	required>
															</div>
														</div>


														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Color</label> <input type="text"
																	id="color0" class="form-control border-primary"
																	placeholder="Color" name="color" onkeyup="enterListener(this.id,0)">
															</div>
														</div>


														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Remarks</label> <input
																	type="text" id="remark0" name="remark"
																	class="form-control border-primary"
																	placeholder="Max 500 words" onkeyup="enterListener(this.id,0)">
															</div>
														</div>
													</div>
													</div>
													
													<div>
														Total Stone : <font id="totalStone"> </font>
														Total Weight : <font id="totalWeight"> </font>
													</div>
													
													<!-- <hr>
													<div class="row">
														<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">How Many Child Stone
																	Created?</label> <input type="number" id="num"
																	class="form-control border-primary"
																	placeholder="Enter Number" name="stoneNum"
																	onchange="setWeight(this.value)">
															</div>
														</div>

														<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12"
															id="childStone"></div>
													</div> -->
												</div>
												<div class="form-actions right">
													<button type="button" class="btn btn-primary" id="saveBtn"
														onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
													<button type="button" class="btn btn-primary"
														id="saveLoader">
														<i class="icon-load-a spinner"></i> Waiting...
													</button>
													<button type="button" class="btn btn-warning mr-1"
														onclick="javascript:window.location.href='redirect?p=Y2hhbGxhbk1hc3Rlcg=='">
														<i class="icon-cross2"></i> Go To List
													</button>
												</div>
											</form>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<script src="app-assets/vendors/js/forms/select/select2.full.min.js"
			type="text/javascript"></script>
		<!-- BEGIN PAGE LEVEL JS-->
		<script src="app-assets/js/scripts/forms/select/form-select2.min.js"
			type="text/javascript"></script>
		<script src="app-assets/vendors/js/forms/select/selectize.min.js"
			type="text/javascript"></script>
		<script src="app-assets/js/scripts/forms/select/form-selectize.min.js"
			type="text/javascript"></script>

		<script type="text/javascript">
			$("#updateDiv").hide();
			$("#saveLoader").hide();
			$("#updateLoader").hide();

			$(document).ready(function() {

				//For Datatable initilization
				$(".file-export").DataTable({
					// for table structure
					dom : "Bfrtip",

					//for disable ordering
					"ordering" : false,

					//For page length in data tables
					"pageLength" : 20,

					// for button show in data tables
					buttons : [ {
						extend : 'excel',
						filename : 'Product Master'
					} ]

				}),

				//For Design of that button
				$(".buttons-excel").addClass("btn btn-primary mr-1")

			});

			function checkStoneName(value) {

				var kapanName = $("#kapanName").val();
				var stoneName = value;
				var custId = $("#custId").val();

				//Ajax for get data using Specification Field  id
				$
						.ajax({
							//for specify Method
							method : "POST",
							//for call action
							url : 'checkStoneName',
							//form send data
							data : {
								custId : custId,
								kapanName : kapanName,
								stoneName : stoneName
							},
							// action perform when successfully call action with specific method type
							success : function(data) {

								if (data == 'true') {
									alert("Kapan Name & stone name are same in previous record.Please choose diffrent stone name!!!");
									$("#stoneName").val("");
								}

							}
						});

			}

			function submitForm() {

				var value = $("#processId").val();
				var stoneName = $("#stoneName").val();
				if (stoneName == "") {
					alert("Please Enter Stone name !!!");
				} else if (value == null) {
					alert("Please Select atleast one process!!!");
				} else {

					$("#PIDS").val($("#processId").val());

					$("#saveBtn").hide();
					$("#saveLoader").show();
					$("#formSave").submit();

				}
			}

			function updateForm() {

				$("#PIDS").val($("#processId").val());

				$("#updateBtn").hide();
				$("#updateLoader").show();
				$("#formUpdate").submit();
			}

			function deleteHistory(value) {

				var ratval = confirm("Are you sure?");

				if (ratval == true) {
					location.href = "deactiveWorkHistory?wId=" + value;
				}

			}

			function editData(value) {

				//Ajax for get data using Specification Field  id
				$
						.ajax({
							//for specify Method
							method : "POST",
							//for call action
							url : 'detailsOfWorkHistory',
							//form send data
							data : {
								wId : value
							},
							// action perform when successfully call action with specific method type
							success : function(data) {

								//parse data into json format
								var json = JSON.parse(data);

								$("#wId").val(json.work_history_id);
								$("#kapanName").val(json.kapan_name);
								$("#lotName").val(json.lot_name);
								$("#stoneName").val(json.stone_name);
								$("#actualWeight").val(json.actual_weight);
								$("#priority").val(json.priority);
								$("#color").val(json.color);
								$("#clearity").val(json.clearity);
								$("#pId")
										.val(
												json.productMasterBean.product_master_id);
								$("#custId").val(json.customerBean.customer_id);

								$("#insertDiv").hide();
								$("#updateDiv").show();

							}
						});

			}

			function showFullDetails(value) {
				location.href = "redirectToDetails?wId=" + value;
			}
		<%if (cid != 0) {%>
			setValue(
		<%=cid%>
			);
		<%}%>
		
		
		
			function setValue(id) {

				$("#kapanName").val("");
				$("#lotName").val("");
				$("#stoneName").val("");
				$("#actualWeight").val("");
				$("#priority").val("");
				$("#color").val("");
				$("#clearity").val("");
				$("#pId").val("");

				//Ajax for get data using Specification Field  id
				$
						.ajax({
							//for specify Method
							method : "POST",
							//for call action
							url : 'detailsOfLastWorkHistory',
							//form send data
							data : {
								cId : id
							},
							// action perform when successfully call action with specific method type
							success : function(data) {
								//parse data into json format
								var json = JSON.parse(data);

								$("#kapanName").val(json.kapan_name);
								$("#lotName").val(json.lot_name);
								$("#actualWeight0").val(json.actual_weight);
								$("#priority").val(json.priority);
								$("#color0").val(json.color);
								$("#clearity").val(json.clearity);
								$("#pId")
										.val(
												json.productMasterBean.product_master_id);
								$("#stoneName0").val(
										parseFloat(json.stone_name) + 1);
								
								totalWeight();
								

							}
						});

			}

			function setWeight(value) {
				$("#childStone").empty();

				var start =<%=sizeOfChild + 1%>;
				var end = parseFloat(<%=sizeOfChild%>) + parseFloat(value);

				for (var i = start; i <= end; i++) {
					var html = " <div class=\"col-md-6 col-lg-6 col-sm-12 col-xs-12\">\r\n"
							+ "		<div class=\"form-group\">\r\n"
							+ "			<label for=\"userinput2\"><b>Stone-"
							+ i
							+ "</b> Actual Weight</label> \r\n"
							+ "			<input type=\"text\"\r\n" + 
			"				id=\"num\" class=\"form-control border-primary\"\r\n" + 
			"				placeholder=\"Enter Weight\" name=\"childWeight\">\r\n"
							+ "		</div>\r\n" + "	 </div>	"

					$("#childStone").append(html);
				}

			}
			
		
			
		/* 	function shalinListener(id){
				var input = document.getElementById(id);
				
			//	alert(id);
			
			}
				 */
			
		/* 		 boolean containsOnce(s, substring) {
					    Pattern pattern = Pattern.compile(substring.toString());
					    Matcher matcher = pattern.matcher(s);
					    if(matcher.find()){
					        return !matcher.find();
					    }
					    return false;
					} */
				
					
					
			function enterListener(id,num){
				totalWeight();
				var input = document.getElementById(id);
				var input1 = document.getElementById(id).value;
				
				
				//alert(input1);
				
				var decimal=  /^[-+]?[0-9]+\.[0-9]+$/; 
				var decimal1 = /^\d*\.?\d*$/;
				if(input1.match(decimal1)) 
				{ 
				//alert('Correct, try another...'+input1);
				var flag = true;
				
				input.addEventListener("keyup", function(event) {
					if(flag == true){
					flag = false;
				  // Number 13 is the "Enter" key on the keyboard
				  if (event.keyCode === 13) {
				    addRow(num);
				  }
					}
				});
				
				//return true;
				}
				else
				{ 
				alert('Wrong value !'+input1);
				//return false;
				}
				
			}
			
			var count;
			function addRow(num){
				
				
				count = num+1;
				
				var stone = parseFloat($("#stoneName"+num).val()) + 1 ;
				var color = $("#color"+num).val();
				
				
				var html = "<div class=\"row\">\r\n" + 
				"														<div class=\"col-md-3 col-lg-3 col-sm-12 col-xs-12\">\r\n" + 
				"															<div class=\"form-group\">\r\n" + 
				"																<label for=\"userinput2\">Stone Name</label> <input\r\n" + 
				"																	type=\"text\" id=\"stoneName"+count+"\"\r\n" + 
				"																	class=\"form-control border-primary\"\r\n" + 
				"																	placeholder=\"Stone Name\" name=\"stoneName\" value=\""+stone+"\" required\r\n" + 
				"																	onchange=\"checkStoneName(this.value);\">\r\n" + 
				"															</div>\r\n" + 
				"														</div>\r\n" + 
				"\r\n" + 
				"														<div class=\"col-md-3 col-lg-3 col-sm-12 col-xs-12\">\r\n" + 
				"															<div class=\"form-group\">\r\n" + 
				"																<label for=\"userinput2\">Actual Weight</label> <input\r\n" + 
				"																	type=\"text\" id=\"actualWeight"+count+"\"\r\n" + 
				"																	class=\"form-control border-primary tWeight\"\r\n" + 
				"																	placeholder=\"Actual Weight\" value=\"\" onkeyup=\"enterListener(this.id,'"+count+"')\" autofocus name=\"actualWeight\"\r\n" + 
				"																	required>\r\n" + 	
				"															</div>\r\n" + 
				"														</div>\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"														<div class=\"col-md-3 col-lg-3 col-sm-12 col-xs-12\">\r\n" + 
				"															<div class=\"form-group\">\r\n" + 
				"																<label for=\"userinput2\">Color</label> <input type=\"text\"\r\n" + 
				"																	id=\"color"+count+"\" class=\"form-control border-primary\"\r\n" + 
				"																	placeholder=\"Color\" name=\"color\" value=\""+color+"\" onkeyup=\"enterListener(this.id,'"+count+"')\">\r\n" + 
				"															</div>\r\n" + 
				"														</div>\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"														<div class=\"col-md-3 col-lg-3 col-sm-12 col-xs-12\">\r\n" + 
				"															<div class=\"form-group\">\r\n" + 
				"																<label for=\"userinput2\">Remarks</label> <input\r\n" + 
				"																	type=\"text\" id=\"remark"+count+"\" name=\"remark\"\r\n" + 
				"																	class=\"form-control border-primary\"\r\n" + 
				"																	placeholder=\"Max 500 words\" onkeyup=\"enterListener(this.id,'"+count+"')\">\r\n" + 
				"															</div>\r\n" + 
				"														</div>\r\n" + 
				"													</div>";
				
				$(".stoneData").append(html);
				$('#actualWeight'+count).focus();
				
			}
			
			function totalWeight(){
				var sum = 0;
				var totalStone = 0;
				$('.tWeight').each(function(){
					totalStone += 1;
					if(isNaN(parseFloat($(this).val())) == false){
				    	sum += parseFloat($(this).val());
					}
				});
				
				
				$("#totalStone").text(totalStone);
				$("#totalWeight").text(sum.toFixed(3));
			}
		</script>
</body>
</html>