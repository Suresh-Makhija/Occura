<%@page import="com.occura.bean.MasterChiefComplaintBean"%>
<%@page import="com.occura.dao.AllListDao"%>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-treeview/bootstrap-treeview.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
	<style type="text/css">
	.chosen-select-deselect {
  width: 100%;
}
	</style>
</head>
<body>
<%

AllListDao allListDao = new AllListDao();
List<MasterChiefComplaintBean> ChiefComplaintList = allListDao.getChiefComplaintList();

%>
 <div id="main-content">
        <div class="container-fluid">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth">
                        <i class="fa fa-arrow-left"></i></a> Session</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/view/index.jsp">
                            <i class="icon-home"></i></a></li>
                            <li class="breadcrumb-item active">Session</li>
                        </ul>
                    </div>

                </div>
            </div>
            
            <div class="col-lg-12 col-md-12">
                    <div class="card">
                        <div class="header">
                        </div>
                        <div>
    
</div>

<button data-toggle="collapse" data-target="#demo"  class="btn btn-primary">Chief Complaint</button>

<div id="demo" class="collapse">
<!-- <form action="" method="POST" name="insertCCId"> -->
<div id="chiefDiv" class="row clearfix" style="margin-left: 10%">
<div class="col-sm-3">
  <div class="form-group" style="margin-top: 9%">

	<select id="chielfComplaint1" class="form-control" style="height:50%"  name="chielfComplaintSelectName" data-show-subtext="true" data-live-search="true">
	<option value="0">Select Chief Cmplaint</option>
	<% for(MasterChiefComplaintBean masterChiefComplaintBean :  ChiefComplaintList){%>
	<option value="<%=masterChiefComplaintBean.getMaster_cc_id() %>"><%=masterChiefComplaintBean.getCc_description() %></option>
	<%} %>
	</select>
	</div></div>
	<div class="col-sm-3">
  <div class="form-group" style="margin-top: 9%">
	<input type="text" id="chiefDuration1" class="form-control" autocomplete="off" name="chiefDuration" onkeyup="insertRecords(this.id,1);"  placeholder="duration"></div></div>
	<div class="col-sm-6" >
  <div class="form-group" style="margin-top: 9%">
  <label class="icon-eye"  id="left1"   onclick="selectEye(this.id)"></label>
	<label class="icon-eye"  id="right1" onclick="selectEye(this.id)"></label>
	<label style="align-content: left;" class="icon-magnifier-add" onclick="addRow('1')"></label>
	</div></div>
</div>
<!-- onclick="submitForm(); -->
<button class="btn btn-secondary" ">Submit</button>
<!-- </form> -->

<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
														</div>
</div>
           
                        </div>
                        </div>
            </div>
            </div>
</body>

</button>
<script src="<%=request.getContextPath()%>/vendor/bootstrap-treeview/bootstrap-treeview.min.js"></script>
<script src="<%=request.getContextPath()%>/vendor/jstree/jstree.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/pages/treeview/jstree.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/pages/treeview/bootstrap-treeview.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<script type="text/javascript">

function insertRecords(id,count)
{
	var input = document.getElementById(id);
	input.addEventListener("keyup", function(event){
		if (event.keyCode === 13) {
	        addRow(1);
	    }
	});
	
}

function submitForm()
{
	document.insertCCId.action="../health/chiefComplain.htm";
	document.insertCCId.submit();
	}
function selectEye(inputId)
{
	if(document.getElementById(inputId).style.color == 'red')
	{
	}
	$('#'+inputId).css("color", "red");
	}
	



	function addRow(id)
	{
		var nextId = parseInt(id) + 1;

		var html = "<div class=\"col-sm-3\">"+
		       "<div class=\"form-group\">"+
		"<select id=\"chielfComplaint"+nextId+"\" class=\"form-control\" style=\"height:50%\" name=\"chielfComplaintSelectName\"   >"+
		"<option value=\"0\">Select Chief Cmplaint</option>"+
		"</select>"+
		"</div></div>"+
		"<div class=\"col-sm-3\">"+
	       "<div class=\"form-group\">"+
		"<input type=\"text\" class=\"form-control\" name=\"chiefDuration\" id=\"chiefDuration"+nextId+"\"  placeholder=\"duration\">"+
		"</div></div>"+
		
		"<div class=\"col-sm-6\">"+
	       "<div class=\"form-group\">"+
		"<label class=\"icon-eye\"  id=\"left"+nextId+"\"  onclick=\"selectEye(this.id)\"></label>"+
		"<label class=\"icon-eye\"  id=\"right"+nextId+"\" onclick=\"selectEye(this.id)\"></label>"+
		"<label class=\"icon-magnifier-add\" onclick=\"addRow("+nextId+")\"></label>"+
		"</div></div>";
	$("#chiefDiv").append(html);
	$.ajax({
		type :'POST',
		url: "../health/selectionChiefComplaint.htm",
		success :function(data)
		{
			var json = JSON.parse(data);
		
			$.each(json,function(i,f)
			{
				 $('#chielfComplaint'+nextId)
		         .append($("<option></option>")
		                    .attr("value", f.id)
		                    .text(f.value)); 
			});
		}});
	}
   
</script>
</html>