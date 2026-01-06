<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>

<html xmlns="http://www.w3.org/1999/xhtml">
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
	<div id="wrapper">
		<div id="header-wrapper">
			<div id="header">
				<div id="logo">
					<table>
						<tr>
							<td align="left"><a
								href="http://www.transworldcompressor.com/"> <img
									src="images/transworld.jpg" height="70" width="280"></img>
							</a></td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>

							<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<!--<td><br><img src="images/erp.jpeg" height="45" width="170"></img></td>  -->
						</tr>
					</table>
				</div>

				<div id="menu">
					<ul>
						<li><a href="#" rel="dropmenu1">Leave</a></li>
						<li><a href="#" rel="dropmenu2">Settings</a></li>
						<li><a href="#" rel="dropmenu3">Attendance</a></li>
						<li><a href="#" rel="dropmenu4">Inward</a></li>
						<li><a href="logout.jsp"><font color=red>|Logout|<br></font><%=session.getAttribute("empname")%></a></li>
						<!--  -->
					</ul>
				</div>

			</div>
		</div>
		<%
	String empname=session.getAttribute("email").toString();
    String pass123=session.getAttribute("empPswd").toString();
	
	%>


		<%
String chkRole=session.getAttribute("emprole").toString();
if(chkRole.equals("HR") || chkRole.equals("hod"))
{
%>
		<div id="dropmenu1" class="dropmenudiv">
			<a href="leave application.jsp">Apply</a>
			<%
	if(chkRole.equals("hod"))
	{
	%>
			<a href="leaveRequestReport.jsp">Report</a>
			<%}
	else
	{
	%>
			<a href="leaveRequestReportForAll.jsp">Report</a>
			<%} %>
		</div>
		<div id="dropmenu2" class="dropmenudiv">
			<a href="addEmployee.jsp">Add Employee</a> <a href="editEmployee.jsp">Edit
				Employee</a> <a href="removeEmployee.jsp">Remove Employee</a> <a
				href="newpassword.jsp">Change Password</a>
		</div>
		<div id="dropmenu3" class="dropmenudiv">
			<a href="checkinout.jsp?type=IN">Check IN</a> <a
				href="checkinout.jsp?type=OUT">Check Out</a> <a
				href="checkinout.jsp?type=PASS">Pass</a> <a href="">Special
				Request(Under Construction)</a> <a href="">Attendance Approval(Under
				Construction)</a> <a href="">Individual Report(Under Construction)</a> <a
				href="">Group Report(Under Construction)</a>
		</div>
		<div id="dropmenu4" class="dropmenudiv">
			<a href="IwrdScan.jsp">Scan(Under Construction)</a> <a
				href="IwrdScanReport.jsp">Scan Report(Under Construction)</a> <a
				href="inward.jsp">Inward Entry</a> <a href="inwardReport.jsp">Inward
				Report</a> <a href="IwrdPending.jsp">Pending Report(Under
				Construction)</a> <a href="IwrdPendingAll.jsp">All Pending
				Report(Under Construction)</a>
		</div>
		<%}
else
{
%>
		<div id="dropmenu1" class="dropmenudiv">
			<a href="leave application.jsp">Apply</a> <a
				href="leaveRequestReport.jsp">Report</a>
		</div>
		<div id="dropmenu2" class="dropmenudiv">
			<a href="newpassword.jsp">Change Password</a>
		</div>
		<div id="dropmenu3" class="dropmenudiv">
			<a href="checkinout.jsp?type=IN">Check IN</a> <a
				href="checkinout.jsp?type=OUT">Check Out</a> <a
				href="checkinout.jsp?type=PASS">Pass</a> <a href="">Special
				Request(Under Construction)</a> <a href="">Individual Report(Under
				Construction)</a>
		</div>
		<div id="dropmenu4" class="dropmenudiv">
			<a href="IwrdScan.jsp">Scan(Under Construction)</a> <a
				href="IwrdScanReport.jsp">Scan Report(Under Construction)</a> <a
				href="inward.jsp">Inward Entry</a> <a href="inwardReport.jsp">Inward
				Report</a> <a href="IwrdPending.jsp">Pending Report(Under
				Construction)</a> <a href="IwrdPendingAll.jsp">All Pending
				Report(Under Construction)</a>
		</div>
		<%} %>





		<script type="text/javascript">

cssdropdown.startchrome("menu");
</script>
	</div>