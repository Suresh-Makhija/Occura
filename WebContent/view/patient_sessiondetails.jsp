<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient History</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/jquery.dataTables.css" type="text/css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/jquery.dataTables.min.js"></script>


<script type="text/javascript">

$(document).ready(function() {
	$('#displayTable_cc').DataTable(
			{
				responsive : true,
				"lengthMenu" : [ [ 10, 25, 50, -1 ],
						[ 10, 25, 50, "All" ] ],
				"pageLength" : -1
			});
	
	$('#displayTable_medicine').DataTable(
			{
				responsive : true,
				"lengthMenu" : [ [ 10, 25, 50, -1 ],
						[ 10, 25, 50, "All" ] ],
				"pageLength" : -1
			});
	
	$('#displayTable_diagnosis').DataTable(
			{
				responsive : true,
				"lengthMenu" : [ [ 10, 25, 50, -1 ],
						[ 10, 25, 50, "All" ] ],
				"pageLength" : -1
			});
	
	
});

</script>
</head>
<body>


<div class="container-fluid">
                <div class="block-header">
                    <div class="row">
                      
                        <div class="col-lg-6 col-md-8 col-sm-12">
                           <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
                           <i class="fa fa-arrow-left"></i></a> Patient History</h2>
	                        <ul class="breadcrumb">
	                            <li class="breadcrumb-item"><a onclick="loadcancel();" style="cursor: pointer;">     <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
	                            <i class="icon-home"></i></a></li><li class="breadcrumb-item active">Dashboard</li>
	                        </ul>
                         </div> 
                    </div>
                </div>
                
                <form  method="POST" id="patientdetails" name="patientdetailsName" autocomplete="off"  enctype="multipart/form-data">
					
					<div class="row">
							<h4> Patient Name : ${requestScope.patient_name}</h4>
					</div>
					<br>
					<div class="row mr-0 ml-0 form_title">
							<h4>Chief Complain Details</h4>
					</div>
					<br>
					
				<table class=" table" id="displayTable_cc" width="100%">
					<thead>
						<tr>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>INDEX</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>NAME</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>DURATION</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>EYE</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>DATE</b></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list_cc}" var="i" varStatus="rowNo">
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.cc_name}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.duration}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.eye}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date_str}</td>
						</c:forEach>
					</tbody>
				</table>
				
				<br>
				<div class="row mr-0 ml-0 form_title">
							<h4>Diagnosis Details</h4>
					</div>
					<br>
					
				<table class=" table" id="displayTable_diagnosis" width="100%">
					<thead>
						<tr>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>INDEX</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>NAME</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>DATE</b></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list_diagno}" var="i" varStatus="rowNo">
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.diagno_name}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date_str}</td>
						</c:forEach>
					</tbody>
				</table>
				
				
				<br>
				<div class="row mr-0 ml-0 form_title">
							<h4>Treatment Details</h4>
					</div>
					<br>
					
				<table class=" table" id="displayTable_medicine" width="100%">
					<thead>
						<tr>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>INDEX</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>MEDICINE NAME</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>MEDICINE QUANTITY</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>TOTAL PRICE PER MEDICINE</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>DURATION</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>EYE</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>DESCRIPTION</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>DATE</b></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list_medicine}" var="i" varStatus="rowNo">
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_name}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_Qty}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.total_price_per_medicine}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.duration}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.eye}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.description}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date_str}</td>
						</c:forEach>
						
					</tbody>
				</table>
             		
                
                </form>

</div>


</body>
</html>