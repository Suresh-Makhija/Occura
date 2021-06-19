<!doctype html>
<html lang="en">


<head>
<title>:: Saraswati Eye Hospital :</title>
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
                        <img src="" alt="Occura">
                    </div>
					<div class="card">
                        <div class="header">
                            <p class="lead">Recover my password</p>
                        </div>
                        <div class="body">
                            <p>Please enter your email address below to receive instructions for resetting password.</p>
                            <form class="form-auth-small" name="loginformName">
                                <div class="form-group">                                    
                                    <input type="email" class="form-control" id="signup-email" placeholder="Email">
                                </div>
                                <input type="button" class="btn btn-primary btn-lg btn-block" onclick="forgotEmail();" value="RESET PASSWORD"/>
                                <div class="bottom">
                                    <span class="helper-text">Know your password? <a onclick="loginpage();" style="cursor: pointer;">Login</a></span>   <!-- href="page-login.jsp" -->
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
<script type="text/javascript">

function loginpage()
{
	document.loginformName.action = "../controller/loadLoginPage.htm";  
	document.loginformName.submit();
}

function forgotEmail()
{
	var email = $("#signup-email").val();
	$.ajax({
	type :'POST',
	url: "../mail/forgotPassword.htm",
	data:{email:email},
	success :function(resdata,status,xhr)
	{
		if(resdata == "true")
			{
			swal("SUCCESS!","Check your email!!","success");
			}
		else
			{
			swal("INFO!","No email id present please register","info");
			}

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

