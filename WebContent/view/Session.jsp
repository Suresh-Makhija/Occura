<%@page import="com.occura.bean.MasterMedicineBean"%>
<%@page import="com.occura.bean.MasterChiefComplaintBean"%>
<%@page import="com.occura.bean.MasterDiagnoBean"%>

<%@page import="com.occura.dao.AllListDao"%>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-treeview/bootstrap-treeview.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/select2/select2.css">

<!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" /> -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet" /> -->

<style type="text/css">
.chosen-select-deselect {
  width: 100%;
}


#chiefDiv{
    width: 50%;
    margin-left: 20%;
}

</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#diagnosisId").select2({
			placeholder : "Select Diagnos"
		});
		
		
		if("${requestScope.msg}" != null && "${requestScope.msg}" != "")
		{
			if("${requestScope.msg}" == "fail")
			{
				swal("ERROR!","Chief Complain is not Edited and try again","error");
			}else
			{
				 swal({
			         text: 'Chief Complain Edited Successfully',
			         icon: 'success'
			       });
			}
		}
	});
</script>

</head>
<body>
<%

AllListDao allListDao = new AllListDao();
List<MasterChiefComplaintBean> ChiefComplaintList = allListDao.getChiefComplaintList();
List<MasterMedicineBean> masterMedicineBeans = allListDao.getTreatmentList();
List<MasterDiagnoBean> masterDiagnoBeans = allListDao.getDiagnosList();
%>

	 <form:form name="sessionname" method="post" id="sessionid"
		modelAttribute="GeneralDTO" enctype="multipart/form-data" autocomplete="off"> 
		
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
               <br>
               	<div class="col-lg-12">
	               	<div class="col-lg-2">
	               		<div data-toggle="collapse" data-target="#chiefcomplaint_target"  class="btn btn-primary">Chief Complaint</div>
	               	</div>
               	</div>
					<br>
					<div id="chiefcomplaint_target" class="collapse">
						<div id="chiefDiv">
								<table class="table table-bordered table-condensed" id="datatable1">
								
								<thead style="text-align: left;">
									<tr>
										<th style="text-align: left;">Chief Complaint</th>
										<th style="text-align: left;">Duration(In Days)</th>
										<th style="text-align: left;" width="50%">Eye</th>
										<th style="text-align: left;">Action</th>
									</tr>
								</thead>
								<tbody id="tbodyID">
									<tr class="" id="">
										<td width="50%">
											<select id="chielfComplaint0" class="form-control"   style="height:50%"  
											name="boPatientCCHistory[0].master_cc_id"  data-show-subtext="true" data-live-search="true"
											onfocus="hideError1(this);" onclick="hideError1(this);">
												<option value="0">Select Chief Complaint</option>
												<% for(MasterChiefComplaintBean masterChiefComplaintBean :  ChiefComplaintList){%>
												<option value="<%=masterChiefComplaintBean.getMaster_cc_id() %>"><%=masterChiefComplaintBean.getCc_description() %></option>
												<%} %>
											</select>
										</td>
										<td width="50%">
											<input type="text" id="chiefDuration0" class="form-control" autocomplete="off" 
											name="boPatientCCHistory[0].duration" onchange="onlyNumber(this);"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="duration">
										</td><!-- onkeyup="insertRecords(this.id,1);" --> 
										
										<td width="50%">
											<!-- <label class="icon-eye"  id="left0"   onclick="selectEye(this.id)"></label>
											<label class="icon-eye"  id="right0" onclick="selectEye(this.id)"></label> -->
											
											<select id="eye0" class="form-control"   style="height:50%"  
											name="boPatientCCHistory[0].eye"  >
												<option value="0">Select Eye</option>
												<option value="Both">Both</option>
												<option value="Left">Left</option>
												<option value="Right">Right</option>
											</select>
											
										</td>
										<td align="center"></td>
									</tr>
									
								</tbody>
							</table>
							<table>
								<tr style="border: none;">
									<td align="left" colspan="4">
										<a onclick="checkAddRowValidation();" title="Add"
										class="btn btn-success">ADD</a>
									</td>
								</tr>
							</table>
						</div>
						
							
					</div>
					
					<br>
					
					
					
				
					
					
				
					
           		</div>
              </div>
              
              
              
              
               <div class="col-lg-12 col-md-12">
               <div class="card">
               <br>
               	<div class="col-lg-12">
	               <div class="col-lg-2">
	               		<button data-toggle="collapse" data-target="#diagnosis_target"  class="btn btn-primary">Diagnosis</button>
	               	</div>
               	</div>
               	<br>
					<div id="diagnosis_target" class="collapse">
						<div id="chiefDiv">
								<table class="table table-bordered table-condensed" id="datatable1">
								
								<thead style="text-align: left;">
									<tr>
										<th style="text-align: left;">Diagnosis</th>
									</tr>
								</thead>
								<tbody id="tbodyID">
									<tr class="" id="">
										<td width="50%">
											<select id="diagnosisId" class="form-control" style="height:50%"  multiple="multiple"
											name="boPatientDiagnos.master_diagno_id">
												<option value="0">Select Diagnosis</option>
												<% for(MasterDiagnoBean masterDiagnolist :  masterDiagnoBeans){%>
												<option value="<%=masterDiagnolist.getMaster_diagno_id()%>"><%=masterDiagnolist.getDiagno_description() %></option>
												<%} %>
											</select>
										</td>
									</tr>
									
								</tbody>
							</table>
							
						</div>
						
					</div>
           		</div>
              </div>
	               	
	          <div class="col-lg-12 col-md-12">
               <div class="card">
               <br>
               	<div class="col-lg-12">
	                	<div class="col-lg-2">
	               		<button data-toggle="collapse" data-target="#treatment_target"  class="btn btn-primary">Treatment</button>
	               	</div>
               	</div>
               	<br>
					<div id="treatment_target" class="collapse">
						<div id="chiefDiv">
								<table class="table table-bordered table-condensed" id="datatable1">
								
								<thead style="text-align: left;">
									<tr>
										<th style="text-align: left;">Treatment</th>
										<th style="text-align: left;">Quantity</th>
										<th style="text-align: left;">Duration</th>
										<th style="text-align: left;">Eye</th>
										<th style="text-align: left;">Description</th>
										<th style="text-align: left;">Action</th>
									</tr>
								</thead>
								<tbody id="tbodyID_medicine">
									<tr class="" id="">
										<td width="50%">
											<select id="treatmentmedicine0" class="form-control"   style="height:50%"  
											name="boPatientMedicine[0].master_medicine_id" 
											onfocus="hideError1(this);" onclick="hideError1(this);">
												<option value="0">Select Treatment</option>
												<% for(MasterMedicineBean masterMedicineBean :  masterMedicineBeans){%>
												<option value="<%=masterMedicineBean.getMaster_medicine_id() %>"><%=masterMedicineBean.getMedicine_description()%></option>
												<%} %>
											</select>
										</td>
										
										<td style="width: 50%">
											<input type="text" id="Quantity0" class="form-control" autocomplete="off" 
											name="boPatientMedicine[0].medicine_Qty" onchange="onlyNumber(this);"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Quantity">
										</td>
										
										<td style="width: 50%">
											<input type="text" id="treatmentDuration0" class="form-control" autocomplete="off" 
											name="boPatientMedicine[0].duration" onchange="onlyNumber(this);"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="duration">
										</td>
										<td>
											<!-- <label class="icon-eye"  id="left_treatment0"   onclick="selectEye(this.id)"></label>
											<label class="icon-eye"  id="right_treatment0" onclick="selectEye(this.id)"></label> -->
											
											<select id="eyetreatment0" class="form-control"   style="height:50%"  
													name="boPatientMedicine[0].eye"  >
												<option value="0">Select Eye</option>
												<option value="Both">Both</option>
												<option value="Left">Left</option>
												<option value="Right">Right</option>
											</select>
											
										</td>
										
										<td>
											<textarea rows="5" cols="10" class="form-control" name="boPatientMedicine[0].description" 
											id="description0" placeholder="Description"></textarea>
										</td>
										
										<td align="center"></td>
									</tr>
									
								</tbody>
							</table>
							<table>
								<tr style="border: none;">
									<td align="left" colspan="4">
										<a onclick="checkAddRowTreatment();" title="Add"
										class="btn btn-success">ADD</a>
									</td>
								</tr>
							</table>
						</div>
						
					</div>
					
					
           		</div>
              </div>
	             
	             
	             <div class="col-lg-12 col-md-12">
	             	<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
									<a class="btn btn-success" id="btn_submit" onclick="submitForm();" 
									title="Submit">Submit</a>
								</div>
							</div> 
	             </div>
	             
	             
	             
	             
            </div>
            </div>
            
            
         </form:form> 
            
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="<%=request.getContextPath()%>/vendor/bootstrap-treeview/bootstrap-treeview.min.js"></script>
<script src="<%=request.getContextPath()%>/vendor/jstree/jstree.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/pages/treeview/jstree.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/pages/treeview/bootstrap-treeview.js"></script>
<script src="<%=request.getContextPath()%>/assets/select2/select2.js"></script>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script> -->
<script type="text/javascript">
/* function insertRecords(id,count)
{
	var input = document.getElementById(id);
	input.addEventListener("keyup", function(event){
		if (event.keyCode === 13) {
	        addRow(1);
	    }
	});
	
} */

