<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="header.jsp" %> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://momentjs.com/downloads/moment.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">

<style>
.fc-header-title{
       color: #0052ba;
       background: #000;
       font-size: 20px;    
}

/* .fc-event .fc-content { */
/* color:black; */
/* background-color:white; */
/* font-size:18px; */
/* text-align:center; */
/* padding:10px; */
/* border-radius:12px; */
/* padding:16px; */

/* } */

.fc-event{
color:black;
background-color:white;
font-size:18px;
text-align:center;
padding:10px;
border-radius:12px;
padding-top:16px;
box-shadow:2px 2px Brown;

}

</style>
  <script>
            $(document).ready(function() {

            	var date = new Date();
        		var d = date.getDate();
        		var m = date.getMonth();
        		var y = date.getFullYear();
            // page is now ready, initialize the calendar...
            
			
            	var calendar =  $('#calendar').fullCalendar({
            		displayEventTime: false,
            		editable: true,
            		 header:{
                       	left:'month,agendaWeek,agendaDay',
                         center:'title',
                         right:'prev,next,today'
                     },
        		selectable: true,
        			defaultView: 'month',
        			selectHelper: true,
        			select: function(start, end, allDay) {
        				var title = prompt('Event Title:','');
       				if (title) {
//        					---FOR TITLE-----
       					$("#rem_title").val(title);
       					
       					alert("START-->"+start);
       					alert("END-->"+end);
       					alert("ALLDAY-->"+allDay);
       					
//        		---FOR 	TAX Reminder Date ----START---Date
  				  var tmp_start =moment(start).format('YYYY-MM-DD');
    				  $("#rem_start").val(tmp_start);
    				  
//    	        		---FOR 	TAX Reminder Date ----End---Date
    				  var tmp_end = moment(end).format('YYYY-MM-DD');
    				  $("#rem_end").val(tmp_end);
// $.post( "${pageContext.request.contextPath}/acc/saveCalendarReminder.htm", function( events ) {
//         						  alert( "Data Loaded: " + events);
//         						});
 						//$.post("${pageContext.request.contextPath}/acc/saveCalendarReminder.htm",$("#Event_form").serialize()),
                          
                          /*  var start = $.fullCalendar.formatDate(start, "Y-MM-DD HH:mm:ss");
                            var end = $.fullCalendar.formatDate(end, "Y-MM-DD HH:mm:ss");
                            
                            $.ajax({
                                url:"${pageContext.request.contextPath}/acc/saveCalendarReminder.htm",
                                type:"POST",
                                data:{title:title, start:start, end:end},
                                success:function()
                                {
                                    calendar.fullCalendar('refetchEvents');
                                    alert("Added Successfully");
                                }
                            }),*/
        					calendar.fullCalendar('renderEvent',
        						{
        							title: title,
        							start: start,
        							end: end,
        							allDay: allDay,
        						},
        						true // make the event "stick"
        						
        					);
        				   
        					
        				}
        				calendar.fullCalendar('unselect');
        			},
        			droppable: true, // this allows things to be dropped onto the calendar !!!
        			drop: function(date, allDay) { // this function is called when something is dropped

        				// retrieve the dropped element's stored Event Object
        				var originalEventObject = $(this).data('eventObject');

        				// we need to copy it, so that multiple events don't have a reference to the same object
        				var copiedEventObject = $.extend({}, originalEventObject);

        				// assign it the date that was reported
        				copiedEventObject.start = date;
        				copiedEventObject.allDay = allDay;

        				// render the event on the calendar
        				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

        				// is the "remove after drop" checkbox checked?
        				if ($('#drop-remove').is(':checked')) {
        					// if so, remove the element from the "Draggable Events" list
        					$(this).remove();
        				}

        			},
        			events: [
 					 		//START Push into Array Of Calendar
								{
						
			               			title		             :'Calendar',
			               			start		             : '2021-24-05',
			               			allDay: false,
	        						className: 'info'
	        						
								},
							 //End 
        				    ]
        				        				
        				
        				 <%--
        				eventRender: function(event, element, view)
        				{
        				  if (event.allDay == false)
        				  {
        				     element.css("color", "black");
        				     element.css("font-weight", "10000");//--bold
        				     element.css("font-size", "22px");
        				     element.css("text-align", "center");
        				     element.css("padding", "10px");
        				     element.css("background-color", "white");
        				     element.css("border-radius", "12px");
        				   
        				   
        				     element.css("border-style", "double");
        				     element.css("border-color", "black");
        				     element.css("opacity", "10");
        				     element.css("border-top", "thick ridge red");
        				     element.css("border-bottom", "thick ridge green");
        				     element.css("border-left", "thick groove tomato");
        				     element.css("border-right", "thick groove darkblue");
        				     element.css("box-shadow", "2px 2px 4px Brown");
        				       element.css("text-shadow", "2px 2px 4px Brown");
        				    
        				     element.text(event.title);
						  }
        				
        				},
        				  --%>
        				});
            	
            	
            });
        </script>

<body>


 <div class="col-lg-3 ">
                           
   <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
<!--    <i class="fa fa-arrow-left"></i> -->
   </a> Calendar</h2>
 <ul class="breadcrumb">
     <li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;">   <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
     <i class="icon-home"></i></a></li><li class="breadcrumb-item active">Dashboard</li>
 </ul>
  </div> 

<div id='calendar' align="center" style="margin-top: 100px;margin-left: 100px; events.color:black; ">

  <form:form name="indexform"> </form:form>
  
  <form:form id="Event_form" name="Event_form" enctype="multipart/form-data">
<!--    <input type = "hidden" name ="" id="rem_id"/>   -->
  <input type="hidden" name="title" id="rem_title">
  <input type = "hidden" name ="rem_date_start" id="rem_start"/>  
   <input type="hidden" name="rem_date_end" id="rem_end"> 
  </form:form>
</div>



</body>

<script type="text/javascript">
	
function loadindex()
{
	document.indexform.action = "../health/loadindex.htm";  
	document.indexform.submit();
}
</script>
	
	
