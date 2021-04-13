
<!-- 
Created by 	: Suresh makhija
Date 		: 12-04-2021 
-->

<%@page import="com.di.dao.AllListDAO"%>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="com.di.bean.UserBean"%>
<%@page import="com.di.controller.EncodeDecode"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Robust admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, robust admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>Occura</title>
<link rel="apple-touch-icon" sizes="60x60"
	href="img/sltlICO.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="img/sltlICO.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="img/sltlICO.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="img/sltlICO.png">
	
	
<link rel="shortcut icon" type="image/x-icon"
	href="img/sltlICO.png">
<link rel="shortcut icon" type="image/png"
	href="img/sltlICO.png">
<!--  <link rel="apple-touch-icon" sizes="76x76" href="app-assets/images/ico/apple-icon-76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="app-assets/images/ico/apple-icon-120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="app-assets/images/ico/apple-icon-152.png"> -->
<!--  <link rel="shortcut icon" type="image/x-icon" href="https://pixinvent.com/bootstrap-admin-template/robust/app-assets/images/ico/favicon.ico">
	    <link rel="shortcut icon" type="image/png" href="app-assets/images/ico/favicon-32.png"> -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
 <title></title>
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css"
	href="app-assets/css/bootstrap.min.css">
<!-- font icons-->
<link rel="stylesheet" type="text/css"
	href="app-assets/fonts/icomoon.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/fonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/sliders/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/extensions/pace.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/charts/jquery-jvectormap-2.0.3.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/charts/morris.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/extensions/unslider.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/vendors/css/weather-icons/climacons.min.css">
<!-- END VENDOR CSS-->
<!-- BEGIN ROBUST CSS-->
<link rel="stylesheet" type="text/css"
	href="app-assets/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/css/app.min.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/css/colors.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<!-- END ROBUST CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css"
	href="app-assets/css/core/menu/menu-types/horizontal-menu.min.css">
<link rel="stylesheet" type="text/css"
	href="app-assets/css/core/menu/menu-types/vertical-overlay-menu.min.css">
<link rel="stylesheet" type="text/css"	
	href="app-assets/css/core/colors/palette-gradient.min.css">
<!--   <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/calendars/clndr.min.css"> -->
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<!--  <link rel="stylesheet" type="text/css" href="assets/css/style.css"> -->
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/selects/select2.min.css">
     <link rel="stylesheet" type="text/css" href="app-assets/css/plugins/forms/selectize/selectize.min.css">
   	   <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/selects/selectize.default.css">
   	   <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/forms/selects/selectize.css">
<!-- END Custom CSS-->

<!-- Card Box CSS -->
<script>
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>

