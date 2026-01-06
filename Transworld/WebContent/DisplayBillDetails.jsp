
<%
/****************************************************
Programmer Name: Vikram Abhang
Date- 21st-july-2012
Purpose:This page is create as per puri sir requirement to maintain record of paid bill displaying
        on page from database t_billpayment & t_billpaymenthistory table
*****************************************************/
%>

<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<%@ page language="java"%>
<%@page import="java.util.Date"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="sorttable.js" type="text/javascript"></script>


<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Transworld Compressor Technologies LTD.</title>
<link href="css/style2.css" rel="stylesheet" type="text/css"
	media="screen" />
<style type="text/css">
</style>
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />




<script type="text/javascript" src="css/chrome.js">

</script>


<link href="css/table.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>
	<%
		Statement stmt=null,st1=null,st=null;
		String sql="",SqlDisplay="";
		ResultSet rst=null;
		stmt=conn.createStatement();
		st1=conn.createStatement();
		st=conn.createStatement();
		int i=1;
%>
	<table align="center">
		<tr>

			<td><font size="4" color="blue"><b> Bill Details For
						Inward RefNo:<%=request.getParameter("refno") %></b></font></td>
		</tr>
	</table>
	<table width="100%" bgcolor="white" align="center" class="sortable"
		style="width: 800px; border: 1px;">
		<tr>
			<td style="background-color: #C6DEFF;" align="center"><font
				size="2" color="black"><b>SrN0.</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font
				size="2" color="black"><b>Inward No.</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font
				size="2" color="black"><b>Paid Amount</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font
				size="2" color="black"><b>Paid By</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font
				size="2" color="black"><b>Check/Bill No</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font
				size="2" color="black"><b>Date Of Payment</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font
				size="2" color="black"><b>EnteredBy</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font
				size="2" color="black"><b>EnteredDate-Time</b></font></td>
		</tr>
		<%
	try
	{
	SqlDisplay="Select * from t_billpayment where InwardNo='"+request.getParameter("refno")+"'";
	System.out.println(">>>>>>>SqlDisplay:"+SqlDisplay);
	rst=st.executeQuery(SqlDisplay);
	while(rst.next())
	{
	%>
		<tr>
			<td align="center"><div align="right">
					<font size="2" color="black"><%=i%></font>
				</div></td>
			<td align="center"><div align="right">
					<font size="2" color="black"><%=rst.getString("InwardNo")%></font>
				</div></td>
			<td align="center"><div align="right">
					<font size="2" color="black"><%=rst.getString("PaidAmount")%></font>
				</div></td>
			<td align="center"><div align="left">
					<font size="2" color="black"><%=rst.getString("PaidBy")%></font>
				</div></td>
			<td align="center"><div align="right">
					<font size="2" color="black"><%=rst.getString("CheckNo")%></font>
				</div></td>
			<td align="center"><div align="right">
					<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("DateOfPayment")))%></font>
				</div></td>
			<td align="center"><div align="left">
					<font size="2" color="black"><%=rst.getString("EnterBy")%></font>
				</div></td>
			<td align="center"><div align="right">
					<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("EnteredDateTime")))%></font>
				</div></td>
		</tr>


		<%
	i++;
	}
	}
	catch(Exception e)
	{
		System.out.println(">>>>>>>Exception in Display Query:"+e);
	}
	
	%>


	</table>
</body>
</html>