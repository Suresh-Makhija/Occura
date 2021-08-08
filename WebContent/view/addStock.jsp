<%@page import="com.occura.bean.StockEntry"%>
<%@page import="com.occura.bean.MasterMedicineBean"%>
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
List<StockEntry> stockEntries = allListDao.getEntries();
List<String> medType = new ArrayList<>();
medType.add("tab");
medType.add("individual");
%>


<form:form name="stockname" method="post" id="stockid"
		modelAttribute="GeneralDTO" enctype="multipart/form-data" autocomplete="off">
    <div id="main-content">
        <div class="container-fluid">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <h2><a href="javascript:void(0);" class="btn btn-xs btn-link btn-toggle-fullwidth"><i class="fa fa-arrow-left"></i></a> Add Stock</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a onclick="loadindex();" style="cursor: pointer;"><i class="icon-home"></i></a></li>     <!-- href="index.jsp"  -->                        
                            <li class="breadcrumb-item">Stock</li>
                            <li class="breadcrumb-item active">Add Stock</li>
                        </ul>
                    </div>   
                    
                               
               
                </div>
            </div>
           
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="card">
                        <div class="header">
                        </div>
                        <div class="body">
                           <button type="button" class="btn btn-primary" data-toggle="modal" style="float: right; margin-bottom: 2%;" data-target="#exampleModal">
 Add Stock
</button>
 </form:form> 
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
											<input type="text" id="stockEntries_medicine_name0" class="form-control" autocomplete="off" 
											name="stockEntries[0].medicine_name"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Name" >
											<select id="stockEntries_medicine_type0" class="form-control"   style="height:50%"  
											name="stockEntries[0].medicine_type"  data-show-subtext="true" data-live-search="true"
											onfocus="hideError1(this);" onclick="hideError1(this);">
												<option value="0">Select Type</option>
												<% for(String type :  medType){%>
												<option value="<%=type %>"><%=type%></option>
												<%} %>
											</select>
											<input type="text" id="stockEntries_medicine_count_per_tab0" class="form-control" autocomplete="off" 
											name="stockEntries[0].count_per_tab"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Count per tab" >
											<input type="text" id="stockEntries_medicine_qty0" class="form-control" autocomplete="off" 
											name="stockEntries[0].medicine_qty"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Qty">
											<input type="text" id="stockEntries_medicine_price0" class="form-control" autocomplete="off" 
											name="stockEntries[0].medicine_price"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Price">
											<input type="text" id="stockEntries_medicine_description0" class="form-control" autocomplete="off" 
											name="stockEntries[0].medicine_description"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Description">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="submitForm()">Save changes</button>
      </div>
    </div>
  </div>
</div>
                    </div>  
                    <form:form name="stocknameM" method="post" id="stockidM"
		modelAttribute="GeneralDTO" enctype="multipart/form-data" autocomplete="off">
                            					<div>
						<div >
								<table class="table table-bordered table-condensed" id="datatable1">
								
								<thead style="text-align: left;">
									<tr>
										<th width="30%" style="text-align: left;">Medicine</th>
										<th width="10%" style="text-align: left;">Type</th>
										<th width="10%" style="text-align: left;">tab Count</th>
										<th width="10%" style="text-align: left;">Qty</th>
										<th width="10%" style="text-align: left;">Price</th>
										<th width="30%" style="text-align: left;">Description</th>
										<th width="10%" style="text-align: left;">Action</th>
									</tr>
								</thead>
								<tbody id="tbodyID">
									<tr class="" id="">
										<td >
											<select id="stockEntries_medicine_name0" class="form-control"   style="height:50%"  
											name="stockEntries[0].medicine_name"  data-show-subtext="true" data-live-search="true"
											onfocus="hideError1(this);" onclick="hideError1(this);">
												<option value="0">Select Medicine</option>
												<% for(StockEntry stockEntry :  stockEntries){%>
												<option value="<%=stockEntry.getMedicine_name() %>"><%=stockEntry.getMedicine_name()%></option>
												<%} %>
											</select>
										</td>
										<td >
											<select id="stockEntries_medicine_type0" class="form-control"   style="height:50%"  
											name="stockEntries[0].medicine_type"  data-show-subtext="true" data-live-search="true"
											onfocus="hideError1(this);" onclick="hideError1(this);">
												<option value="0">Select Type</option>
												<% for(String type :  medType){%>
												<option value="<%=type %>"><%=type%></option>
												<%} %>
											</select>
										</td>
										
										<td>
											<input type="text" id="stockEntries_medicine_count_per_tab0" class="form-control" autocomplete="off" 
											name="stockEntries[0].count_per_tab"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Count per tab" >
										</td>
										<td>
											<input type="text" id="stockEntries_medicine_qty0" class="form-control" autocomplete="off" 
											name="stockEntries[0].medicine_qty"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Qty">
										</td>
										<td>
											<input type="text" id="stockEntries_medicine_price0" class="form-control" autocomplete="off" 
											name="stockEntries[0].medicine_price"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Price">
										</td>
										
										<td>
											<input type="text" id="stockEntries_medicine_description0" class="form-control" autocomplete="off" 
											name="stockEntries[0].medicine_description"
											onfocus="hideError1(this);" onclick="hideError1(this);" placeholder="Description">
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
								<tr style="border: none;" align="right">
								<td align="left" colspan="4">
										<a onclick="submitForm1();" title="Submit"
										class="btn btn-success">Save</a>
									</td>
								</tr>
							</table>
						</div>
						
							
					</div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
            </div>

        </div>
         </form:form> 
