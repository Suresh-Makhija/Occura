<%@page import="com.occura.dao.AllListDao"%>
<%@include file="header.jsp" %>
<!doctype html>
<html lang="en">


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="Lucid Bootstrap 4.1.1 Admin Template">
<meta name="author" content="WrapTheme, design by: ThemeMakker.com">


</head>
<body class="theme-cyan">

<%
AllListDao allListDao = new AllListDao();
List<UserBean> usList =  allListDao.getUserList();
%>



    <div id="main-content">
        <div class="container-fluid">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Add Departments</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;"><i class="icon-home"></i></a></li>     <!-- href="index.jsp"  -->                        
                            <li class="breadcrumb-item">Department</li>
                            <li class="breadcrumb-item active">Add Departments</li>
                        </ul>
                    </div>            
               
                </div>
            </div>
           
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="card">
                        <div class="header">
                            <h2>Basic Information <small>Description text here...</small> </h2>                            
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Departments Name">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <select class="selectpicker" multiple>
                                        	<option value="">- Select Team -</option>
                                        <%for(UserBean userBean : usList){ %>
                                            <option value="<%= userBean.getUser_id()%>"><%= userBean.getName()%></option>
                                            <%} %>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <input type="file" class="dropify">
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group mt-3">
                                        <textarea rows="6" class="form-control no-resize" placeholder="Please type what you want..."></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary">Add</button>
                                    <button type="submit" class="btn btn-outline-secondary">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    
</div>


</body>

</html>
