<%@page import="com.di.controller.CashWordConverter"%>
<%@page import="org.apache.commons.lang.WordUtils"%>
<%@page import="com.di.bean.CustomerProductRateBean"%>
<%@page import="com.di.controller.EncodeDecode"%>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="com.di.bean.InvoiceLineBean"%>
<%@page import="com.di.bean.InvoiceBean"%>
<%@page import="com.di.dao.AllListDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	AllListDAO allListDAO = new AllListDAO();

	String iId = request.getParameter("iId");
	
	String decodeIid = new EncodeDecode().decodeString(iId);
	
	InvoiceBean invoiceBean = allListDAO.detailsOfInvoice(decodeIid);
	
	//List<InvoiceLineBean> listOfInvoiceLine = allListDAO.listOfInvoiceLine(decodeIid);
	
	List<String> listOfKapan = allListDAO.listOfInvoiceLineGroupByKapan(decodeIid);
	
	//List<Double> listOfrate = allListDAO.listOfInvoiceLineGroupByRate(decodeIid);
	
	SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");
	int custId = invoiceBean.getCustomerBean().getCustomer_id();
	
	int userCustId = invoiceBean.getCustomerBean().getParent_customer_id();

	CustomerBean c = allListDAO.customerDetails(userCustId);
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat hhmm = new SimpleDateFormat("hh:MM");
	System.out.println(custId+"-----"+userCustId);
	double vatrate = c.getVat_rate();
