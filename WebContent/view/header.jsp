<!doctype html>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.occura.bean.UserBean"%>
-<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">


<head>
<title>:: Saraswati Eye Hospital :</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="Lucid Bootstrap 4.1.1 Admin Template">
<meta name="author" content="WrapTheme, design by: ThemeMakker.com">

<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/chartist/css/chartist.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/chartist-plugin-tooltip/chartist-plugin-tooltip.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/toastr/toastr.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">
</head>
<body class="theme-cyan">
<%  UserBean user = (UserBean)session.getAttribute("loginUser");
	if(user != null){
		
%>
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img src="" width="48" height="48" alt="Occura"></div>
        <p>Please wait...</p>        
    </div>
</div>
<!-- Overlay For Sidebars -->

<div id="wrapper">

    <nav class="navbar navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-offcanvas"><i class="lnr lnr-menu fa fa-bars"></i></button>
            </div>

            <div class="navbar-brand">
                <a onclick="loadindex();" style="cursor: pointer;"><img src="" alt="Occura Logo" class="img-responsive logo"></a>       <!--  href="index.jsp"  -->         
            </div>
            
            <div class="navbar-right">
            	<form id="navbar-search" class="navbar-form search-form">
                    <input value="" class="form-control" placeholder="Search here..." type="text">
                    <button type="button" class="btn btn-default"><i class="icon-magnifier"></i></button>
                </form> 
                
                <form:form name="loadmenu"> </form:form>

                <div id="navbar-menu">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="doctor-events.html" class="icon-menu d-none d-sm-block d-md-none d-lg-block"><i class="icon-calendar"></i></a>
                        </li>
                        <li>
                            <a href="https://mail.google.com/" class="icon-menu d-none d-sm-block"><i class="icon-envelope"></i><span class="notification-dot"></span></a>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown" 
                            onclick="loadNotification();">
                                <i class="icon-bell"></i><span class="notification-dot"></span>
                            </a>
                            <ul class="dropdown-menu notifications" id="notificationtoday">
                                  
                                  
                                 <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-info text-warning"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Your New Campaign <strong>Holiday Sale</strong> is approved.</p>
                                                <span class="timestamp">11:30 AM Today</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                                         
                                <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-like text-success"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Your New Campaign <strong>Holiday Sale</strong> is approved.</p>
                                                <span class="timestamp">11:30 AM Today</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                 <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-pie-chart text-info"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Website visits from Twitter is 27% higher than last week.</p>
                                                <span class="timestamp">04:00 PM Today</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-info text-danger"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Error on website analytics configurations</p>
                                                <span class="timestamp">Yesterday</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="footer"><a href="javascript:void(0);" class="more">See all notifications</a></li>
                            </ul>
                        </li>
                     
                        <li>
<!--                         	<button onclick="logout();" class="icon-menu"></button> -->
                            <a  class="icon-menu" id = "logoutMenu" onclick="logout();" style="cursor: pointer;"><i class="icon-login"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div id="left-sidebar" class="sidebar">
        <div class="sidebar-scroll">
            <div class="user-account">
                <img src="<%=request.getContextPath()%>/images/user.png" class="rounded-circle user-photo" alt="User Profile Picture">
                <div class="dropdown">
                    <span>Welcome,</span>
                    <a href="javascript:void(0);" class="dropdown-toggle user-name" data-toggle="dropdown"><strong><%=user.getName() %></strong></a>
                    <ul class="dropdown-menu dropdown-menu-right account">
                        <li><a onclick="doctorprofile();" style="cursor: pointer;"><i class="icon-user"></i>My Profile</a></li>    <!--  href="doctor-profile.jsp" -->
                        <li><a href="https://mail.google.com/"><i class="icon-envelope-open"></i>Messages</a></li>
<!--                         <li><a href="javascript:void(0);"><i class="icon-settings"></i>Settings</a></li> -->
                        <li class="divider"></li>
                        <li><a id="logoutSubMenu" onclick="logout();" style="cursor: pointer;"><i class="icon-power"></i>Logout</a></li>
                    </ul>
                </div>
                <hr>
                <ul class="row list-unstyled">
                    <li class="col-4">
<!--                         <small>Exp</small> -->
<!--                         <h6>14</h6> -->
                    </li>
                    
                </ul>
            </div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#menu">Menu</a></li>                
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#setting"><i class="icon-settings"></i></a></li>                
            </ul>
                
            <!-- Tab panes -->
            <div class="tab-content p-l-0 p-r-0">
                <div class="tab-pane active" id="menu">
                    <nav class="sidebar-nav">
                        <ul class="main-menu metismenu">
                            <li class="active"><a onclick="loadindex();" style="cursor: pointer;"><i class="icon-home"></i><span>Dashboard</span></a></li>  <!-- href="index.jsp" -->
<!--                             <li><a href="app-appointment.html"><i class="icon-calendar"></i>Appointment</a></li> -->
                            <li><a href="javascript:void(0);" class="has-arrow"><i class="icon-calendar"></i>
                            	<span>Session</span> </a>
                                 <ul> 
                                     <li><a onclick="startSession();" style="cursor: pointer;">Start Session</a></li>   <!-- href="appointment_user.jsp" -->
                                 </ul> 
                             </li> 
                            <li><a href="javascript:void(0);" class="has-arrow"><i class="icon-calendar"></i>
                            	<span>Appointment</span> </a>
                                 <ul> 
                                     <li><a onclick="loadappointment();" style="cursor: pointer;">Book Appointment</a></li>   <!-- href="appointment_user.jsp" -->
                                     <li><a onclick="loadcalendar();" style="cursor: pointer;">Test Calendar</a></li>   <!-- href="fullcalendar.jsp" -->
                                 	<li><a onclick="loadtestsnapshot();" style="cursor: pointer;">Test Snapshot</a></li>
                                 </ul> 
                             </li> 

                            <!-- <li><a href="app-taskboard.html"><i class="icon-list"></i>Taskboard</a></li>
                            <li><a href="app-inbox.html"><i class="icon-home"></i>Inbox App</a></li> -->

<!--                             <li><a href="javascript:void(0);" class="has-arrow"><i class="icon-user-follow"></i><span>Doctors</span> </a> -->
<!--                                 <ul> -->
<!--                                     <li><a href="doctors-all.html">All Doctors</a></li> -->
<!--                                     <li><a href="doctor-add.html">Add Doctor</a></li> -->
<!--                                     <li><a href="doctor-profile.html">Doctor Profile</a></li> -->
<!--                                     <li><a href="doctor-events.html">Doctor Schedule</a></li> -->
<!--                                 </ul> -->
<!--                             </li> -->
                            <li><a href="javascript:void(0);" class="has-arrow"><i class="icon-user"></i><span>Patients</span> </a>
                                <ul>
                                    <li><a href="patients-all.html">All Patients</a></li>
                                    <li><a href="patient-add.html">Add Patient</a></li>
                                    <li><a href="patient-profile.html">Patient Profile</a></li>
                                    <li><a href="patient-invoice.html">Invoice</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0);" class="has-arrow"><i class="icon-wallet"></i><span>Payments</span> </a>
                                <ul>
                                    <li><a href="payments.html">Payments</a></li>
                                    <li><a href="payments-add.html">Add Payment</a></li>
                                    <li><a href="payments-invoice.html">Invoice</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0);" class="has-arrow"><i class="icon-layers"></i><span>Departments</span> </a>
                                <ul>
                                    <li><a onclick="loaddepartment();" style="cursor: pointer;">Add</a></li>    <!-- href="depa-add.jsp" -->
                                </ul>
                            </li>

                            <li>
