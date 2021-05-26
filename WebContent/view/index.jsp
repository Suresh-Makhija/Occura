<%@include file="header.jsp" %>
<!doctype html>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.occura.bean.UserBean"%>
<html lang="en">


<head>
<title>:: Saraswati Eye Hospital :</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="Lucid Bootstrap 4.1.1 Admin Template">
<meta name="author" content="WrapTheme, design by: ThemeMakker.com">

<style type="text/css">

#toDoPatientToday{
 
  padding-top:10px;
  width: 400px; 
  height: 400px;
  overflow-x: hidden;
  overflow-y: scroll;
}


</style>

</head>
<body class="theme-cyan">
<%List<Integer> yearList  = new ArrayList<>();
Date d = new Date();
int currentYear = d.getYear() + 1900 ;
System.out.println(currentYear);
System.out.println(currentYear);
for(int i=0;i<5;i++)
{
	yearList.add(currentYear - i);
} %>


    <div id="main-content">
        <div class="container-fluid">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Dashboard</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/view/index.jsp"><i class="icon-home"></i></a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ul>
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
                                                    <h5 id="total_patient" class="number">215</h5>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="icon"><i class="fa fa-user"></i> </div>
                                                <div class="content">
                                                    <div class="text">New Patient</div>
                                                    <h5 id="new_patient" class="number"></h5>
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
                                                    <h5 id="operation" class="fa fa-inr"></h5>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="icon"><i class="fa fa-user-md"></i> </div>
                                                <div class="content">
                                                    <div class="text">Surgery</div>
                                                    <h5 id="revenue" class="number fa fa-inr">$18,925</h5>
                                                </div>
                                            </div>

                                        </div>
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
                                <li><a class="tab_btn" onclick="revenueGraph(this.id,<%=currentYear%>);" id="monthlyRevenue" href="javascript:void(0);" title="Monthly">M</a></li>
                                <li><a class="tab_btn active" id="yearlyRevenue" onclick="revenueGraph(this.id,<%=currentYear%>);"  href="javascript:void(0);" title="Yearly">Y</a></li>
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
                                        <h4 id="operation_income"><i class="icon-wallet"></i> 7,12,326$</h4>
                                        <span>Operation Income</span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="body bg-warning text-light">
                                        <h4 id="pharmacy_income"><i class="icon-wallet"></i> 25,965$</h4>
                                        <span>Pharmacy Income</span>
                                    </div>
                                </div>

                            </div>
                            <div id="total_revenue" class="ct-chart m-t-20"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-lg-8 col-md-12">
                    <div class="card">
                        <div class="header">
                            <h2>Patient Statistics</h2>
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
                            <h2>ToDo List <small>Today task list</small></h2>
                        </div>
                        <div class="body todo_list">
                            <ul class="list-unstyled" id="toDoPatientToday">
