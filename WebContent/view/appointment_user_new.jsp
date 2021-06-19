<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Appointment User</title>

<%-- 
<link rel="stylesheet" href="<c:url value ="/resources/mis/css/font-awesome.min.css"/>" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/mis/css/datepicker.css" type="text/css"/> --%>


<link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">

 <style type="text/css">

 .profile{
 display:inline-block;
 border:2px solid ;
 border-radius:100%;   
 width:100px;
 height:100px;
 background-position:center;
 background-size:cover;
 }

.validateStyle{
	border: 1px solid red!important;
}


.button-group, .play-area {
  border: 1px solid grey;
  padding: 1em 1%;
  margin-bottom: 1em;
}

.button {
  padding: 0.5em;
  margin-right: 1em;
}

.play-area-sub {
  width: 47%;
  padding: 1em 1%;
  display: inline-block;
  text-align: center;
}

#capture {
  display: none;
}

/* #snapshot {
 display:inline-block;
 border:2px solid ;
 border-radius:100%;  
 width:100px;
 height:100px;
 background-position:center;
 background-size:cover;
} */

#profilePic{
 border-radius:100%;   
 width:150px;
 height:150px;
 background-position:center;
 background-size:cover;
}



 </style>

        
</head>
<body>

            <div class="container-fluid">
                <div class="block-header">
                    <div class="row">
                      
                        <div class="col-lg-6 col-md-8 col-sm-12">
                            <!-- <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Book Appointment</h2> -->
                           
                           <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
                           <i class="fa fa-arrow-left"></i></a> Book Appointment</h2>
	                        <ul class="breadcrumb">
	                            <li class="breadcrumb-item"><a onclick="loadcancel();" style="cursor: pointer;">     <%-- href="<%=request.getContextPath()%>/view/index.jsp" --%>
	                            <i class="icon-home"></i></a></li><li class="breadcrumb-item active">Dashboard</li>
	                        </ul>
                           
                           
                            <!-- The buttons to control the stream -->
							  <button id="btn-stop" type="button" class="button" hidden>Stop Streaming</button>
							  <button id="btn-capture" type="button" class="button" >Capture Image</button>
							
							<!-- Video Element & Canvas -->
							    <video id="stream" width="320" height="240" ></video>
							    <canvas id="capture"  ></canvas>
    
                           
                           <%--  <h2><a href="<%=request.getContextPath()%>/view/index.jsp" class="btn btn-xs btn-link btn-toggle-fullwidth">
                            <i class="fa fa-arrow-left"></i></a>Book Appointment</h2> --%>
                            <!-- <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                                <li class="breadcrumb-item active">Appointment</li>
                            </ul> -->
                        </div>            
                        <!-- <div class="col-lg-6 col-md-4 col-sm-12 text-right">
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
                        </div> -->
                    </div>
                </div>
                
                <!-- action="/appointment_user" -->
                <form  method="POST" id="userform" name="userformName" modelAttribute="PatientBean" autocomplete="off"  
                			enctype="multipart/form-data">
                    <!--  Script add Properly -->
                	
                     <input type="hidden" id="patientpicturebase64" name="patientpicturebase64"> 
                    

                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="header">
                                <h2>Book Appointment</h2>
                            </div>

                             <div class="float-right">
                             	 <i id="btn-start" class="fa fa-camera" aria-hidden="true"></i>
                                <h5>(<font color="red">*</font>)- Mandatory Fields</h5>
                            </div> 
							
							
                            <div class="col-md-9">
                                <div class="file-loading">
                                    <div class="container">
                                        <div class="row">
                                        <%--  <%if (records.length >0){ %>
                                          <% records.forEach(function(row){ %>
                                            <img src="./uploads/<%= row.name %>" class="profile" id="profileid" alt="image">
                                          <% }) } else { %> --%>
                                           <div  id="snapshot" ></div>
                                            <%-- <img src="<%=request.getContextPath()%>/images/user1.png" class="profile" id="profileid" onclick=openfile(); alt="image"><br><br>
                                            <input type="file" onchange=checkFile(this); name="uploadfile" id="fileChoose" style="display: none;" /> --%>
                                           <%--  <%  }  %> --%>
                                            
                                      </div>
                                  </div>
                                </div>
                            </div>
							<br><br>
                            <div class="body">

                                <div class="row clearfix">
                                    <div class="col-lg-2 col-sm-3">
                                        <div><label for="firstname" class="form-label">First Name</label> : <font color="red">*</font></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                        <!-- <div><input type="text" class="form-control ValidateInput SimpleTextWithSpaceRegexClass" onchange="validateRegex(this);" name="first_name" id="first_name" placeholder="First Name"/></div> -->
                                        <div><input type="text" class="form-control ValidateInput" onchange="onlyalphabetwithspace(this);" name="first_name" id="first_name" placeholder="First Name"/></div>
                                    </div>


                                    <div class="col-lg-2 col-sm-3">
                                        <div><label for="lastname" class="form-label">Last Name</label> : <font color="red">*</font></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                        <div><input type="text" class="form-control ValidateInput"  onchange="onlyalphabetwithspace(this);" name="last_name" id="last_name" placeholder="Last Name"/></div>
                                    </div>
                                </div>

                                <br>
                                <div class="row clearfix">
                                     
                                    <div class="col-lg-2 col-sm-3">
                                        <div><label for="gender" class="form-label">Gender</label> :</div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                       
                                            <select class="form-control show-tick" name="gender">
                                                <option value="">- Gender -</option>
                                                <option >Male</option>   
                                                <option >Female</option>
                                            </select>
                                        
                                    </div>


                                    <div class="col-lg-2 col-sm-3">
                                        <div><label for="age" class="form-label">Age</label> : </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                        <div><input type="text" class="form-control" onchange="onlyNumber(this);" maxlength="3" name="age" id="age" placeholder="Age"/></div>
                                    </div>

                                </div>
                                <br>

                                <div class="row clearfix">
                                    <div class="col-lg-2 col-sm-3">
                                        <div><label for="emailaddress" class="form-label">Email </label> : </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                        <div><input type="text" class="form-control" name="email_address" id="email_address" onchange="validateEmail(this);checkemail(this);" placeholder="Enter Your Email"/></div>
                                    </div>


                                    <div class="col-lg-2 col-sm-3">
                                        <div><label for="mobileno" class="form-label">Mobile Number</label> : <font color="red">*</font></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                        <div><input type="text" class="form-control ValidateInput" onchange="mobilenoValidation(this);" name="mobile_no" id="mobile_no" maxlength="10" placeholder="Enter Your Mobile Number"/></div>
                                    </div>
                                </div>

                                <br>
                                <div class="row clearfix">
                                    <div class="col-lg-3 col-sm-3">
                                        <div><label for="appointmentdate" class="form-label">Appointment Date </label> : <font color="red">*</font></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                        <!-- <input data-provide="datepicker" name="appointment_date_time" data-date-autoclose="true" class="form-control" placeholder="Appointment Date"> -->
                                        <input type="datetime-local" class="form-control ValidateInput"  name="appointment_date_time" 
                                        id="appointment_date_time" onchange="checkdatetime(this);" placeholder="Appointment Date"/>

                                    </div>
                                    
                                    
                                     <div class="col-lg-2 col-sm-3">
                                        <div><label for="description" class="form-label">Description </label> :</div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                    <textarea rows="5" cols="10" class="form-control" name="description" placeholder="Description"></textarea>
                                    </div>

                                </div>
                                <br>



                                <div class="row clearfix">                                
                                    
                                  
                                    <div class="col-lg-2">
                                       <!--  <button type="submit" onclick="loadsubmit()" class="btn btn-primary">Submit</button> -->
                                        <input type="button" onclick="loadsubmit();" class="btn btn-primary btn-lg btn-block" value="SUBMIT"/>
