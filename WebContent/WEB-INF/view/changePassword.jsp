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
<title>Change Password</title>
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
					<h2 class="content-header-title mb-0"><i class="icon-key3"></i> Change Password</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Change Password</li>
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
									<h4 class="card-title" id="striped-label-layout-icons">Change Password</h4>
								</div>
								
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
								<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
								</div>
										<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
											<!-- This Hidden field shiow the status which action perform in servlet -->
												<div class="form-body">
													<h4 class="form-section">Enter Your Password Here</h4>
													<div class="row">
														<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">	
															<div class="form-group">
																<label for="userinput1">Enter Password</label> <input type="text"
																	id="pass" class="form-control border-primary"
																	placeholder="Enter Password" name="pass" required>
															</div>
														</div>
														<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="userinput2">Re-Enter Password</label> <input type="text"
																	id="rePass" class="form-control border-primary"
																	placeholder="Re-enter Password" name="rePass" required>
															</div>
														</div>
													</div>
												</div>
												<br>
												<div align="right">
													<button type="button" class="btn btn-primary" onclick="checkPassRePass();">
														<i class="icon-check2"></i> Update
													</button>
												</div>
										</div>
										<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
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
		function checkPassRePass(){
			var pass = $("#pass").val();
			var repass = $("#rePass").val();
			
			if(pass == repass){
				$.ajax({
					//for specify Method
				    method: "POST",
				    //for call action
				    url: 'changePassword',
				    //form send data
				    data: {pass : pass,user_id : <%=user_id%>},
				    // action perform when successfully call action with specific method type
				    success: function (data) {
				    	
				    	alert("Password successfully change!!! Please login again..");
				    	location.href = "logout";
				    	
				    }
				});
			}else{
				alert("Password or Re-entered password does not match !!!");
			}
		}
	</script>
	
	<script type="text/javascript" src="customJs/dontBack.js"></script>
	
</body>
</html>