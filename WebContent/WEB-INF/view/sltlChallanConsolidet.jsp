<!doctype html>
<%@page import="org.apache.commons.lang.WordUtils"%>
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
<%
AllListDAO allListDAO = new AllListDAO();

String encodeCId = request.getParameter("cId");

String cId = new EncodeDecode().decodeString(String.valueOf(encodeCId));

ChallanBean challanBean = allListDAO.detailsOfChallan(cId);

int userCustId = challanBean.getCustomerBean().getParent_customer_id();

CustomerBean c = allListDAO.customerDetails(userCustId);
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat hhmm = new SimpleDateFormat("hh:MM");

List<ChallanLineBean> listOfChallanLine = allListDAO.listOfChallanLine(cId);

%>
<title><%=challanBean.getChallan_number()%></title>

<style>
 .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 0;
       /*  border: 1px solid #eee; */
        box-shadow: 0 0 0px rgba(0, 0, 0, .15);
        font-size: 15px;
        line-height: 24px;
        /* font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; */
       font-family: arial;
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
    
#footer {
	padding-top : 50px;
    bottom: 0px;
    left: 0px;
    right: 0px;
    margin-bottom: 0px;
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
	<div class="invoice-box">
	
	<table class="table">
		<tr>
		<td align="left" style="width: 10%"> 	
			<img alt="" src="img/sltllogoNEW.png" width="180px;" height="90px;">
		</td>
		<td align="center" style="width: 90%"> 	
			<font style="font-size: 28px;letter-spacing: 1px;font-weight: bold;"> Sahajanand Laser Technology Ltd. </font><br>
			<font style="font-size: 13px;"> Phone : +91 (079) 23287461 - 67, Fax : +91 (079) 23287470 </font><br>
			<font style="font-size: 13px;"> GSTIN : 24AAGCS1983B1ZK, CIN No. : U30007GJ2002PLC040659 </font>
		</td>
		</tr>
	</table>	
	<hr>
	<table class="table">	
	<tr>
		<td colspan="2" align="center"><font style="font-size: 25px;font-weight: bold;">Delivery Challan</font></td>
	</tr>
		<tr>
			<td style="width: 50%"> 
				<b>To,</b>	<br>
				<b><%=challanBean.getCustomerBean().getCompany()%></b><br>
				<font style="white-space:pre-wrap;"><%=WordUtils.capitalizeFully(challanBean.getCustomerBean().getAddress())%><br><%=WordUtils.capitalizeFully(challanBean.getCustomerBean().getCity())%>,<%=WordUtils.capitalizeFully(challanBean.getCustomerBean().getState())%>, <%=WordUtils.capitalizeFully(challanBean.getCustomerBean().getCountry())%></font><br>
				<b>GSTIN : <%=challanBean.getCustomerBean().getGst_number()%></b><br>
				<!-- <label class="border">PROFORMA INVOICE</label> -->
			</td>
			<td align="left" style="width: 40%">
				<b>Challan Number : </b> <%=challanBean.getChallan_number()%><br> 
				<b>Challan Date : </b> <%=simpleDateFormat.format(challanBean.getInsert_date())%><br> 
			 </td>
		</tr>
		
		
		</table>

		<table class="listTable">
			<tr align="center">
				<th>No.</th>
				<th>Kapan Name</th>
				<th>Lot Name</th>
				<th>Qty</td>
				<th>Carats</th>
			</tr>
			
			<%
			int count = 0;
			double totalCarat = 0;
			double totalRate = 0;
			String kapan = "";
			String lot = "";
			int countStone = 0;
			for(ChallanLineBean clb : listOfChallanLine) {
				
				List<WorkHistoryBean> listOfChildWork =  allListDAO.listOfWorkHistoryByParentWorkId(clb.getWorkHistoryBean().getWork_history_id());
				
				if(listOfChildWork.size() == 0){
				
				totalCarat = totalCarat + Double.parseDouble(clb.getWorkHistoryBean().getActual_weight());
				totalRate = totalRate + clb.getFinal_rate();
				
				kapan = clb.getWorkHistoryBean().getKapan_name();
				lot = clb.getWorkHistoryBean().getLot_name();
				countStone++;
				}else{
					for(WorkHistoryBean w : listOfChildWork){ 
						kapan = w.getKapan_name();
						lot = w.getLot_name();
						countStone++;		
						totalCarat = totalCarat + Double.parseDouble(w.getActual_weight());
					}	
				}
			%>
				<%-- <tr bgcolor="" align="center">
					<td><%=++count%></td>
					<td><%=clb.getWorkHistoryBean().getKapan_name()%></td>
					<td><%=clb.getWorkHistoryBean().getLot_name()%></td>
					<td><%=clb.getWorkHistoryBean().getStone_name()%></td>
					<td>1</td>
					<td><%=clb.getWorkHistoryBean().getActual_weight()%></td>
				</tr> --%>
			<%} %>
		
			<tr>
				<td align="center"><%=++count%></td>
				<td align="center"><%=kapan%></td>
				<td align="center"><%=lot%></td>
				<th align="center"><%=countStone%></th>
				<th align="center"><%=String.format("%.2f", totalCarat)%></th>
			</tr>
		

		</table>
		<table style="padding-top: 15px;">
			<tr>
				<td align="right">
					For, <font style="font-weight: bold;font-size: 15px;">Sahajanand Laser Technology Ltd.</font>
					<br><br>
					Authorised Signatory
				</td>
			</tr>


		</table>
	</div>
	<div id="footer">
			<table>
			<tr>
				<td colspan="7" align="left" style="font-family: calibri;">
					<font style="font-weight: bold;font-size: 15px;">Sahajanand Laser Technology Ltd.</font>
				</td>			
			</tr>
				<tr>
					<td style="white-space: nowrap;" valign="top">
						<font style="font-size: 25px;">ISO</font><br>
						<font style="font-size: 10px;">9001-2015</font>
					</td>
					<td style="white-space: nowrap;" valign="top">
						<font style="font-size: 8px;"><b>Regd. Office & Works - 1</b><br>
						E-30, G.I.D.C Electronics Estate,<br>Sector-26, Gandhinagar - 382 028,<br> Gujarat, India<br>
						Tel : +91-79-2328-7461 to 68<br>
						Fax : +91-79-2328-7470</font>
					</td>
					<td style="white-space: nowrap;" valign="top">
						<font style="font-size: 8px;"><b>Works - 2</b><br>
						E-30, G.I.D.C Electronics Estate,<br>Sector-26, Gandhinagar - 382 028,<br> Gujarat, India<br>
						Tel : +91-79-2328-7461 to 68<br>
						Fax : +91-79-2328-7470</font>
					</td>
					<td style="white-space: nowrap;" valign="top">
						<font style="font-size: 8px;"><b>Works - 3</b><br>
						E-30, G.I.D.C Electronics Estate,<br>Sector-26, Gandhinagar - 382 028,<br>Gujarat, India<br>
						Tel : +91-79-2328-7461 to</font>
					</td>
					<td style="white-space: nowrap;" valign="top">
						<font style="font-size: 8px;"><b>Ahmedabad Office</b><br>
						41, New York Tower-1, Nr. Thaltej <br> Cross Road S.G Highway,<br>Ahmedabad - 382 054, Gujarat, India<br>
						Tel : +91-79-2685-4537-38<br>
						Fax : +91-79-2685-4539</font>
					</td>
					<td style="white-space: nowrap;" valign="top">
						<font style="font-size: 8px;"><b>Mumbai Office</b><br>
						C/303 Diamond Wing -A,<br>Tanvi Complex, S.V. Road,<br> Dahisar-E, Mumbai - 400 068,<br> Maharastra, India<br>
						Tel : +91-88-7933-6213 / 14</font>
					</td>
					<td style="white-space: nowrap;" valign="top">
						<font style="font-size: 8px;"><b>Surat Works</b><br>
						Plot No. 233, Venus Building,<br>Beside J.B. Diamond,<br> L.H. Road, Varachha,<br>Surat - 395 006, Gujarat, India<br>
						Tel : +91-261-2543440 / 2548440</font>
					</td>
					
				</tr>
			</table>
		</div>

	<script type="text/javascript">
	window.print();
	setTimeout(function(){ window.close(); }, 2000);
   </script>

</body>
</html>
