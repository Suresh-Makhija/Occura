<%@page import="com.di.controller.AESEncrypt"%>
<%@page import="com.di.bean.CustomerBean"%>
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
<title>User List</title>
<%@include file="header.jsp" %>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();
	String encodeParentId = request.getParameter("cId");
	
	int decodeParentId = Integer.parseInt(new EncodeDecode().decodeString(String.valueOf(encodeParentId)));
	List<UserBean> listOfUser = allListDAO.listOfAllUser(decodeParentId);
	
	CustomerBean c = allListDAO.customerDetails(decodeParentId);
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

		<%if(auth == 1){%>
			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-users2"></i> User(s) of <%=c.getCompany()%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item"><a href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=">Customer Master</a></li>
		                  <li class="breadcrumb-item active">User List</li>
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
					<h2 class="content-header-title mb-0"><i class="icon-users2"></i> User(s) of <%=c.getCompany()%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">User List</li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						data-original-title="Add User" data-toggle="modal" data-target="#myModal">
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
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-3">
									<h4 class="card-title" id="striped-label-layout-icons">User(s) of <%=c.getCompany()%></h4>
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
						                                    <th style="padding: 5px;">Name</th>
						                                    <th style="padding: 5px;">Company</th>
						                                    <th style="padding: 5px;">Username</th>
						                                    <th style="padding: 5px;">Password</th>
						                                    <th style="padding: 5px;">Active</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	<%
						                            	
						                            	int count = 0;
						                            	/* for Extract Data */ 
						                            	for(UserBean u : listOfUser){
						                            		int cId = u.getCustomer_id();
						                            		CustomerBean customerBean = allListDAO.customerDetails(cId);
						                            	%>  
						                            	<tr>
						                            		<td style="padding: 5px;"><%=u.getName()%></td>
						                            		<td style="padding: 5px;"><%=customerBean.getCompany()%></td>
						                            		<td style="padding: 5px;"><b><%=u.getUsername()%></b></td>
						                            		<td style="padding: 5px;"><b><%=new AESEncrypt().decrypt(u.getPassword()) %></b></td>
						                            		<td style="padding: 5px;">
						                            			<%if(user_id != u.getUser_id()){ %>
						                            			<%if(u.getActive() == 1){%>
						                            				<input type="checkbox" name="active" checked="checked" id="active<%=u.getUser_id()%>" onclick="updateActiveStatus(<%=u.getUser_id()%>)">
						                            			<%}else{%>
						                            				<input type="checkbox" name="active" id="active<%=u.getUser_id()%>" onclick="updateActiveStatus(<%=u.getUser_id()%>)">
						                            			<%} %>	
						                            			<%} %>
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
			
			
			 <!-- Modal -->
			  <div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Add User</h4>
			        </div>
			        <div class="modal-body">
			        <form action="addUser" method="post">
			          <input type="hidden" name="parentId" value="<%=decodeParentId%>">
			          
			          <label>Name</label>
			          <input type="text" class="form-control" name="name" value="" placeholder="Enter Name" required>
			          
			          <label>Username</label>
			          <input type="text" class="form-control" name="username" value="" placeholder="Enter Username" required>
			          
			           <label>Password</label>
			          <input type="text" class="form-control" name="password" value="" placeholder="Enter Password" required>
			          <br>
			          <input type="submit" name="submit" value="Submit" class="btn btn-primary">
			         </form> 
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	
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
	
	
	function updateActiveStatus(userId){
		
		if($("#active"+userId).is(':checked')){
			authority = 1;
		}else{
			authority = 0;
		}
		
		$.ajax({
			//for specify Method
		    method: "POST",
		    //for call action
		    url: 'deactivateActivateUser',
		    //form send data
		    data: {authority : authority,user_id : userId},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
		    	
		    	
		    }
		});
		
	}
	
</script>
</body>
</html>