<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@include file="header.jsp" %> --%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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


/* .modal-content {
    background-color: #fefefe;
    margin: auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 1100px;
    
	}
	.modal-header{
	padding: 20px 10px;
	background-color: #f6ba8e;
	}
	
	.modal-dialog {
	    width: auto;
	} */
	
.app-content {
  min-height: calc(100vh - 50px);
  margin-top: 59px;
  padding: 30px;
  background-color: #E5E5E5;
  -webkit-transition: margin-left 0.3s ease;
  -o-transition: margin-left 0.3s ease;
  transition: margin-left 0.3s ease;
}

@media (min-width: 768px) {
  .app-content {
    margin-left: 230px;
  }
}

@media (max-width: 767px) {
  .app-content {
    margin-top: 50px;
    min-width: 100%;
  }
}

@media (max-width: 480px) {
  .app-content {
    padding: 15px;
  }
}

@media print {
  .app-content {
    margin: 0;
    padding: 0;
    background-color: #fff;
  }
}     
 
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" />     
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/bootstrap-datepicker3.min.css">
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
	                          <!--  <ul class="app-breadcrumb breadcrumb">
	                               <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
	                               <li class="breadcrumb-item"><a href="#">Calendar</a></li>
	                           </ul> -->
	                           
	                           <ul class="breadcrumb">
     								<li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;">   <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
     								<i class="fa fa-home fa-lg"></i></a></li>
     								<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
 								</ul>
 
	                       </div>
	                       
	                       
	                   </div>
	                   
	<form:form name="createActionScheduleForm" id="createActionScheduleForm" method="post" >	
		<input type="hidden" id="appointment_id" name="appointment_id">
		<input type="hidden" id="patient_id" name="patient_id"> 
		
		<div class="row">
			<div class="col-md-12">
				<div class="tile row">
					<div class="col-md-12">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>


		<!-- <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div> -->
		
		<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
		
		<div id="CalenderModalEdit" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
				            <h4 class="modal-title">Patient Appointment Details</h4>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                <span aria-hidden="true">&times;</span>
				                </button>
           			 </div>
						<div class="modal-body">
							<div class="row">
									<div class="col-md-12">
											<div id="createActionSchedule">
														<div class="form-group">
															<div class="row">
																Full Name : <input type="text" name="fullname_id" id="full_name_id" readonly="readonly">
															</div>
															<div class="row">
																Appointment Date : <input type="text" name="appointmentdate_str" id="appointment_date_id" readonly="readonly">
															</div>
															<div class="row" style="display: none;" id="desc_hide">
																Description : <input type="text" name="description_name" id="description_id" readonly="readonly">
															</div>
														</div>
											</div>
									</div>
							</div>
						</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" onclick="patientHistory()" value="Patient History">
						<input type="submit" class="btn btn-primary" onclick="createActionSchedule()" value="Session">
					</div>
				</div>
				
			</div>
		</div>
			
			
<!-- <div class="modal  right fade text-left" id="patientDocumentModelId" data-backdrop="static" data-keyboard="false" >
  <div class="modal-dialog modal-lg" >
	<div class="modal-content">
	  <div class="modal-header bg-primary text-white">
		  <h5 class="modal-title" id="LabelId">Patient Appointment Details
			<button type="button" class="close" onclick="closeUploadedDocumentModel();"><span aria-hidden="true">×</span></button>
			
			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				                
		  </h5>
	  </div>
	  <div class="modal-body" style="min-height: 450px;">
			<div class="row">
									<div class="col-md-12">
											<div id="createActionSchedule">
														<div class="form-group">
															<div class="row">
																Full Name : <input type="text" name="fullname_id" id="full_name_id" readonly="readonly">
															</div>
															<div class="row">
																Appointment Date : <input type="text" name="appointmentdate_str" id="appointment_date_id" readonly="readonly">
															</div>
															<div class="row" style="display: none;" id="desc_hide">
																Description : <input type="text" name="description_name" id="description_id" readonly="readonly">
															</div>
														</div>
											</div>
									</div>
							</div>
	  </div>
	</div>
  </div>
</div> --> 

</form:form>
	                   
	                   
                </div>

              
           <!--  <div class="row clearfix">
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
                </div> -->
               
        </div>
 </div>
 
 <script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery.min.js'></script>
