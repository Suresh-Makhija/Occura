<!doctype html>
<%@page import="com.di.bean.CustomerBean"%>
<%@page import="com.di.bean.CustomerProductRateBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.di.bean.InvoiceLineBean"%>
<%@page import="java.util.List"%>
<%@page import="com.di.controller.EncodeDecode"%>
<%@page import="com.di.bean.InvoiceBean"%>
<%@page import="com.di.dao.AllListDAO"%>
<html>
<head>
    <meta charset="utf-8">
    <title>Invoice Print</title>
    
    <style>
    
    @page  
	{ 
	    size: auto;   /* auto is the initial value */ 
	
	    /* this affects the margin in the printer settings */ 
	    margin: 8mm;  
	} 
	
	body  
	{ 
	    /* this affects the margin on the content before sending to printer */ 
	    margin: 0px;  
	} 
    
    .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 0;
       /*  border: 1px solid #eee; */
        box-shadow: 0 0 0px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
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
    
    .invoice-box table tr td:nth-child(2) {
        text-align: right;
    }
    
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
    }
    
    .rtl table {
        text-align: right;
    }
    
    .rtl table tr td:nth-child(2) {
        text-align: left;
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
	
	CustomerBean cb = allListDAO.customerDetails(invoiceBean.getCustomerBean().getParent_customer_id());
%>
    <div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                         <td class="title" colspan="2" align="center" style="padding-left: 8%;">A M R U T &nbsp;&nbsp;&nbsp; D I A M O N D S<br> <font style="font-size: small;">Embrace Eternity</font>
                          </td>
                       
                            <td class="title" align="right">
                                <img src="img/amrutDiamond.png" style="width:50%; max-width:150px;">
                            </td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
             <tr class="information">
                <td colspan="2" align="center">
                 	<font style="font-weight: bold;font-size: 25px;">TAX Invoice</font>
                </td>
            </tr>
            
             <tr class="information">
                <td>
                    <table style="width: 30%">
                        <tr>
                            <td><font style="font-weight: bold;">INVOICE TO</font></td>
                        </tr>
                        <tr>
                        	<td style="white-space: pre-wrap;"><%=invoiceBean.getCustomerBean().getCompany()%><br><%=invoiceBean.getCustomerBean().getAddress()%></td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
            <table style="font-size: 14px;" border="1">
             <tr bgcolor="lightgray" align="center">
                <th>Payment Terms</th>
                <th colspan="2">Client Number</th>
                <th>Invoice Number</th>
                <th colspan="2">Date</th>
           	 </tr>
            <tr bgcolor="" align="center">
                <td></td>
                <td colspan="2"></td>
                <td><%=invoiceBean.getInvoice_num()%></td>
                <td colspan="2"><%=ddmmyyyy.format(invoiceBean.getInvoice_date())%></td>
            </tr>
             <tr bgcolor="" align="center">
                <td colspan="6"></td>
            </tr>
             <tr bgcolor="lightgray" align="center">
                <th style="padding: 3px;">Kapan Name</th>
				<th style="padding: 3px;">Stone Name</th>
				<th style="padding: 3px;">Product</th>
				<th style="padding: 3px;">Weight</th>
				<th style="padding: 3px;">Discount</th>
				<th style="padding: 3px;" align="right">Rate</th>
            </tr>
             <%
				for(InvoiceLineBean il : listOfInvoiceLine){ 
					int prod_id = il.getProductMasterBean().getProduct_master_id();
					CustomerProductRateBean customerProductRateBean = allListDAO.detailsOfCustomerProductRateByCustId(custId, prod_id);
					String encodeWork_id = new EncodeDecode().encodeString(il.getWorkHistoryBean().getWork_history_id());
											%>
			<tr align="center">
				<td style="padding: 3px;"><%=il.getWorkHistoryBean().getKapan_name()%></td>
				<td style="padding: 3px;"><%=il.getWorkHistoryBean().getStone_name()%></td>
				<td style="padding: 3px;"><%=il.getProductMasterBean().getProduct_name()%></td>
				<td style="padding: 3px;"><%=il.getWorkHistoryBean().getActual_weight()%></td>
				<td style="padding: 3px;"><%=customerProductRateBean.getDiscount()%> %</td>
				<td style="padding: 3px;font-weight: bold;" align="right"><%=String.format("%.2f", il.getRate())%> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small> <%if(il.getMin_rate_flag() == 1){%><i class="icon-information-circled" style="color: red;cursor: pointer;" title="This product exceed the minimum rate of SLTL criteria !!!"></i><%} %></td>
			</tr>
                 <%} %>
           

 			<tr bgcolor="lightgray" align="left">
                <td colspan="5"></td>
                <td>
	                <font style="font-size: 20px;font-weight: bold;" id="invoiceFinalOutstanding"><%=String.format("%.2f", invoiceBean.getGross_outstanding())%></font>
					<small class="text-muted"><%=invoiceBean.getCurrency_type()%></small>
				</td>
            </tr>
            
            <tr>
            	<td colspan="5">
            	<font size="2">The diamonds herein invoiced have been purchased from legitimate sources not </font><br>
           		 <font size="2">involved in funding conflict and in compliance with United Nations Resolutions.</font><br>
           		 <font size="2">The seller hereby guarantees that these diamonds  are conflict free, based on </font><br>
           		  <font size="2">The diamonds herein invoiced have been purchased from legitimate sources not these diamonds. </font>
            	</td>
            	<td>
            		 <table>
                        <tr>
                            <td><font style="font-weight: bold;">VAT</font></td>
                            <td>0.00 <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small></td>
                        </tr>
                        <tr>
                        	 <td style="white-space: nowrap;border-top: solid 2px;"><font style="font-weight: bold;">TOTAL</font></td>
                             <td style="white-space: nowrap;border-top: solid 2px;"><font style="font-weight: bold;font-size: 20px;"><%=String.format("%.2f", invoiceBean.getGross_outstanding())%></font> <small class="text-muted"><%=invoiceBean.getCurrency_type()%></small></td>
                        </tr>
                    </table>
            	</td>
            </tr>
        </table>
        <table style="width: 60%">
                       			 <tr>
		                            <td style="padding: 0;margin: 0" colspan="2"><font style="font-weight: bold;" size="2">Banking Details</font></td>
		                         </tr>
		                         <tr>
		                            <td style="padding: 0;margin: 0">
		                            
		                            <font style="font-weight: bold;" size="2">Account Name</font> : <font size="2">AMRUT DIAMONDS</font><br>
		                             <font style="font-weight: bold;" size="2">Bank</font> : <font size="2">NEDBANK</font><br>
		                              <font style="font-weight: bold;" size="2">Branch</font> : <font size="2">DIAMOND EXCHANGE (193205)</font><br>
		                               <font style="font-weight: bold;" size="2">Account Number</font> : <font size="2">1932298541 (ZAR)</font><br>
		                                <font style="font-weight: bold;" size="2">Account Number</font> : <font  size="2">7710019900 (CFC)</font>
		                            </td>
		                            
		                         </tr>
                     
                    </table>
                     <table style="font-size: 12px;">
                     	<tr align="center">
                            <td colspan="5">
	                             <font>Suite 208 5 Sturdee Avenue Rosebank  Johannesburg 2196</font><br>
								 <font>Tel 011 334 1699 Cell 083 649 0002</font><br>			
								 <font>	info@amrutdiamonds.co.za www.amrutdiamonds.co.za</font><br>						
								<font>CK # 2006/027275/23 VAT # 4120234184</font><br>				
								<font>Licensed Rough and Polished Diamond Dealer (License Number AP05259/2)</font>						
                            </td>
                        </tr>
                     </table>
    </div>
    
    
   <script type="text/javascript">
   	 	window.print();
   		window.close();
   </script>
</body>
</html>
