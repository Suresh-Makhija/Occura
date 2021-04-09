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
</head>
<body>
<%
AllListDAO allListDAO = new AllListDAO();
List<CustomerBean> listOfCustomer =  null;
List<CustomerBean> listOfCustomerForList =  allListDAO.listOfSubCustomer();
if(auth != 1){
	listOfCustomer =  allListDAO.listOfCustomerByParentId(userLoginCustId);
	listOfCustomerForList =  allListDAO.listOfCustomerByParentId(userLoginCustId);
}

%>
	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0"><i class="icon-clipboard"></i> Analyzer Status</h2>
					<div class="row breadcrumbs-top">
		              <div class="breadcrumb-wrapper col-xs-12">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
		                  <li class="breadcrumb-item active">Analyzer Status</li>
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
								
								<div class="row">
									<div class="col-md-2 col-lg-2 col-sm-6 col-xs-6">	
										Select Customer
									</div>
									<div class="col-md-4 col-lg-4 col-sm-6 col-xs-6">	
															<div class="form-group">
																<select class="form-control border-primary" name="custId" onchange="getData(this.value)">
																	<option value="" selected="selected">---SELECT CUSTOMER---</option>
																	<%for(CustomerBean c : listOfCustomerForList){%>
																			<option value="<%=c.getCustomer_id()%>"><%=c.getFullname()%> (<%=c.getCompany()%>)</option>
																	<%}%>
																</select>
																
															</div>
														</div>
													</div>	
													<hr>
								
									<div class="row tablePanel">
									
									<div class="card-block">
						<ul class="nav nav-tabs">
							<li class="nav-item">
							<a class="nav-link active" id="baseIcon-tab1" data-toggle="tab" aria-controls="tabIcon1" href="#tabIcon1" aria-expanded="true"><i class="icon-play5"></i> IN-Work <div class="tag tag-pill tag-primary" id="pillInwork">0</div></a>
							</li>
							<li class="nav-item">
							<a class="nav-link" id="baseIcon-tab2" data-toggle="tab" aria-controls="tabIcon2" href="#tabIcon2" aria-expanded="false"><i class="icon-pause4"></i> Pending <div class="tag tag-pill tag-default" id="pillPending">0</div></a>
							</li>
							<li class="nav-item">
							<a class="nav-link" id="baseIcon-tab3" data-toggle="tab" aria-controls="tabIcon3" href="#tabIcon3" aria-expanded="false"><i class="icon-check2"></i> Completed <div class="tag tag-pill tag-success" id="pillCompleted">0</div></a>
							</li>
							<li class="nav-item">
							<a class="nav-link" id="baseIcon-tab4" data-toggle="tab" aria-controls="tabIcon3" href="#tabIcon4" aria-expanded="false"><i class="icon-cross2"></i> Failed <div class="tag tag-pill tag-danger" id="pillFailed">0</div></a>
							</li>
						</ul>
						<div class="tab-content px-1 pt-1">
							<div role="tabpanel" class="tab-pane active" id="tabIcon1" aria-expanded="true" aria-labelledby="baseIcon-tab1">
								<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 13px;" id="inWork">
						                            <thead>
						                                <tr>
						                                    <th>No</th>
						                                    <th>Company</th>
						                                    <th>Stone Name</th>
						                                    <th>Entry Date</th>
						                                    <th>Start Date</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	
						                            </tbody>
					                        </table>
					                       </div> 
							</div>
							<div class="tab-pane" id="tabIcon2" aria-labelledby="baseIcon-tab2">
								<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 13px;" id="pending">
						                            <thead>
						                                <tr>
						                                    <th>No</th>
						                                     <th>Company</th>
						                                    <th>Stone Name</th>
						                                    <th>Entry Date</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	
						                            </tbody>
					                        </table>
					                       </div> 
							</div>
							<div class="tab-pane" id="tabIcon3" aria-labelledby="baseIcon-tab3">
								<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 13px;" id="completed">
						                            <thead>
						                                <tr>
						                                    <th>No</th>
						                                     <th>Company</th>
						                                    <th>Stone Name</th>
						                                     <th>Rough Weight</th>
						                                    <th>Entry Date</th>
						                                    <th>Start Date</th>
						                                    <th>End Date</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	
						                            </tbody>
					                        </table>
					                       </div> 
							</div>
							<div class="tab-pane" id="tabIcon4" aria-labelledby="baseIcon-tab4">
								<div class="table-responsive">
					 							<table class="table table-striped table-bordered file-export" style="font-size: 13px;" id="failed">
						                            <thead>
						                                <tr>
						                                    <th>No</th>
						                                     <th>Company</th>
						                                    <th>Stone Name</th>
						                                    <th>Entry Date</th>
						                                    <th>Start Date</th>
						                                    <th>End Date</th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                            	
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
  	         "pageLength": 10,
  	         
  	     	// for button show in data tables
  	        buttons: [
              {
                  extend: 'excel',
                  filename: 'Data'
              }
          ]
  	        
  	    }),
  	    
  	  	//For Design of that button
  	    $(".buttons-excel").addClass("btn btn-primary mr-1")
  				
  	});
      
      
      var allCountCompleted = 0;
      var allCountInwork = 0;
      var allCountInQueue = 0;
      var allCountFailed = 0;
      
      function getData(id){
    	 
    	  
    	//Ajax for get data using Specification Field  id
  		$.ajax({
  			//for specify Method
  		    method: "POST",
  		    //for call action
  		    url: 'detailsOfCustomerMaster',
  		    //form send data
  		    data:{cId : id},
  		    // action perform when successfully call action with specific method type
  		    success: function (data) {
  		    	
  		    	//parse data into json format
  		    	 var json = JSON.parse(data);
  		    	 $('#completed').DataTable().clear().draw();
  		    	 $('#inWork').DataTable().clear().draw();
  		    	 $('#pending').DataTable().clear().draw();
  		    	 $('#failed').DataTable().clear().draw();
  		    	 
  		    	  allCountCompleted = 0;
  		          allCountInwork = 0;
  		          allCountInQueue = 0;
  		          allCountFailed = 0;
  		    	 
  				 completedData('Completed',json.company,json.customer_code);
  				 inWorkData('In Work',json.company,json.customer_code);
  				 inQueueData('InQueue',json.company,json.customer_code);
  				 failedData('Failed',json.company,json.customer_code);
  		    	
  		    }
  		});
    	
    	
      }
      
      
      
       
  		<%
  		if(listOfCustomer != null){
  		for(CustomerBean c : listOfCustomer){ %>
    	var custCode = '<%=c.getCustomer_code()%>';
    	var SLT_Planning = 'Completed';
        var company = '<%=c.getCompany()%>';
        	completedData(SLT_Planning,company,custCode);
    	<%}}%>
    	
    	function completedData(SLT_Planning,company,custCode){
    		$.ajax({
    			//for specify Method
    		    method: "POST",
    		    //for call action
    		    url: 'apiForAnalyzer',
    		    //form send data
    		    data:{customer_code : custCode,SLT_Planning : SLT_Planning},
    		    // action perform when successfully call action with specific method type
    		    success: function (data) {
    		    	//parse data into json format
    		    	 var json = JSON.parse(data);
    		    	var i = 0;
    		    	 $.each(json, function(i, f)
       				{
    		    		   i++;
    		    		   var t = $('#completed').DataTable();
    		    		   var rough_weight = -1;
    		    		   if(String(f.Rough_weight) != 'undefined'){
    		    			   rough_weight = f.Rough_weight;
    		    		   }
    		    		   
    		        		 t.row.add( [
    		        	           i,
    		        	           company,
    		        	           f.StoneName,
    		        	           rough_weight,
    		        	           f.DateTime_Entry,
    		        	           f.DateTime_Start,
    		        	           f.DateTime_End
    		        	        ] ).draw( false );
       				});
    		    	 
    		    	 
    		    	 var count = Object.keys(json).length;
    		    	 allCountCompleted = allCountCompleted + count;
    		    	 $('#pillCompleted').html(allCountCompleted);
    		    }
    		});
    	}
    	
    	
    	<%
  		if(listOfCustomer != null){
  		for(CustomerBean c : listOfCustomer){ %>
    	var custCode = '<%=c.getCustomer_code()%>';
    	var SLT_Planning = 'In Work';
    	var company = '<%=c.getCompany()%>';
  		 	inWorkData(SLT_Planning,company,custCode);
    	<%}}%>
    	
    	function inWorkData(SLT_Planning,company,custCode){
    		$.ajax({
    			//for specify Method
    		    method: "POST",
    		    //for call action
    		    url: 'apiForAnalyzer',
    		    //form send data
    		    data:{customer_code : custCode,SLT_Planning : SLT_Planning},
    		    // action perform when successfully call action with specific method type
    		    success: function (data) {
    		    	//parse data into json format
    		    	 var json = JSON.parse(data);
    		    	var i = 0;
    		    	 $.each(json, function(i, f)
       				{
    		    		   i++;
    		    		   var t = $('#inWork').DataTable();
    		        		 t.row.add( [
    		        	           i,
    		        	           company,
    		        	           f.StoneName,
    		        	           f.DateTime_Entry,
    		        	           f.DateTime_Start,
    		        	        ] ).draw( false );
       				});
    		    	 var count = Object.keys(json).length;
    		    	 allCountInwork = allCountInwork + count;
    		    	 $('#pillInwork').html(allCountInwork);
    		    	
    		    }
    		});
    	}
    	
    	
    	<%
  		if(listOfCustomer != null){
  		for(CustomerBean c : listOfCustomer){ %>
    	var custCode = '<%=c.getCustomer_code()%>';
    	var SLT_Planning = 'InQueue';
    	var company = '<%=c.getCompany()%>';
    	
    		inQueueData(SLT_Planning,company,custCode);
    	
    	<%}}%>
    	
    	function inQueueData(SLT_Planning,company,custCode){
    		$.ajax({
    			//for specify Method
    		    method: "POST",
    		    //for call action
    		    url: 'apiForAnalyzer',
    		    //form send data
    		    data:{customer_code : custCode,SLT_Planning : SLT_Planning},
    		    // action perform when successfully call action with specific method type
    		    success: function (data) {
    		    	//parse data into json format
    		    	 var json = JSON.parse(data);
    		    	var i = 0;
    		    	 $.each(json, function(i, f)
       				{
    		    		   i++;
    		    		   var t = $('#pending').DataTable();
    		        		 t.row.add( [
    		        	           i,
    		        	           company,
    		        	           f.StoneName,
    		        	           f.DateTime_Entry,
    		        	        ] ).draw( false );
       				});
    		    	 var count = Object.keys(json).length;
    		    	 allCountInQueue = allCountInQueue + count;
    		    	 $('#pillPending').html(allCountInQueue);
    		    }
    		});
    	}
    	
    	
    	<%
  		if(listOfCustomer != null){
  		for(CustomerBean c : listOfCustomer){ %>
    	var custCode = '<%=c.getCustomer_code()%>';
    	var SLT_Planning = 'Failed';
    	var company = '<%=c.getCompany()%>';
    		failedData(SLT_Planning,company,custCode);
    	<%}}%>
    	
    	function failedData(SLT_Planning,company,custCode){

        	$.ajax({
    			//for specify Method
    		    method: "POST",
    		    //for call action
    		    url: 'apiForAnalyzer',
    		    //form send data
    		    data:{customer_code : custCode,SLT_Planning : SLT_Planning},
    		    // action perform when successfully call action with specific method type
    		    success: function (data) {
    		    	//parse data into json format
    		    	 var json = JSON.parse(data);
    		    	var i = 0;
    		    	 $.each(json, function(i, f)
       				{
    		    		   i++;
    		    		   var t = $('#failed').DataTable();
    		        		 t.row.add( [
    		        	           i,
    		        	           company,
    		        	           f.StoneName,
    		        	           f.DateTime_Entry,
    		        	           f.DateTime_Start,
    		        	           f.DateTime_End
    		        	        ] ).draw( false );
       				});
    		    	 var count = Object.keys(json).length;
    		    	 allCountFailed = allCountFailed + count;
    		    	 $('#pillFailed').html(allCountFailed);
    		    	
    		    }
    		});
    	}
      
      
	</script>
     
      
</body>
</html>