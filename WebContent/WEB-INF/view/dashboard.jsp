<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">

<head>
<title>:: Lucid Hospital :: Home</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="Lucid Bootstrap 4.1.1 Admin Template">
<meta name="author" content="WrapTheme, design by: ThemeMakker.com">

<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon">
<!-- VENDOR CSS -->


<link rel="stylesheet" href="<%=request.getContextPath()%>/app-assets/vendors/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/app-assets/fontawesome/css/font-awesome.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/app-assets/vendors/css/charts/chartist.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/app-assets/vendors/css/chartist-plugin-tooltip.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/app-assets/css/plugins/extensions/toastr.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/app-assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/app-assets/css/colors.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/app-assets/simplelineicon/css/simple-line-icons.css">
</head>
<body class="theme-cyan">

<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img src="<%=request.getContextPath()%>/assets/images/logo-icon.svg" width="48" height="48" alt="Lucid"></div>
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
                <a href="index.html"><img src="<%=request.getContextPath()%>/assets/images/logo.svg" alt="Lucid Logo" class="img-responsive logo"></a>                
            </div>
            
            <div class="navbar-right">
                <form id="navbar-search" class="navbar-form search-form">
                    <input value="" class="form-control" placeholder="Search here..." type="text">
                    <button type="button" class="btn btn-default"><i class="icon-magnifier"></i></button>
                </form>                

                <div id="navbar-menu">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="doctor-events.html" class="icon-menu d-none d-sm-block d-md-none d-lg-block"><i class="icon-calendar"></i></a>
                        </li>
                        <li>
                            <a href="app-chat.html" class="icon-menu d-none d-sm-block"><i class="icon-bubbles"></i></a>
                        </li>
                        <li>
                            <a href="app-inbox.html" class="icon-menu d-none d-sm-block"><i class="icon-envelope"></i><span class="notification-dot"></span></a>
                        </li>
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle icon-menu" data-toggle="dropdown">
                                <i class="icon-bell"></i>
                                <span class="notification-dot"></span>
                            </a>
                            <ul class="dropdown-menu notifications">
                                <li class="header"><strong>You have 4 new Notifications</strong></li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="icon-info text-warning"></i>
                                            </div>
                                            <div class="media-body">
                                                <p class="text">Campaign <strong>Holiday Sale</strong> is nearly reach budget limit.</p>
                                                <span class="timestamp">10:00 AM Today</span>
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
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle icon-menu" data-toggle="dropdown"><i class="icon-equalizer"></i></a>
                            <ul class="dropdown-menu user-menu menu-icon">
                                <li class="menu-heading">ACCOUNT SETTINGS</li>
                                <li><a href="javascript:void(0);"><i class="icon-note"></i> <span>Basic</span></a></li>
                                <li><a href="javascript:void(0);"><i class="icon-equalizer"></i> <span>Preferences</span></a></li>
                                <li><a href="javascript:void(0);"><i class="icon-lock"></i> <span>Privacy</span></a></li>
                                <li><a href="javascript:void(0);"><i class="icon-bell"></i> <span>Notifications</span></a></li>
                                <li class="menu-heading">BILLING</li>
                                <li><a href="javascript:void(0);"><i class="icon-credit-card"></i> <span>Payments</span></a></li>
                                <li><a href="javascript:void(0);"><i class="icon-printer"></i> <span>Invoices</span></a></li>                                
                                <li><a href="javascript:void(0);"><i class="icon-refresh"></i> <span>Renewals</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="page-login.html" class="icon-menu"><i class="icon-login"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div id="left-sidebar" class="sidebar">
        <div class="sidebar-scroll">
            <div class="user-account">
                <img src="<%=request.getContextPath()%>/assets/images/user.png" class="rounded-circle user-photo" alt="User Profile Picture">
                <div class="dropdown">
                    <span>Welcome,</span>
                    <a href="javascript:void(0);" class="dropdown-toggle user-name" data-toggle="dropdown"><strong>Dr. Chandler Bing</strong></a>
                    <ul class="dropdown-menu dropdown-menu-right account">
                        <li><a href="doctor-profile.html"><i class="icon-user"></i>My Profile</a></li>
                        <li><a href="app-inbox.html"><i class="icon-envelope-open"></i>Messages</a></li>
                        <li><a href="javascript:void(0);"><i class="icon-settings"></i>Settings</a></li>
                        <li class="divider"></li>
                        <li><a href="page-login.html"><i class="icon-power"></i>Logout</a></li>
                    </ul>
                </div>
                <hr>
                <ul class="row list-unstyled">
                    <li class="col-4">
                        <small>Exp</small>
                        <h6>14</h6>
                    </li>
                    <li class="col-4">
                        <small>Awards</small>
                        <h6>13</h6>
                    </li>
                    <li class="col-4">
                        <small>Clients</small>
                        <h6>213</h6>
                    </li>
                </ul>
            </div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#menu">Menu</a></li>                
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#sub_menu"><i class="icon-grid"></i></a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Chat"><i class="icon-book-open"></i></a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#setting"><i class="icon-settings"></i></a></li>                
            </ul>
                
            <!-- Tab panes -->
            <div class="tab-content p-l-0 p-r-0">
                <div class="tab-pane active" id="menu">
                    <nav class="sidebar-nav">
                        <ul class="main-menu metismenu">
                            <li class="active"><a href="index.html"><i class="icon-home"></i><span>Dashboard</span></a></li>
                            <li><a href="app-appointment.html"><i class="icon-calendar"></i>Appointment</a></li>
                            <li><a href="app-taskboard.html"><i class="icon-list"></i>Taskboard</a></li>
                            <li><a href="app-inbox.html"><i class="icon-home"></i>Inbox App</a></li>
                            <li><a href="app-chat.html"><i class="icon-bubbles"></i>Chat App</a></li>
                            <li><a href="javascript:void(0);" class="has-arrow"><i class="icon-user-follow"></i><span>Doctors</span> </a>
                                <ul>
                                    <li><a href="doctors-all.html">All Doctors</a></li>
                                    <li><a href="doctor-add.html">Add Doctor</a></li>
                                    <li><a href="doctor-profile.html">Doctor Profile</a></li>
                                    <li><a href="doctor-events.html">Doctor Schedule</a></li>
                                </ul>
                            </li>
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
                                    <li><a href="depa-add.html">Add</a></li>
                                    <li><a href="depa-all.html">All Departments</a></li>
                                    <li><a href="javascript:void(0);">Cardiology</a></li>
                                    <li><a href="javascript:void(0);">Pulmonology</a></li>
                                    <li><a href="javascript:void(0);">Gynecology</a></li>
                                    <li><a href="javascript:void(0);">Neurology</a></li>
                                    <li><a href="javascript:void(0);">Urology</a></li>
                                    <li><a href="javascript:void(0);">Gastrology</a></li>
                                    <li><a href="javascript:void(0);">Pediatrician</a></li>
                                    <li><a href="javascript:void(0);">Laboratory</a></li>
                                </ul>
                            </li>
                            <li><a href="our-centres.html"><i class="icon-pointer"></i>WorldWide Centres</a></li>
                            <li>
                                <a href="#Authentication" class="has-arrow"><i class="icon-lock"></i><span>Authentication</span></a>
                                <ul>
                                    <li><a href="page-login.html">Login</a></li>
                                    <li><a href="page-register.html">Register</a></li>
                                    <li><a href="page-lockscreen.html">Lockscreen</a></li>
                                    <li><a href="page-forgot-password.html">Forgot Password</a></li>
                                    <li><a href="page-404.html">Page 404</a></li>
                                    <li><a href="page-403.html">Page 403</a></li>
                                    <li><a href="page-500.html">Page 500</a></li>
                                    <li><a href="page-503.html">Page 503</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#Widgets" class="has-arrow"><i class="icon-puzzle"></i><span>Widgets</span></a>
                                <ul>
                                    <li><a href="widgets-statistics.html">Statistics Widgets</a></li>
                                    <li><a href="widgets-data.html">Data Widgets</a></li>
                                    <li><a href="widgets-chart.html">Chart Widgets</a></li>
                                    <li><a href="widgets-weather.html">Weather Widgets</a></li>
                                    <li><a href="widgets-social.html">Social Widgets</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#Pages" class="has-arrow"><i class="icon-docs"></i><span>Extra Pages</span></a>
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
                                    <img class="media-object " src="<%=request.getContextPath()%>/assets/images/avatar4.jpg" alt="">
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
                                    <img class="media-object " src="<%=request.getContextPath()%>/assets/images/avatar5.jpg" alt="">
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
                                    <img class="media-object " src="<%=request.getContextPath()%>/assets/images/avatar2.jpg" alt="">
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
                                    <img class="media-object " src="<%=request.getContextPath()%>/assets/images/avatar1.jpg" alt="">
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
                                    <img class="media-object " src="<%=request.getContextPath()%>/assets/images/avatar3.jpg" alt="">
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
                    <hr>
                    <h6>General Settings</h6>
                    <ul class="setting-list list-unstyled">
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox">
                                <span>Report Panel Usag</span>
                            </label>
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox">
                                <span>Email Redirect</span>
                            </label>
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox" checked>
                                <span>Notifications</span>
                            </label>                      
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox" checked>
                                <span>Auto Updates</span>
                            </label>
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox">
                                <span>Offline</span>
                            </label>
                        </li>
                        <li>
                            <label class="fancy-checkbox">
                                <input type="checkbox" name="checkbox" checked>
                                <span>Location Permission</span>
                            </label>
                        </li>
                    </ul>
                </div>             
            </div>          
        </div>
    </div>

    <div id="main-content">
        <div class="container-fluid">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Dashboard</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>                            
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ul>
                    </div>            
                    <div class="col-lg-6 col-md-4 col-sm-12 text-right">
                        <div class="bh_chart hidden-xs">
                            <div class="float-left m-r-15">
                                <small>Visitors</small>
                                <h6 class="mb-0 mt-1"><i class="icon-user"></i> 1,784</h6>
                            </div>
                            <span class="bh_visitors float-right">2,5,1,8,3,6,7,5</span>
                        </div>
                        <div class="bh_chart hidden-sm">
                            <div class="float-left m-r-15">
                                <small>Visits</small>
                                <h6 class="mb-0 mt-1"><i class="icon-globe"></i> 325</h6>
                            </div>
                            <span class="bh_visits float-right">10,8,9,3,5,8,5</span>
                        </div>
                        <div class="bh_chart hidden-sm">
                            <div class="float-left m-r-15">
                                <small>Chats</small>
                                <h6 class="mb-0 mt-1"><i class="icon-bubbles"></i> 13</h6>
                            </div>
                            <span class="bh_chats float-right">1,8,5,6,2,4,3,2</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-lg-3 col-md-12">
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-6">
                            <div class="card top_counter">
                                <div class="body">
                                    <div id="top_counter1" class="carousel vert slide" data-ride="carousel" data-interval="2500">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="icon"><i class="fa fa-user"></i> </div>
                                                <div class="content">
                                                    <div class="text">Total Patient</div>
                                                    <h5 class="number"><label id="total_patient"></label></h5>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="icon"><i class="fa fa-user"></i> </div>
                                                <div class="content">
                                                    <div class="text">New Patient</div>
                                                    <h5 class="number"><label id="new_patient"></label></h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div id="top_counter2" class="carousel vert slide" data-ride="carousel" data-interval="2100">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="icon"><i class="fa fa-user-md"></i> </div>
                                                <div class="content">
                                                    <div class="text">Operations</div>
                                                    <h5 class="number"><label id="doc_operation"></label></h5>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="icon"><i class="fa fa-user-md"></i> </div>
                                                <div class="content">
                                                    <div class="text">Surgery</div>
                                                    <h5 class="number"><label id="doc_surgery"></label></h5>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="icon"><i class="fa fa-user-md"></i> </div>
                                                <div class="content">
                                                    <div class="text">Treatment</div>
                                                    <h5 class="number"><label id="doc_treatment"></label></h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-6">
                            <div class="card top_counter">
                                <div class="body">
                                    <div id="top_counter3" class="carousel vert slide" data-ride="carousel" data-interval="2300">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="icon"><i class="fa fa-eye"></i> </div>
                                                <div class="content">
                                                    <div class="text">Total Visitors</div>
                                                    <h5 class="number"><label id="total_visitors"></label></h5>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="icon"><i class="fa fa-eye"></i> </div>
                                                <div class="content">
                                                    <div class="text">Today Visitors</div>
                                                    <h5 class="number"><label id="today_visitors"></label></h5>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="icon"><i class="fa fa-eye"></i> </div>
                                                <div class="content">
                                                    <div class="text">Month Visitors</div>
                                                    <h5 class="number"><label id="month_visitors"></label></h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                    <hr>
                                    <div class="icon"><i class="fa fa-university"></i> </div>
                                    <div class="content">
                                        <div class="text">Revenue</div>
                                        <h5 class="number"><label id="doc_revenue"></label></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="card top_counter">
                                <div class="body">
                                    <div class="icon"><i class="fa fa-thumbs-o-up"></i> </div>
                                    <div class="content">
                                        <div class="text">Happy Clients</div>
                                        <h5 class="number"><label id="happy_client"></label></h5>
                                    </div>
                                    <hr>
                                    <div class="icon"><i class="fa fa-smile-o"></i> </div>
                                    <div class="content">
                                        <div class="text">Smiley Faces</div>
                                        <h5 class="number"><label id="smiley_faces"></label></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-12">
                    <div class="card">
                        <div class="header">
                            <h2>Total Revenue</h2>
                            <ul class="header-dropdown">
                                <li><a class="tab_btn" href="javascript:void(0);" title="Weekly">W</a></li>
                                <li><a class="tab_btn" href="javascript:void(0);" title="Monthly">M</a></li>
                                <li><a class="tab_btn active" href="javascript:void(0);" title="Yearly">Y</a></li>
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another Action</a></li>
                                        <li><a href="javascript:void(0);">Something else</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="body bg-success text-light">
                                        <h4><i class="icon-wallet"></i> 7,12,326$</h4>
                                        <span>Operation Income</span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="body bg-warning text-light">
                                        <h4><i class="icon-wallet"></i> 25,965$</h4>
                                        <span>Pharmacy Income</span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="body bg-danger text-light">
                                        <h4><i class="icon-wallet"></i> 14,965$</h4>
                                        <span>Hospital Expenses</span>
                                    </div>
                                </div>
                            </div>
                            <div id="demo_total_revenue" class="ct-chart m-t-20"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-lg-8 col-md-12">
                    <div class="card">
                        <div class="header">
                            <h2>Visitors Statistics</h2>
                            <ul class="header-dropdown">
                                <li><a class="tab_btn" href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Weekly">W</a></li>
                                <li><a class="tab_btn" href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Monthly">M</a></li>
                                <li><a class="tab_btn active" href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Yearly">Y</a></li>
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another Action</a></li>
                                        <li><a href="javascript:void(0);">Something else</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div id="Visitors_chart" class="flot-chart m-b-20"></div>
                            <div class="row text-center">
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div id="Visitors_chart1" class="carousel slide" data-ride="carousel" data-interval="2000">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="body xl-turquoise">
                                                    <h4>2,025</h4>
                                                    <span>America</span>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="body xl-parpl">
                                                    <h4>1,100</h4>
                                                    <span>Canada</span>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="body xl-salmon">
                                                    <h4>680</h4>
                                                    <span>Brazil</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div id="Visitors_chart2" class="carousel slide" data-ride="carousel" data-interval="2200">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="body xl-parpl">
                                                    <h4>1,025</h4>
                                                    <span>UK</span>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="body xl-slategray">
                                                    <h4>582</h4>
                                                    <span>France</span>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="body xl-khaki">
                                                    <h4>128</h4>
                                                    <span>Georgia</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="body xl-salmon">                                        
                                        <h4>3,845</h4>
                                        <span>India</span>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="body xl-slategray">                                        
                                        <h4>863</h4>
                                        <span>Other</span>
                                    </div>
                                </div>                      
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="header">
                            <h2>ToDo List <small>This Month task list</small></h2>
                        </div>
                        <div class="body todo_list">
                            <ul class="list-unstyled">
                                <li>
                                    <label class="fancy-checkbox mb-0">
                                        <input type="checkbox" name="checkbox" checked>
                                        <span>A Brief History Of Anesthetics</span>
                                    </label>
                                    <div class="m-l-35 m-b-30">
                                        <small class="text-muted">SCHEDULED FOR 3:00 P.M. ON JUN 2018</small>
                                        <ul class="list-unstyled team-info">
                                            <li><img src="<%=request.getContextPath()%>/assets/images/avatar1.jpg" data-toggle="tooltip" data-placement="top" title="Dr. Chris Fox" alt="Avatar"></li>
                                            <li><img src="<%=request.getContextPath()%>/assets/images/avatar2.jpg" data-toggle="tooltip" data-placement="top" title="Dr. Joge Lucky" alt="Avatar"></li>
                                            <li><img src="<%=request.getContextPath()%>/assets/images/avatar5.jpg" data-toggle="tooltip" data-placement="top" title="Isabella" alt="Avatar"></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <label class="fancy-checkbox mb-0">
                                        <input type="checkbox" name="checkbox">
                                        <span>Using Laser Teatment to Help</span>
                                    </label>
                                    <div class="m-l-35 m-b-30">
                                        <small class="text-muted">SCHEDULED FOR 4:30 P.M. ON JUN 2018</small>
                                    </div>
                                </li>
                                <li>
                                    <label class="fancy-checkbox mb-0">
                                        <input type="checkbox" name="checkbox">
                                        <span>Selecting the Apnea Treatment</span>
                                    </label>
                                    <div class="m-l-35 m-b-30">
                                        <small class="text-muted">SCHEDULED FOR 4:30 P.M. ON JUN 2018</small><br>
                                        <small class="text-warning">ICU PATIENT - LAST 2 DAYS</small><br>
                                        <small>Patient Name: <a href="#">Hossein</a></small>                                        
                                    </div>
                                </li>
                                <li>
                                    <label class="fancy-checkbox mb-0">
                                        <input type="checkbox" name="checkbox">
                                        <span>Using Laser Teatment to Help</span>
                                    </label>
                                    <div class="m-l-35">
                                        <small class="text-muted">SCHEDULED FOR 4:30 P.M. ON JUN 2018</small>
                                        <ul class="list-unstyled team-info">
                                            <li><img src="<%=request.getContextPath()%>/assets/images/avatar4.jpg" data-toggle="tooltip" data-placement="top" title="Dr. Chris Fox" alt="Avatar"></li>
                                            <li><img src="<%=request.getContextPath()%>/assets/images/avatar6.jpg" data-toggle="tooltip" data-placement="top" title="Dr. Joge Lucky" alt="Avatar"></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-lg-6 col-md-12">
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h2>Patient history</h2>
                                    <ul class="header-dropdown">
                                        <li><a class="tab_btn" href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Weekly">W</a></li>
                                        <li><a class="tab_btn" href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Monthly">M</a></li>
                                        <li><a class="tab_btn active" href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Yearly">Y</a></li>
                                        <li class="dropdown">
                                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="javascript:void(0);">Action</a></li>
                                                <li><a href="javascript:void(0);">Another Action</a></li>
                                                <li><a href="javascript:void(0);">Something else</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="body">
                                    <div id="patient_history" class="chartist"></div>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-lg-12 col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h2>Recent Chat</h2>
                                    <ul class="header-dropdown">
                                        <li class="dropdown">
                                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="javascript:void(0);">Action</a></li>
                                                <li><a href="javascript:void(0);">Another Action</a></li>
                                                <li><a href="javascript:void(0);">Something else</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="body text-center">
                                    <div class="cwidget-scroll">
                                        <ul class="chat-widget m-r-5 clearfix">
                                            <li class="left float-left">
                                                <img src="<%=request.getContextPath()%>/assets/images/avatar2.jpg" class="rounded-circle" alt="">
                                                <div class="chat-info">       
                                                    <span class="message">Hello, John<br>What is the update on Project X?</span>
                                                </div>
                                            </li>
                                            <li class="right">
                                                <img src="<%=request.getContextPath()%>/assets/images/avatar1.jpg" class="rounded-circle" alt="">
                                                <div class="chat-info">
                                                    <span class="message">Hi, Chandler<br> It is almost completed. I will send you an email later today.</span>
                                                </div>
                                            </li>
                                            <li class="left float-left">
                                                <img src="<%=request.getContextPath()%>/assets/images/avatar2.jpg" class="rounded-circle" alt="">
                                                <div class="chat-info">
                                                    <span class="message">That's great. Will catch you in evening.</span>
                                                </div>
                                            </li>
                                            <li class="right">
                                                <img src="<%=request.getContextPath()%>/assets/images/avatar1.jpg" class="rounded-circle" alt="">
                                                <div class="chat-info">
                                                    <span class="message">Sure we'will have a blast today.</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="input-group p-t-15">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" ><i class="icon-paper-plane"></i></span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Enter text here...">                                    
                                    </div>                            
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="card">
                        <div class="header">
                            <h2>Hospital Activities</h2>
                        </div>
                        <div class="body">
                            <div class="timeline-item green">
                                <span class="date">20-04-2018 - Today</span>
                                <h5>A Brief History Of Anesthetics</h5>
                                <span><a href="javascript:void(0);">Elisse Joson</a> San Francisco, CA</span>
                                <div class="msg">
                                    <p>I'm speaking with myself, number one, because I have a very good brain and I've said a lot of things.</p>
                                    <a href="javascript:void(0);" class="m-r-20"><i class="icon-heart"></i> Like</a>
                                    <a role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="icon-bubbles"></i> Comment</a>
                                    <div class="collapse m-t-10" id="collapseExample">
                                        <div class="well">
                                            <form>
                                                <div class="form-group">
                                                    <textarea rows="2" class="form-control no-resize" placeholder="Enter here for tweet..."></textarea>
                                                </div>
                                                <button class="btn btn-primary">Submit</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>                                
                            </div>

                            <div class="timeline-item blue">
                                <span class="date">19-04-2018 - Yesterday</span>
                                <h5>Using Laser Teatment to Help</h5>
                                <span><a href="javascript:void(0);" title="">Katherine Lumaad</a> Oakland, CA</span>
                                <div class="msg">
                                    <p>web by far While that's mock-ups and this is politics, are they really so different? I think the only card she has is the Lorem card.</p>
                                    <div class="timeline_img m-b-20">
                                        <img class="w-25" src="<%=request.getContextPath()%>/assets/images/blog-page-4.jpg" alt="Awesome Image">
                                        <img class="w-25" src="<%=request.getContextPath()%>/assets/images/blog-page-2.jpg" alt="Awesome Image">
                                    </div>
                                    <a href="javascript:void(0);" class="m-r-20"><i class="icon-heart"></i> Like</a>
                                    <a role="button" data-toggle="collapse" href="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1"><i class="icon-bubbles"></i> Comment</a>
                                    <div class="collapse m-t-10" id="collapseExample1">
                                        <div class="well">
                                            <form>
                                                <div class="form-group">
                                                    <textarea rows="2" class="form-control no-resize" placeholder="Enter here for tweet..."></textarea>
                                                </div>
                                                <button class="btn btn-primary">Submit</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="timeline-item warning pb-0">
                                <span class="date">21-02-2018</span>
                                <h5>Selecting the right Apnea Treatment</h5>
                                <span><a href="javascript:void(0);" title="">Gary Camara</a> San Francisco, CA</span>
                                <div class="msg">
                                    <p>I write the best placeholder text, and I'm the biggest developer on the web by far... While that's mock-ups and this is politics, is the Lorem card.</p>
                                    <a href="javascript:void(0);" class="m-r-20"><i class="icon-heart"></i> Like</a>
                                    <a role="button" data-toggle="collapse" href="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2"><i class="icon-bubbles"></i> Comment</a>
                                    <div class="collapse m-t-10" id="collapseExample2">
                                        <div class="well">
                                            <form>
                                                <div class="form-group">
                                                    <textarea rows="2" class="form-control no-resize" placeholder="Enter here for tweet..."></textarea>
                                                </div>
                                                <button class="btn btn-primary">Submit</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="header">
                            <h2>Patients Status</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another Action</a></li>
                                        <li><a href="javascript:void(0);">Something else</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <p class="float-md-right">
                                <span class="badge badge-success">3 Admit</span>
                                <span class="badge badge-default">2 Discharge</span>
                            </p>
                            <div class="table-responsive table_middel">
                                <table class="table m-b-0">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>#</th>
                                            <th>Patients</th>
                                            <th>Adress</th>
                                            <th>START Date</th>
                                            <th>END Date</th>
                                            <th>Priority</th>
                                            <th>Progress</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><img src="<%=request.getContextPath()%>/assets/images/avatar3.jpg" class="rounded-circle width30 m-r-15" alt="profile-image"><span>John</span></td>
                                            <td><span class="text-info">70 Bowman St. South Windsor, CT 06074</span></td>
                                            <td>Sept 13, 2017</td>
                                            <td>Sept 16, 2017</td>
                                            <td><span class="badge badge-warning">MEDIUM</span></td>
                                            <td><div class="progress progress-xs">
                                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"> <span class="sr-only">40% Complete</span> </div>
                                                </div>
                                            </td>
                                            <td><span class="badge badge-success">Admit</span></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><img src="<%=request.getContextPath()%>/assets/images/avatar1.jpg" class="rounded-circle width30 m-r-15" alt="profile-image"><span>Jack Bird</span></td>
                                            <td><span class="text-info">123 6th St. Melbourne, FL 32904</span></td>
                                            <td>Sept 13, 2017</td>
                                            <td>Sept 22, 2017</td>
                                            <td><span class="badge badge-warning">MEDIUM</span></td>
                                            <td><div class="progress progress-xs">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"> <span class="sr-only">100% Complete</span> </div>
                                                </div>
                                            </td>
                                            <td><span class="badge badge-default">Discharge</span></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><img src="<%=request.getContextPath()%>/assets/images/avatar4.jpg" class="rounded-circle width30 m-r-15" alt="profile-image"><span>Dean Otto</span></td>
                                            <td><span class="text-info">123 6th St. Melbourne, FL 32904</span></td>
                                            <td>Sept 13, 2017</td>
                                            <td>Sept 23, 2017</td>
                                            <td><span class="badge badge-warning">MEDIUM</span></td>
                                            <td><div class="progress progress-xs">
                                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 15%;"> <span class="sr-only">15% Complete</span> </div>
                                                </div>
                                            </td>
                                            <td><span class="badge badge-success">Admit</span></td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><img src="<%=request.getContextPath()%>/assets/images/avatar2.jpg" class="rounded-circle width30 m-r-15" alt="profile-image"><span>Jack Bird</span></td>
                                            <td><span class="text-info">4 Shirley Ave. West Chicago, IL 60185</span></td>
                                            <td>Sept 17, 2017</td>
                                            <td>Sept 16, 2017</td>
                                            <td><span class="badge badge-success">LOW</span></td>
                                            <td><div class="progress progress-xs">
                                                    <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"> <span class="sr-only">100% Complete</span> </div>
                                                </div>
                                            </td>
                                            <td><span class="badge badge-default">Discharge</span></td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><img src="<%=request.getContextPath()%>/assets/images/avatar5.jpg" class="rounded-circle width30 m-r-15" alt="profile-image"><span>Hughe L.</span></td>
                                            <td><span class="text-info">4 Shirley Ave. West Chicago, IL 60185</span></td>
                                            <td>Sept 18, 2017</td>
                                            <td>Sept 18, 2017</td>
                                            <td><span class="badge badge-danger">HIGH</span></td>
                                            <td><div class="progress progress-xs">
                                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"> <span class="sr-only">85% Complete</span> </div>
                                                </div>
                                            </td>
                                            <td><span class="badge badge-success">Admit</span></td>
                                        </tr>
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