<!--                                 <a href="#Pages" class="has-arrow"><i class="icon-docs"></i><span>Extra Pages</span></a> -->
                                <ul>
                                    <li><a href="page-blank.html">Blank Page</a> </li>
                                    <li><a href="doctor-profile.html">Profile</a></li>
                                    <li><a href="page-gallery.html">Image Gallery <span class="badge badge-default float-right">v1</span></a> </li>
                                    <li><a href="page-gallery2.html">Image Gallery <span class="badge badge-warning float-right">v2</span></a> </li>
                                    <li><a href="page-timeline.html">Timeline</a></li>
                                    <li><a href="page-timeline-h.html">Horizontal Timeline</a></li>
                                    <li><a href="page-pricing.html">Pricing</a></li>
                                    <li><a href="page-search-results.html">Search Results</a></li>
                                    <li><a href="page-helper-class.html">Helper Classes</a></li>
                                    <li><a href="page-maintenance.html">Maintenance</a></li>
                                    <li><a href="page-testimonials.html">Testimonials</a></li>
                                    <li><a href="page-faq.html">FAQs</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="tab-pane" id="sub_menu">
                    <nav class="sidebar-nav">
                        <ul class="main-menu metismenu">
                            <li>
                                <a href="#uiElements" class="has-arrow"><i class="icon-diamond"></i> <span>UI Elements</span></a>
                                <ul>
                                    <li><a href="ui-typography.html">Typography</a></li>
                                    <li><a href="ui-tabs.html">Tabs</a></li>
                                    <li><a href="ui-buttons.html">Buttons</a></li>
                                    <li><a href="ui-bootstrap.html">Bootstrap UI</a></li>
                                    <li><a href="ui-icons.html">Icons</a></li>
                                    <li><a href="ui-notifications.html">Notifications</a></li>
                                    <li><a href="ui-colors.html">Colors</a></li>
                                    <li><a href="ui-dialogs.html">Dialogs</a></li>                                    
                                    <li><a href="ui-list-group.html">List Group</a></li>
                                    <li><a href="ui-media-object.html">Media Object</a></li>
                                    <li><a href="ui-modals.html">Modals</a></li>
                                    <li><a href="ui-nestable.html">Nestable</a></li>
                                    <li><a href="ui-progressbars.html">Progress Bars</a></li>
                                    <li><a href="ui-range-sliders.html">Range Sliders</a></li>
                                    <li><a href="ui-treeview.html">Treeview</a></li>
                                </ul>
                            </li>                            
                            <li>
                                <a href="#forms" class="has-arrow"><i class="icon-pencil"></i> <span>Forms</span></a>
                                <ul>
                                    <li><a href="forms-validation.html">Form Validation</a></li>
                                    <li><a href="forms-advanced.html">Advanced Elements</a></li>
                                    <li><a href="forms-basic.html">Basic Elements</a></li>
                                    <li><a href="forms-wizard.html">Form Wizard</a></li>                                    
                                    <li><a href="forms-dragdropupload.html">Drag &amp; Drop Upload</a></li>                                    
                                    <li><a href="forms-cropping.html">Image Cropping</a></li>
                                    <li><a href="forms-summernote.html">Summernote</a></li>
                                    <li><a href="forms-editors.html">CKEditor</a></li>
                                    <li><a href="forms-markdown.html">Markdown</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#Tables" class="has-arrow"><i class="icon-tag"></i> <span>Tables</span></a>
                                <ul>
                                    <li><a href="table-basic.html">Tables Example<span class="badge badge-info float-right">New</span></a> </li>
                                    <li><a href="table-normal.html">Normal Tables</a> </li>
                                    <li><a href="table-jquery-datatable.html">Jquery Datatables</a> </li>
                                    <li><a href="table-editable.html">Editable Tables</a> </li>
                                    <li><a href="table-color.html">Tables Color</a> </li>
                                    <li><a href="table-filter.html">Table Filter <span class="badge badge-info float-right">New</span></a> </li>
                                    <li><a href="table-dragger.html">Table dragger <span class="badge badge-info float-right">New</span></a> </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#charts" class="has-arrow"><i class="icon-bar-chart"></i> <span>Charts</span></a>
                                <ul>
                                    <li><a href="chart-e.html">E Charts</a> </li>
                                    <li><a href="chart-morris.html">Morris</a> </li>
                                    <li><a href="chart-flot.html">Flot</a> </li>
                                    <li><a href="chart-chartjs.html">ChartJS</a> </li>                                    
                                    <li><a href="chart-jquery-knob.html">Jquery Knob</a> </li>                                        
                                    <li><a href="chart-sparkline.html">Sparkline Chart</a></li>
                                    <li><a href="chart-peity.html">Peity</a></li>
                                    <li><a href="chart-c3.html">C3 Charts</a></li>
                                    <li><a href="chart-gauges.html">Gauges</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#Maps" class="has-arrow"><i class="icon-map"></i> <span>Maps</span></a>
                                <ul>
                                    <li><a href="map-google.html">Google Map</a></li>
                                    <li><a href="map-yandex.html">Yandex Map</a></li>
                                    <li><a href="map-jvectormap.html">jVector Map</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="tab-pane p-l-15 p-r-15" id="Chat">
                    <form>
                        <div class="input-group m-b-20">
                            <div class="input-group-prepend">
                                <span class="input-group-text" ><i class="icon-magnifier"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="Search...">
                        </div>
                    </form>
                    <ul class="right_chat list-unstyled">
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="<%=request.getContextPath()%>/images/xs/avatar4.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Dr. Chris Fox</span>
                                        <span class="message">Dentist</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="<%=request.getContextPath()%>/images/xs/avatar5.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Dr. Joge Lucky</span>
                                        <span class="message">Gynecologist</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>
                        <li class="offline">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="<%=request.getContextPath()%>/images/xs/avatar2.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Dr. Isabella</span>
                                        <span class="message">CEO, WrapTheme</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>
                        <li class="offline">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="<%=request.getContextPath()%>/images/xs/avatar1.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Dr. Folisise Chosielie</span>
                                        <span class="message">Physical Therapy</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>
                        <li class="online">
                            <a href="javascript:void(0);">
                                <div class="media">
                                    <img class="media-object " src="<%=request.getContextPath()%>/images/xs/avatar3.jpg" alt="">
                                    <div class="media-body">
                                        <span class="name">Dr. Alexander</span>
                                        <span class="message">Audiology</span>
                                        <span class="badge badge-outline status"></span>
                                    </div>
                                </div>
                            </a>                            
                        </li>                        
                    </ul>
                </div>
                <div class="tab-pane p-l-15 p-r-15" id="setting">
                    <h6>Choose Skin</h6>
                    <ul class="choose-skin list-unstyled">
                        <li data-theme="purple">
                            <div class="purple"></div>
                            <span>Purple</span>
                        </li>                   
                        <li data-theme="blue">
                            <div class="blue"></div>
                            <span>Blue</span>
                        </li>
                        <li data-theme="cyan" class="active">
                            <div class="cyan"></div>
                            <span>Cyan</span>
                        </li>
                        <li data-theme="green">
                            <div class="green"></div>
                            <span>Green</span>
                        </li>
                        <li data-theme="orange">
                            <div class="orange"></div>
                            <span>Orange</span>
                        </li>
                        <li data-theme="blush">
                            <div class="blush"></div>
                            <span>Blush</span>
                        </li>
                    </ul>
                    </div></div></div></div></div>
                    

