
<%
/****************************************************
Programmer Name: Vikram Abhang
Date- 21st-july-2012
Purpose:This page is create as per puri sir requirement to maintain record of paid bill
        in database t_billpayment & t_billpaymenthistory
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@page import="java.util.Date"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/ajax-tooltip.js"></script>
<script src="js/sorttable.js" type="text/javascript"></script>
<title>Transworld Bill Entry</title>
</head>
<script LANGUAGE="JavaScript" type="text/javascript">
function validate()
{
	var refno = document.getElementById("inwardno").value;
	var amount = document.getElementById("amount").value;
	var checkno = document.getElementById("checkno").value;
	var paidby = document.getElementById("paidby").value;
	var dop = document.getElementById("dop").value;

	if(refno==""||refno==null)
	{
		alert("Please Enter Inward No ");
		return false;
	}
	if(amount=="")
	{
		alert("Please Enter Paid Amount ");
		return false;
	}
	if(isNaN(amount))
	{
	alert("Enter the Valid Paid Amount");
	return false;
	}
	if(checkno=="")
	{
		alert("Please Enter Check/Bill No ");
		return false;
	}
	if(paidby=="")
	{
		alert("Please Enter Check/Bill No ");
		return false;
	}
	var ajaxRequest;  // The variable that makes Ajax possible!
	try
	{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	//alert("function is not ready ready");
	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function()
	{
		//alert("function ready");
		if(ajaxRequest.readyState == 4)
		{
			//alert("ready state is 4");
			var reslt=ajaxRequest.responseText;
			//alert(">>>    "+reslt);
			var data=reslt.trim();
			//alert("<*****  "+data);
			if(data="Yes")
			{
                    alert("Bill Data Save Successfully");					 
					window.opener.location.reload();
					
					 setTimeout('self.close()',5);              
            }
			else if(data = "No")
			{
					 alert("Bill Data Not Save Successfully");
			}
		}
	}	
	var queryString = "?refno="+refno+"&amount="+amount+"&checkno="+checkno+"&paidby="+paidby+"&dop="+dop;
	ajaxRequest.open("GET", "insertbillentry.jsp" + queryString, true);
	ajaxRequest.send(null); 
}
</script>
<body>
	<%
String datenew1="",datenew2="";
datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

%>
	<form name="billentry" method="get" action="">
		<%

String refno=request.getParameter("refno");
%>
		<div id="billentryform"
			style="width: 98%; border: thin solid; border-color: blue; position: absolute; background-color: #E1F3F3; border-radius: 12px 12px 12px 12px;">
			<table align="center">
				<tr>
					<td>Bill Entry Form</td>
				</tr>
			</table>
			<br></br>
			<table align="center" style="font-size: small;">
				<tr>
					<td><label id="custype"><b>Inward No:<font
								color="#990000">*</font> :
						</b></label></td>
					<td><input type="text" name="inwardno" id="inwardno"
						value="<%=refno %>" /></td>
				</tr>
				<tr>
					<td><label id="custype"><b>Paid Amount:<font
								color="#990000">*</font> :
						</b></label></td>
					<td><input type="text" name="amount" id="amount" /></td>
				</tr>
				<tr>
					<td><label id="custype"><b>Paid By:<font
								color="#990000">*</font> :
						</b></label></td>
					<td><input type="text" name="paidby" id="paidby" /></td>
				</tr>
				<tr>
					<td><label id="custype"><b>Check/Bill No:<font
								color="#990000">*</font> :
						</b></label></td>
					<td><input type="text" name="checkno" id="checkno" /></td>
				</tr>
				<tr>
					<td><label id="custype"><b>Date Of Payment: <font
								color="#990000">*</font> :
						</b></label></td>
					<td><input type="text" id="dop" name="dop" size="12"
						value="<%=datenew1%>"
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
						readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "dop",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "dop"       // ID of the button
					    }
					  );
				</script></td>
				</tr>
			</table>
			<br></br>
			<table align="center" style="font-size: small;">
				<tr>
					<td align="center"><input type="button" id="button"
						value="Submit" onclick="validate();"></td>
				</tr>
			</table>
		</div>

	</form>
</body>
</html>