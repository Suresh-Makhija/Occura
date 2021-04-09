<%@page import="com.di.bean.ChallanOutLineBean"%>
<%@page import="com.di.bean.ChallanOutBean"%>
<%@page import="com.di.bean.WorkHistoryBean"%>
<%@page import="com.di.bean.ChallanLineBean"%>
<%@page import="com.di.bean.ChallanBean"%>
<%@page import="com.di.bean.InvoiceLineBean"%>
<%@page import="com.di.bean.InvoiceBean"%>
<%@page import="com.di.bean.CustomerTypeBean"%>
<%@page import="com.di.bean.ProductProcessBean"%>
<%@page import="com.di.dao.AllListDAO"%>
<%@page import="com.di.bean.ProductMasterBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://wwc.getWorkHistoryBean().w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Challan line List</title>
<%@include file="header.jsp"%>
</head>
<body>

<%
	AllListDAO allListDAO = new AllListDAO();

	String encodeCid = request.getParameter("cId");
	
	String decodeCid = new EncodeDecode().decodeString(encodeCid);
	
	List<ChallanLineBean> listOfChallanLine = allListDAO.listOfChallanLine(decodeCid);
	List<ChallanLineBean> listOfChallanLineForOutChallan = allListDAO.listOfChallanForOutChallanLine(decodeCid);
	
	ChallanBean cc = allListDAO.detailsOfChallan(decodeCid);
	int parentid = cc.getCustomerBean().getParent_customer_id();
	CustomerBean parent = allListDAO.customerDetails(parentid);
	
	
	List<ChallanOutBean> listOfOutChallan = allListDAO.listOfOutChallan(decodeCid);