<script type="text/javascript">
function checkAddRowValidation(){
	var flg1=validateAddrowFields();
	if(flg1){
		addRow('tbodyID');
		}
}
var rowCount = 1;
var nRow =1;
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
function addRow(t_id){
	  var table = document.getElementById(t_id);
	  
  var row = document.createElement("TR");
  row.setAttribute('id', 'n' + nRow);
  var td1 = document.createElement("TD");
  var element1 = document.createElement("SELECT");
  element1.name="stockEntries["+nRow+"].medicine_name"; 
  element1.className="form-control";
  element1.id="stockEntries_medicine_name"+nRow;
  element1.style="height:50%";	
  
  
  var itemid = element1.id;
  element1.onclick=function(){hideError1(this);};
  element1.onfocus=function(){hideError1(this);};
  var o1 = document.createElement("OPTION");
  o1.value="0";
  var t1 = document.createTextNode("Select Medicine");
  
  o1.appendChild(document.createTextNode("Select Medicine"));
		 element1.appendChild(o1);
  <%
  	for(StockEntry stockEntry :  stockEntries){%>
	    	var o2 = document.createElement("OPTION");
	    		o2.value="<%=stockEntry.getMedicine_name()%>";
	    	var t2 = document.createTextNode("<%=stockEntry.getMedicine_name()%>");
	    		o2.appendChild(t2);
	    		element1.appendChild(o2);
  	<%} %>
  td1.appendChild(element1);
  row.appendChild(td1);

  
  
  
  var td2 = document.createElement("TD");
  var element2 = document.createElement("SELECT");
  element2.name="stockEntries["+nRow+"].medicine_type"; 
  element2.className="form-control";
  element2.id="stockEntries_medicine_type"+nRow;
  element2.style="height:50%";	
  
  
  var itemid = element2.id;
  element2.onclick=function(){hideError1(this);};
  element2.onfocus=function(){hideError1(this);};
  var o21 = document.createElement("OPTION");
  o2.value="0";
  var t21 = document.createTextNode("type");
  
  o21.appendChild(document.createTextNode("type"));
		 element2.appendChild(o21);
  <%
  	for(String  type :  medType){%>
	    	var o211 = document.createElement("OPTION");
	    		o211.value="<%=type%>";
	    	var t211 = document.createTextNode("<%=type%>");
	    		o211.appendChild(t211);
	    		element2.appendChild(o211);
  	<%} %>
  td2.appendChild(element2);
  row.appendChild(td2);
  
  
  
  
  
  var td3 = document.createElement("TD");
  var element3 = document.createElement("input");
  element3.type = "text";
  element3.className="form-control";
  element3.name = "stockEntries["+nRow+"].count_per_tab";
  element3.autocomplete = "off";
  element3.placeholder = "Count per tab";
  element3.id="stockEntries_medicine_count_per_tab"+nRow;
  element3.onclick=function(){hideError1(this);};
  element3.onfocus=function(){hideError1(this);};
  element3.onchange=function(){onlyNumber(this);};
  td3.appendChild(element3);
  row.appendChild(td3);

var td4 = document.createElement("TD");
var element4 =document.createElement("input");
element4.type = "text";
element4.className="form-control";
element4.name = "stockEntries["+nRow+"].medicine_qty";
element4.autocomplete = "off";
element4.placeholder = "Qty";
element4.id="stockEntries_medicine_qty"+nRow;
element4.onclick=function(){hideError1(this);};
element4.onfocus=function(){hideError1(this);};
element4.onchange=function(){onlyNumber(this);};
td4.appendChild(element4);
row.appendChild(td4);

var td5 = document.createElement("TD");
var element5 =document.createElement("input");
element5.type = "text";
element5.className="form-control";
element5.name = "stockEntries["+nRow+"].medicine_price";
element5.autocomplete = "off";
element5.placeholder = "Price";
element5.id="stockEntries_medicine_price"+nRow;
element5.onclick=function(){hideError1(this);};
element5.onfocus=function(){hideError1(this);};
element5.onchange=function(){onlyNumber(this);};
td5.appendChild(element5);
row.appendChild(td5);

var td6 = document.createElement("TD");
var element6 =document.createElement("input");
element6.type = "text";
element6.className="form-control";
element6.name = "stockEntries["+nRow+"].medicine_price";
element6.autocomplete = "off";
element6.placeholder = "Description";
element6.id="stockEntries_medicine_price"+nRow;
element6.onclick=function(){hideError1(this);};
element6.onfocus=function(){hideError1(this);};
element6.onchange=function(){onlyNumber(this);};
td6.appendChild(element6);
row.appendChild(td6);

  var td7 = document.createElement("TD");
	    td7.setAttribute("align","center");
	    var element7 = document.createElement("A");
	    td7.setAttribute("id",nRow);
	    element7.className="fa fa-remove";
	    element7.title="Remove";
	    element7.style="font-size: 25px;color: #FF9797;";	
	    element7.setAttribute('href', 'javascript:deleteItem(\'n' + nRow + '\');');
	    td7.appendChild(element7);
	    row.appendChild(td7);
  table.appendChild(row);

  rowCount++;
  nRow++;
 }
function hideError1(elementId) {
	document.getElementById(elementId.id).style.border = "";
	document.getElementById(elementId.id).style.background = "";
}
function deleteItem(id){
	 var table = document.getElementById("tbodyID");
		table.removeChild(document.getElementById(id));
		$("#"+id).closest("tr").find("input:text").val('');
	rowCount--;
 nRow--;
}
function submitForm()
{
	alert("a");
	document.stockname.action="../health/chiefComplain.htm";
	document.stockname.submit();
}
function submitForm1()
{
	alert("a1");
	document.stocknameM.action="../health/submitStockList.htm";
	document.stocknameM.submit();
}
</script>


</body>

</html>