/* $(document).on('change', '.selectpicker', function () {
    $('.selectpicker').selectpicker('refresh');
}); */
	
function checkAddRowValidation(){
	var flg1=validateAddrowFields();
	if(flg1){
		addRow('tbodyID');
		}
}


function validateAddrowFields(){
	var flag = true;
		 for(var i=0;i<=rowCount;i++){
			 try{
				if(document.getElementById("chielfComplaint"+i).value=="0"){
					document.getElementById("chielfComplaint"+i).style.border="1px solid #E85445";
			        document.getElementById("chielfComplaint"+i).style.background="#FAEDEC";
					flag=false;
					}
		
				if(document.getElementById("chiefDuration"+i).value==""){
					document.getElementById("chiefDuration"+i).style.border="1px solid #E85445";
			        document.getElementById("chiefDuration"+i).style.background="#FAEDEC";
					flag=false;
					}
			}catch (e) {
				continue;
			} 
		 }
	return flag;
}


var rowCount = 1;
var nRow =1;

function addRow(t_id){
	  var table = document.getElementById(t_id);
	  
    var row = document.createElement("TR");
    row.setAttribute('id', 'n' + nRow);
    var td1 = document.createElement("TD");
    var element1 = document.createElement("SELECT");
    element1.name="boPatientCCHistory["+nRow+"].master_cc_id"; 
    element1.className="form-control";
    element1.id="chielfComplaint"+nRow;
    element1.style="height:50%";	
    
    
    var itemid = element1.id;
    element1.onclick=function(){hideError1(this);};
    element1.onfocus=function(){hideError1(this);};
    var o1 = document.createElement("OPTION");
    o1.value="0";
    var t1 = document.createTextNode("Select Chief Complaint");
    
    o1.appendChild(document.createTextNode("Select Chief Complaint"));
		 element1.appendChild(o1);
    <%
    	for(MasterChiefComplaintBean masterChiefComplaintBean :  ChiefComplaintList){%>
	    	var o2 = document.createElement("OPTION");
	    		o2.value="<%=masterChiefComplaintBean.getMaster_cc_id()%>";
	    	var t2 = document.createTextNode("<%=masterChiefComplaintBean.getCc_description()%>");
	    		o2.appendChild(t2);
	    		element1.appendChild(o2);
    	<%} %>
    td1.appendChild(element1);
    row.appendChild(td1);

    var td2 = document.createElement("TD");
    var element2 = document.createElement("input");
    element2.type = "text";
    element2.className="form-control";
    element2.name = "boPatientCCHistory["+nRow+"].duration";
    element2.autocomplete = "off";
    element2.placeholder = "duration";
    element2.id="chiefDuration"+nRow;
    element2.onclick=function(){hideError1(this);};
    element2.onfocus=function(){hideError1(this);};
    element2.onchange=function(){onlyNumber(this);};
    td2.appendChild(element2);
    row.appendChild(td2);

var td3 = document.createElement("TD");
var element3 = document.createElement("SELECT");
element3.name="boPatientCCHistory["+nRow+"].eye"; 
element3.className="form-control";
element3.id="eye"+nRow;
element3.style="height:50%";	

var o3 = document.createElement("OPTION");
	o3.value="0";
var t3 = document.createTextNode("Select Eye");
	o3.appendChild(t3);
element3.appendChild(o3);

var o4 = document.createElement("OPTION");
o4.value="Both";
var t4 = document.createTextNode("Both");
	o4.appendChild(t4);
	element3.appendChild(o4);

var o5 = document.createElement("OPTION");
o5.value="Left";
var t5 = document.createTextNode("Left");
	o5.appendChild(t5);
	element3.appendChild(o5);
	
		
var o6 = document.createElement("OPTION");
o6.value="Right";
var t6 = document.createTextNode("Right");
	o6.appendChild(t6);
	element3.appendChild(o6);

td3.appendChild(element3);
row.appendChild(td3);

	/*  var td3 = document.createElement("TD");
	    var element3 = document.createElement("label");
	    element3.className="icon-eye";
	    element3.id="left"+nRow;
	    element3.onclick=function(){selectEye(this.id);};
	    td3.appendChild(element3);
	    
	    var element4 = document.createElement("label");
	    element4.className="icon-eye";
	    element4.id="right"+nRow;
	    element4.onclick=function(){selectEye(this.id);};
	    td3.appendChild(element4); 
	    row.appendChild(td3);*/
	    
	    


    var td4 = document.createElement("TD");
	    td4.setAttribute("align","center");
	    var element6 = document.createElement("A");
	    td4.setAttribute("id",nRow);
	    element6.className="fa fa-remove";
	    element6.title="Remove";
	    element6.style="font-size: 25px;color: #FF9797;";	
	    element6.setAttribute('href', 'javascript:deleteItem(\'n' + nRow + '\');');
	    td4.appendChild(element6);
	    row.appendChild(td4);
    table.appendChild(row);
  
    rowCount++;
    nRow++;
   }