<%} else{
	response.sendRedirect(request.getContextPath()+"/view/page-login.jsp");
}%>
<!-- Javascript -->
<script src="<%=request.getContextPath()%>/assets/bundles/libscripts.bundle.js"></script>
<script src="<%=request.getContextPath()%>/assets/bundles/vendorscripts.bundle.js"></script>

<script src="<%=request.getContextPath()%>/assets/bundles/chartist.bundle.js"></script>
<script src="<%=request.getContextPath()%>/assets/bundles/knob.bundle.js"></script> <!-- Jquery Knob-->
<script src="<%=request.getContextPath()%>/assets/bundles/flotscripts.bundle.js"></script> <!-- flot charts Plugin Js -->
<script src="<%=request.getContextPath()%>/vendor/toastr/toastr.js"></script>
<script src="<%=request.getContextPath()%>/vendor/flot-charts/jquery.flot.selection.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script> -->
<script src="<%=request.getContextPath()%>/assets/bundles/mainscripts.bundle.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/index.js"></script>


<script type="text/javascript">

function loadindex()
{
	document.loadmenu.action = "../health/loadindex.htm";  
	document.loadmenu.submit();
}

function doctorprofile()
{
	document.loadmenu.action = "../health/doctorprofile.htm";  
	document.loadmenu.submit();
}

