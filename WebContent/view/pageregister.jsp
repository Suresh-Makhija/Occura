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

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color_skins.css">
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
                            <form class="form-auth-small" >
                                <div class="form-group">
                                    <label for="signup-email" class="control-label sr-only">Email</label>
                                    <input type="email" class="form-control" name="signup-email" id="signup-email" placeholder="Your email">
                                </div>
                                <div class="form-group">
                                 <label for="signup-user" class="control-label sr-only">UserName</label>
                                    <input type="text" class="form-control" name="signup-user" id="signup-user" placeholder="Your Username">
                                </div>
                                <div class="form-group">
                                    <label for="signup-password" class="control-label sr-only">Password</label>
                                    <input type="password" class="form-control" name="signup-password" id="signup-password" placeholder="Password">
                                </div>
                                <input type="button" onclick="register();" class="btn btn-primary btn-lg btn-block" value="REGISTER"/>
                                <div class="bottom">
                                    <span class="helper-text">Already have an account? <a href="page-login.html">Login</a></span>
                                </div>
                            </form>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
<script type="text/javascript">
function register()
{
	var email = $("#signup-email").val(); 
	var user = $("#signup-user").val();
	var password = $("#signup-password").val();
$.ajax({
type :'POST',
url: "register",
data :{email : email, user : user,password:password},
success :function(resdata,status,xhr)
{

},
error : function(xhr, status, errorThrown) {

},
complete : function(xhr, status) {
}
});
}


</script>
</body>

</html>
