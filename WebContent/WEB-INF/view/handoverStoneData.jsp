
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

String handoverid = request.getParameter("id");
List<HandoverStoneBean> listOfHandoverStone = allListDAO.listOfhandoverStone(handoverid);
HandoverBean handoverBean = allListDAO.handoverDetails(handoverid);

List<HandoverStoneBean> listOfHandoverStoneAssign = allListDAO.listOfhandoverStoneWithStatus(handoverid,"assign");
List<HandoverStoneBean> listOfHandoverStoneReturn = allListDAO.listOfhandoverStoneWithStatus(handoverid,"return");
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
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>

			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
						<div class="card-body collapse in">
								<div class="card-block">
									<div class="row tablePanel">
									
									<table class="table table-bordered">
										<tr>
											<th>Company Name</th>
											<th>Assign Person</th>
											<th>Process</th>
											<th>Status</th>
											<th>Date</th>
										</tr>
										
										<tr>
											<td><%=handoverBean.getCustomerBean().getCompany()%></td>
											<td><%=handoverBean.getPerson_name()%></td>
											<td><%=handoverBean.getProcess()%></td>
											<td>
												<%if(listOfHandoverStoneReturn.size() == listOfHandoverStone.size()){ %>
						                                    		<font style="color: green;font-weight: bold;font-size: 15px;"><%=listOfHandoverStoneReturn.size()%>/<%=listOfHandoverStone.size()%></font>
						                                    	<%}else{ %>
						                                    		<font style="color: red;font-weight: bold;font-size: 15px;"><%=listOfHandoverStoneReturn.size()%>/<%=listOfHandoverStone.size()%></font>
						                                    	<%} %>
											</td>
											<td><%=ddmmyyyyhhmmss.format(handoverBean.getHandover_date())%></td>
										</tr>
									</table>
									
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 11px;">
						                            <thead>
						                                <tr>
						                                    <th style="padding: 3px;">No</th>
						                                    <th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;">Kapan Name</th>
						                                    <th style="padding: 3px;">Lot Name</th>
						                                    <th style="padding: 3px;">Stone Name</th>
						                                    <th style="padding: 3px;">Actual Weight</th>
						                                    <th style="padding: 3px;">Insert Date</th>
						                                    <th style="padding: 3px;">Status</th>
						                                    <th style="padding: 3px;">Remark</th>
						                                    <th style="padding: 3px;">Assign Date</th>
						                                    <th style="padding: 3px;">Return Date</th>
						                                    <th style="padding: 3px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(HandoverStoneBean h : listOfHandoverStone){
					                            		
					                            		WorkHistoryBean w = allListDAO.workHistoryId(h.getWorkHistoryBean().getWork_history_id());
					                            		
					                            		String wId = w.getWork_history_id();
					                            		String encodeWork_id = new EncodeDecode().encodeString(wId);
					                            		
														List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(wId);
					                            		
						                            %>
						                            	<tr>
						                            		<td style="padding: 3px;"><%=++count%></td>
						                            		<td style="padding: 3px;"><font style="font-weight: bold;">Parent</font></td>
						                            		<td style="padding: 3px;"><%=w.getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=w.getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(w.getInsert_date())%></td>
						                            		<th style="padding: 3px;" id="status<%=h.getHandover_stone_id()%>">
						                            			<%if(h.getStatus().equals("assign")){%>
						                            				<font color="red" style="cursor: pointer;" onclick="updateStatus('<%=h.getHandover_stone_id()%>','return');"><%=h.getStatus().toUpperCase()%></font>
						                            			<%}else if(h.getStatus().equals("return")){%>
						                            				<font color="green" style="cursor: pointer;" onclick="updateStatus('<%=h.getHandover_stone_id()%>','assign');"><%=h.getStatus().toUpperCase()%></font>
						                            			<%} %>
						                            		</th>
						                            		<td style="padding: 3px;" contenteditable="true" id="pname<%=h.getHandover_stone_id()%>" onkeyup="updateRemark('<%=h.getHandover_stone_id()%>','pname')">
									                            <%=h.getRemark()%>	
						                            		</td>
						                            		<td style="padding: 3px;" >
						                            		
						                            			<%=ddmmyyyyhhmmss.format(h.getInsert_date_time())%>
						                            		
						                            		</td>
						                            		<td style="padding: 3px;" id="date<%=h.getHandover_stone_id()%>">
						                            			<%if(h.getStatus().equals("assign")){%>
						                            				-
						                            			<%}else if(h.getStatus().equals("return")){%>
						                            				<%=ddmmyyyyhhmmss.format(h.getReturn_date_time())%>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<i class="icon-trash" title="delete" style="color: red;cursor: pointer;" onclick="deleteHandover('<%=h.getHandover_stone_id()%>')"></i>
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
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
      
      
      function updateStatus(id,action){
    	  
    	  $.ajax({
				//for specify Method
				method : "GET",
				//for call action
				url : 'updateHandoverStatus',
				//form send data
				data : {
					id : id,
					action : action
				},
				// action perform when successfully call action with specific method type
				success : function(data) {
					//parse data into json format
					if(action == "return"){
						var html = "<font color=\"green\" style=\"cursor: pointer;\" onclick=\"updateStatus('"+id+"','assign');\">RETURN</font>";
						$("#status"+id).html(html);
						$("#date"+id).html(data);
					}
					
					if(action == "assign"){
						var html = "<font color=\"red\" style=\"cursor: pointer;\" onclick=\"updateStatus('"+id+"','return');\">ASSIGN</font>";
						$("#status"+id).html(html);
						$("#date"+id).html("-");
					} 
					
				}
			});
    	  
      }
      
      function updateRemark(id,action){
    	  var val = $("#"+action+id).text().trim();
    	  
    	  $.ajax({
  			//for specify Method
  		    method: "GET",
  		    //for call action
  		    url: 'updateHandoverRemark',
  		    //form send data
  		    data:{hsid : id,remark:val},
  		    // action perform when successfully call action with specific method type
  		    success: function (data) {
  		    	
  		    }
  		});
    	  
      }
      
 function deleteHandover(id){
    
	 var ratval = confirm("Are you sure?");
	 
	 if(ratval == true){
    	  $.ajax({
				//for specify Method
				method : "GET",
				//for call action
				url : 'deleteHandover',
				//form send data
				data : {
					id : id,
				},
				// action perform when successfully call action with specific method type
				success : function(data) {
					//parse data into json format
					location.reload();
				}
			});
	 } 
    	  
      }
      
      
      function showFullDetails(value){
  		location.href = "redirectToDetails?wId="+value;
  	}
      </script>
      
</body>
</html>