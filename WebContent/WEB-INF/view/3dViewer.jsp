<%@page import="com.di.controller.GetExtension"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="header.jsp"%>
<script type="text/javascript">
var stl_viewer_main = "";	
</script>
</head>
<body>
<%

ServletContext context = getServletContext();

		File file = new File("D:/dataOfStl");
		String[] directories = file.list(new FilenameFilter() {
		public boolean accept(File current, String name) {
		return new File(current, name).isDirectory();
	}
});

%>



	<div class="app-content container center-layout mt-2">
		<div class="content-wrapper">

			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12">
					<h2 class="content-header-title mb-0">
						<i class="icon-ios-list"></i> Planning List
					</h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
								<li class="breadcrumb-item active">Planning List</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="content-header-right text-md-right col-md-6 col-xs-12">
					<div class="form-group"></div>
					<!-- Round Outline Icon Buttons-->
					<button type="button" class="btn-icon btn btn-secondary btn-round"
						onclick="window.history.back();" data-toggle="tooltip"
						data-original-title="Back">
						<i class="icon-arrow-left4"></i>
					</button>
				</div>

			</div>

			<br>
			<div class="content-header row">
				<div class="row">
<!-- 					<div class="col-md-12">
					
 -->						
						
						<%
						int i = 0;
						for (String s : directories) {
							
							if(!s.equalsIgnoreCase("inclusion")){
							String dirPath = "D:/dataOfStl"; 
							String dir = s;
							file = new File(dirPath+"/"+s);
							String[] directoriessub = file.list(new FilenameFilter() {
								public boolean accept(File current, String name) {
									return new File(current, name).isDirectory();
								}
							});
							
									%>
									
		<div class="col-xl-3 col-md-6">
			<div class="card" style="background-color : transparent;">
				<div class="card-header">
					<div class="col-md-6">
						<h4 class="card-title">Plan-<%=++i%></h4>
					</div>
					<div class="col-md-6" align="right">
						<a href="redirect?p=M2REZXRhaWxWaWV3ZXI=&s=<%=s%>">3d View</a>
					</div>
				</div>
				<div class="" style="background: transparent;">
					<div id="stl_small<%=s%>"style="visibility: hidden;"></div> <%-- onclick="drawDiamond('<%=dirPath%>','<%=dir%>','main')" --%>
				</div>
			</div>
		</div>
								<%-- 	
								<div class="col-md-4">		
							<div id="wrap" style="width: 100%; margin: 0 auto;">
								<div id="stl_small<%=s%>"style="visibility: hidden; border: 1px solid #202020;cursor: pointer;" onclick="drawDiamond('<%=dirPath%>','<%=dir%>','main')"></div>
							</div>
							</div> --%>
									<%
									
							}	
						}
						%>
					
						

