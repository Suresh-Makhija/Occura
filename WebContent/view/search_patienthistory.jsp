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
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/select2/select2.css">

<title>Patient List</title>


</head>
<body>

                
                <form:form  method="POST" id="patientdetails" name="patientdetailsName" autocomplete="off" >
				<div id="main-content">
					<div class="container-fluid">
		                <div class="block-header">
		                    <div class="row">
		                      
		                        <div class="col-lg-6 col-md-8 col-sm-12">
		                           <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
		                           <i class="fa fa-arrow-left"></i></a> Patient List</h2>
			                        <ul class="breadcrumb">
			                            
			                             <li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;">     <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
	                            <font color="007bff"><i class="icon-home"></i></font></a></li><li class="breadcrumb-item active">Dashboard</li>
	                            
			                         <%--  <li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;">   href="<%=request.getContextPath()%>/view/index.jsp"
     									<i class="fa fa-home fa-lg"></i></a></li>
     								<li class="breadcrumb-item"><a href="#">Dashboard</a></li> --%>
     								
			                        </ul>
		                         </div> 
		                    </div>
		                </div>
		                <br>
                	 <div class="card" style="height:7rem; ">
                	  <div class="header">
                	  <div class="row">
							<div class="col-lg-2 col-sm-6"> 
								<b>Patient Name :</b>
							</div>
							<div class="col-lg-4 col-sm-6"> 
									<select id="patient_id" name="patient_id" style="height:100%" class="form-control">
										<c:forEach items="${list_patient}" var="list" varStatus="cnt">
												<option value="${list.patient_id}">${list.full_name}</option>
										</c:forEach>
									</select>
							</div>
							
							<div class="col-lg-2">
		                                <input type="button" onclick="searchname();" class="btn btn-primary btn-lg btn-block" value="Search"/>
		                     </div>
		                  </div>
						</div>
             		</div>
             		
             		<%-- <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12">
							<br>
		                     <div class="row">
		                        <div class="col-md-6">
		                        
		                        <b>Patient Name :</b>
		                        	<select id="patient_id" name="patient_id" style="height:50%" class="form-control">
										<c:forEach items="${list_patient}" var="list" varStatus="cnt">
												<option value="${list.patient_id}">${list.full_name}</option>
										</c:forEach>
									</select>
		                         </div>
		                         
		                         <div class="col-lg-2">
                                        <input type="button" onclick="searchname();" class="btn btn-primary btn-lg btn-block" value="Search"/>
                                  </div>
		                    </div>

                
                        </div>
                    </div> --%>
                    
             		
             		
                </div>
                </div>
                </form:form>




</body>
<script src="<%=request.getContextPath()%>/assets/select2/select2.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$("#patient_id").select2({
			placeholder : "Select Patient Name"
	});
});
	
function searchname()
{
	var patient_id = $("#patient_id").val();
	
	 if(patient_id != null && patient_id != '0' && patient_id != '')
	{
		document.patientdetailsName.target="_blank";
		document.patientdetailsName.action="../health/patientHistory.htm";
		document.patientdetailsName.submit();
		document.patientdetailsName.target="_self";
	}else
		{
			alert("Please Choose Patient Name");
		} 
	
}

function loadindex()
{
	document.patientdetailsName.action = "../health/loadindex.htm";  
	document.patientdetailsName.submit();
}

</script>

</html>