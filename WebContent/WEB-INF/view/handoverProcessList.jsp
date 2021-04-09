
<%@page import="com.di.bean.HandoverStoneBean"%>
<%@page import="com.di.bean.HandoverBean"%>
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
<title>New Challan</title>
<%@include file="header.jsp" %>
<style type="text/css">
	td{
		white-space: nowrap;
	}
</style>

</head>
<body>
<%
AllListDAO allListDAO = new AllListDAO();

List<HandoverBean> listOfHandover = allListDAO.listOfhandover();
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-pencil-square-o"></i> Handover List</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Handover List</li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<!-- <div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					Round Outline Icon Buttons
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="javascript:window.location.href='redirect?p=YWRkU3RvbmU='" data-toggle="tooltip"
						data-original-title="Add New Challan">
						<i class="icon-plus"></i>
					</button>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div> -->

			</div>

			<br>
			<ul class="nav nav-tabs nav-linetriangle no-hover-bg">
 					<li class="nav-item">
						<a class="nav-link" id="base-tab" href="redirect?p=aGFuZG92ZXJQcm9jZXNz" aria-expanded="true">Handover</a>
					</li>
					<li class="nav-item ">
						<a class="nav-link active" id="base-tab" href="redirect?p=aGFuZG92ZXJQcm9jZXNzTGlzdA==" aria-expanded="true">Handover List</a>
					</li>
			</ul>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
						<div class="card-body collapse in">
								<div class="card-block">
									<div class="row tablePanel">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 11px;">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 3px;">Date</th>
						                                    <th style="padding: 3px;">Company</th>
						                                    <th style="padding: 3px;">Person_name</th>
						                                    <th style="padding: 3px;">Process</th>
						                                    <th style="padding: 3px;">Status</th>
						                                    <th style="padding: 3px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(HandoverBean h : listOfHandover){
					                            		
					                            		List<HandoverStoneBean> listOfHandoverStone = allListDAO.listOfhandoverStone(h.getHandover_id());
					                            		List<HandoverStoneBean> listOfHandoverStoneAssign = allListDAO.listOfhandoverStoneWithStatus(h.getHandover_id(),"assign");
					                            		List<HandoverStoneBean> listOfHandoverStoneReturn = allListDAO.listOfhandoverStoneWithStatus(h.getHandover_id(),"return");
					                            		
						                            %>
						                            <tr>
						                                    <td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(h.getHandover_date())%></td>
						                                 	<td style="padding: 3px;"><%=h.getCustomerBean().getCompany()%></td>
						                                    <td style="padding: 3px;" contenteditable="true" id="pname<%=h.getHandover_id()%>" onkeyup="updateName('<%=h.getHandover_id()%>','pname')"><%=h.getPerson_name()%></td>
						                                    <td style="padding: 3px;"><%=h.getProcess()%></td>
						                                    <td style="padding: 3px;">
						                                    	<%if(listOfHandoverStoneReturn.size() == listOfHandoverStone.size()){ %>
						                                    		<font style="color: green;font-weight: bold;font-size: 15px;"><%=listOfHandoverStoneReturn.size()%>/<%=listOfHandoverStone.size()%></font>
						                                    	<%}else{ %>
						                                    		<font style="color: red;font-weight: bold;font-size: 15px;"><%=listOfHandoverStoneReturn.size()%>/<%=listOfHandoverStone.size()%></font>
						                                    	<%} %>
						                                    </td>
						                                    <td style="padding: 3px;"><a href="redirect?p=aGFuZG92ZXJTdG9uZURhdGE=&id=<%=h.getHandover_id()%>"><i class="icon-file" title="Details" style="color: blue;cursor: pointer;"></i></a></td>
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
	
	<script src="app-assets/vendors/js/forms/select/select2.full.min.js" type="text/javascript"></script>
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/scripts/forms/select/form-select2.min.js" type="text/javascript"></script>
     <script src="app-assets/vendors/js/forms/select/selectize.min.js" type="text/javascript"></script>
      <script src="app-assets/js/scripts/forms/select/form-selectize.min.js" type="text/javascript"></script>
      
      <script type="text/javascript">
      $(document).ready(function(){
  		
  		//For Datatable initilization
  		$(".file-export").DataTable({
  			// for table structure
  	         dom: "Bfrtip",
  	         
  	         //for disable ordering
  	         "ordering": false,
  			
  	         //For page length in data tables
  	         "pageLength": 20,
  	         
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
      
      function showFullDetails(value){
  		location.href = "redirectToDetails?wId="+value;
  	}
      
      
      function updateName(id,action){
    	  var val = $("#"+action+id).text();
    	  
    	  $.ajax({
  			//for specify Method
  		    method: "GET",
  		    //for call action
  		    url: 'updateHandover',
  		    //form send data
  		    data:{hid : id,name:val},
  		    // action perform when successfully call action with specific method type
  		    success: function (data) {
  		    	
  		    }
  		});
    	  
      }
      </script>
      
</body>
</html>