
<%@page import="com.di.bean.BundleLogBean"%>
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

String bundleNum = request.getParameter("bunNum");
WorkHistoryBean ww = allListDAO.workHistoryIdByBundleId(bundleNum);
List<WorkHistoryBean> listOfStone = allListDAO.listOfWorkHistoryByBundle(bundleNum);

double weight = 0;
for(WorkHistoryBean www : listOfStone){
	weight += Double.parseDouble(www.getActual_weight()); 					                            			
}

%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-pencil-square-o"></i> <%=bundleNum%></h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active"><%=bundleNum%></li>
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

			
			<font>Customer Name  : <b><%=ww.getCustomerBean().getFullname()%></b></font> &nbsp;&nbsp; <font>Company Name  : <b><%=ww.getCustomerBean().getCompany()%></b></font>
			&nbsp;&nbsp; <font>Total Stone  : <b><%=listOfStone.size()%></b></font> &nbsp;&nbsp; <font>Total Weight  : <b><%=weight%></b></font>
			
			<br>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
						<div class="card-body collapse in">
								<div class="card-block">
							<%
							String stone = "active";
							String log = "";
							if(request.getParameter("log") != null){
								 stone = "";
								 log = "active";
							}
							%>
							<ul class="nav nav-tabs nav-linetriangle no-hover-bg">
								<li class="nav-item">
									<a class="nav-link <%=stone%>" id="base-tab41" data-toggle="tab" aria-controls="tab41" href="#tab41" aria-expanded="true">Stone Data</a>
								</li>
								<li class="nav-item">
									<a class="nav-link <%=log%>" id="base-tab42" data-toggle="tab" aria-controls="tab42" href="#tab42" aria-expanded="false">Logs</a>
								</li>
							</ul>
							<div class="tab-content px-1 pt-1">
								<div role="tabpanel" class="tab-pane <%=stone%>" id="tab41" aria-expanded="true" aria-labelledby="base-tab41">
								<h3>STONE LIST</h3>
																		<div class="row tablePanel">
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
						                                    <th style="padding: 3px;">Added By</th>
						                                    <th style="padding: 3px;">Insert Date</th>
						                                    <th style="padding: 3px;">Stock</th>
						                                    <th style="padding: 3px;">Action</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            <%
					                            	int count = 0;
					                            	/* for Extract Data */ 
					                            	for(WorkHistoryBean w : listOfStone){
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
						                            		<td style="padding: 3px;"><%=w.getUserBean().getName()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(w.getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(w.getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(w.getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(w.getIn_stock_datetime())%></small>
						                            			<%}else if(w.getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(w.getIn_stock_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<%if(w.getIn_stock() == 0){ %>
						                            				<a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==&wId=<%=encodeWork_id%>"><i class="icon-pencil2" title="Edit" onclick="editData(<%=w.getWork_history_id()%>);" style="cursor: pointer;color: green"></i></a>
						                            				<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteHistory(<%=w.getWork_history_id()%>)"></i>
						                            			<%} %>
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            		</td>
						                            	</tr>
						                            	
						                            	<%for(WorkHistoryBean www : listOfChildWork){
						                            		
						                            		 wId = www.getWork_history_id();
					                            		 	encodeWork_id = new EncodeDecode().encodeString(wId);
					                            		%>
						                            		<tr>
						                            		<td style="padding: 3px;"><%=++count%></td>
						                            		<td style="padding: 3px;" align="right"><i class="icon-arrow-right4"></i></td>
						                            		<td style="padding: 3px;"><%=www.getCustomerBean().getFullname()%></td>
						                            		<td style="padding: 3px;"><%=www.getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;"><%=www.getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=www.getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=www.getUserBean().getName()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(www.getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(www.getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(www.getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(www.getIn_stock_datetime())%></small>
						                            			<%}else if(www.getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(www.getIn_stock_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<%if(w.getIn_stock() == 0){ %>
						                            				<a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==&wId=<%=encodeWork_id%>"><i class="icon-pencil2" title="Edit" onclick="editData(<%=www.getWork_history_id()%>);" style="cursor: pointer;color: green"></i></a>
						                            				<i class="icon-trash" title="Delete" style="color: red;cursor: pointer;" onclick="deleteHistory(<%=www.getWork_history_id()%>)"></i>
						                            			<%} %>
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            		</td>
						                            		</tr>
						                            	<%} %>
						                            <%} %>	
						                            </tbody>
					                        </table>
					                       </div> 
					 					
										</div>
									</div>
									
								</div>
								<div class="tab-pane <%=log%>" id="tab42" aria-labelledby="base-tab42">
									<h3>LOGS</h3>
									
									<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
									<form action="insertLog" method="post">
									<input type="hidden" name ="bundle_num" value="<%=bundleNum%>">
										<div class="row">
											<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
												<div class="form-group">
													<label for="userinput2">Person Name</label> <input
														type="text" id="name"
														class="form-control border-primary"
														placeholder="Person Name" name="name" required">
												</div>
											</div>

											<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
												<div class="form-group">
													<label for="userinput2">Remark</label> 
													<textarea id="remark" rows="" cols="" name="remark" class="form-control border-primary" placeholder="Max 500 words" required></textarea>
												</div>
											</div>
										</div>
										
										<br>
										<div class="form-actions right">
													<button type="submit" class="btn btn-primary" id="saveBtn" onclick="submitForm();">
														<i class="icon-check2"></i> Save
													</button>
												</div>
												</form>
									</div>
									
									<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12" style="border-left: dotted 1px;">
										<div class="table-responsive">
											<table class="table table-striped table-bordered file-export" style="font-size: 11px;">
												<thead>
						                                <tr>
						                                    <th style="padding: 3px;">Date</th>
						                                    <th style="padding: 3px;">Name</th>
						                                    <th style="padding: 3px;">Remark</th>
						                                </tr>
						                            </thead>
						                            
						                            <tbody>
						                            <%
						                            	List<BundleLogBean> listOfLog = allListDAO.listOfLogByBundle(bundleNum);
						                            	for(BundleLogBean b : listOfLog){
						                            %>
						                            	<tr>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(b.getInsert_date())%></td>
						                            		<td style="padding: 3px;"><%=b.getAssign_name()%></td>
						                            		<td style="padding: 3px;white-space: pre-wrap;"><%=b.getBundle_log()%></td>
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
      </script>
      
      <script type="text/javascript">
      
      function deleteHistory(value){
  		
  		var ratval = confirm("Are you sure?");
  		
  		if(ratval == true){
  			location.href = "deactiveWorkHistory?wId="+value;
  		}
  		
  	}
      
      
      function showFullDetails(value){
  		location.href = "redirectToDetails?wId="+value;
  	}
      
      </script>
      
</body>
</html>