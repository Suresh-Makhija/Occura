<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient History</title>
<style type="text/css">

.flex-container {
  display: flex;
  flex-wrap: nowrap;
}	

 .profile{
 border-radius:100%;   
 width:180px;
 height:200px;
 background-position:center;
 background-size:cover;
 }


</style>
</head>
<body>

	            
                
                <form:form  method="POST" id="patientdetails" name="patientdetailsName" autocomplete="off"  enctype="multipart/form-data">
					
					<input id="appointment_id" name="appointment_id" value="${requestScope.appointment_id}">
					<input id="patient_id" name="patient_id" value="${requestScope.patient_id}">                	
                     
                    <input id="appointmentid_hidden" name="appointmentname_hidden" >
                    <input id="patientid_hidden" name="patientname_hidden" >
                    <input id="patienthistory_id" name="patienthistory" value="patienthistory" >
                 
                 <div id="main-content">
                 <div class="container-fluid">
                <div class="block-header">
                    <div class="row">
                        <div class="col-lg-6 col-md-8 col-sm-12">
                            <!-- <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Book Appointment</h2> -->
                           
                           <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
                           <i class="fa fa-arrow-left"></i></a> Patient History</h2>
	                        <ul class="breadcrumb">
	                            <li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;">     <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
	                            <font color="007bff"><i class="icon-home"></i></font></a></li><li class="breadcrumb-item active">Dashboard</li>
	                        </ul>
                         </div> 
                    </div>
                </div>
                   
				<c:if test="${requestScope.patientlist ne null}">
	                <div class="row clearfix">
	                    <div class="col-lg-12 col-md-12 col-sm-12">
	                        <div class="card">
	                            <div class="header">
	                                <h2>Patient Details</h2>
	                            </div>
								
	                            <div class="body">
	                                <div class="row clearfix">
	                                	<div class="flex-container">
	                                	
	                                		<div class="row" style="margin-left: 10px;">
	                                			<img src="data:image/jpg;base64,${patientlist.filebyte}" alt="Avatar" class="profile">
	                                		</div>
	                                		
	                                		<div class="row" style="margin-left: 150px;margin-top: 50px;">
	                                			<c:choose>
	                                    			<c:when test="${patientlist.full_name ne null and patientlist.full_name ne ''}">
	                                    				<td>Full Name : ${patientlist.full_name}</td>
	                                    			</c:when>
	                                    			<c:otherwise>
	                                    				<td>Full Name : -</td>
	                                    			</c:otherwise>
	                                    		</c:choose><br>
	                                    		<c:choose>
	                                    			<c:when test="${patientlist.gender ne null and patientlist.gender ne ''}">
	                                    				<td>Gender : ${patientlist.gender}</td>
	                                    			</c:when>
	                                    			<c:otherwise>
	                                    				<td>Gender : -</td>
	                                    			</c:otherwise>
	                                    		</c:choose><br>
	                                    		<c:choose>
	                                    			<c:when test="${patientlist.mobile_no ne null and patientlist.mobile_no ne ''}">
	                                    				<td>Mobile No : ${patientlist.mobile_no}</td>
	                                    			</c:when>
	                                    			<c:otherwise>
	                                    				<td>Mobile No : -</td>
	                                    			</c:otherwise>
	                                    		</c:choose><br>
	                                    		<c:choose>
	                                    			<c:when test="${patientlist.age ne null and patientlist.age ne ''}">
	                                    				<td>Age : ${patientlist.age}</td>
	                                    			</c:when>
	                                    			<c:otherwise>
	                                    				<td>Age : -</td>
	                                    			</c:otherwise>
	                                    		</c:choose>
	                                		</div>
	                                	</div>
	                                   <!--  <table>
	                                    	<tr>
	                                    		<td colspan="4">
	                                    			
	                                    		</td>
	                                    		
	                                    	</tr>
	                                    </table> -->
	                                </div>
	                                <br>
	
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:if>
               <br>
               <c:if test="${requestScope.appointment_id ne null and requestScope.appointment_id ne ''
               				 and requestScope.appointmentdate_str ne null and requestScope.appointmentdate_str ne ''}">
               <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="header">
                                <h2>Session (Appointment Date - ${requestScope.appointmentdate_str})</h2>
                                <div class="float-right">
                             		<a onclick="getSession('${requestScope.appointment_id}','${requestScope.patient_id}');" 
                             		   style="cursor: pointer;">Session</a>
                            	</div> 
                            </div>
                             
               			</div>
               		</div>
               	</div>
               	</c:if>
               <br>
               <c:choose>
               	<c:when test="${requestScope.patientlist_size gt 0}">
               		<div class="row clearfix">
	                    <div class="col-lg-12 col-md-12 col-sm-12">
	                        <div class="card">
	                            <div class="header">
	                                <h2>Patient History</h2>
	                            </div>
							</div>
	                    </div>
	                </div>
	                
	                <%
					if(request.getAttribute("patienthistory")!=null)
					{
						
						List<Object[]> patienthistory = (List<Object[]>) request.getAttribute("patienthistory");
						int index = 0;
							for(Object[] object : patienthistory)
							{
					%>
						<div class="card" style="width: 18rem;">
						  <div class="card-body">
						    <p class="card-text">
						    	Sr.No : <%=++index%>
						    	<br>
						    	Appointment Date : <%=object[5]%>
						    	<br>
						    <%	
						    	if(object[4] != null && object[4] != "" && object[4] != "null" && !("").equals(object[4]))	
						    	{%>
						    		Description : <%=object[4]%>
						    	<%}%>
							</p>
						    <a onclick="getpatienthistory('<%=object[0]%>','<%=object[1]%>');" class="card-link"
						       style="cursor: pointer;">Patient History</a>&nbsp;&nbsp;&nbsp;&nbsp;
						    
						    <%	
						    	if(object[6] != null && object[6] != "" && object[6] != "null" && !("").equals(object[6])
						    			&& ("N").equals(object[6]))	
						    	{%>
						    	<a onclick="getbilldetails('<%=object[0]%>','<%=object[1]%>');" class="card-link"
						       		style="cursor: pointer;">Bill Details</a>
						        <%}%>
						  </div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;
					
					<% }} %>
               		
               	</c:when>
               	<c:otherwise>
               				<div class="row" align="center">
               					No Data Available
               				</div>
               	</c:otherwise>
               </c:choose>
               
                </div>
                </div>
                </form:form>


	

</body>

<script type="text/javascript">


function getpatienthistory(appointmentID,patientID) {
	$("#appointmentid_hidden").val(appointmentID);
	$("#patientid_hidden").val(patientID);
	document.patientdetailsName.target="_blank";
	document.patientdetailsName.action="../health/patientHistorySessionDetails.htm";
	document.patientdetailsName.submit();
	document.patientdetailsName.target="_self";
}

function getbilldetails(appointmentID,patientID) {
	$("#appointmentid_hidden").val(appointmentID);
	$("#patientid_hidden").val(patientID);
	document.patientdetailsName.target="_blank";
	document.patientdetailsName.action="../health/loadtestprint.htm";
	document.patientdetailsName.submit();
	document.patientdetailsName.target="_self";
}


function getSession(appointmentID,patientID) {
	$("#appointment_id").val(appointmentID);
	$("#patient_id").val(patientID);
	document.patientdetailsName.action="../health/startSession.htm";
	document.patientdetailsName.submit();	
}

function loadindex() {
	document.patientdetailsName.action="../health/loadindex.htm";
	document.patientdetailsName.submit();	
}


</script>

</html>