<style>
#grad2 {
	background: #80D2EF; /* For browsers that do not support gradients */
	background: -webkit-linear-gradient(90deg, #80D2EF, #80D2EF);
	/* For Safari 5.1 to 6.0 */
	background: -o-linear-gradient(90deg, #80D2EF, #80D2EF);
	/* For Opera 11.1 to 12.0 */
	background: -moz-linear-gradient(90deg, #80D2EF, #80D2EF);
	/* For Firefox 3.6 to 15 */
	background: linear-gradient(90deg, #80D2EF, #80D2EF);
	/* Standard syntax (must be last) */
}
</style>
</head>

<body data-open="hover" data-menu="horizontal-menu" data-col="2-columns"
	class="horizontal-layout horizontal-menu 2-columns">
	
	<%
	String diamondSession = new EncodeDecode().encodeString("diamondSession");
	UserBean userBean = (UserBean) session.getAttribute(diamondSession);
	SimpleDateFormat ddmmyyyyhhmmss = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
	SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");
	AllListDAO aaaaa = new AllListDAO();
	int user_id = 0;
	int auth = 0;
	int userCustId = 0;
	int userLoginCustId = 0;
	if(userBean != null){
		userCustId = userBean.getCustomer_id();
		user_id = userBean.getUser_id();
		auth = userBean.getAuthority();
		userLoginCustId = userBean.getCustomer_id();
		String encodeUserLoginCust_id = new EncodeDecode().encodeString(String.valueOf(userLoginCustId));
		CustomerBean cccc = aaaaa.customerDetails(userLoginCustId);
	%>
	<!-- navbar-fixed-top-->
	<nav class="header-navbar navbar navbar-with-menu undefined navbar-light navbar-border navbar-brand-center">
      <div class="navbar-wrapper">
        <div class="navbar-header">
          <ul class="nav navbar-nav">
            <li class="nav-item" style="width: 180px;"><font size="5px" style="font-weight: bold" class="navbar-brand nav-link">Diamond Invoice</font></li>
            <li class="nav-item hidden-md-up float-xs-right"><a data-toggle="collapse" data-target="#navbar-mobile" class="nav-link open-navbar-container"><i class="icon-ellipsis pe-2x icon-icon-rotate-right-right"></i></a></li>
          </ul>
        </div>
        <div class="navbar-container container center-layout">
          <div id="navbar-mobile" class="collapse navbar-toggleable-sm">
            <ul class="nav navbar-nav">
              <li class="nav-item hidden-sm-down">
               <img alt="" src="img/sltllogoNEW.png" width="150px;" height="50px;">
              </li>
            </ul>
             <ul class="nav navbar-nav float-xs-right">
             
              <li class="dropdown dropdown-user nav-item"><a href="#" data-toggle="dropdown" class="dropdown-toggle nav-link dropdown-user-link"><span class="avatar avatar-online"><img src="img/user.bmp" alt="avatar"><i></i></span><span class="user-name">
              <%if(cccc != null){ %>
               <%=cccc.getCompany()%>
              <%}else{ %>
              	<%=userBean.getName()%>
              <%} %>
             
              <%if(auth == 2){ %>
              	(Manager)
              <%} else if(auth == 3){%>
             	 (Operator)
              <%} %>
              </span></a>
                <div class="dropdown-menu dropdown-menu-right">
                <%if(cccc != null){ %>
                 <a href="redirect?p=dXNlclByb2ZpbGU=" class="dropdown-item"><i class="icon-building-o"></i> Company Profile</a>
              	<%} %>
              	 <a href="redirect?p=Y2hhbmdlUGFzc3dvcmQ=" class="dropdown-item"><i class="icon-key3"></i> Change password</a>
                 <a href="logout" class="dropdown-item"><i class="icon-power3"></i> Logout</a>
                </div>
              </li>
           
             </ul>
          </div>
        </div>
      </div>
    </nav>
    
    <div role="navigation" data-menu="menu-wrapper"
		style="background-color: #002266;"
		class="header-navbar navbar navbar-horizontal navbar-fixed navbar-light navbar-without-dd-arrow navbar-bordered navbar-shadow"
		id="grad1">
		<!-- Horizontal menu content-->
		<div data-menu="menu-container"
			class="navbar-container main-menu-content container center-layout">
			<!-- include includes/mixins-->
			<ul id="main-menu-navigation" data-menu="menu-navigation"
				class="nav navbar-nav">
			
				<%if(auth != 4){ %>
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-file-text"></i><span
						data-i18n="nav.category.ui">Entry Options</span></a>
					<ul class="dropdown-menu">
						<li><a href="redirect?p=Y2hhbGxhbk1hc3Rlcg==" class="dropdown-item"><i
								class="icon-pencil-square-o"></i>Challan Entry</a></li>
						<li><a href="redirect?p=Y2hhbGxhbkNyZWF0b3I=" class="dropdown-item"><i
						class="icon-network"></i>Create Challan</a></li>
								<li><a href="redirect?p=Y2hhbGxhbkxpc3Q=" class="dropdown-item"><i
								class="icon-android-list"></i>Challan List</a></li>
					</ul>
				</li>
				<%} %>
				
				<%if(auth == 1){ %>
				
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-gear-a"></i><span
						data-i18n="nav.category.ui">Master</span></a>
					<ul class="dropdown-menu">
						<li><a href="redirect?p=Y3VzdG9tZXJNYXN0ZXI=" class="dropdown-item"><i
								class="icon-user-tie"></i>Customer Master</a></li>
								<li><a href="redirect?p=Y3VzdG9tZXJUeXBlTWFzdGVy" class="dropdown-item"><i
								class="icon-price-tags"></i>Customer Type Master</a></li>
						<li><a href="redirect?p=cHJvZHVjdE1hc3Rlcg==" class="dropdown-item"><i
								class="icon-diamond2"></i>Product Master</a></li>
						<li><a href="redirect?p=Y3VycmVuY3lNYXN0ZXI=&cId=<%=encodeUserLoginCust_id%>" class="dropdown-item"><i
						class="icon-dollar"></i>Currency Master</a></li>
					</ul>
				</li>
				<%}else if(auth == 2){ %>
					<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-gear-a"></i><span
						data-i18n="nav.category.ui">Master</span></a>
					<ul class="dropdown-menu">
						<li><a href="redirect?p=Y3VzdG9tZXJTdWJNYXN0ZXI=&pId=<%=encodeUserLoginCust_id%>" class="dropdown-item"><i
								class="icon-user-tie"></i>Customer Master</a></li>
						<li><a href="redirect?p=Y3VzdG9tZXJQcm9kdWN0=&cId=<%=encodeUserLoginCust_id%>" class="dropdown-item"><i
								class="icon-diamond2"></i>Product Master</a></li>
						<li><a href="redirect?p=dXNlckxpc3Q=&cId=<%=encodeUserLoginCust_id%>" class="dropdown-item"><i
						class="icon-users2"></i>User List</a></li>	
						<li><a href="redirect?p=Y3VycmVuY3lNYXN0ZXI=&cId=<%=encodeUserLoginCust_id%>" class="dropdown-item"><i
						class="icon-dollar"></i>Currency Master</a></li>
					</ul>
				</li>
				<%} %>
				
				<%if(auth != 4){ %>
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-list2"></i><span
						data-i18n="nav.category.ui">Billing</span></a>
					<ul class="dropdown-menu">
						<li><a href="redirect?p=Z2VuZXJhdGVCaWxs" class="dropdown-item"><i
								class="icon-coin-dollar"></i>Generate Bill</a></li>
							<li><a href="redirect?p=aW52b2ljZUxpc3Q=" class="dropdown-item"><i
								class="icon-ios-list"></i>Invoice List</a></li>	
								
					</ul>
				</li>
				<%} %>
				
				<%if(auth != 4){ %>
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-paper-stack"></i><span
						data-i18n="nav.category.ui">Stock</span></a>
					<ul class="dropdown-menu">
						<li><a href="redirect?p=c3RvY2tIaXN0b3J5" class="dropdown-item"><i
								class="icon-paper-stack"></i>Stock History</a></li>
								
						<!-- <li><a href="redirect?p=YWRkQ2hpbGRTdG9uZUR5bmFtaWNhbGx5" class="dropdown-item"><i
								class="icon-paper-stack"></i>Dynamic Childstone</a></li>		 -->
							
						<li><a href="redirect?p=aGFuZG92ZXJQcm9jZXNz" class="dropdown-item"><i
								class="icon-paper-stack"></i>Handover Process</a></li>		
								
								<li><a href="redirect?p=Z2xvYmFsUmVwb3J0" class="dropdown-item"><i
								class="icon-paper-stack"></i>Summary Report</a></li>		
								
					</ul>
				</li>
				<%} %>
				<%if(auth == 4){ %>
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-paper-stack"></i><span
						data-i18n="nav.category.ui">Stock</span></a>
					<ul class="dropdown-menu">
						<li><a href="redirect?p=dXNlclBhZ2U=" class="dropdown-item"><i
								class="icon-paper-stack"></i>Add Child Stone</a></li>
						<li><a href="redirect?p=dXNlclNpZGVTdG9ja0hpc3Rvcnk=" class="dropdown-item"><i
								class="icon-paper-stack"></i>Stock History</a></li>
								
					</ul>
				</li>
				<%} %>
				
				<%if(auth != 4){ %>
				<li data-menu="dropdown" class="dropdown nav-item"
					style="font-family: verdana;" id=""><a href="#"
					data-toggle="dropdown" class="dropdown-toggle nav-link"
					style="color: #ffffff;"><i class="icon-clipboard"></i><span
						data-i18n="nav.category.ui">SLTL Status</span></a>
					<ul class="dropdown-menu">
						<li><a href="redirect?p=c2x0bEFkYXB0ZXJTdGF0dXM=" class="dropdown-item"><i
								class="icon-clipboard"></i>Adapter Status</a></li>
						<li><a href="redirect?p=c2x0bFFjU3RhdHVz" class="dropdown-item"><i
								class="icon-clipboard"></i>QC Status</a></li>
						<li><a href="redirect?p=c2x0bEFuYWx5emVyU3RhdHVz" class="dropdown-item"><i
						class="icon-clipboard"></i>Analyzer Status</a></li>		
						
					</ul>
				</li>
				<%} %>
			</ul>
		</div>
	</div>
    
    <%}else{ 
    	response.sendRedirect("logout");
    } %>
    
    <!-- BEGIN VENDOR JS-->
	<!-- build:js app-assets/js/vendors.min.js-->
	<script src="app-assets/js/core/libraries/jquery.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/tether.min.js"
		type="text/javascript"></script>
	<script src="app-assets/js/core/libraries/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/perfect-scrollbar.jquery.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/unison.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/blockUI.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/jquery.matchHeight-min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/jquery-sliding-menu.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/sliders/slick/slick.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/ui/screenfull.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/extensions/pace.min.js"
		type="text/javascript"></script>
	<!-- /build-->
	<!-- BEGIN VENDOR JS-->
	<!-- BEGIN PAGE VENDOR JS-->
	<script type="text/javascript"
		src="app-assets/vendors/js/ui/jquery.sticky.js"></script>
	<script src="app-assets/js/core/app-menu.min.js" type="text/javascript"></script>
	<script src="app-assets/js/core/app.min.js" type="text/javascript"></script>
	<script src="app-assets/js/scripts/ui/fullscreenSearch.min.js"
		type="text/javascript"></script>
	<script src="app-assets/js/scripts/extensions/sweet-alerts.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/extensions/sweetalert.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/js/scripts/gallery/photo-swipe/photoswipe-script.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/vendors/js/gallery/photo-swipe/photoswipe.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/vendors/js/gallery/photo-swipe/photoswipe-ui-default.min.js"
		type="text/javascript"></script>
	<!-- BEGIN PAGE VENDOR JS-->
	<script
		src="app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/vendors/js/tables/datatable/dataTables.buttons.min.js"
		type="text/javascript"></script>
	<script
		src="app-assets/js/scripts/tables/datatables/datatable-basic.min.js"
		type="text/javascript"></script>
		 <script src="app-assets/vendors/js/tables/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/datatable/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/buttons.flash.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/jszip.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/pdfmake.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/vfs_fonts.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/buttons.html5.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/tables/buttons.print.min.js" type="text/javascript"></script>
     
    
</body>

</html>