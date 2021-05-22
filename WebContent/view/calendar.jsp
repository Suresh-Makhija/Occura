<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calendar</title>

<style>
     @media ( min-width : 576px) {
         .modal-dialog {
             max-width: 1207px;
             margin: 2.75rem auto;
         }
     }
     </style>
     
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">     
        
</head>
<body>


	<div id="main-content">
            <div class="container-fluid">
                <div class="block-header">
                    <div class="row">
                        <div class="app-title">
                            <div>
                                <h4>
                                    <i class="fa fa-calendar"></i>Calendar 
                                </h4>
                            </div>
                            <ul class="app-breadcrumb breadcrumb">
                                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                                <li class="breadcrumb-item"><a href="#">Calendar</a></li>
                            </ul>
                        </div>

                    </div>
                </div>

              
            <div class="row clearfix">
                <div class="col-lg-12 col-md-6">
                  <div class="col-lg-12 col-md-12">
                                    
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="tile row">
                                                    <div class="col-md-12">
                                                        <div id="calendar"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      
                                  </div>
                </div>
                </div>
               
        </div>
 


<script type="text/javascript">



  $(window).on('load', function(){
		
		var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        
        var started;
        var categoryClass;
        
		
		$('#calendar').fullCalendar({
			header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
			},
				selectable : true,
				selectHelper : true, // this allows things to be dropped onto the calendar
				
				select : function(start, end, allDay) {

					var date=new Date(start);
                	var today = new Date();
                	var datestr=(date.getMonth()+1)+"/"+date.getDate()+"/"+date.getFullYear();
                    var todatestr=(today.getMonth()+1)+"/"+today.getDate()+"/"+today.getFullYear();
                    var newdate=new Date(datestr);
                    var newtoday=new Date(todatestr);
					var flag=true;
					
					if (newdate - newtoday < 0) {
						toastr.error( "", "You can't enter Past date",
								{
									closeButton : true
								});
						date.value = "";
						return true;
					}
                    
                    date = new Date(end);
			
			
						
					started = start;
					ended = end
				},
				
				eventClick : function(calEvent,jsEvent,view) 
				{
					// Event Submit - Edit 
				},
				editable : true,
				
				events: [
							// Data Show 						
							
						]
	});
});	

</script>
 <%-- <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-3.6.1.min.js"></script> --%>   
 
  <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/fullcalendar.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/moment.min.js"></script>
    
 <script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/libscripts.bundle.js"></script>    
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/vendorscripts.bundle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script><!-- bootstrap datepicker Plugin Js --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/mainscripts.bundle.js"></script>
 
 
        
</body>
</html>