<!--                                         <input type="button" onclick="loadcancel();" class="btn btn-outline-secondary" value="CANCEL"/> -->
                                         <!-- <button type="submit" onclick="loadcancel()"  class="btn btn-outline-secondary">Cancel</button>  -->
<%--                                           <a href="<%=request.getContextPath()%>/view/index.jsp" class="btn btn-outline-secondary">Cancel</a>  --%>
                                    </div>
                                    
                                    <div class="col-lg-2">
                                        <input type="button" onclick="loadcancel();" class="btn btn-outline-secondary" value="CANCEL"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>

</div>

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

<script type="text/javascript">

$(document).ready(function() {
	
	if("${requestScope.msg}" != null && "${requestScope.msg}" != "")
	{
		if("${requestScope.msg}" == "fail")
		{
			swal("ERROR!","Patient is not Edited and try again","error");
		}else
		{
			 swal({
		         text: 'Patient Edited Successfully',
		         icon: 'success'
		       });
		       
		       //.then(function() {
		         //window.location = "${pageContext.request.contextPath}/view/appointment_user.jsp";
		       //});
		}
		/* window.location = "${pageContext.request.contextPath}/view/appointment_user.jsp"; */
	}
});




function loadsubmit()
{
	var flag = formValidate("userform");
	if(flag)
	{
		document.userformName.action="../health/appointment_user.htm";
		document.userformName.submit();
	} 
}

/* window.location = "${pageContext.request.contextPath}/view/index.jsp"; */


function loadcancel()
{
		
	document.userformName.action = "../health/loadindex.htm";  
	document.userformName.submit();	
}


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            // $('#'+id).show();
            $('#profileid')
                .attr('src', e.target.result)
                .width(150)
                .height(150);
        };
        reader.readAsDataURL(input.files[0]); // convert to base64 string
    }

}