%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-ios-list"></i> Challan Line</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item"><a href="redirect?p=Y2hhbGxhbkxpc3Q=">Challan List</a></li>
		                  <li class="breadcrumb-item active">Challan Line of challan Number : <%=cc.getChallan_number()%></li>
		                </ol>
		              </div>
          	 	 </div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="windoc.getWorkHistoryBean().history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>

	
			<ul class="nav nav-tabs nav-left nav-border-left">
					<li class="nav-item">
						<a class="nav-link active" id="baseVerticalLeft3-tab1" data-toggle="tab" aria-controls="tabVerticalLeft31" href="#tabVerticalLeft31" aria-expanded="true">Challan Details</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="baseVerticalLeft3-tab2" data-toggle="tab" aria-controls="tabVerticalLeft32" href="#tabVerticalLeft32" aria-expanded="false">Out Challan <div class="tag tag-pill tag-primary"><%=listOfOutChallan.size()%></div></a>
					</li>
			</ul>
			<br>
			<div class="tab-content px-1">
								<div role="tabpanel" class="tab-pane active" id="tabVerticalLeft31" aria-expanded="true" aria-labelledby="baseVerticalLeft3-tab1">
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-6">
									<h4 class="card-title" id="striped-label-layout-icons">Challan List of challan Number : <%=cc.getChallan_number()%></h4>
								</div>
								<%if(parent.getCustomer_code().trim().equalsIgnoreCase("C-00002")){%>
									<div class="col-md-6" align="right">
										<a href="redirect?p=Y2hhbGxhbkFkZFN0b25l=&cId=<%=encodeCid%>"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-plus" style="font-size: 15px;font-weight: bold;" title="Add Stone in challan"></i> Add Stone</button></a>
										<a href="redirect?p=c3RhckdlbXNDaGFsbGFu&cId=<%=encodeCid%>" target="_blank"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-printer4" style="font-size: 15px;font-weight: bold;" title="Print Challan"></i></button></a>
									</div>
								<%}else if(parent.getCustomer_code().trim().equalsIgnoreCase("C-00001")){%>
									<div class="col-md-6" align="right">
										<a href="redirect?p=Y2hhbGxhbkFkZFN0b25l=&cId=<%=encodeCid%>"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-plus" style="font-size: 15px;font-weight: bold;" title="Add Stone in challan"></i> Add Stone</button></a>
										<a href="redirect?p=c2x0bENoYWxsYW4=&cId=<%=encodeCid%>" target="_blank"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-printer4" style="font-size: 15px;font-weight: bold;" title="Print Full Challan"></i> Full Challan</button></a>
										<a href="redirect?p=c2x0bENoYWxsYW5Db25zb2xpZGV0=&cId=<%=encodeCid%>" target="_blank"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-printer4" style="font-size: 15px;font-weight: bold;" title="Print Combine Challan"></i> Consolidate Challan</button></a>
									</div>
								<%} %>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 12px;">
						                            <thead>
						                               <tr>
						                                    <th style="padding: 3px;">No</th>
						                                    <th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;">Customer Name</th>
						                                    <th style="padding: 3px;">Company Name</th>
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
					                            	for(ChallanLineBean c : listOfChallanLine){
					                            		String wId = c.getWorkHistoryBean().getWork_history_id();
					                            		String encodeWork_id = new EncodeDecode().encodeString(wId);
					                            		
														List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(wId);
					                            		
						                            %>
						                            	<tr>
						                            		<td style="padding: 3px;"><%=++count%></td>
						                            		<td style="padding: 3px;"><font style="font-weight: bold;">Parent</font></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getCustomerBean().getFullname()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getUserBean().getName()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(c.getWorkHistoryBean().getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(c.getWorkHistoryBean().getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(c.getWorkHistoryBean().getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(c.getWorkHistoryBean().getIn_stock_datetime())%></small>
						                            			<%}else if(c.getWorkHistoryBean().getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(c.getWorkHistoryBean().getCleared_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<i class="icon-trash" title="Delete Line from Challan" style="color: red;cursor: pointer;" onclick="deleteLine('<%=c.getChallan_line_id()%>','<%=c.getWorkHistoryBean().getWork_history_id()%>')"></i>
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            		</td>
						                            	</tr>
						                            	<%for(WorkHistoryBean w : listOfChildWork){ %>
							                            	<tr>
							                            		<td style="padding: 3px;"></td>
							                            		<td style="padding: 3px;" align="right"><i class="icon-arrow-right4"></i></td>
							                            		<td style="padding: 3px;"><%=w.getCustomerBean().getFullname()%></td>
							                            		<td style="padding: 3px;"><%=w.getCustomerBean().getCompany()%></td>
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
							                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(w.getCleared_datetime())%></small>
							                            			<%} %>
							                            		</td>
							                            		<td style="padding: 3px;">
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
						</div>
					</div>
				</div>

			</div>
			</div>
			
			<div class="tab-pane" id="tabVerticalLeft32" aria-labelledby="baseVerticalLeft3-tab2">
			
			
			<%if(listOfChallanLineForOutChallan.size() != 0){ %>
			<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-8">
									<h4 class="card-title" id="striped-label-layout-icons">Generate Out Challan</h4>
								</div>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 						<form action="generateOutChallan" method="post">
					 							<button type="submit" class="btn btn-primary" id="saveBtn">
													<i class="icon-check2"></i> Generate Out Challan
												</button>
					 						<input type="hidden" name="challan_id" value="<%=decodeCid%>">
											<input type="hidden" name="userId" value="<%=user_id%>">
											<input type="hidden" name="userCustId" value="<%=userCustId%>">
					 							<table class="table table-striped table-bordered" style="font-size: 12px;">
						                            <thead>
						                               <tr>
						                               		<th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;">No</th>
						                                    <th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;">Customer Name</th>
						                                    <th style="padding: 3px;">Company Name</th>
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
					                            		count = 0;
					                            	/* for Extract Data */ 
					                            	for(ChallanLineBean c : listOfChallanLineForOutChallan){
					                            		String wId = c.getWorkHistoryBean().getWork_history_id();
					                            		String encodeWork_id = new EncodeDecode().encodeString(wId);
					                            		
														List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(wId);
					                            		
						                            %>
						                            	<tr>
						                            		<td style="padding: 3px;"><input type="checkbox" name="wId" value="<%=wId%>"></td>
						                            		<td style="padding: 3px;"><%=++count%></td>
						                            		<td style="padding: 3px;"><font style="font-weight: bold;">Parent</font></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getCustomerBean().getFullname()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=c.getWorkHistoryBean().getUserBean().getName()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(c.getWorkHistoryBean().getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(c.getWorkHistoryBean().getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(c.getWorkHistoryBean().getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(c.getWorkHistoryBean().getIn_stock_datetime())%></small>
						                            			<%}else if(c.getWorkHistoryBean().getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(c.getWorkHistoryBean().getIn_stock_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            		</td>
						                            	</tr>
						                            <%} %>	
						                            </tbody>
					                        </table>
					                        </form>
					                       </div> 
										</div>
										
								
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<%} %>
						<div class="content-header row">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-8">
									<h4 class="card-title" id="striped-label-layout-icons">Generated Out Challan</h4>
								</div>
								<a class="heading-elements-toggle"><i
									class="icon-ellipsis font-medium-3"></i></a>
							</div>
							<div class="card-body collapse in">
								<div class="card-block">
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="tableDiv">
					 						<div class="table-responsive">
					 							<table class="table table-bordered" style="font-size: 12px;">
						                            <tbody>
						                            	 <%
					                            		count = 0;
					                            	/* for Extract Data */ 
					                            	for(ChallanOutBean c : listOfOutChallan){
					                            		String challanOutId = c.getChallan_out_id();
					                            		String encodeCoid = new EncodeDecode().encodeString(challanOutId);
					                            		List<ChallanOutLineBean> listOfChallanOutLine = allListDAO.listOfOutChallanLine(challanOutId);
					                            		
						                            %>
						                            	<tr>
						                            		<td><font style="font-weight: bold;font-size: 15px;"><%=c.getChallanBean().getChallan_number()%>_<%=c.getChallan_out_number()%> (Out)</font></td>
						                            		<td><%=ddmmyyyyhhmmss.format(c.getInsert_date())%></td>
						                            		<td>
						                            			<%if(parent.getCustomer_code().trim().equalsIgnoreCase("C-00002")){%>
																	<div class="col-md-4" align="right">
																		<a href="redirect?p=c3RhckdlbXNPdXRDaGFsbGFu&&coId=<%=encodeCoid%>" target="_blank"><button type="button" class="btn-icon btn btn-secondary btn-round"><i class="icon-printer4" style="font-size: 15px;font-weight: bold;" title="Print Challan"></i></button></a>
																	</div>
																<%} %>
						                            		</td>
						                            	</tr>
						                            	
						                            	<tr>
						                            		<td colspan="3">
						                            			<table class="table table-bordered" style="font-size: 12px;">
						                            <thead>
						                               <tr>
						                                    <th style="padding: 3px;">No</th>
						                                    <th style="padding: 3px;"></th>
						                                    <th style="padding: 3px;">Customer Name</th>
						                                    <th style="padding: 3px;">Company Name</th>
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
					                            		count = 0;
					                            	/* for Extract Data */ 
					                            	for(ChallanOutLineBean col : listOfChallanOutLine){
					                            		String wId = col.getWorkHistoryBean().getWork_history_id();
					                            		String encodeWork_id = new EncodeDecode().encodeString(wId);
					                            		
														List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(wId);
					                            		
						                            %>
						                            	<tr>
						                            		<td style="padding: 3px;"><%=++count%></td>
						                            		<td style="padding: 3px;"><font style="font-weight: bold;">Parent</font></td>
						                            		<td style="padding: 3px;"><%=col.getWorkHistoryBean().getCustomerBean().getFullname()%></td>
						                            		<td style="padding: 3px;"><%=col.getWorkHistoryBean().getCustomerBean().getCompany()%></td>
						                            		<td style="padding: 3px;"><%=col.getWorkHistoryBean().getKapan_name()%></td>
						                            		<td style="padding: 3px;"><%=col.getWorkHistoryBean().getLot_name()%></td>
						                            		<td style="padding: 3px;"><%=col.getWorkHistoryBean().getStone_name()%></td>
						                            		<td style="padding: 3px;"><%=col.getWorkHistoryBean().getActual_weight()%></td>
						                            		<td style="padding: 3px;"><%=col.getWorkHistoryBean().getUserBean().getName()%></td>
						                            		<td style="padding: 3px;"><%=ddmmyyyyhhmmss.format(col.getWorkHistoryBean().getInsert_date())%></td>
						                            		<td style="padding: 3px;">
						                            			<%if(col.getWorkHistoryBean().getIn_stock() == 0){ %>
						                            				<font style="color: blue;font-weight: bold;">In-Stock</font>
						                            			<%}else if(col.getWorkHistoryBean().getIn_stock() == 1){ %>
						                            				<font style="color: orange;font-weight: bold;">Process Done</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(col.getWorkHistoryBean().getIn_stock_datetime())%></small>
						                            			<%}else if(col.getWorkHistoryBean().getIn_stock() == 2){%>
						                            				<font style="color: green;font-weight: bold;">Cleared</font><br>
						                            				<small class="text-muted"><%=ddmmyyyyhhmmss.format(col.getWorkHistoryBean().getIn_stock_datetime())%></small>
						                            			<%} %>
						                            		</td>
						                            		<td style="padding: 3px;">
						                            			<i class="icon-file" title="Show Details" style="color: orange;cursor: pointer;" onclick="showFullDetails('<%=encodeWork_id%>')"></i>
						                            		</td>
						                            	</tr>
						                            <%} %>	
						                            </tbody>
					                        </table>
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
	</div>
	
	
	<script type="text/javascript">
	
	$("#updateDiv").hide();
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
	
	function deleteLine(cid,wid){
		
		var ratVal = confirm("Are you sure?")
		
		if(ratVal == true){
		
		//Ajax for get data using Specification Field  id
		$.ajax({
			//for specify Method
		    method: "GET",
		    //for call action
		    url: 'deleteChallanLine',
		    //form send data
		    data:{challanId : cid,wId : wid, uid : '<%=user_id%>'},
		    // action perform when successfully call action with specific method type
		    success: function (data) {
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