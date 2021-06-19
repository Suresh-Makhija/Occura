<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/tabs.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/tabs.js"></script>   


</head>
<body>

<div id="main-content">
            <div class="container-fluid">
            
             <div class="TabView" id="TabView" style="padding-top: 1px">
		<div class="Tabs" style="width: 100%;">
			<a>New Case</a>
			<a>Old Case</a>
		</div>
		<div class="Pages" style="width: 100%; border: 0px;">
			<div class="Page" id="1">
				<div id="page1" class="demo"><jsp:include
						page="/view/appointment_user_new.jsp" /></div>
			</div>
			<div class="Page" id="2">
				<div id="page2" class="demo"><jsp:include
						page="/view/appointment_user_old.jsp" /></div>
			</div>
			
			
			
		</div>
	</div>
	
	<c:set value="${requestScope.onPage}" var="onPage" />
	<c:choose>
		<c:when test="${onPage == 2}">
			<script type="text/javascript"> tabview_switch('TabView', '2'); </script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript"> tabview_switch('TabView', '1'); </script>
		</c:otherwise>
	</c:choose>
            
            </div>
            </div>
                
               
	
                
	

	
	


</body>
</html>