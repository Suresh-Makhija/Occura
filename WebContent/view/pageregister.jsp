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
<link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.css"> --%>
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">

<style type="text/css">   /* add header  */

.validateStyle{
	border: 1px solid red!important;
}

</style>

</head>

<body class="theme-cyan">
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle auth-main">
				<div class="auth-box">
                    <div class="top">
                        <img src="https://www.wrraptheme.com/templates/lucid/hospital/assets/images/logo-white.svg" alt="Lucid">
                    </div>
					<div class="card">
                        <div class="header">
                            <p class="lead">Create an account</p>
                        </div>
                        <div class="body">

                            <form class="form-auth-small" name="registerformName" id="registerform" autocomplete="off">

                                <div class="form-group">
                                    <label for="signup-email" class="control-label sr-only">Email</label>
                                    <input type="email" required="required" class="form-control ValidateInput" name="signup-email" id="signup-email" placeholder="Your email">
                                </div>
                                <div class="form-group">
                                 <label for="signup-user" class="control-label sr-only">UserName</label>
                                    <input type="text" required="required" class="form-control ValidateInput" name="signup-user" id="signup-user" placeholder="Your Username">
                                </div>
                                <div class="form-group">
                                    <label for="signup-password" class="control-label sr-only">Password</label>
                                    <input type="password" required="required" class="form-control ValidateInput" name="signup-password" id="signup-password" 
                                    		placeholder="Password" autocomplete="new-password">
                                </div>
                                <input type="button" onclick="register();" class="btn btn-primary btn-lg btn-block" value="REGISTER"/>
                                <div class="bottom">
                                    <span class="helper-text">Already have an account? <a href="page-login.jsp">Login</a></span>
                                </div>
                            </form>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
<%-- 	<script src="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.min.js" type="text/javascript"></script> --%>
	 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	  <%-- <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-3.6.1.min.js"></script>  --%> 
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
function register()
{
	var flag = formValidate("registerform");
	if(flag){
		var email = $("#signup-email").val(); 
		var user = $("#signup-user").val();
		var password = $("#signup-password").val();
		$.ajax({
			type :'POST',
			url: "../controller/register.htm",
			data :{email : email, user : user,password:password},
			success :function(resdata,status,xhr)
			{
				if(resdata == "match")
				{
				//alert(resdata);
				 swal({
			         title: 'Welcome!' +user ,
			         text: 'Success register!',
			         icon: 'success'
			       }).then(function() {
			         window.open("page-login.jsp");
			       });
				}
				if(resdata == "exist")
					{
					swal("INFO!","User Already exits !! try different one","info");
					}
				if(resdata == "notmatch"){
					swal("ERROR!","Try again after 5 min","error");
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