<!--                                 <li> -->
<!--                                     <label class="fancy-checkbox mb-0"> -->
<!--                                         <input type="checkbox" name="checkbox" checked> -->
<!--                                         <span>A Brief History Of Anesthetics</span> -->
<!--                                     </label> -->
<!--                                     <div class="m-l-35 m-b-30"> -->
<!--                                         <small class="text-muted">SCHEDULED FOR 3:00 P.M. ON JUN 2018</small> -->
<!--                                         <ul class="list-unstyled team-info"> -->
<%--                                             <li><img src="<%=request.getContextPath()%>/images/xs/avatar1.jpg" data-toggle="tooltip" data-placement="top" title="Dr. Chris Fox" alt="Avatar"></li> --%>
<%--                                             <li><img src="<%=request.getContextPath()%>/images/xs/avatar2.jpg" data-toggle="tooltip" data-placement="top" title="Dr. Joge Lucky" alt="Avatar"></li> --%>
<%--                                             <li><img src="<%=request.getContextPath()%>/images/xs/avatar5.jpg" data-toggle="tooltip" data-placement="top" title="Isabella" alt="Avatar"></li> --%>
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <label class="fancy-checkbox mb-0"> -->
<!--                                         <input type="checkbox" name="checkbox"> -->
<!--                                         <span>Using Laser Teatment to Help</span> -->
<!--                                     </label> -->
<!--                                     <div class="m-l-35 m-b-30"> -->
<!--                                         <small class="text-muted">SCHEDULED FOR 4:30 P.M. ON JUN 2018</small> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <label class="fancy-checkbox mb-0"> -->
<!--                                         <input type="checkbox" name="checkbox"> -->
<!--                                         <span>Selecting the Apnea Treatment</span> -->
<!--                                     </label> -->
<!--                                     <div class="m-l-35 m-b-30"> -->
<!--                                         <small class="text-muted">SCHEDULED FOR 4:30 P.M. ON JUN 2018</small><br> -->
<!--                                         <small class="text-warning">ICU PATIENT - LAST 2 DAYS</small><br> -->
<!--                                         <small>Patient Name: <a href="#">Hossein</a></small>                                         -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <label class="fancy-checkbox mb-0"> -->
<!--                                         <input type="checkbox" name="checkbox"> -->
<!--                                         <span>Using Laser Teatment to Help</span> -->
<!--                                     </label> -->
<!--                                     <div class="m-l-35"> -->
<!--                                         <small class="text-muted">SCHEDULED FOR 4:30 P.M. ON JUN 2018</small> -->
<!--                                         <ul class="list-unstyled team-info"> -->
<%--                                             <li><img src="<%=request.getContextPath()%>/images/xs/avatar4.jpg" data-toggle="tooltip" data-placement="top" title="Dr. Chris Fox" alt="Avatar"></li> --%>
<%--                                             <li><img src="<%=request.getContextPath()%>/images/xs/avatar6.jpg" data-toggle="tooltip" data-placement="top" title="Dr. Joge Lucky" alt="Avatar"></li> --%>
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                 </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-lg-12 col-md-12">
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h2>Operation history</h2>
                                    <ul class="header-dropdown">
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

                    </div>
                </div>



<script type="text/javascript">

window.onload = function() {
		basicDetails();
		var d = new Date();
		revenueGraph("yearlyRevenue",d.getFullYear());
		patientChart();
		toDoListDashboard();
		OpCharts(d.getFullYear());
};
	
	
function logout()
{
	$.ajax({
	type :'POST',
	url: "../controller/logout.htm",
	success :function(resdata,status,xhr)
	{
		if(resdata == "logout")
			{
			window.location = "page-login.jsp";
			}
	},
	error : function(xhr, status, errorThrown) {
	
	},
	complete : function(xhr, status) {
	}
	});
}



function basicDetails()
{
	$.ajax({
	type :'POST',
	url: "../health/basicDetails.htm",
	success :function(data)
	{
		var json = JSON.parse(data);
		$.each(json,function(i,f){
			document.getElementById("total_patient").innerHTML = f.total_patient;
			document.getElementById("new_patient").innerHTML = f.today_patient;
			document.getElementById("revenue").innerHTML = "  "+ f.revenue ;
			//document.getElementById("menu_visit").innerHTML = f.today_patient ;     /* Cannot set property 'innerHTML' of null */
			document.getElementById("operation").innerHTML = " "+f.total_operation ;
			document.getElementById("pharmacy_income").innerHTML = f.pharmacy_income ;
			document.getElementById("operation_income").innerHTML = f.operation_income ;
		});
	
	}
	});
}

