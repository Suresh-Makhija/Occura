
<!doctype html>
<html lang="en">

<head>
<title>:: Occura :: Login</title>
		<script>
		function startTimer()
		 {
				var tim = window.setTimeout("hideMessage()", 5000);  // 5000 milliseconds = 5 seconds
		 }
</script>
</head>
 <body data-open="hover" data-menu="horizontal-menu" data-col="1-column" class="horizontal-layout horizontal-menu 1-column  blank-page blank-page">
    
    
    <div class="app-content container center-layout">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
        <!-- <img src="img/sltllogo.png" alt="sltlLogo" class="animated zoomIn"> -->
        
        
        
        <section class="flexbox-container">
		    <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1 box-shadow-2 p-0">
<%-- 		    <%if(request.getAttribute("loginError") !=null) {%> --%>
<!-- 		    <div class="alert alert-danger alert-dismissible fade in mb-2" role="alert"> -->
<!-- 									<button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 										<span aria-hidden="true">&times;</span> -->
<!-- 									</button> -->
<%-- 									<strong>Oh snap!</strong> ${loginError} --%>
<!-- 								</div> -->
<%-- 					<%} %>			 --%>
		        <div class="card border-grey border-lighten-3 px-2 py-2 m-0">
		            <div class="card-header no-border pb-0">
		                <div class="card-title text-xs-center">
		                 <div class="BODY">
		                    <img alt="" src="img/sltllogoNEW.png" width="200px;" height="70px;">
			</div>
                </div>
                <h6 class="card-subtitle line-on-side text-muted text-xs-center font-small-3 pt-2"><span>Login</span></h6>
            </div>
            <div class="card-body collapse in">
                <!-- <p class="card-subtitle line-on-side text-muted text-xs-center font-small-3 mx-2 my-1"><span></span></p> -->
                <div class="card-block">
                		 <form class="form-horizontal" action="controller/login" method="post" >
                        <fieldset class="form-group position-relative has-icon-left">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Your username" required>
                            <div class="form-control-position"  style="margin-top:10px">
                                <i class="icon-head"></i>
                            </div>
                        </fieldset>
                        <br>
                        <fieldset class="form-group position-relative has-icon-left">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                            <div class="form-control-position"  style="margin-top:10px">
                                <i class="icon-key3"></i>
                            </div>
                        </fieldset>
                        <br>
                        <button type="submit" class="btn btn-primary btn-block"><i class="icon-unlock2"></i> Login</button>
                    </form>
                </div>
            </div>
        </div>
        </div>
        
    </div>
</section>
</body>
</html>