<script src="http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery-ui.custom.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>


  <%-- <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>     --%>
 
  <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script> --> 
<%--   <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/moment.min.js"></script>  --%>
<%--   <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/fullcalendar.min.js"></script> --%>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://momentjs.com/downloads/moment.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.js'></script>


   
    
<%--  <script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/libscripts.bundle.js"></script>    
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/vendorscripts.bundle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script><!-- bootstrap datepicker Plugin Js --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bundles/mainscripts.bundle.js"></script>
 --%> 
 
<script type="text/javascript">



/* $('#calendar').fullCalendar({
    defaultDate: '2014-09-12',
    editable: true,
    eventLimit: true, // allow "more" link when too many events
}); */



  /* $(window).on('load', function(){
		
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
});	 */



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
			/* toastr.error( "", "You can't enter Past date",
					{
						closeButton : true
					}); */
			alert("You can't enter Past date");
			date.value = "";
			return true;
		}
		
		date = new Date(end);
		started = start;
        ended = end
        /* $(".antosubmit").on("click", function () {
        	var title = "";
            if (end) {
                ended = end
            }
            if (title) {
            	$('#calendar').fullCalendar('renderEvent', {
                        title: title,
                        start: started,
                        end: end,
                        allDay: allDay
                    },
                    true // make the event "stick"
                );
            }
            $('#title').val('');
            $('#calendar').fullCalendar('unselect');
            $('.antoclose').click();
            return false;
        }); */

	},
	eventClick : function(calEvent,jsEvent,view) 
	{
		
		$('#fc_edit').click();
		//$("#patientDocumentModelId").modal('show');
		var date=new Date(calEvent.start);
		
		if(calEvent.description != null && calEvent.description != '' 
			&& calEvent.description != 'null')
		{
			$("#desc_hide").show();
			$("#description_id").val(calEvent.description);
		}
        $("#appointment_date_id").val(calEvent.appointmentdatestr);
		$("#appointment_id").val(calEvent.appointmentId);
        $("#patient_id").val(calEvent.patientId);
        $("#full_name_id").val(calEvent.fullName);
        
        
        
	},
	editable : true,
	events: [
				<%
					if(request.getAttribute("calendar_list")!=null)
					{
						SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");
						//SimpleDateFormat changeFormatDate=new SimpleDateFormat("dd/MM/yyyy");
						
						List<Object[]> calendarBo = (List<Object[]>) request.getAttribute("calendar_list");
						
							for(Object[] object : calendarBo)
							{
								String start_dt=sdf.format(object[2]);
								String end_dt=sdf.format(object[2]);
								String appointmentId="",patientId="",fullName="",description="",appointmentdatestr="";
								
					%>
					
								 //START Push into Array Of Calendar
									{
										appointmentdatestr       :'<%=object[5]%>',
				               			title		             :'<%=object[3]%>',
				               			start		             :'<%=start_dt%>',
				               			end 		             :'<%=end_dt%>',
				               			appointmentId            :'<%=object[0]%>',
				               			patientId                :'<%=object[1]%>',
				               			fullName                 :'<%=object[3]%>',
				               			description              :'<%=object[4]%>'
									},
								 //End 
							<%		 
						   } // Completed Here the For Loop Expression
					}	
				%>
				
				
			]
});
});



function createActionSchedule() {
	
	if($("#patient_id").val() != null && $("#patient_id").val() != '' &&
		$("#appointment_id").val() != null && $("#appointment_id").val() != '')
	{
		document.createActionScheduleForm.action="../health/startSession.htm";
		document.createActionScheduleForm.submit();	
	}
	
}

function patientHistory() {
	
	if($("#patient_id").val() != null && $("#patient_id").val() != '' &&
			$("#appointment_id").val() != null && $("#appointment_id").val() != '')
	{
		document.createActionScheduleForm.action="../health/patientHistory.htm";
		document.createActionScheduleForm.submit();	
	}	
	
}


function loadindex()
{
	document.createActionScheduleForm.action = "../health/loadindex.htm";  
	document.createActionScheduleForm.submit();
}


</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bootstrap.min.js"></script>
 
        
</body>
</html>