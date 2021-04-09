<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.di.bean.WorkHistoryBean"%>
<%@page import="com.di.controller.EncodeDecode"%>
<%@page import="com.di.dao.AllListDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Print Label</title>
<%
AllListDAO allListDAO = new AllListDAO();

String encodeWId = request.getParameter("wId");

String wId = new EncodeDecode().decodeString(String.valueOf(encodeWId));

WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId);
SimpleDateFormat ddmmyyyyhhmmss = new SimpleDateFormat("dd/MM/yyyy hh:MM:ss aa");

%>
<style type="text/css">
@media print {
	@page {
		size: 297mm 210mm; /* landscape */
		/* you can also specify margins here: */
		 margin-left: 50mm;
	}
	
	body {
 	 zoom:100%; /*or whatever percentage you need, play around with this number*/
	}
}
</style>
<style>
/* Create two equal columns that floats next to each other */
.column {
  float: left;
  padding: 0;
  margin: 0;
}

.column1 {
  float: right;
  padding: 0;
  margin: 0;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
<script type="text/javascript">
	var clientName = '<%=workHistoryBean.getCustomerBean().getCompany()%>';
    var kapanName = '<%=workHistoryBean.getKapan_name()%>';
    var lotName = '<%=workHistoryBean.getLot_name()%>';
    var stoneName = '<%=workHistoryBean.getStone_name()%>';
    var weight = '<%=workHistoryBean.getActual_weight()%>';
    var date = '<%=ddmmyyyyhhmmss.format(workHistoryBean.getInsert_date())%>';
</script>
<script type="text/javascript" src="customJs/qrcode.js"></script>
</head>
<body style="padding-left: 10px;" onload="setupqr();doqr();">


<div class="row">
  <div class="column" align="left">
  <br><br>
    <font style="font-size: 15px;padding: 0;"><b>Id :</b> <%=workHistoryBean.getWork_history_id()%></font><br>
    <font style="font-size: 15px;padding: 0;"><b>Client Name :</b> <%=workHistoryBean.getCustomerBean().getCompany()%></font><br>
	<font style="font-size: 15px;padding: 0;"><b>Kapan Name :</b> <%=workHistoryBean.getKapan_name()%></font><br>
	<font style="font-size: 15px;padding: 0;"><b>Lot Name :</b> <%=workHistoryBean.getLot_name()%></font><br>
	<font style="font-size: 15px;padding: 0;"><b>Stone Name :</b> <%=workHistoryBean.getStone_name()%></font><br>
	<font style="font-size: 15px;padding: 0;"><b>Weight :</b> <%=workHistoryBean.getActual_weight()%></font><br>
	<font style="font-size: 15px;padding: 0;"><b>Date :</b> <%=ddmmyyyyhhmmss.format(workHistoryBean.getInsert_date())%></font>
  </div>
  <div class="column1" align="right" style="padding-top: 50px;">
     <canvas id="qrcanv"></canvas>
  </div>
</div>
<script type="text/javascript">

	
	 setTimeout(function(){ 
		
		window.print();
		location.href = "redirect?p=Y2hhbGxhbk1hc3Rlcg==&action=a";
		
	}, 500);
	
</script>

</body>
</html>