<!-- Javascript -->


<script src="<%=request.getContextPath()%>/app-assets/js/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/app-assets/js/index.js"></script>
<script src="<%=request.getContextPath()%>/app-assets/js/jquery.min.js"></script>

 <script src="<%=request.getContextPath()%>/assets/js/bundles/libscripts.bundle.js"></script> 
<script src="<%=request.getContextPath()%>/assets/js/bundles/vendorscripts.bundle.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bundles/chartist.bundle.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bundles/knob.bundle.js"></script> <!-- Jquery Knob-->
<script src="<%=request.getContextPath()%>/assets/js/bundles/flotscripts.bundle.js"></script> <!-- flot charts Plugin Js -->
<script src="<%=request.getContextPath()%>/app-assets/vendors/js/extensions/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/app-assets/vendors/js/charts/flot/jquery.flot.selection.js"></script>

<script src="<%=request.getContextPath()%>/assets/js/bundles/mainscripts.bundle.js"></script>
 <script src="<%=request.getContextPath()%>/assets/js/index.js"></script>  
<script type="text/javascript">

 $(document).ready(function(){
	//getdatadashboard();
	
	 Highcharts.chart('demo_total_revenue', {
		    chart: {
		        type: 'spline'
		    },
		    title: {
		        text: 'Income and Expenses'
		    },
		    xAxis: {
		        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		    },
		    yAxis: {
		        title: {
		            text: 'Total Revenue'
		        }
		    },
		    plotOptions: {
		        line: {
		            dataLabels: {
		                enabled: true
		            },
		            enableMouseTracking: false
		        }
		    },
		    series: [{
		        name: 'Operation Income',
		        data: [2001, 6800, 350, 3020, 4100, 4050, 5700, 4000, 5050, 6200, 3500, 9000]
		    }, {
		        name: 'Pharmacy Income',
		        data: [1010, 5800, 3800, 3020, 4010, 4050, 4300, 4800, 5450, 7200, 5500, 7280]
		    },{
		        name: 'Hospital Expenses',
		        data: [580, 890, 1020, 2010, 2100, 3100, 2580, 2680, 3490, 1200, 980, 1050]
		    } ]
		});
	
	
	}); 

	
 	$("#total_patient").html("250");
	$("#new_patient").html("25");
	$("#doc_operation").html("10");
	$("#doc_surgery").html("8");
	$("#doc_treatment").html("30");
	$("#total_visitors").html("15k");
	$("#today_visitors").html("150");
	$("#month_visitors").html("3000");
	$("#doc_revenue").html("$19000");
	$("#happy_client").html("600");
	$("#smiley_faces").html("3000"); 
	
	
	
 	// getdatadashboard();
	
	//url : "${pageContext.request.contextPath}/health/getdatadashboard",
	
/* function getdatadashboard(){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/getdatadashboard",
		type : "POST",
		beforeSend: function(){
			
		   }, 
		success : function(resdata, status, xhr) {
			var result = JSON.parse(resdata);			
			
			$("#total_patient").html(result.total_patient);
			$("#new_patient").html(result.new_patient);
			$("#doc_operation").html(result.doc_operation);
			$("#doc_surgery").html(result.doc_surgery);
			$("#doc_treatment").html(result.doc_treatment);
			$("#total_visitors").html(result.total_visitors);
			$("#today_visitors").html(result.today_visitors);
			$("#month_visitors").html(result.month_visitors);
			$("#doc_revenue").html(result.doc_revenue);
			$("#happy_client").html(result.happy_client);
			$("#smiley_faces").html(result.smiley_faces);
	
		},
		complete:function(){
			
		   } 
		
	});
} */

/* setInterval(getdatadashboard, 1000);  */


</script>



</body>
</html>