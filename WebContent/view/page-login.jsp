<!doctype html>
<html lang="en">


<head>
<title>:: Saraswati Eye Hospital :: Login</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="Lucid Bootstrap 4.1.1 Admin Template">
<meta name="author" content="WrapTheme, design by: ThemeMakker.com">

<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
<link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">

<style type="text/css">   /* add header  */

.validateStyle{
	border: 1px solid red!important;
}

</style>
</head>
<%
		boolean details= false;
		if(request.getRequestURL().indexOf("view") > -1){
		 details= true;
		}%>
<body class="theme-cyan">
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle auth-main">
				<div class="auth-box">
                    <div class="top">
                        <img src="" alt="Saraswati Eye Hospital">
                    </div>
					<div class="card">
                        <div class="header">
                            <p class="lead">Login to your account</p>
                        </div>
                        <div class="body">
                            <form class="form-auth-small" name="loginformName" id="loginform" >
                                <div class="form-group">

                                    <label for="signin-email" class="control-label sr-only">Email</label>
                                    <input type="email" class="form-control ValidateInput" id="signin-email"  placeholder="Email" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="signin-password" class="control-label sr-only">Password</label>
                                    <input type="password" class="form-control ValidateInput" id="signin-password"  placeholder="Password" autocomplete="new-password">
                                </div>
                              
                                <input type="button" class="btn btn-primary btn-lg btn-block" onclick="login();" value="LOGIN"/>
                                <div class="bottom">
                                
                                <span class="helper-text m-b-10"><i class="fa fa-lock"></i> <a onclick="forgetpassword();" style="cursor: pointer;">Forgot password</a></span> <!--  href="page-forgot-password.jsp" -->
        						<span>Don't have an account? <a onclick="loadregister();" style="cursor: pointer;">Register</a></span>    <!-- href="pageregister.jsp" -->
        						                        
                                <%--  <%
                                  if(details){%>
	  <span class="helper-text m-b-10"><i class="fa fa-lock"></i> <a href="page-forgot-password.jsp">Forgot password?</a></span>
		<%}else{%>
	  <span class="helper-text m-b-10"><i class="fa fa-lock"></i> <a href="view/page-forgot-password.jsp">Forgot password?</a></span>
	<%} %>
                                  
                                  <%
                                  if(details){%>
		<span>Don't have an account? <a href="pageregister.jsp">Register</a></span>
		<%}else{%>
	<span>Don't have an account? <a href="view/pageregister.jsp">Register</a></span>
	<%} %> --%>

                                </div>
                            </form>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
	 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<%-- 	 <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-3.6.1.min.js"></script>   --%>
	<script type="text/javascript">

	
	function forgetpassword()
	{
		document.loginformName.action = "../controller/loadforgetpage.htm";  
		document.loginformName.submit();
	}
	
	function loadregister()
	{
		document.loginformName.action = "../controller/loadregister.htm";  
		document.loginformName.submit();
	}
	

	<%-- <%if(details){%>
	window.location = "index.jsp";
<%}else{%>
	window.location = "view/index.jsp";
<%}%> --%>

function login()
{
	var flag = formValidate("loginform");
	if(flag)
	{
		var email = $("#signin-email").val(); 
		var password = $("#signin-password").val();
		$.ajax({
			type :'POST',
			url: "${pageContext.request.contextPath}/controller/login.htm",
			data :{email : email,password:password},
			success :function(resdata,status,xhr)
			{
				if(resdata == "true")
				{
					document.loginformName.action = "../health/loadindex.htm";  
					document.loginformName.submit();
				}
				else
					{
					swal("ERROR!","wrong details","error");
					}
			
			},
			error : function(xhr, status, errorThrown) {
			
			},
			complete : function(xhr, status) {
			}
		});
	}
}


function formValidate(divName)   /* add header  */
{

            var flag=true;
            /*for textbox , radio button , password*/
            var dataInput=$('#'+divName+' input[type="text"].ValidateInput ,input[type="number"].ValidateInput ,#'+divName+' input[type="email"].ValidateInput, #'+divName+' input[type="file"].ValidateInput ,#'+divName+' input[type="password"].ValidateInput');
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
</script>



</body>

</html>