%>
<title><%=invoiceBean.getInvoice_num()%>_SHREEJI</title>
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
	
	#footer {
	padding-top : 50px;
    bottom: 0px;
    left: 0px;
    right: 0px;
    margin-bottom: 0px;
}
</style>
<body>
	
	
	
	
	<div class="invoice-box">
	
	
	
	<table class="table">
		<tr>
		<td align="left" style="width: 10%"> 	
			<img alt="" src="img/ShreejiServices.png" width="160px;" height="90px;">
		</td>
		<td align="center" style="width: 90%"> 	
			<font style="font-size: 28px;letter-spacing: 1px;font-weight: bold;"> Shreeji Services </font><br>
			<font style="font-size: 13px;"> Phone : +91 (079) 23287461 - 67, Fax : +91 (079) 23287470 </font><br>
			<font style="font-size: 13px;"> GSTIN : 24AAGCS1983B1ZF</font>
		</td>
		</tr>
	</table>	
	<hr>
	<table class="table">	
	<tr>
		<td colspan="2" align="center"><font style="font-size: 25px;font-weight: bold;">Proforma Invoice</font></td>
	</tr>
		<tr>
			<td style="width: 50%"> 
				<b>To,</b>	<br>
				<b><%=invoiceBean.getCustomerBean().getCompany()%></b><br>
				<font style="white-space:pre-wrap;"><%=WordUtils.capitalizeFully(invoiceBean.getCustomerBean().getAddress())%><br><%=WordUtils.capitalizeFully(invoiceBean.getCustomerBean().getCity())%>,<%=WordUtils.capitalizeFully(invoiceBean.getCustomerBean().getState())%>, <%=WordUtils.capitalizeFully(invoiceBean.getCustomerBean().getCountry())%></font><br>
				<b>GSTIN : <%=invoiceBean.getCustomerBean().getGst_number()%></b><br>
				<!-- <label class="border">PROFORMA INVOICE</label> -->
			</td>
			<td align="left" style="width: 40%">
				<b>From,</b>	<br>
				<b> Shreeji Services </b><br>
				<font style="white-space:pre-wrap;">E-02, Electorincs Estate, G.I.D.C, Sector - 26 Gandhinagar</font><br>
				<b>Invoice Number : </b> <%=invoiceBean.getInvoice_num()%><br> 
				<b>Invoice Date : </b> <%=simpleDateFormat.format(invoiceBean.getInvoice_date())%><br> 
			 </td>
		</tr>
		
		
		</table>
		<br>
		<table class="listTable">
			<tr align="center">
				<td style="padding: 3px;font-weight: bold;" align="center">No</td>
                <td style="padding: 3px;font-weight: bold;" align="center">Description Of Goods</td>
				<td style="padding: 3px;font-weight: bold;" align="center">HSN/SAC</td>
				<td style="padding: 3px;font-weight: bold;" align="center">Qty</td>
				<td style="padding: 3px;font-weight: bold;" align="center">Rate</td>
				<td style="padding: 3px;font-weight: bold;" align="center">Amount</td>
			</tr>
			
			 <%
             	int count = 0;
             	double totalQty = 0;
             	double totalAmount = 0;
				for(String kapan : listOfKapan){ 
					
					List<String> listOfKapanLot = allListDAO.listOfInvoiceLineGroupByLot(decodeIid,kapan);
					
					for(String lot : listOfKapanLot){ 
						
						List<Double> listOfrateBYkapanLot = allListDAO.listOfInvoiceLineKapanLotGroupByRate(decodeIid,kapan,lot);
						
							
						for(Double prate : listOfrateBYkapanLot){
							
							//List<InvoiceLineBean> listOfInvoiceLine = allListDAO.listOfInvoiceLineKapanLot(decodeIid, kapan, lot,rate);
							
							List<Object[]> listOfInvoiceLine = allListDAO.listOfInvoiceLineByRateKapnaLot(decodeIid, prate,kapan,lot);
							
							totalQty = totalQty + listOfInvoiceLine.size();
							double amount = prate * listOfInvoiceLine.size();
				%>
			<tr align="center">
				<td style="padding: 3px;"><%=++count%></td>
				<td style="padding: 3px;" align="left">Job Work of Diamond (<%=kapan%>/<%=lot%>)</td>
				<td style="padding: 3px;">998898</td>
				<td style="padding: 3px;"><%=listOfInvoiceLine.size()%></td>
				<td style="padding: 3px;"><%=String.format("%.2f", prate)%></td>
				<td style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", amount)%> <%=invoiceBean.getCurrency_type()%></td>
			</tr>
			<%} %>
			<%} %>
                 <%} %>
		
			<tr>
				<td align="right" style="padding: 3px;font-weight: bold;" colspan="3">Total</td>
				<td align="right" style="padding: 3px;font-weight: bold;"><%=totalQty%></td>
				<td align="right" style="padding: 3px;font-weight: bold;"></td>
				<td align="center" style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", invoiceBean.getFinal_outstanding())%> <%=invoiceBean.getCurrency_type()%></td>
			</tr>
			
			<%
			double finalOustanding = invoiceBean.getFinal_outstanding();
			if(invoiceBean.getCgst_per() != 0){ 
												double cgst = (invoiceBean.getFinal_outstanding() * invoiceBean.getCgst_per()) / 100;
												finalOustanding = finalOustanding + cgst;
												%>
			<tr>
				<td align="right" style="padding: 3px;font-weight: bold;" colspan="5">CGST (<%=invoiceBean.getCgst_per()%> %)</td>
				<td align="center" style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", cgst)%> <%=invoiceBean.getCurrency_type()%></td>
			</tr>
			<%} %>
			
			<%
			if(invoiceBean.getSgst_per() != 0){ 
												double sgst = (invoiceBean.getFinal_outstanding() * invoiceBean.getSgst_per()) / 100;
												finalOustanding = finalOustanding + sgst;
												%>
			<tr>
				<td align="right" style="padding: 3px;font-weight: bold;" align="right" colspan="5">SGST (<%=invoiceBean.getSgst_per()%> %)</td>
				<td align="center" style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", sgst)%> <%=invoiceBean.getCurrency_type()%></td>
			</tr>
			<%} %>
			
			<%
			if(invoiceBean.getIgst_per() != 0){ 
												double igst = (invoiceBean.getFinal_outstanding() * invoiceBean.getIgst_per()) / 100;
												finalOustanding = finalOustanding + igst;
												%>
			<tr>
				<td align="right" style="padding: 3px;font-weight: bold;" align="right" colspan="5">IGST (<%=invoiceBean.getIgst_per()%> %)</td>
				<td align="center" style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", igst)%> <%=invoiceBean.getCurrency_type()%></td>
			</tr>
			<%} %>
			
			<%
				double roundValue = Math.round(finalOustanding);
			   int roundValueInt =  (int) roundValue;
			%>
			<tr>
				<td align="right" style="padding: 3px;font-weight: bold;" colspan="5">Final Outstanding</td>
				<td align="center" style="padding: 3px;font-weight: bold;"><%=String.format("%.2f", roundValue)%> <%=invoiceBean.getCurrency_type()%></td>
			</tr>
			
			<tr>
				<td align="right" style="padding: 3px;" colspan="6"><%=WordUtils.capitalizeFully(new CashWordConverter().doubleConvert(roundValueInt))%> Only</td>
			</tr>
		

		</table>
		<table style="padding-top: 15px;">
			<tr>
				<td align="right">
					For, Shreeji Services
					<br><br>
					Authorised Signatory
				</td>
			</tr>


		</table>
	</div>
	
<!-- 	<div id="footer">
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
 -->
	<script type="text/javascript">
	window.print();
	setTimeout(function(){ window.close(); }, 2000);
   </script>

</body>


</html>