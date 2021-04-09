<!doctype html>
<%@page import="com.di.bean.CustomerProductRateBean"%>
<%@page import="com.di.bean.InvoiceLineBean"%>
<%@page import="com.di.bean.InvoiceBean"%>
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
<title>Invoice Print</title>

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

	String iId = request.getParameter("iId");
	
	int decodeIid = Integer.parseInt(new EncodeDecode().decodeString(iId));
	
	InvoiceBean invoiceBean = allListDAO.detailsOfInvoice(decodeIid);
	
	List<InvoiceLineBean> listOfInvoiceLine = allListDAO.listOfInvoiceLine(decodeIid);
	SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");
	int custId = invoiceBean.getCustomerBean().getCustomer_id();
	
	int userCustId = invoiceBean.getCustomerBean().getParent_customer_id();

	CustomerBean c = allListDAO.customerDetails(userCustId);
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat hhmm = new SimpleDateFormat("hh:MM");
	
	double vatrate = c.getVat_rate();
	
	CustomerBean cb = allListDAO.customerDetails(invoiceBean.getCustomerBean().getParent_customer_id());
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
					<br> Date: <%=simpleDateFormat.format(invoiceBean.getInsert_date())%></td>
			</tr>


			<tr class="information">
				<td colspan="2" align="center">TAX Invoice No. <font color="red" style="font-weight: bold;"><%=cb.getInvoice_seq()%><%=invoiceBean.getInvoice_num()%></font>
				</td>
			</tr>

			<tr class="">
				<td colspan="2" align="left"><b>To:</b> <br>
				<font style="font-weight: bold;"><%=invoiceBean.getCustomerBean().getCompany()%></font>&nbsp;&nbsp;&nbsp;<font
					style="font-weight: bold;">VAT NO: <%=invoiceBean.getCustomerBean().getVat_number()%></font>
				</td>
			</tr>
			<tr class="">
				<td colspan="2" align="left" style="white-space: pre-wrap;"><%=invoiceBean.getCustomerBean().getAddress()%><br><%=invoiceBean.getCustomerBean().getCity()%>,<%=invoiceBean.getCustomerBean().getState()%> <%=invoiceBean.getCustomerBean().getCountry()%></td>
			</tr>


		</table>

		<table class="listTable">
			<tr bgcolor="lightgray" align="center">
			 	<th style="padding: 3px;">No</th>
                <th style="padding: 3px;">Stone Name</th>
				<th style="padding: 3px;">Customer K. name</th>
				<th style="padding: 3px;">Process</th>
				<th style="padding: 3px;">St.</th>
				<th style="padding: 3px;">Carats</th>
				<th style="padding: 3px;">Price Per Crt.</th>
				<th style="padding: 3px;" align="right">Rate</th>
            </tr>
             <%
             	int count = 0;
             	double totalCarat = 0;
             	double totalAmount = 0;
				for(InvoiceLineBean il : listOfInvoiceLine){ 
					if(il.getRate() != 0){
					int prod_id = il.getProductMasterBean().getProduct_master_id();
					CustomerProductRateBean customerProductRateBean = allListDAO.detailsOfCustomerProductRateByCustId(custId, prod_id);
					String encodeWork_id = new EncodeDecode().encodeString(il.getWorkHistoryBean().getWork_history_id());
					totalCarat = totalCarat + Double.parseDouble(il.getWorkHistoryBean().getActual_weight());
					double priceDollar = il.getRate() / invoiceBean.getConversion();
					totalAmount = totalAmount + priceDollar;
				%>
			<tr align="center">
				<td style="padding: 3px;"><%=++count%></td>
				<td style="padding: 3px;"><%=il.getWorkHistoryBean().getStone_name()%></td>
				<td style="padding: 3px;"><%=il.getWorkHistoryBean().getKapan_name()%></td>
				<td style="padding: 3px;"><%=il.getProductMasterBean().getProduct_name()%></td>
				<td style="padding: 3px;">1</td>
				<td style="padding: 3px;"><%=il.getWorkHistoryBean().getActual_weight()%></td>
				<%
					double pricePerCarat = il.getRate()/Double.parseDouble(il.getWorkHistoryBean().getActual_weight());
					double pricePerCaratDollar = pricePerCarat / invoiceBean.getConversion();
				%>
				<td style="padding: 3px;"><%=String.format("%.2f", pricePerCaratDollar)%> $</td>
				<td style="padding: 3px;font-weight: bold;" align="right"><%=String.format("%.2f", priceDollar)%> $</td>
			</tr>
                 <%} }%>
		
			<tr>
				<th colspan="4" align="right">Total</th>
				<th align="center"><%=listOfInvoiceLine.size()%></th>
				<th align="center"><%=String.format("%.2f", totalCarat)%></th>
				<th align="center"></th>
				<th align="right"><%=String.format("%.2f", totalAmount)%> $</th>
			</tr>
		

		</table>
		<%-- <table cellpadding="0" cellspacing="0">
			<tr class="">
				<td colspan="2" align="left"><b>BOOKED IN BY : <%=c.getFullname()%></b><br>
					@ <%=hhmm.format(challanBean.getInsert_date())%></td>
			</tr>


		</table> --%>
		<br> 
       <table frame="box">
      		 <tr>
				<td>Acc Name:</td>
				<td>:</td>
				<td colspan="2" align="left">Star Gems (Pty) Ltd</td>

				<td colspan="3"></td>

			</tr>
			<tr bgcolor="">
				<td>Bank</td>
				<td>:</td>

				<td colspan="2" align="left">Nedbank</td>

				<td colspan="3">1 US$ =  <%=invoiceBean.getConversion()%> <%=invoiceBean.getCurrency_type()%></td>
			</tr>
			<tr>
				<td>Account Number (ZAR):</td>
				<td>:</td>
				<td colspan="2" align="left">1051564131</td>

				<td colspan="3">Sub Total Amount In <%=invoiceBean.getCurrency_type()%> =  <%=String.format("%.2f", invoiceBean.getFinal_outstanding())%></td>

			</tr>
			<!-- <tr>
				<td>Branch Code:</td>
				<td>:</td>
				<td colspan="2" align="left">198765</td>

				<td colspan="3"></td>

			</tr> -->
			
			<%
				double vatamount = invoiceBean.getFinal_outstanding() * vatrate /100;
			%>
			<tr>
				<td>Branch Name:</td>
				<td>:</td>	
				<td colspan="2" align="left">Diamond Exchange</td>

				<td colspan="3">VAT =   <%=String.format("%.2f", vatamount)%> <%=invoiceBean.getCurrency_type()%></td>

			</tr>
			<tr>
				<td colspan="2"></td>

				<td colspan="2"></td>

				<td colspan="3">Total Amount In <%=invoiceBean.getCurrency_type()%> =  <%=String.format("%.2f", invoiceBean.getFinal_outstanding()+vatamount)%></td>

			</tr>
			<tr>
				<td colspan="2"></td>

				<td colspan="2"></td>

				<td colspan="3"><font color="red"> <b>Invoice To be
							paid in <%=invoiceBean.getCurrency_type()%></b>
				</font></td>

			</tr>


		</table>
       
	</div>

	<script type="text/javascript">
   	 	//window.print();
   		//window.close();
   </script>

</body>
</html>