function loadappointment()
{
	document.loadmenu.action = "../health/loadappointment.htm";  
	document.loadmenu.submit();
}
function startSession()
{document.loadmenu.action = "../health/startSession.htm";  
document.loadmenu.submit();
	}
function loadcalendar()
{
	document.loadmenu.action = "../health/loadcalendar.htm";  
	document.loadmenu.submit();
}

function loaddepartment()
{
	document.loadmenu.action = "../health/loaddepartment.htm";  
	document.loadmenu.submit();
}

function loadtestsnapshot()
{
	document.loadmenu.action = "../health/loadtestsnapshot.htm";  
	document.loadmenu.submit();
}



/* window.location = "page-login.jsp"; */

function logout()
{
	$.ajax({
	type :'POST',
	url: "../controller/logout.htm",
	success :function(resdata,status,xhr)
	{
		if(resdata == "logout")
			{
			document.loadmenu.action = "../controller/loadLoginPage.htm";  
			document.loadmenu.submit();
			}
	},
	error : function(xhr, status, errorThrown) {
	
	},
	complete : function(xhr, status) {
	}
	});
}

/* window.setInterval(function()
{
	loadNotification();
}, 300000);  */

function loadNotification()
{
	$.ajax({
		type :'POST',
		url: "../health/listNotification.htm",
		success :function(data)
		{
			var json = JSON.parse(data);
			$("#notificationtoday").empty();
			var d;
			if(json.length > 0)
			{
				d = "<li class=\"header\"><strong>You have "+json.length+" new Notifications</strong></li>";
				$("#notificationtoday").append(d);
				$.each(json,function(i,f){
				 d = "<li>"+
				 		"<a>"+
               				"<div class=\"media\">"+
           						"<div class=\"media-left\">"+
           							"<i class=\"icon-info text-warning\"></i>"+
           						"</div>"+
           					/* 	"<div class=\"media-body\">"+
           					 		"<p class=\"text\">"+f.full_name+"</p>"
           					 	"</div>"+
	           					 "<div class=\"media-body\">"+
	    					 		"<p class=\"text\">Scheduled For  Today </p>"
	    					 	"</div>"+ */
	    					 	  "<div class=\"m-l-35 m-b-30 \">"+
	    			            	"<small class=\"text-muted\">"+f.full_name+"</small><br>"+
	    			                "<small class=\"text-muted\">Scheduled For  "+f.appointment_time+"</small>"+
	    			            "</div>"+
           					"</div>"+
           					"</a>"
   						"</li>";
				$("#notificationtoday").append(d);
			});
			}else
				{
					d = "<li class=\"header\"><strong>You have 0 new Notification</strong></li>";
					$("#notificationtoday").append(d);
				}
		}
	});

}