function deleteItem(id){
	 var table = document.getElementById("tbodyID");
		table.removeChild(document.getElementById(id));
		$("#"+id).closest("tr").find("input:text").val('');
	rowCount--;
  nRow--;
}



function checkAddRowTreatment(){
	var flg1=validateAddrowFieldsTreatment();
	if(flg1){
		addRow1('tbodyID_medicine');
		}
}


function validateAddrowFieldsTreatment(){
	var flag = true;
		 for(var i=0;i<=rowCount1;i++){
			 try{
				if(document.getElementById("treatmentmedicine"+i).value=="0"){
					document.getElementById("treatmentmedicine"+i).style.border="1px solid #E85445";
			        document.getElementById("treatmentmedicine"+i).style.background="#FAEDEC";
					flag=false;
					}
		
				if(document.getElementById("treatmentDuration"+i).value==""){
					document.getElementById("treatmentDuration"+i).style.border="1px solid #E85445";
			        document.getElementById("treatmentDuration"+i).style.background="#FAEDEC";
					flag=false;
					}
				
				if(document.getElementById("Quantity"+i).value==""){
					document.getElementById("Quantity"+i).style.border="1px solid #E85445";
			        document.getElementById("Quantity"+i).style.background="#FAEDEC";
					flag=false;
					}
				
			}catch (e) {
				continue;
			} 
		 }
	return flag;
}


