<%@page import="com.di.controller.GetExtension"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
String dirPath = "D:/dataOfStl"; 
String dir = request.getParameter("s");
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
						<i class="icon-ios-list"></i>
						<%=dir%>
					</h2>
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-xs-12">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Diamond Invoice</a></li>
								<li class="breadcrumb-item active"><%=dir%></li>
								
							 <%-- 	<%
								for(String SS : directories){	
									
									System.out.println("basic :"+SS);
									
									File chirag = new File(SS);
									
										if (chirag.isFile()) {

											String path = "D:/dataOfStl/" + SS + "/" + chirag.getName();
											System.out.println("path :"+path);
											
									}
									else{
										System.out.println("else");
									String[] directoriessub = file.list(new FilenameFilter() {
										public boolean accept(File current, String name) {
											return new File(current, name).isDirectory();
										}
									});
									
									
									for (String subDir : directoriessub) {

										System.out.println("\t-" + subDir);


										File filee = new File(subDir);

										if(filee.isFile()){
											String path = "D:/dataOfStl/" + SS  + "/" + filee.getName();
										}
										File folder = new File("D:/dataOfStl/" + SS + "/" + subDir);
										
										
										File[] listOfFiles = folder.listFiles();
										
										for (File filesub : listOfFiles) {
											if (filesub.isFile()) {

									String path = "D:/dataOfStl/" + SS + "/" + subDir + "/" + filesub.getName();
								
								%> 
								<li class="breadcrumb-item active"></li>
									
					 		<%} }}}} %>  --%>
							
								
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
					<div class="col-md-12">

						<div class="row">
							<div class="col-md-12" style="margin-bottom: 10px;">
								<div class="sepPart"></div>
							</div>
							<div class="col-md-12" style="padding: 0;">

								<div class="row">
									<div class="col-md-8">
										<div id="wrap"
											style="width: 100%; margin: 0 auto; position: absolute;">
											<div id="stl_smallmain"
												style="width: 100%; visibility: hidden; border: 1px solid #D7DBDD;"></div>
										</div>
									</div>
									<div class="col-md-4">
										<div id="stl_smallmain_text" style="width: 100%;border: 1px solid #D7DBDD;height: 460px;background: white;white-space: pre-wrap;padding:10px; "></div>
									</div>
								</div>

							</div>
						</div>


					</div>




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
			$id(object).style.visibility = 'visible';
		}
						
		onloaddata();
		drawDiamond('<%=dirPath%>','<%=dir%>','main')
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
		    	//alert(data);
		    	var json = JSON.parse(data);
		    	//alert(json);
		    	var arrayForthreed = new Array();
		    	//alert(arrayForthreed);
		    	
		    	$(".sepPart").empty();
		    	$(".sepPartOption").empty();
		    	
		    	 $.each(json, function(i, f) {
		    		 var arrayForthreedSub = new Array();
		    		
		    		 
		    		 arrayForthreed.push({
			   				id: parseFloat(f.id),
			   				filename: "../file?path="+f.filename,
							color: f.color,
							scale: f.scale,
							opacity: f.opacity,
						
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
		    			 if(f.txtName == ""){
		    				 var html = "  <div class=\"col-xl-2 col-md-4\" style=\"padding : 0\">\r\n" + 
				    			"		    								<div class=\"card\" style=\"background-color : transparent;\">\r\n" + 
				    			"		    									<div class=\"card-header\" style=\"padding : 5px;\">\r\n" + 
				    			"													<div><input id=\"color"+f.id+"\" type=\"hidden\" value=\""+f.color+"\"><input id=\"transparent"+f.id+"\" type=\"checkbox\" checked=\"checked\" onchange=\"stl_viewer_main.set_color("+f.id+", this.checked?$id('color"+f.id+"').value:'transparent');\"> <small>Transparent</small>"+
								"													<select onchange=\"stl_viewer_main.set_display("+f.id+",this.value);\"><option value=\"flat\" selected=\"selected\">Flat</option><option value=\"smooth\">Smooth</option><option value=\"wireframe\">Wireframe</option></select><br><font style=\"cursor : pointer\">-<font></div>"+
				    			"		    									</div>\r\n" + 
				    			"		    									<div class=\"\" style=\"background: transparent;\">\r\n" + 
				    			"													<div id=\""+subid+"\"></div>"+
				    			"		    									</div>\r\n" + 
				    			"		    								</div>\r\n" + 
				    			"		    							</div>"			  
				    			
				    												  
				    							  
				    			 $(".sepPart").append(html);
				    			 drawMainSupPart(arrayForthreedSub,dir,subid);
		    			 }else{
		    				 var html = "  <div class=\"col-xl-2 col-md-4\" style=\"padding : 0\">\r\n" + 
				    			"		    								<div class=\"card\" style=\"background-color : transparent;\">\r\n" + 
				    			"		    									<div class=\"card-header\" style=\"padding : 5px;\">\r\n" + 
				    			"													<div><input id=\"color"+f.id+"\" type=\"hidden\" value=\""+f.color+"\"><input id=\"transparent"+f.id+"\" type=\"checkbox\" checked=\"checked\" onchange=\"stl_viewer_main.set_color("+f.id+", this.checked?$id('color"+f.id+"').value:'transparent');\"> <small>Transparent</small>"+
								"													<select onchange=\"stl_viewer_main.set_display("+f.id+",this.value);\"><option value=\"flat\" selected=\"selected\">Flat</option><option value=\"smooth\">Smooth</option><option value=\"wireframe\">Wireframe</option></select><font style=\"cursor : pointer\" onclick=\"readFile('"+f.txtName+"')\">Load Dimensions</font></div>"+
				    			"		    									</div>\r\n" + 
				    			"		    									<div class=\"\" style=\"background: transparent;\">\r\n" + 
				    			"													<div id=\""+subid+"\"></div>"+
				    			"		    									</div>\r\n" + 
				    			"		    								</div>\r\n" + 
				    			"		    							</div>"			  
				    			
				    												  
				    							  
				    			 $(".sepPart").append(html);
				    			 drawMainSupPart(arrayForthreedSub,dir,subid);
		    			 }
		    			
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
		
	
			$id(object).style.height = height * 0.35 + 'px';
		
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
					center_models : false,
					models : data
				});
	}
	
function drawMainSupPart(data,dir,id){
	
	
	
	var height = isNaN(window.innerHeight) ? window.clientHeight
			: window.innerHeight;
	var width = isNaN(window.innerWidth) ? window.clientWidth
			: window.innerWidth;
	
	var object = id;
	
	$id(object).style.height = height * 0.20 + 'px';
	

	new StlViewer(document.getElementById(object),
			{
				all_loaded_callback : all_loaded(object),
				auto_resize : true,
				size : 1000,
				zoom : 300,
				allow_drag_and_drop : true,
				center_models : false,
				models : data
			});
}
	
function readFile(path){	
	$("#stl_smallmain_text").html("<i class=\"icon-load-a spinner\"></i>");
	
	$.ajax({
	    //for call action
	    url: 'readFile',
	    //for specify Method
	    method: "POST",
	    //form send data
	    data:{path:path},
	    success: function (data) {
	    	$("#stl_smallmain_text").html(data);
	    }
	});
	
}
	
	</script>
</body>
</html>