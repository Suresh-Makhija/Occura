<!doctype html>
<%@page import="com.di.bean.ChallanOutLineBean"%>
<%@page import="com.di.bean.ChallanOutBean"%>
<%@page import="java.util.List"%>
<%@page import="com.di.bean.ChallanLineBean"%>
<%@page import="com.di.bean.ChallanBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="com.di.bean.WorkHistoryBean"%>
<%@page import="com.di.controller.EncodeDecode"%>
<%@page import="com.di.dao.AllListDAO"%>
<html>
<head>
<meta charset="utf-8">
<title>Challan Print</title>

<style>
 .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 0;
       /*  border: 1px solid #eee; */
        box-shadow: 0 0 0px rgba(0, 0, 0, .15);
        font-size: 15px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
       /*  font-family: callibri; */
        color: #555;
    }
    
    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }
    
    .invoice-box table td {
        padding: 3px;
        vertical-align: top;
    }
    
   /*  .invoice-box table tr td:nth-child(2) {
        text-align: right;
    } */
    
    .invoice-box table tr.top table td {
        padding-bottom: 5px;
    }
    
    .invoice-box table tr.top table td.title {
        font-size: 35px;
        line-height: 45px;
        color: #333;
    }
    
    .invoice-box table tr.information table td {
        padding-bottom: 4px;
    }
    
    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
    }
    
    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
    }
    
    .invoice-box table tr.item.last td {
        border-bottom: none;
    }
    
    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
    
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }
        
        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }
    
    /** RTL **/
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        /* font-family: callibri; */
    }
    
    .rtl table {
        text-align: right;
    }
    
    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
    
    .listTable td, th {
	  border: 1px solid #dddddd;
	  padding: 2px;
	}
</style>
</head>

<body>
	<%
AllListDAO allListDAO = new AllListDAO();

String encodeCId = request.getParameter("coId");

String coId = new EncodeDecode().decodeString(String.valueOf(encodeCId));

ChallanOutBean challanOutBean = allListDAO.detailsOfOutChallan(coId);

int userCustId = challanOutBean.getChallanBean().getCustomerBean().getParent_customer_id();

CustomerBean c = allListDAO.customerDetails(userCustId);
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat hhmm = new SimpleDateFormat("hh:MM");

List<ChallanOutLineBean> listOfChallanOutLine = allListDAO.listOfOutChallanLine(coId);

%>
	<div class="invoice-box">
		<table>
			<tr>

				<td rowspan="2" style="width: 35%; padding-top: 25px;"><b><%=c.getCompany()%></b>
					<div style="border-bottom: solid 2px;"></div> <font
					style="white-space:pre-wrap;"><%=c.getAddress()%><br><%=c.getCity()%>,<%=c.getState()%> <%=c.getCountry()%></font></td>
				<td rowspan="2"><img src="img/starGems.png"
					style="width: 100%;"></td>
				<td rowspan="2" style="width: 35%; padding-top: 25px;">
					<br>
					<div style="border-bottom: solid 2px;"></div> <font>Tel : <%=c.getContact_one()%></font><br>
					<font>Email : <%=c.getEmail_one()%></font></td>
			</tr>
			<tr>

			</tr>

			<!-- <tr>
				<td rowspan="2" style="width: 35%;">Address</td>
				<td rowspan="2"></td>
				<td rowspan="2" style="width: 35%;" align="right">Address</td>
			</tr>
 -->

		</table>

		<br>
		<table cellpadding="0" cellspacing="0">
			<tr class="">
				<td colspan="2" align="right"><b>VAT : <%=c.getVat_number()%></b>
					<br> Date: <%=simpleDateFormat.format(challanOutBean.getInsert_date())%></td>
			</tr>


			<tr class="information">
				<td colspan="2" align="center">Work Order No. <font color="red" style="font-weight: bold;"><%=challanOutBean.getChallanBean().getChallan_number()%>_<%=challanOutBean.getChallan_out_number()%> (Out)</font>
				</td>
			</tr>

			<tr class="">
				<td colspan="2" align="left"><b>To:</b> <br>
				<font style="font-weight: bold;"><%=challanOutBean.getChallanBean().getCustomerBean().getCompany()%></font>&nbsp;&nbsp;&nbsp;<font
					style="font-weight: bold;">VAT NO: <%=challanOutBean.getChallanBean().getCustomerBean().getVat_number()%></font>
				</td>
			</tr>
			<tr class="">
				<td colspan="2" align="left" style="white-space: pre-wrap;"><%=challanOutBean.getChallanBean().getCustomerBean().getAddress()%><br><%=challanOutBean.getChallanBean().getCustomerBean().getCity()%>,<%=challanOutBean.getChallanBean().getCustomerBean().getState()%> <%=challanOutBean.getChallanBean().getCustomerBean().getCountry()%></td>
			</tr>


		</table>

		<table class="listTable">
			<tr bgcolor="lightgray" align="center">
				<th>No.</th>
				<th>Stone Name</th>
				<th>Customer K. Name</th>
				<th>St.</td>
				<th>Carats</th>
				<!-- <th>Price Per Crt.</th>
				<th>Amount US $</th> -->
			</tr>
			
			<%
			int count = 0;
			double totalCarat = 0;
			double totalRate = 0;
			for(ChallanOutLineBean clo : listOfChallanOutLine) {
				totalCarat = totalCarat + Double.parseDouble(clo.getWorkHistoryBean().getActual_weight());
			%>
				<tr bgcolor="" align="center">
					<td><%=++count%></td>
					<td><%=clo.getWorkHistoryBean().getStone_name()%></td>
					<td><%=clo.getWorkHistoryBean().getLot_name()%></td>
					<td>1</td>
					<td><%=clo.getWorkHistoryBean().getActual_weight()%></td>
				</tr>
			<%} %>
		
			<tr>
				<th colspan="3" align="right">Total</th>
				<th align="center"><%=listOfChallanOutLine.size()%></th>
				<th align="center"><%=String.format("%.2f", totalCarat)%></th>
				<%-- <th align="center"></th>
				<th align="center"><%=String.format("%.2f", totalRate)%> $</th> --%>
			</tr>
		

		</table>
		<table cellpadding="0" cellspacing="0">
			<tr class="">
				<td colspan="2" align="left"><b>BOOKED IN BY : <%-- <%=c.getFullname()%> --%></b><br>
					@ <%=hhmm.format(challanOutBean.getInsert_date())%></td>
			</tr>


		</table>
		<br>
		<table cellpadding="0" cellspacing="0">
			<tr class="">
				<td colspan="2" align="left">Name Receiver<b>_________________</b><br>
					Signature Receiver<b>_________________</b><br> Name Sender<b>_________________</b><br> Signature Sender<b>_________________</b></td>
			</tr>


		</table>
	</div>

	<script type="text/javascript">
   	 	//window.print();
   		//window.close();
   </script>

</body>
</html>