function openfile(){
        $('#fileChoose').trigger('click');
}

function checkemail(txtinput)
{
	$.ajax({
		type :'POST',
		url: "../health/checkemail.htm",
		data :{email : txtinput.value},
		success :function(resdata,status,xhr)
		{
			if(resdata == "exist")
				{
				txtinput.value = "";
                txtinput.focus();
				swal("INFO!","E-mail Already exits !! try diffrent one","info");
				}
		},
		error : function(xhr, status, errorThrown) {
		},
		complete : function(xhr, status) {
		}
	});	
}

function checkdatetime(txtinput)
{
 	$.ajax({
		type :'POST',
		url: "../health/checkdatetime.htm",
		data :{appointmentdate : txtinput.value},
		success :function(resdata,status,xhr)
		{
			if(resdata == "exist")
				{
				txtinput.value = "";
                txtinput.focus();
				swal("INFO!","Appointment Date Already exits !! try select different timing","info");
				}else if(resdata == "error")
					{
					txtinput.value = "";
	                txtinput.focus();
					swal("ERROR!","Something went wrong!!","error");
					}
		},
		error : function(xhr, status, errorThrown) {
		},
		complete : function(xhr, status) {
		}
	});	 
}


function checkFile(fieldObj){
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
						readURL(fieldObj);
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




//The buttons to start & stop stream and to capture the image
var btnStart = document.getElementById( "btn-start" );
var btnStop = document.getElementById( "btn-stop" );
var btnCapture = document.getElementById( "btn-capture" );
$("#stream").hide();
$("#btn-capture").hide();
// The stream & capture
var stream = document.getElementById( "stream" );
var capture = document.getElementById( "capture" );
var snapshot = document.getElementById( "snapshot" );

var width = 320; // We will scale the photo width to this
var height = 0; // This will be computed based on the input stream

// The video stream
var cameraStream = null;

// Attach listeners
btnStart.addEventListener( "click", startStreaming );
btnStop.addEventListener( "click", stopStreaming );
btnCapture.addEventListener( "click", captureSnapshot );

// Start Streaming
function startStreaming() {
	
		$("#stream").show();
		$("#btn-capture").show();
		$("#stream").css({"hidden":"false"});
		$("#capture").css({"hidden":"false"});
		var mediaSupport = 'mediaDevices' in navigator;

	if( mediaSupport && null == cameraStream ) {
		navigator.mediaDevices.getUserMedia( {
			video: true,
            audio: false 
			} )
		.then( function( mediaStream ) {
			cameraStream = mediaStream;
			stream.srcObject = mediaStream;
			stream.play();
		}).catch( function( err ) {
		console.log( "Unable to access camera: " + err );
		});
		
		stream.addEventListener('canplay', function(ev) {
                 height = stream.videoHeight / (stream.videoWidth / width);
                 if (isNaN(height)) {
                     height = width / (4 / 3);
                 }

                 stream.setAttribute('width', width);
                 stream.setAttribute('height', height);
                 capture.setAttribute('width', width);
                 capture.setAttribute('height', height);
         }, false);
		 
	}
	else {
		alert('Your browser does not support media devices.');
		return;
		}
}

// Stop Streaming
function stopStreaming() {
	if( null != cameraStream ) {
		var track = cameraStream.getTracks()[ 0 ];
		track.stop();
		stream.load();
		cameraStream = null;
	}
}

function captureSnapshot() {

	if( null != cameraStream ) {
		//var ctx = capture.getContext('2d');
		//ctx.fillStyle = "#AAA";
		//ctx.fillRect(0, 0, capture.width, capture.height);
		
		var context = capture.getContext('2d');
        if (width && height) {
        	capture.width = width;
        	capture.height = height;
            context.drawImage(stream, 0, 0, width, height);
            var data = capture.toDataURL('image/png');
            //photo.setAttribute('src', data);
        }
         
		var img = new Image();
		//ctx.drawImage( stream, 0, 0, capture.width, capture.height );
		
		img.src = data; //capture.toDataURL("image/png");
		img.id = 'profilePic';
		var img1 = capture.toDataURL("image");
		var item_image = img1.replace(/^data:image\/(png|jpg);base64,/, "") 
		$("#patientpicturebase64").val(item_image);
		
		/* var ctx = capture.getContext('2d');
        if (width && height) {
        	capture.width = width;
        	capture.height = height;
        	ctx.drawImage(stream, 0, 0, width, height);

            var data = capture.toDataURL('image/png');
            photo.setAttribute('src', data);
        } */
        
        
		snapshot.innerHTML = '';
		snapshot.appendChild(img);
	}
	
	$("#stream").hide();
	$("#btn-capture").hide();
	stopStreaming();
}


</script>
</body>
</html>