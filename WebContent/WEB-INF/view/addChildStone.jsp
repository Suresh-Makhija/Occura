
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
		String encodeWId = request.getParameter("wId");

		String decodeWId = new EncodeDecode().decodeString(String.valueOf(encodeWId));
		List<WorkHistoryBean> listOfChildWork1 = allListDAO.listOfWorkHistoryByParentWorkId(decodeWId);
		int sizeOfChild = 0;
		
		WorkHistoryBean w = allListDAO.workHistoryId(decodeWId);
		
		
	%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0">
						<i class="icon-pencil-square-o"></i> Add Child Stone
					</h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
								<li class="breadcrumb-item active">Add Child Stone</li>
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
									
									<table class="table table-bordered">
										<tr>
											<th>Kapan Name</th>
											<th>Stone Name</th>
											<th>Lot Name</th>
											<th>Weight</th>
										</tr>
										
										
										<tr>
											<td><%=w.getKapan_name()%></td>
											<td><%=w.getStone_name()%></td>
											<td><%=w.getLot_name()%></td>
											<td><%=w.getActual_weight()%></td>
										</tr>
									</table>
										
									<div class="row insertPanel">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12"
											id="insertDiv">
											<form class="form" id="formSave" action="#"
												method="post">
												<input type="hidden" name="uId" value="<%=user_id%>">
												<input type="hidden" name="parentId" value="<%=w.getWork_history_id()%>">
												<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
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
													</div>
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
												</div>
											</form>
										</div>

									</div>

								</div>
							</div>
							</div>
							</div></div></div></div>
							
							
								<div class="row">
						<div class="card">
				
							<div class="card-body collapse in">
										<div class="card-block">
									
									<table class="table table-bordered">
										<tr>
										<th>No.</th>
											<th>Kapan Name</th>
											<th>Stone Name</th>
											<th>Lot Name</th>
											<th>Child Stone</th>
											<th>Weight</th>
											
										</tr>
									
									<%
									int i = 1;
									int j = 1;
									Double weight = 0.0;
									for(WorkHistoryBean ww : listOfChildWork1){ %>
									
										<tr>
											<td><%=i++ %></td>									
											<td><%=ww.getKapan_name()%></td>
											<td><%=ww.getStone_name()%></td>
											<td><%=ww.getLot_name()%></td>
											<td>Child <%=j++ %></td>
											<td><b><%=ww.getActual_weight()%></b></td>
										
										</tr>
										<%
										double finalValue =Double.parseDouble(ww.getActual_weight());
										weight = finalValue + weight;	
									} %>
										<td colspan="5"><b>Total</b></td>
										<td><b><%= weight%></b></td>
									</table>
										
		

								</div>
							
						
					</div>
				</div>

			</div>
</div>

						
			<script src="app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/scripts/forms/select/form-select2.min.js" type="text/javascript"></script>
     <script src="app-assets/vendors/js/forms/select/selectize.min.js" type="text/javascript"></script>
      <script src="app-assets/js/scripts/forms/select/form-selectize.min.js" type="text/javascript"></script>	
			
			<script type="text/javascript">
			
			$("#updateDiv").hide();
			$("#saveLoader").hide();
			$("#updateLoader").hide();
			
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
			
			
			function submitForm(){
				$("#saveBtn").hide();
				$("#saveLoader").show();
				//Ajax for get data using Specification Field  id
				$
						.ajax({
							//for specify Method
							method : "POST",
							//for call action
							url : 'insertChildWork',
							//form send data
							data : $("#formSave").serialize(),
							// action perform when successfully call action with specific method type
							success : function(data) {
								alert("Child Stone Added Successfully !!!");
								window.close();
								
							}
						});
				
				
				
			}
			</script>

</body>
</html>