function revenueGraph(id,year)
{
	var durationArray = [];
	var medicineCount = [];
	var operationCount = [];
	var type = id;
	if(type == "yearlyRevenue")
    {
		document.getElementById("yearlyRevenue").className = "tab_btn active";
		document.getElementById("monthlyRevenue").className = "tab_btn";
		 durationArray =  ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
	     medicineCount = ["0","0","0","0","0","0","0","0","0","0","0","0"];
	     operationCount = ["0","0","0","0","0","0","0","0","0","0","0","0"];
    }
	
	if(type == "monthlyRevenue")
	{
	document.getElementById("monthlyRevenue").className = "tab_btn active";
	document.getElementById("yearlyRevenue").className = "tab_btn";
	var daysInMonth = new Date("2021", "05", 0).getDate();
       var temp = 1;
       for(var i=0;i<daysInMonth;i++)
       {
         durationArray.push(temp);
         temp = temp + 1;
       }
        medicineCount = new Array(daysInMonth).fill(0);
        operationCount = new Array(daysInMonth).fill(0);
	}
	
	$.ajax({
		type :'POST',
		url: "../health/revenueGraph.htm",
		 data:{type:type,year:year,graph:"operation"},
		success :function(data)
		{
			var json = JSON.parse(data);
		
			$.each(json,function(i,f)
			{
				
				if(type == "yearlyRevenue"){
			    var month = "-";
			    var monthNumber = f.month;
			        if(monthNumber == "1")
			        	operationCount[0] = f.amount;
			         if(monthNumber == "2")
			        	 operationCount[1] = f.amount;
			         if(monthNumber == "3")
			        	 operationCount[2] = f.amount;
			         if(monthNumber == "4")
			        	 operationCount[3] = f.amount;
			         if(monthNumber == "5")
			        	 operationCount[4] = f.amount;
			         if(monthNumber == "6")
			        	 operationCount[5] = f.amount;
			         if(monthNumber == "7")
			        	 operationCount[6] = f.amount;
			         if(monthNumber == "8")
			        	 operationCount[7] = f.amount;
			         if(monthNumber == "9")
			        	 operationCount[8] = f.amount;
			         if(monthNumber == "10")
			        	 operationCount[9] = f.amount;
			         if(monthNumber == "11")
			        	 operationCount[10] = f.amount;
			         if(monthNumber == "12")
			        	 operationCount[11] = f.amount;
				}
			
				if(type == "monthlyRevenue"){
			         {
			           var month = "-";
			           var monthNumber = f.month;
			               if(monthNumber == "01")
			            	   operationCount[0] = f.amount;
			                if(monthNumber == "02")
			                	operationCount[1] = f.amount;
			                if(monthNumber == "03")
			                	operationCount[2] = f.amount;
			                if(monthNumber == "04")
			                	operationCount[3] = f.amount;
			                if(monthNumber == "05")
			                	operationCount[4] = f.amount;
			                if(monthNumber == "06")
			                	operationCount[5] = f.amount;
			                if(monthNumber == "07")
			                	operationCount[6] = f.amount;
			                if(monthNumber == "08")
			                	operationCount[7] = f.amount;
			                if(monthNumber == "09")
			                	operationCount[8] = f.amount;
			                if(monthNumber == "10")
			                	operationCount[9] = f.amount;
			                if(monthNumber == "11")
			                	operationCount[10] = f.amount;
			                if(monthNumber == "12")
			                	operationCount[11] = f.amount;
			
			                    if(monthNumber == "13")
			                    	operationCount[12] = f.amount;
			                     if(monthNumber == "14")
			                    	 operationCount[13] = f.amount;
			                     if(monthNumber == "15")
			                    	 operationCount[14] = f.amount;
			                     if(monthNumber == "16")
			                    	 operationCount[15] = f.amount;
			                     if(monthNumber == "17")
			                    	 operationCount[16] = f.amount;
			                     if(monthNumber == "18")
			                    	 operationCount[17] = f.amount;
			                     if(monthNumber == "19")
			                    	 operationCount[18] = f.amount;
			                     if(monthNumber == "20")
			                    	 operationCount[19] = f.amount;
			                     if(monthNumber == "21")
			                    	 operationCount[20] = f.amount;
			                     if(monthNumber == "22")
			                    	 operationCount[21] = f.amount;
			                     if(monthNumber == "23")
			                    	 operationCount[22] = f.amount;
			                     if(monthNumber == "24")
			                    	 operationCount[23] = f.amount;
			                     if(monthNumber == "25")
			                    	 operationCount[24] = f.amount;
			                     if(monthNumber == "26")
			                    	 operationCount[25] = f.amount;
			                     if(monthNumber == "27")
			                    	 operationCount[26] = f.amount;
			                     if(monthNumber == "28")
			                    	 operationCount[27] = f.amount;
			                     if(monthNumber == "29")
			                    	 operationCount[28] = f.amount;
			                     if(monthNumber == "30")
			                    	 operationCount[29] = f.amount;
			                     if(monthNumber == "31")
			                    	 operationCount[30] = f.amount;
						}}
			});
			
			$.ajax({
				type :'POST',
				url: "../health/revenueGraph.htm",
				 data:{type:type,year:year,graph:"medicine"},
				success :function(data)
				{
					var json = JSON.parse(data);
					$.each(json,function(i,f){
						if(type == "yearlyRevenue"){
					    var month = "-";
					    var monthNumber = f.month;
					        if(monthNumber == "1")
					        	medicineCount[0] = f.amount;
					         if(monthNumber == "2")
					        	 medicineCount[1] = f.amount;
					         if(monthNumber == "3")
					        	 medicineCount[2] = f.amount;
					         if(monthNumber == "4")
					        	 medicineCount[3] = f.amount;
					         if(monthNumber == "5")
					        	 medicineCount[4] = f.amount;
					         if(monthNumber == "6")
					        	 medicineCount[5] = f.amount;
					         if(monthNumber == "7")
					        	 medicineCount[6] = f.amount;
					         if(monthNumber == "8")
					        	 medicineCount[7] = f.amount;
					         if(monthNumber == "9")
					        	 medicineCount[8] = f.amount;
					         if(monthNumber == "10")
					        	 medicineCount[9] = f.amount;
					         if(monthNumber == "11")
					        	 medicineCount[10] = f.amount;
					         if(monthNumber == "12")
					        	 medicineCount[11] = f.amount;
						}
				
						if(type == "monthlyRevenue"){
					         {
					           var month = "-";
					           var monthNumber = f.month;
					               if(monthNumber == "01")
					            	   medicineCount[0] = f.amount;
					                if(monthNumber == "02")
					                	medicineCount[1] = f.amount;
					                if(monthNumber == "03")
					                	medicineCount[2] = f.amount;
					                if(monthNumber == "04")
					                	medicineCount[3] = f.amount;
					                if(monthNumber == "05")
					                	medicineCount[4] = f.amount;
					                if(monthNumber == "06")
					                	medicineCount[5] = f.amount;
					                if(monthNumber == "07")
					                	medicineCount[6] = f.amount;
					                if(monthNumber == "08")
					                	medicineCount[7] = f.amount;
					                if(monthNumber == "09")
					                	medicineCount[8] = f.amount;
					                if(monthNumber == "10")
					                	medicineCount[9] = f.amount;
					                if(monthNumber == "11")
					                	medicineCount[10] = f.amount;
					                if(monthNumber == "12")
					                	medicineCount[11] = f.amount;
				
					                    if(monthNumber == "13")
					                    	medicineCount[12] = f.amount;
					                     if(monthNumber == "14")
					                    	 medicineCount[13] = f.amount;
					                     if(monthNumber == "15")
					                    	 medicineCount[14] = f.amount;
					                     if(monthNumber == "16")
					                    	 medicineCount[15] = f.amount;
					                     if(monthNumber == "17")
					                    	 medicineCount[16] = f.amount;
					                     if(monthNumber == "18")
					                    	 medicineCount[17] = f.amount;
					                     if(monthNumber == "19")
					                    	 medicineCount[18] = f.amount;
					                     if(monthNumber == "20")
					                    	 medicineCount[19] = f.amount;
					                     if(monthNumber == "21")
					                    	 medicineCount[20] = f.amount;
					                     if(monthNumber == "22")
					                    	 medicineCount[21] = f.amount;
					                     if(monthNumber == "23")
					                    	 medicineCount[22] = f.amount;
					                     if(monthNumber == "24")
					                    	 medicineCount[23] = f.amount;
					                     if(monthNumber == "25")
					                    	 medicineCount[24] = f.amount;
					                     if(monthNumber == "26")
					                    	 medicineCount[25] = f.amount;
					                     if(monthNumber == "27")
					                    	 medicineCount[26] = f.amount;
					                     if(monthNumber == "28")
					                    	 medicineCount[27] = f.amount;
					                     if(monthNumber == "29")
					                    	 medicineCount[28] = f.amount;
					                     if(monthNumber == "30")
					                    	 medicineCount[29] = f.amount;
					                     if(monthNumber == "31")
					                    	 medicineCount[30] = f.amount;
						}}
					});
				
					var options;
					var data = {
					    labels: durationArray,
					    series: [
					    	operationCount,
					    	medicineCount,
					    ],
					    borderColor:"#000",
					};
					options = {
					    height: "354px",
					    showPoint: true,
					    axisX: {
					        showGrid: false
					    },
					    axisY: {
					        labelInterpolationFnc: function(value) {
					            return (value / 100) + 'K';
					        }
					    },
					    lineSmooth: true,
					    plugins: [
					        Chartist.plugins.tooltip({
					            appendToBody: true
					        }),
					    ]
					};
					new Chartist.Line('#total_revenue', data, options); 
					}
				});
			}
	});

   function loadOperationalGraph(id)
   {
	   revenueGraph("yearlyRevenue",id);
   }
}