var rowCount1 = 1;
var nRow1 =1;

function addRow1(t_id){
	  var table = document.getElementById(t_id);
	  
    var row = document.createElement("TR");
    row.setAttribute('id', 'n' + nRow1);
    var td1 = document.createElement("TD");
    var element1 = document.createElement("SELECT");
    element1.name="boPatientMedicine["+nRow1+"].master_medicine_id"; 
    element1.className="form-control";
    element1.id="treatmentmedicine"+nRow1;
    element1.style="height:50%";	

    element1.onclick=function(){hideError1(this);};
    element1.onfocus=function(){hideError1(this);};
    var o1 = document.createElement("OPTION");
    o1.value="0";
    var t1 = document.createTextNode("Select Treatment");
		
    o1.appendChild(document.createTextNode("Select Treatment"));
		 element1.appendChild(o1);
    <%
    	for(MasterMedicineBean masterMedicineBean :  masterMedicineBeans){%>
	    	var o2 = document.createElement("OPTION");
	    		o2.value="<%=masterMedicineBean.getMaster_medicine_id()%>";
	    	var t2 = document.createTextNode("<%=masterMedicineBean.getMedicine_description()%>");
	    		o2.appendChild(t2);
	    		element1.appendChild(o2);
    	<%} %>
    td1.appendChild(element1);
    row.appendChild(td1);

		
    var td7 = document.createElement("TD");
    var element7 = document.createElement("input");
    element7.type = "text";
    element7.className="form-control";
    element7.name = "boPatientMedicine["+nRow1+"].medicine_Qty";
    element7.autocomplete = "off";
    element7.placeholder = "Quantity";
    element7.id="Quantity"+nRow1;
    element7.onclick=function(){hideError1(this);};
    element7.onfocus=function(){hideError1(this);};
    element7.onchange=function(){onlyNumber(this);};
    td7.appendChild(element7);
    row.appendChild(td7);
    
    
    var td2 = document.createElement("TD");
    var element2 = document.createElement("input");
    element2.type = "text";
    element2.className="form-control";
    element2.name = "boPatientMedicine["+nRow1+"].duration";
    element2.autocomplete = "off";
    element2.placeholder = "duration";
    element2.id="treatmentDuration"+nRow1;
    element2.onclick=function(){hideError1(this);};
    element2.onfocus=function(){hideError1(this);};
    td2.appendChild(element2);
    row.appendChild(td2);

	/*  var td3 = document.createElement("TD");
	    var element3 = document.createElement("label");
	    element3.className="icon-eye";
	    element3.id="left_treatment"+nRow1;
	    element3.onclick=function(){selectEye(this.id);};
	    td3.appendChild(element3);
	    
	    var element4 = document.createElement("label");
	    element4.className="icon-eye";
	    element4.id="right_treatment"+nRow1;
	    element4.onclick=function(){selectEye(this.id);};
	    td3.appendChild(element4);
	    row.appendChild(td3); */

	    var td3 = document.createElement("TD");
	    var element3 = document.createElement("SELECT");
	    element3.name="boPatientMedicine["+nRow1+"].eye"; 
	    element3.className="form-control";
	    element3.id="eyetreatment"+nRow1;
	    element3.style="height:50%";	

	    var o3 = document.createElement("OPTION");
	    	o3.value="0";
	    var t3 = document.createTextNode("Select Eye");
	    	o3.appendChild(t3);
	    element3.appendChild(o3);

	    var o4 = document.createElement("OPTION");
	    o4.value="Both";
	    var t4 = document.createTextNode("Both");
	    	o4.appendChild(t4);
	    	element3.appendChild(o4);

	    var o5 = document.createElement("OPTION");
	    o5.value="Left";
	    var t5 = document.createTextNode("Left");
	    	o5.appendChild(t5);
	    	element3.appendChild(o5);
	    	
	    		
	    var o6 = document.createElement("OPTION");
	    o6.value="Right";
	    var t6 = document.createTextNode("Right");
	    	o6.appendChild(t6);
	    	element3.appendChild(o6);

	    td3.appendChild(element3);
	    row.appendChild(td3);

	    
	    var td8 = document.createElement("TD");
	    var element8 = document.createElement("textarea");
	    element8.rows = "5";
	    element8.cols = "10";
	    element8.className="form-control";
	    element8.name = "boPatientMedicine["+nRow1+"].description";
	    element8.placeholder = "Description";
	    element8.id="description"+nRow1;
	    td8.appendChild(element8);
	    row.appendChild(td8);
			
    var td4 = document.createElement("TD");
	    td4.setAttribute("align","center");
	    var element6 = document.createElement("A");
	    td4.setAttribute("id","treat_med"+nRow1);
	    element6.className="fa fa-remove";
	    element6.title="Remove";
	    element6.style="font-size: 25px;color: #FF9797;";	
	    element6.setAttribute('href', 'javascript:deleteItem("treat_med"\'n'+nRow1+'\');');
	    td4.appendChild(element6);
	    row.appendChild(td4);
    table.appendChild(row);
  
    rowCount1++;
    nRow1++;
   }




function hideError1(elementId) {
	document.getElementById(elementId.id).style.border = "";
	document.getElementById(elementId.id).style.background = "";
}



function submitForm()
{
	document.sessionname.action="../health/saveComplain.htm";
	document.sessionname.submit();
}

function selectEye(inputId)
{
	
	if(document.getElementById(inputId).style.color == 'red')
	{
		$('#'+inputId).css("color", "black");
	}else
		{
		$('#'+inputId).css("color", "red");
		}
}
	



/* 	function addRow(id)
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
	} */

</script>
</html>