function checkFileUpload(fieldObj){
		var id = fieldObj.id;
		var FileName = fieldObj.value;
		
		var Extension = FileName.split(".");
		
		if(Extension.length > 2)
		{
			alert('Please select correct file format');
			fieldObj.value = "";
		}else
			{
				var FileExt = FileName.substr(FileName.lastIndexOf('.') + 1);
				var FileSize = fieldObj.files[0].size;
				var FileSizeMB = (FileSize / 10485760).toFixed(2);
				
					 if(FileExt == "jpeg" || FileExt == "JPEG" || FileExt == "png" || FileExt == "PNG" || FileExt == "jpg" || FileExt == "JPG")
					{
						if ((FileExt == "jpeg" || FileExt == "JPEG" || FileExt == "png" || FileExt == "PNG" || FileExt == "jpg" || FileExt == "JPG") && FileSize < 307200) { 
							return true;
						} else {
							var error = "Please make sure your file is in jpeg or png  format and size is less than 300KB.";
							alert(error);
							fieldObj.value = "";
							return false;
						}
					}	
					 else {
						var error = "Please make sure your file is in png or jpeg format.";
						alert(error);
						fieldObj.value = "";
						return false;
					}
			}
	}

function validateEmail(txtinput) {
    var check_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([A-Za-z]{2,6}(?:\.[a-z]{2})?)$/;
    {
        if (!txtinput.value == "") {
            if (txtinput.value.match(check_email)) {
        
                return true;
            } else {
                txtinput.value = "";
                txtinput.focus();
                alert('Please enter valid Email Id.');
                return false;
            }
        }
    }
}  


