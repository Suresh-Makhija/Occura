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
<title></title>

<link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">

        
</head>
<body>

            
                
                <form:form  method="POST" id="printform" name="printformName"  autocomplete="off" >
                <div id="main-content">
                <div class="container-fluid">
                <div class="block-header">
                     <div class="row">
                        <div class="col-lg-6 col-md-8 col-sm-12">
                           <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
                           <i class="fa fa-arrow-left"></i></a> Bill Details</h2>
	                        <ul class="breadcrumb">
	                            <li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;">    
	                            <font color="007bff"><i class="icon-home"></i></font></a></li><li class="breadcrumb-item active">Dashboard</li>
	                        </ul>
                        </div>        
                    </div> 
                </div>
                
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="header">
                            	Doctor Name :- ${userProfileBean.first_name} ${userProfileBean.last_name} 
                            </div>
                        </div>
                        <br>
                        <div class="card">
                            <div class="header">
                            	Patient Name :- ${requestScope.patient_name}  &nbsp;&nbsp;&nbsp;and&nbsp;&nbsp;&nbsp;
                            	Appointment Date :- ${requestScope.appointment_date_str}
                            </div>
                            <br>
                            <fieldset>
								<div class="table-responsive">
									<table class="table" id="displayTable" width="100%">
											<thead>
												<tr>
													<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"> Sr No. </th>
												    <th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"> Medicine Name </th>
												    <th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"> Duration </th>
													<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"> Eye </th>
													<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"> Description </th>
													<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"> Medicine Quantity </th>
													<th style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;"> Total Price Per Medicine </th>
												</tr>
											</thead>
											<tbody>
													<c:set value="0" var="total_medicine"></c:set>
												<c:forEach items="${requestScope.list_medicine}" var="i" varStatus="rowNo">
													<tr>
														<td style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${rowNo.count}</td>
														
														<td style="text-align: left; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_name}</td>
														<td style="text-align: left; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.duration}</td>
														<td style="text-align: left; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.eye}</td>
														<td style="text-align: left; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.description}</td>
														<td style="text-align: left; vertical-align: middle; border: solid 1px; border-collapse: collapse;">${i.medicine_quantity}</td>
														
														<td style="text-align: right;vertical-align: middle; border: solid 1px; 
																		border-collapse: collapse;font-weight: bold;">
															<c:set value="${total_medicine+i.total_price}" var="total_medicine"></c:set>${i.total_price} </td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
											<tr>
												<td colspan="6" style="text-align: center; vertical-align: middle; border: solid 1px; border-collapse: collapse;font-weight: bold;">TOTAL</td>
												<td style="text-align: right; vertical-align: middle; border: solid 1px; border-collapse: collapse;font-weight: bold;">${total_medicine}</td>
											</tr>
											</tfoot>
									</table>
								</div>
							</fieldset>	
                        </div>
                        <br>
                         <div class="card">
                            <div class="header">
                            	Address :- ${userProfileBean.address_line_1}<br>
                            	City    :- ${userProfileBean.city}<br>
                            	State   :- ${userProfileBean.state}
                            </div>
                        </div>
                        
                        
                        
                    </div>
                </div>
                </div>
                </div>
                </form:form>



<!-- Javascript -->
<%-- <script á src="<c:url value = "/resources/mis/js/commonJS.js"/>"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/mis/js/datepicker.js"></script> --%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.min.js"></script>  --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/libscripts.bundle.js"></script>    
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/vendorscripts.bundle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script><!-- bootstrap datepicker Plugin Js --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/mainscripts.bundle.js"></script>

</body>

<script type="text/javascript">

function loadindex() {
	document.printformName.action="../health/loadindex.htm";
	document.printformName.submit();	
}

</script>

</html>