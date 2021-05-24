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

 </style>

        
</head>
<body>

<div id="main-content">
            <div class="container-fluid">
                <div class="block-header">
                    <div class="row">
                      
                        <div class="col-lg-6 col-md-8 col-sm-12">
                            <!-- <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Book Appointment</h2> -->
                            <h2><a href="<%=request.getContextPath()%>/view/index.jsp" class="btn btn-xs btn-link btn-toggle-fullwidth">
                            <i class="fa fa-arrow-left"></i></a>Book Appointment</h2>
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
                	
                       
                    

                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="header">
                                <h2>Book Appointment</h2>
                            </div>

                             <div class="float-right">
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
                                            <img src="<%=request.getContextPath()%>/images/user1.png" class="profile" id="profileid" onclick=openfile(); alt="image"><br><br>
                                            <input type="file" onchange=checkFile(this); name="uploadfile" id="fileChoose" style="display: none;" />
                                           <%--  <%  }  %> --%>
                                            
                                      </div>
                                  </div>
                                </div>
                            </div>

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
                                    <div class="col-lg-2 col-sm-3">
                                        <div><label for="appointmentdate" class="form-label">Appointment Date </label> : <font color="red">*</font></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-3">
                                        <!-- <input data-provide="datepicker" name="appointment_date_time" data-date-autoclose="true" class="form-control" placeholder="Appointment Date"> -->
                                        <input type="datetime-local" class="form-control ValidateInput"  name="appointment_date_time" id="appointment_date_time" placeholder="Appointment Date"/>

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
        </div>


<!-- Javascript -->

<%-- <script � src="<c:url value = "/resources/mis/js/commonJS.js"/>"></script>
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
		       }).then(function() {
		         window.location = "${pageContext.request.contextPath}/view/appointment_user.jsp";
		       });
		}
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

function loadcancel()
{
	window.location = "${pageContext.request.contextPath}/view/index.jsp";	
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