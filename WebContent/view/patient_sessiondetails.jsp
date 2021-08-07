<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

fieldset {
	padding: 1.75em .625em .75em;
	margin: 0 2px;
	border: 1px solid #c0c0c0;
	border-radius: 5px;
}

</style>

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
	
	$('#displayTable_eye').DataTable(
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

                
                <form:form  method="POST" id="patientdetails" name="patientdetailsName" autocomplete="off"  enctype="multipart/form-data">
				<div id="main-content">
					<div class="container-fluid">
		                <div class="block-header">
		                    <div class="row">
		                      
		                        <div class="col-lg-6 col-md-8 col-sm-12">
		                           <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
		                           <i class="fa fa-arrow-left"></i></a> Patient History</h2>
			                        <ul class="breadcrumb">
			                            <li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;">     <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
			                            <font color="007bff"><i class="icon-home"></i></font></a></li><li class="breadcrumb-item active">Dashboard</li>
			                        </ul>
		                         </div> 
		                    </div>
		                </div>
                	<fieldset >
	                	<fieldset >
							<div class="row mr-0 ml-0 form_title">
									<h4> Patient Name : ${requestScope.patient_name}</h4> &nbsp;&nbsp;&nbsp;<h4>and</h4> &nbsp;&nbsp;&nbsp;
									<h4> Appointment Date :${requestScope.appointment_date_str}</h4>
							</div>
						</fieldset>
					<br>
					
					<fieldset >
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
						<tr>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.cc_name}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.duration}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.eye}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date_str}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<br><br><br>
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
						<tr>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.diagno_name}</td>
							<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date_str}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
				<br><br><br>
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
							<tr>
								<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
								<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_name}</td>
								<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_quantity}</td>
								<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.total_price}</td>
								<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.duration}</td>
								<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.eye}</td>
								<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.description}</td>
								<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date_str}</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				
				<br><br><br>
				<div class="row mr-0 ml-0 form_title">
							<h4>Eye Sight Details</h4>
					</div>
					<br>
					
				<table class="table" id="displayTable_eye"  width="100%">
					<thead>
						<tr>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>INDEX</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>EYE</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>SPHERE</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>CYLINDER</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>AXIS</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>Vn</b></th>
							<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>DATE</b></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list_eyesight}" var="i" varStatus="rowNo">
						<tr>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">RIGHT</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.sphere_r}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.cylinder_r}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.axis_r}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.vn_r}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date_str}</td>
						</tr>
						<tr>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">LEFT</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.sphere_l}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.cylinder_l}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.axis_l}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.vn_l}</td>
							<td  style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.crt_date_str}</td>
						</tr>
							
						</c:forEach>
						
					</tbody>
				</table>
				</fieldset>
             	</fieldset>
                </div>
                </div>
                </form:form>




</body>
<script type="text/javascript">

function loadindex() {
	document.patientdetailsName.action="../health/loadindex.htm";
	document.patientdetailsName.submit();	
}

</script>
</html>