<!-- 						<div class="col-md-7">
						
							<div class="row">
								<div class="col-md-12">
									<div class="row sepPart">
										
									</div>
									
									<div class="row sepPartOption">
										
									</div>
									
								</div>
								<div class="col-md-12" style="padding: 0;">
									<div id="wrap"
								style="width: 100%; margin: 0 auto; position: relative;">
								<div id="stl_smallmain"
									style="width: 100%; visibility: hidden; border: 1px dashed #202020;"></div>
								
							</div>
								</div>
							</div>

							
						</div>
 -->



					</div>
				<!-- </div> -->

			</div>
		</div>
	</div>


	<script src="stl/stl_viewer.min.js"></script>
	<script>
	function $id(id)
	{
		return document.getElementById(id);
	}	

		function all_loaded(object) {
			
			alert("Object :"+object);
			$id(object).style.visibility = 'visible';
		}
		
		
						
		onloaddata();					
	function onloaddata(){
		<%for (String s : directories) {
			int count = 0;
			List<String> polishArr = new ArrayList<String>();
			List<String> roughArr = new ArrayList<String>();%>

					drawDiamond("D:/dataOfStl",'<%=s%>','<%=s%>')	


			<%}%>
	}			
					
					
				
	function drawDiamond(path,dir,id){
		$.ajax({
		    //for call action
		    url: 'getThreeDData',
		    //for specify Method
		    method: "POST",
		    //form send data
		    data:{dir : dir,path:path,id:id},
		    success: function (data) {
		    	
		    	var json = JSON.parse(data);
		    	var arrayForthreed = new Array();
		    	
		    	$(".sepPart").empty();
		    	$(".sepPartOption").empty();
		    	
		    	 $.each(json, function(i, f) {
		    		 var arrayForthreedSub = new Array();
		    		 arrayForthreed.push({
			   				id: parseFloat(f.id),
			   				filename: "../file?path="+f.filename,
							color: f.color,
							scale: f.scale,
							opacity: f.opacity
					    }); 
		    		 arrayForthreedSub.push({
			   				id: parseFloat(f.id),
			   				filename: "../file?path="+f.filename,
							color: f.color,
							scale: f.scale,
							opacity: f.opacity
					    }); 
		    		 
		    		 if(id == 'main'){
		    			 var subid = "mainSub"+f.id;
		    			 var html = "<div style=\"border: 1px solid #202020;\" class=\"col-md-2\" id=\""+subid+"\"></div>";
		    			 var htmlOption = "<div style=\"border: 1px solid #202020;\" class=\"col-md-2\"><input id=\"color"+f.id+"\" type=\"hidden\" value=\""+f.color+"\"><input id=\"transparent"+f.id+"\" type=\"checkbox\" checked=\"checked\" onchange=\"stl_viewer_main.set_color("+f.id+", this.checked?$id('color"+f.id+"').value:'transparent');\"> <small>Transparent</small>"+
		    							  "<select onchange=\"stl_viewer_main.set_display("+f.id+",this.value);\"><option value=\"flat\" selected=\"selected\">Flat</option><option value=\"smooth\">Smooth</option><option value=\"wireframe\">Wireframe</option></select></div>";
		    			 $(".sepPart").append(html);
		    			 $(".sepPartOption").append(htmlOption);
		    			 
		    			 drawMainSupPart(arrayForthreedSub,dir,subid);
		    		 }
		    	 });
		    	 
		    	 if(id == 'main'){
		    		 drawMain(arrayForthreed,dir,id);
		    	 }else{
		    		 draw(arrayForthreed,dir,id);
		    	 }
		    }
		});
	}
	
	function draw(data,dir,id){
		
		var height = isNaN(window.innerHeight) ? window.clientHeight
				: window.innerHeight;
		var width = isNaN(window.innerWidth) ? window.clientWidth
				: window.innerWidth;
		
		var object = 'stl_small'+id;
		
	
			$id(object).style.height = height * 0.25 + 'px';
		
		
		
	
		
		new StlViewer(document.getElementById(object),
				{
					all_loaded_callback : all_loaded(object),
					auto_resize : true,
					zoom : 300,
					allow_drag_and_drop : true,
					center_models : false,
					models : data
				});
	}
	
	
function drawMain(data,dir,id){
		
		var height = isNaN(window.innerHeight) ? window.clientHeight
				: window.innerHeight;
		var width = isNaN(window.innerWidth) ? window.clientWidth
				: window.innerWidth;
		
		var object = 'stl_small'+id;
		
			$('#stl_small'+id).empty();
			$id(object).style.height = height * 0.50 + 'px';
		
	
		
		 stl_viewer_main = new StlViewer(document.getElementById(object),
				{
					all_loaded_callback : all_loaded(object),
					auto_resize : true,
					zoom : 300,
					allow_drag_and_drop : true,
					center_models : true,
					models : data
				});
	}
	

function drawMainSupPart(data,dir,id){
	
	
	
	var height = isNaN(window.innerHeight) ? window.clientHeight
			: window.innerHeight;
	var width = isNaN(window.innerWidth) ? window.clientWidth
			: window.innerWidth;
	
	var object = id;
	
	$id(object).style.height = height * 0.1 + 'px';
	

	new StlViewer(document.getElementById(object),
			{
				all_loaded_callback : all_loaded(object),
				auto_resize : true,
				zoom : 300,
				allow_drag_and_drop : true,
				center_models : true,
				models : data
			});
}
	
		
	</script>
</body>
</html>