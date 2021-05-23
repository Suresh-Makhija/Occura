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
                            <form class="form-auth-small" >
                                <div class="form-group">
                                    <label for="signin-email" class="control-label sr-only">Email / User</label>
                                    <input type="email" class="form-control" id="signin-email"  placeholder="Email/User">
                                </div>
                                <div class="form-group">
                                    <label for="signin-password" class="control-label sr-only">Password</label>
                                    <input type="password" class="form-control" id="signin-password"  placeholder="Password">
                                </div>
                              
                                <input type="button" class="btn btn-primary btn-lg btn-block" onclick="login();" value="LOGIN"/>
                                <div class="bottom">
                                 <%
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
	<%} %>
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
function login()
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
		<%
		if(details){%>
		window.location = "index.jsp";
		<%}else{%>
	window.location = "view/index.jsp";
	<%}%>
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
	  



</script>

</body>

</html>
