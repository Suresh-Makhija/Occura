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
<body>

            <div class="container-fluid">
                <div class="block-header">
                    <div class="row">
                        <div class="col-lg-6 col-md-8 col-sm-12">
                            <!-- <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Book Appointment</h2> -->
                           
                           <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
                           <i class="fa fa-arrow-left"></i></a> Book Appointment</h2>
	                        <ul class="breadcrumb">
	                            <li class="breadcrumb-item"><a onclick="oldcancel();" style="cursor: pointer;">    <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
	                            <i class="icon-home"></i></a></li><li class="breadcrumb-item active">Dashboard</li>
	                        </ul>
                   	  </div>
                	</div>
                
                <form  method="POST" id="olduserform" name="olduserformName" autocomplete="off" >
                	
				<input type="hidden" id="hiddenappointmenttime" name="hiddenappointmenttime">
				<input type="hidden" id="hiddendescription" name="hiddendescription">
				<input type="hidden" id="patientid" name="patientid">
				
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                            
							<br>
		
		                     <div class="row">
		                        <div class="col-md-6">
		                          <input type="text" class="form-control" name="query" placeholder="Search old case by Phone, Name">
		                         </div>
		                         <div class="col-lg-2">
                                        <input type="button" onclick="oldusersearch();" class="btn btn-primary btn-lg btn-block" value="Search"/>
                                  </div>
		                    </div>

                
                        </div>
                    </div>
                    
                    <br>
                    <c:if test="${requestScope.search eq 'search'}">
                    
                    	<table class=" table" id="displayTable" width="100%">
						<thead>
							<tr>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>SR.NO</b></th>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>FULL NAME</b></th>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>PHONE-NO</b></th>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>APPOINTMENT TIME</b></th>
							    <th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>DESCRIPTION</b></th>
								<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"><b>ACTION</b></th>
							</tr>
						</thead>
														
						<tbody>
							<c:forEach items="${requestScope.listpatient}" var="i" varStatus="rowNo">
								<tr>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.full_name}</td>
									<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.mobile_no}</td>
									
		 						    <td style="text-align: left; vertical-align: middle; border: solid 1px; border-collapse: collapse;">
											 <input type="datetime-local" class="form-control"  name="appointment_date_time" 
                                        id="appointment_date_time${rowNo.count}" onchange="checkdatetime(this);" placeholder="Appointment Date"/>
									</td>
									<td style="text-align: left; vertical-align: middle; border: solid 1px; border-collapse: collapse;">
										<textarea rows="5" cols="10" class="form-control" name="description" 
											id="description${rowNo.count}" placeholder="Description"></textarea>
									</td>
									
									<td style="text-align: left; vertical-align: middle; border: solid 1px; border-collapse: collapse;">
											<input type="button" value="Submit" onclick="loadsubmitold('${rowNo.count}','${i.patient_id}');">
									</td> 
								</tr>
							</c:forEach>
						</tbody>
					</table>
				
                    
                    </c:if>
                    
                    
                </form>

</div>
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.min.js"></script>  --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/libscripts.bundle.js"></script>    
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/vendorscripts.bundle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script><!-- bootstrap datepicker Plugin Js --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/mainscripts.bundle.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	if("${requestScope.msg}" != null && "${requestScope.msg}" != "")
	{
		if("${requestScope.msg}" == "fail")
		{
			swal("ERROR!","Appointment time is not Edited and try again","error");
		}else
		{
			 swal({
		         text: 'Appointment Time Edited Successfully',
		         icon: 'success'
		       });
		       
		       //.then(function() {
		         //window.location = "${pageContext.request.contextPath}/view/appointment_user.jsp";
		       //});
		}
		/* window.location = "${pageContext.request.contextPath}/view/appointment_user.jsp"; */
	}
});

function loadsubmitold(count,patientid)
{
    var appointment_date_time = $('#appointment_date_time'+count).val();
	var description = $('#description'+count).val();
	
	$('#appointment_date_time'+count).addClass("ValidateInput");
	 var flag = formValidate("olduserform");
	
	 if(flag)
	{
		$("#hiddenappointmenttime").val(appointment_date_time);
		$("#hiddendescription").val(description);
		$("#patientid").val(patientid); 
		document.olduserformName.action = "../health/saveAppointmenttime.htm";
		document.olduserformName.submit();
		$('#appointment_date_time'+count).removeClass("ValidateInput");
	} 
}

function oldcancel()
{
	//window.location = "${pageContext.request.contextPath}/view/index.jsp";
	document.olduserformName.action="../health/loadindex.htm";
	document.olduserformName.submit();
}

function checkdatetime(txtinput)
{
 	$.ajax({
		type :'POST',
		url: "../health/checkdatetime.htm",
		data :{appointmentdate : txtinput.value},
		success :function(resdata,status,xhr)
		{
			if(resdata == "exist")
				{
				txtinput.value = "";
                txtinput.focus();
				swal("INFO!","Appointment Date Already exits !! try select different timing","info");
				}else if(resdata == "error")
					{
					txtinput.value = "";
	                txtinput.focus();
					swal("ERROR!","Something went wrong!!","error");
					}
		},
		error : function(xhr, status, errorThrown) {
		},
		complete : function(xhr, status) {
		}
	});	 
}

function oldusersearch()
{
	document.olduserformName.action="../health/oldusersearch.htm";
	document.olduserformName.submit();
}
</script>
</body>
</html>