function weekendAreas(axes) {

    var markings = [],
        d = new Date(axes.xaxis.min);


    d.setUTCDate(d.getUTCDate() - ((d.getUTCDay() + 1) % 7))
    d.setUTCSeconds(0);
    d.setUTCMinutes(0);
    d.setUTCHours(0);

    var i = d.getTime();


    do {
        markings.push({ xaxis: { from: i, to: i + 2 * 24 * 60 * 60 * 1000 } });
        i += 7 * 24 * 60 * 60 * 1000;
    } while (i < axes.xaxis.max);
    return markings;
}


function patientChart()
{
	var d = [];
	$.ajax({
		type :'POST',
		url: "../health/patientCount.htm",
		success :function(data)
		{
		var json = JSON.parse(data);
		$.each(json,function(i,f){
			var temp = new Array();
		temp.push(f.timeZone,f.count);
			d.push(temp);
		});

	    for (var i = 0; i < d.length; ++i) {
	        d[i][0] += 60 * 60 * 1000;
	    }



	    var options = {
	        xaxis: {
	            mode: "time",
	            tickLength: 5
	        },
	        selection: {
	            mode: "x"
	        },
	        grid: {
	            markings: weekendAreas,
	            borderColor: '#eaeaea',
	            tickColor: '#eaeaea',
	            hoverable: true,
	            borderWidth: 1,
	        }
	    };

	    var plot = $.plot("#Visitors_chart", [d], options);

	    $("#Visitors_chart").bind("plotselected", function (event, ranges) {

	        $.each(plot.getXAxes(), function(_, axis) {
	            var opts = axis.options;
	            opts.min = ranges.xaxis.from;
	            opts.max = ranges.xaxis.to;
	        });
	        plot.setupGrid();
	        plot.draw();
	        plot.clearSelection();


	        overview.setSelection(ranges, true);
		});
}

	});

	}

	 function toDoListDashboard()
	 {

	 $.ajax({
			type :'POST',
			url: "../health/toDoGraph.htm",
			success :function(data)
			{
			var json = JSON.parse(data);
			$.each(json,function(i,f){
				var d = "<li>\n\r"+
                    "<B><label class=\"fancy-checkbox mb-0\">\n\r"+
                "<input type=\"checkbox\" name=\"checkbox\">\n\r"+
                "<span>"+f.name+"</span>\n\r"+
            "</label></B>\n\r"+
            "<div class=\"m-l-35 m-b-30 \">\n\r"+
            	"<small class=\"text-muted\">"+f.description+"</small><br>\n\r"+
                "<small class=\"text-muted\">SCHEDULED FOR  "+f.time+"</small>\n\r"+
                "<ul class=\"list-unstyled team-info\">"+
<%--           C      "<li><img src=\""+<%=request.getContextPath()%>/images/xs/avatar1.jpg+"\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Dr. Chris Fox\" alt=\"Avatar\"></li>\n\r+ --%>
                "</ul>\n\r"+
            "</div>\n\r"+
        "</li>\n\r";
	$("#toDoPatientToday").append(d);
});
			}
	 });

	 }

	 function OpCharts(id)
	 {
		 var opHistory = [0,0,0,0,0,0,0,0,0,0,0,0];
		    var opPatientistory = [0,0,0,0,0,0,0,0,0,0,0,0];

		 $.ajax({
				type :'POST',
				data :{type:"operation",year:id},
				url: "../health/operationHistoryCharts.htm",
				success :function(data)
				{
				var json = JSON.parse(data);
				$.each(json,function(i,f){
					 var month = "-";
					    var monthNumber = f.month;
					        if(monthNumber == "1")
					        	opHistory[0] = f.amount;
					         if(monthNumber == "2")
					        	 opHistory[1] = f.amount;
					         if(monthNumber == "3")
					        	 opHistory[2] = f.amount;
					         if(monthNumber == "4")
					        	 opHistory[3] = f.amount;
					         if(monthNumber == "5")
					        	 opHistory[4] = f.amount;
					         if(monthNumber == "6")
					        	 opHistory[5] = f.amount;
					         if(monthNumber == "7")
					        	 opHistory[6] = f.amount;
					         if(monthNumber == "8")
					        	 opHistory[7] = f.amount;
					         if(monthNumber == "9")
					        	 opHistory[8] = f.amount;
					         if(monthNumber == "10")
					        	 opHistory[9] = f.amount;
					         if(monthNumber == "11")
					        	 opHistory[10] = f.amount;
					         if(monthNumber == "12")
					        	 opHistory[11] = f.amount;
				});
				 $.ajax({
						type :'POST',
						data :{type:"patient",year:id},
						url: "../health/operationHistoryCharts.htm",
						success :function(data)
						{
						var json = JSON.parse(data);
						$.each(json,function(i,f){
							var monthNumber = f.month;
							 if(monthNumber == "1")
								 opPatientistory[0] = f.amount;
						         if(monthNumber == "2")
						        	 opPatientistory[1] = f.amount;
						         if(monthNumber == "3")
						        	 opPatientistory[2] = f.amount;
						         if(monthNumber == "4")
						        	 opPatientistory[3] = f.amount;
						         if(monthNumber == "5")
						        	 opPatientistory[4] = f.amount;
						         if(monthNumber == "6")
						        	 opPatientistory[5] = f.amount;
						         if(monthNumber == "7")
						        	 opPatientistory[6] = f.amount;
						         if(monthNumber == "8")
						        	 opPatientistory[7] = f.amount;
						         if(monthNumber == "9")
						        	 opPatientistory[8] = f.amount;
						         if(monthNumber == "10")
						        	 opPatientistory[9] = f.amount;
						         if(monthNumber == "11")
						        	 opPatientistory[10] = f.amount;
						         if(monthNumber == "12")
						        	 opPatientistory[11] = f.amount;
						});
					    var dataStackedBar = {
						        labels: ['Jan','Feb','march','April','May','June','July','Aug','Sep','Oct','Nov','Dec'],
						        series: [
						        	opHistory,
						        	opPatientistory,

						        ]
						    };


						    new Chartist.Bar('#patient_history', dataStackedBar, {
						        height: "268px",
						        stackBars: true,
						        axisX: {
						            showGrid: false
						        },
						        axisY: {
						            labelInterpolationFnc: function(value) {
						                return (value / 1000) + 'k';
						            }
						        },
						        plugins: [
						            Chartist.plugins.tooltip({
						                appendToBody: true
						            }),
						            Chartist.plugins.legend({
						                legendNames: ['Operation', 'Patient']
						            })
						        ]
						    }).on('draw', function(data) {
						            if (data.type === 'bar') {
						                data.element.attr({
						                    style: 'stroke-width: 30px'
						                });
						            }
						    });}
				 });}
		 });



	 }
</script>

</body>

</html>