function mobilenoValidation(mobileno) {
    var val = mobileno.value;
    if(val != null && val != ""){
        
        if (val[0] == 6 || val[0] == 7 || val[0] == 8 || val[0] == 9) {
            if (/^\d{10}$/.test(val)) {
            } else {
                alert("Please enter valid mobile number");
                mobileno.value = "";
                return false;
            }
        }else{
            alert("Please enter valid mobile number");
            mobileno.value = "";
            return false;
        }
        
    }
 }


 function onlyalphabetwithspace(inputtxt) 
 {
    var letters = /^[A-Za-z ]+$/;
    if (!inputtxt.value == "") {
        if (inputtxt.value.match(letters)) {

            return true;
        } else {
            alert('Please input alphabet characters only');
            inputtxt.value = "";
            inputtxt.focus();
            return false;
        }
    }
}

function onlyNumber(form)
{
    var numbers = /^[-+]?[0-9]+$/;
    if(!form.value.match(numbers))
    {
        alert("Only numbers are allowed");
        form.value="";
        form.focus();
    }
}

function formValidate(divName)
{

            var flag=true;
            /*for textbox , radio button , password*/
            var dataInput=$('#'+divName+' input[type="text"].ValidateInput ,input[type="number"].ValidateInput,#'+divName+' input[type="email"].ValidateInput, #'+divName+' input[type="file"].ValidateInput ,#'+divName+' input[type="password"].ValidateInput,#'+divName+' input[type="datetime-local"].ValidateInput');
            for(var i=0;i<dataInput.length;i++)
            {
                if($.trim(dataInput[i].value)=='' && dataInput[i].offsetParent !=null)
                {
                    $("."+dataInput[i].id).empty();
                    $("#"+divName+" #"+dataInput[i].id).addClass("validateStyle");
                    //$("#"+divName+" #"+dataInput[i].id).after('<span class="error errorTag  text-danger '+dataInput[i].id+'" >You Can \'t Leave this Empty</span>');
                    flag=false;
                }
                if(dataInput[i].offsetParent == null)
                {
                    $("."+dataInput[i].id).empty();
                    $("#"+divName+" #"+dataInput[i].id).removeClass("validateStyle");
                }
            }
            
            /*for radio button*/
            var dataRadio=$('#'+divName+' input[type="radio"].ValidateInput');
            for(var i=0;i<dataRadio.length;i++)
            {
                var radioGroupName=$("input[type='radio']#"+dataRadio[i].id)[0].attributes['name'].textContent;
                
                if(!$("input[name='"+radioGroupName+"']").is(":checked"))
                { 
                    $("input[name='"+radioGroupName+"']").addClass("validateStyle");
                    flag=false;
                }
                
            }
            
            /*for textarea*/
            var dataTextArea=$('#'+divName+' textarea.ValidateInput');
            for(var i=0;i<dataTextArea.length;i++)
            {
                if($.trim(dataTextArea[i].value)=='' && dataTextArea[i].offsetParent !=null)
                {
                    $("."+dataTextArea[i].id).empty();
                    //console.log(dataInput[i].id);
                    $("#"+divName+" #"+dataTextArea[i].id).addClass("validateStyle");
                    //$("#"+divName+" #"+dataTextArea[i].id).after('<span class="error errorTag  text-danger '+dataTextArea[i].id+'" >You Can \'t Leave this Empty</span>');
                    
                    flag=false;
                }
                if(dataTextArea[i].offsetParent == null)
                {
                    $("."+dataTextArea[i].id).empty();
                    $("#"+divName+" #"+dataTextArea[i].id).removeClass("validateStyle");
                }
            }
            
            /*for select tag*/
            var dataSelect=$('#'+divName+' select.ValidateInput');
            
            for(var i=0;i<dataSelect.length;i++)
            {
                if((dataSelect[i].value==''  && dataSelect[i].offsetParent !=null) || (dataSelect[i].value=='-1' && dataSelect[i].offsetParent !=null))
                {
                    $("."+dataSelect[i].id).empty();
                    $("#"+divName+" #"+dataSelect[i].id).addClass("validateStyle");
                    //$("#"+divName+" #"+dataSelect[i].id).after('<span class="error errorTag  text-danger '+dataSelect[i].id+'" >You Can \'t Leave this Empty</span>');
                    flag=false;
                }
                if(dataSelect[i].offsetParent == null)
                {
                    $("."+dataSelect[i].id).empty();
                    $("#"+divName+" #"+dataSelect[i].id).removeClass("validateStyle");
                }
            }
            
            /*for hidden for file only*/
            var dataFileInput=$('#'+divName+' input[type="hidden"].ValidateInput');
            for(var i=0;i<dataFileInput.length;i++)
            {
                if($.trim(dataFileInput[i].value)=='')
                {
                    $("."+dataFileInput[i].id+"File").empty();
                    //console.log(dataInput[i].id);
                    $("#"+divName+" #"+dataFileInput[i].id+"File").addClass("validateStyle");
                    //$("#"+divName+" #"+dataFileInput[i].id+"File").after('<span class="error errorTag  text-danger '+dataFileInput[i].id+'File" >You Can \'t Leave this Empty</span>');
                    flag=false;
                }
            }
            
            $('#'+divName+' .validateStyle').click(function(){
                
                $('#'+this.id).removeClass("validateStyle");
                $("."+this.id).empty();
            });
            $('#'+divName+'.validateStyle').change(function(){
                
                $('#'+this.id).removeClass("validateStyle");
                $("."+this.id).empty();
            });
            $('#'+divName+'.validateStyle').focus(function(){
                
                $('#'+this.id).removeClass("validateStyle");
                $("."+this.id).empty();
            });
            
            if($('#'+divName).find(".is-invalid").length > 0 || flag==false)
            {
                flag = false;
            }
            else
            {
                flag=true;
            }
            return flag;
}


