<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Appointment User</title>

<%-- 
<link rel="stylesheet" href="<c:url value ="/resources/mis/css/font-awesome.min.css"/>" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/mis/css/datepicker.css" type="text/css"/> --%>


<link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">

 <style type="text/css">

.validateStyle{
	border: 1px solid red!important;
}

 </style>

        
</head>
<body  class="theme-cyan">
			 <div id="main-content">
            <div class="container-fluid">
                <div class="block-header">
                    <div class="row">
                        <div class="col-lg-6 col-md-8 col-sm-12">
                            <!-- <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Book Appointment</h2> -->
                           
                           <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
                           <i class="fa fa-arrow-left"></i></a>Stock List</h2>
	                        <ul class="breadcrumb">
	                            <li class="breadcrumb-item"><a onclick="oldcancel();" style="cursor: pointer;">    <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
	                            <i class="icon-home"></i></a></li><li class="breadcrumb-item active">Pharma/Stock List</li>
	                        </ul>
                   	  </div>
                	</div>
                 <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="card">
                <form  method="POST" id="olduserform" name="olduserformName" autocomplete="off" >
                	
				<input type="hidden" id="hiddenappointmenttime" name="hiddenappointmenttime">
				<input type="hidden" id="hiddendescription" name="hiddendescription">
				<input type="hidden" id="patientid" name="patientid">
				
                <div class="row clearfix">
                   
                    </div>
                    
                    <br>
                    
                    	<table class=" table" id="displayTable" width="100%">
						<thead>
							<tr>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>SR.NO</b></th>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>Medicine</b></th>
									<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>Type</b></th>
									<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>Count per tabs</b></th>
									<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>Qty</b></th>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>Price</b></th>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>Description</b></th>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>Last Update</b></th>
							</tr>
						</thead>
														
						<tbody>
							<c:forEach items="${requestScope.liststock}" var="i" varStatus="rowNo">
								<tr>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_name}</td>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_type}</td>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.count_per_tab}</td>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_qty}</td>
		 						   <td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_price}</td>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_description}</td>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date}</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				
                    
                    
                    
                </form>
</div></div></div></div>
</div>
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.min.js"></script>  --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/libscripts.bundle.js"></script>    
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/vendorscripts.bundle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script><!-- bootstrap datepicker Plugin Js --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/mainscripts.bundle.js"></script>

</body>
</html>