function validateRegex(element)
{
alert(element.className);

let a=element.className;

if(a.includes("OnlyNumberRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[0-9]*$:Please Enter Only Number');	
}
else if(a.includes("MobileNumberRegexClass"))
{
    alert(element.id);
    bootstrapValidate('#'+element.id, 'regex:^([1-9]{1}[0-9]{9})?$:Please Enter Valid Mobile Number');	
}
else if(a.includes("SimpleTextRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[a-zA-Z\t]*$:Please Enter Only Text');
}
else if(a.includes("SimpleTextWithSpaceRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[a-zA-Z ]*$:Please Enter Only Text');
}
else if(a.includes("SimpleTextWithCoomaRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[a-zA-Z,]*$:Please Enter Valid Text(Only Cooma Allowed)');
}
else if(a.includes("SimpleTextWithUnderScoreAndNumberRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[a-zA-Z0-9_ ]*$:Please Enter Valid Text(Only UnderScore Allowed)');
}
else if(a.includes("AlphaNumericRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[a-zA-Z0-9 ]*$:Please Enter Alpha Numeric Value');
}
else if(a.includes("AlphaNumericWithoutSpaceRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[a-zA-Z0-9]*$:Please Enter Valid Value');
}
else if(a.includes("YearRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^([2][0-9]{3}[-][0-9]{4})*$:Please Enter Valid Year');
}
else if(a.includes("PincodeRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^([0-9]{6})?$:Please Enter Valid Pincode');
}
else if(a.includes("NumberSizeOneRegexClass"))
{ 
    bootstrapValidate('#'+element.id, 'regex:^([1-9]{1})?$:Please Enter Only One Digit');
}
else if(a.includes("NumberSizeThreeRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^([1-9]{1,3})?$:Please Enter Only Three Digit');
}
else if(a.includes("NumberSizeFiveRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^([1-9]{1,5})?$:Please Enter Only Five Digit');
}
else if(a.includes("TextareaRegexWithoutSpecialCharacterClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[a-z(?,-.) A-Z(?,-.) 0-9(?,-.)]*$:Please Enter Valid Text');
}
else if(a.includes("TextareaRegexWithSpecialCharacterClass"))
{
    bootstrapValidate('#'+element.id, 'regex:^[a-z(?,-.) A-Z(?,-.) 0-9(?,-.) ?*!@#$%^&*()_;:]*$:Please Enter Valid Text');
}
else if(a.includes("AgeRegexClass"))
{
    bootstrapValidate('#'+element.id,'regex:^([4-9]([0-9]))?$:Please Enter Valid Age');
}
else if(a.includes("PdfFileExtentionRegexClass"))
{
    var FileName = element.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.') + 1).toLowerCase();
    if(element.files.length>0)
    {
        var FileSize = element.files[0].size;
        if (FileExt == "pdf" && FileSize < 5242880) 
        {$('.invalid-feedback').empty();return true;} 
        else
        {
            var error = "Please make sure your file is in pdf format and less than 5 MB.";
            bootstrapValidate('#'+element.id,'regex:^(([a-zA-Z0-9])*([.])([pdf])*)?$:Please Enter Valid File');
            alert(error);
            $("#"+element.id).val("");
            return false;
        }
}
}
else if(a.includes("FloatValueRegexClass"))
{
    bootstrapValidate('#'+element.id,'regex:^([0-9]{2}(\.))?([0-9]{2})?$:Please Enter Valid Value After Point Enter Two Digit');
}
else if(a.includes("DateFormatRegexClass"))
{
    bootstrapValidate('#'+element.id, 'regex:b(?:Jan?|?:Feb?|?:Mar?|?:Apr?|?:May?|?:Jun?|?:Jul?|?:Aug?|?:Sep?|?:Oct?|?:Nov?|?:Dec?) [0-9]{1,2}[,] (?:19[7-9]\d|2\d{3})(?=\D|$):Please Enter Valid Date');
}
else if(a.includes("TestingClass"))
{
    bootstrapValidate('#'+element.id,'regex:^(0?[1-9]\/\[12][0-9]|3[01])[\/\-]([Jan][\/]Aug])*[\/\-]\d{4}$:Please Enter Valid Age')
}
else if(a.includes("AadharNoregexClass"))
{
    bootstrapValidate('#'+element.id,'regex:^[1-9]{12}$:Please Enter Valid Aadhar No')
}
}


</script>
</body>

</html>
