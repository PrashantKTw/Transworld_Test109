 <%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.Date"%>
 <%@ include file="headConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="sorttable.js" type="text/javascript"></script>


<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />  
<title>Transworld Technologies LTD.</title>
<link href="css/style2.css" rel="stylesheet" type="text/css" media="screen" />
 <link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />




<script type="text/javascript" src="css/chrome.js">

</script>


<link href="css/table.css" rel="stylesheet" type="text/css" media="screen" />
<style>

html, body {
    width: 100%;
    height: 100%;
}

.container-fluid {
    width: 100%;
    max-width: 100%;
    margin: 0 auto; /* Optional: centers the content */
}

</style>
</head>
<body>
<script type="text/javascript">
function openpopup(PageName)
{
	 try{
		 //alert(e);
	 testwindow=window.open("RegisterComplaint.jsp?PageName="+PageName,"java","width=700,height=400,scrollbars=yes");
	 testwindow.moveTo(200,200);
	 }catch(e)
	 {
		 alert(e);
	 }
}
</script>
<%
Statement strno = conn.createStatement();
String PageName=this.getClass().getName();
String reportno = "",reportname="";
String empdept="",IsWorkFromHome="";
PageName=PageName.substring(PageName.lastIndexOf(".")+1,PageName.length());
System.out.println(PageName);
PageName=PageName.replace("_",".");
PageName=PageName.replace(".005f","_");
PageName = PageName.replace(".0020"," ");
System.out.println("PageName   "+PageName);
String sqlreport = "select * from t_reportnumber where PageName = '"+PageName+"'";
ResultSet rsreport = strno.executeQuery(sqlreport);
if(rsreport.next())
{
	reportno = rsreport.getString("ReportNo");
	reportname=rsreport.getString("ReportName");
}
String heading=reportname+" "+reportno;
System.out.println(reportno);
String chkRole=session.getAttribute("emprole").toString();
String chkDept=session.getAttribute("empdept").toString();
IsWorkFromHome=session.getAttribute("IsWorkFromHome").toString();

System.out.println("IsWorkFromHome :- "+IsWorkFromHome);

%>
<div class="container-fluid">
<div id="header-wrapper" style="width:100%;">
<div id="header">
<div id="logo">
<table style="width:100%">
	<tr>
		<td align="left">
		<img src="images/transworld.jpg" height="70" width="260"></img></td>
		

		<td align="left"></td>
		<td>
			<div id="menu" style="width:1000px;">
				<ul>
				    <li><a href="#" rel="dropmenu6">Other Systems</a></li>
					<li><a href="#" rel="dropmenu1">Leave</a></li>
						<%
						if(chkRole.equals("hod")||chkRole.equals("HR") || empdept.equalsIgnoreCase("HR")|| chkDept.equalsIgnoreCase("HR"))
						{
						%>
					<li><a href="#" rel="dropmenu2">HR Module</a></li>
					<%} %>
					<li><a href="#" rel="dropmenu3">Attendance</a></li>
					<li><a href="#" rel="dropmenu4">Inward</a></li>
					<li><a href="#" rel="dropmenu5">Incident</a></li>
					<li><a href="#" rel="dropmenu7">My Account</a></li>
					<li><a href="logout.jsp"><font color=red>|Logout|</font><%=session.getAttribute("empname")%></a></li>
				</ul>
			</div>
		</td>
	</tr>
</table>
</div>



</div>
</div>
<%
	try
	{
		String empname=session.getAttribute("email").toString();
	    String pass123=session.getAttribute("empPswd").toString();
	    empdept=session.getAttribute("empdept").toString();
	    
	    System.out.println("Department -----> "+empdept);
	}
    catch(Exception e)
	{
    	System.out.println("###############>>"+e);
		response.sendRedirect("index.jsp?err=err2");	
		return;
	}
%>
  
	
<%
if(chkRole.equals("HR") || chkRole.equals("hr") || empdept.equalsIgnoreCase("HR")|| chkDept.equalsIgnoreCase("HR"))
{
%>
<div id="dropmenu1" class="dropmenudiv">
	<a href="leaveapplication.jsp">Apply</a> 
	<%
	if(chkRole.equals("hod")||chkRole.equals("HR"))
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
	<a href="employeeReport.jsp">Add User</a>
	<a href="contractorReport.jsp">Contractor Master</a>
	<a href="payableReport.jsp">Payroll</a>
	<a href="attendanceReport.jsp">Attendance Summary</a>
	<a href="companyReport.jsp"> Company</a>
	<a href="departmentReport.jsp">Department</a> 
<!-- 	<a href="deptCreation.jsp">Department Creation</a>--> 
<!-- 	<a href="editDept.jsp">Edit Department</a> -->
<!-- 	<a href="designationReport.jsp"> Designation</a>  --> 
	<a href="TWApply.jsp" target = "_blank" >Application Form</a> 
	<a href="applicant_report.jsp">Applicant Report</a> 
	<a href="Reasonreport.jsp">Attendance Reason Master</a>

<%
	
	if(chkRole.equals("HR"))
	{%>
		<a href="leaveRequestReport_hr.jsp"> Leave Report</a> 
	<%}%>

</div>
<div id="dropmenu3" class="dropmenudiv">
    
    
    
    
    <%
	
//    if(empdept.equals("Sales") || empdept.equals("Sales&Marketing") || IsWorkFromHome.equals("Yes"))
	if( IsWorkFromHome.equals("Yes"))
	{%>
		<a href="checkinout.jsp?type=IN">Check IN</a>   
	<a href="checkinout.jsp?type=OUT">Check Out</a>
	<a href="checkinout.jsp?type=PASS">Pass</a> 
	<%}
     //else{
	%>
	<!-- <a href="checkinout.jsp?type=IN">Check IN</a>   
	<a href="checkinout.jsp?type=OUT">Check Out</a>
	<a href="checkinout.jsp?type=PASS">Pass</a>  -->
	<% 
	//}
	%> 
	
	<a href="checkInOutReport.jsp">Attendance Report</a>
	<a href="">Attendance Approval(Under Construction)</a>
	<a href="">Individual Report(Under Construction)</a>
	<a href="">Group Report(Under Construction)</a> 
	
</div>
<div id="dropmenu4" class="dropmenudiv">
	<a href="IwrdScan.jsp">Upload Doc</a>   
	<a href="IwrdScanReport.jsp">Inward Uploaded Doc</a>
	<a href="inward.jsp">Inward Entry</a>
	<a href="inwardReport.jsp">Inward Report</a>
	<a href="billTracking.jsp">Tracking Report</a> 
	<a href="MasterTracking.jsp">Master Report</a> 
	<a href="billreport.jsp">Bill Report</a>
			<a href="inwardglobal.jsp">Inward Global Search</a> 

</div>
<div id="dropmenu5" class="dropmenudiv">
	<a href="incidentEntryForm.jsp">Enter Incident</a>
	<a href="incidentDataReport.jsp">Incident Report</a> 
</div>

<div id="dropmenu6" class="dropmenudiv">
    <a href="erp.jsp" target="_blank">ERP</a>   
<!--  	<a href="fleetview.jsp" target="_blank">FleetView</a>  --> 
	<a href="diary.jsp" target="_blank">Diary System</a>   
	<a href="siteadmin.jsp" target="_blank">Site Admin</a>   
	<a href="unitdispatch.jsp" target="_blank">Unit Dispatch</a>   
	<a href="unitorder.jsp" target="_blank">Unit Order</a>   
	<a href="quicktest.jsp" target="_blank">Quick Test</a>   
	<a href="Bedoccupancy.jsp" target="_blank">KEM</a>   
</div>
<div id="dropmenu7" class="dropmenudiv">
<a href="newpassword.jsp">Change Password</a>
</div>

<%}
else
{
%>

<div id="dropmenu7" class="dropmenudiv">
<a href="newpassword.jsp">Change Password</a>
</div>
<div id="dropmenu1" class="dropmenudiv">
	<a href="leaveapplication.jsp">Apply</a> 
	<a href="leaveRequestReport.jsp">Report</a>
<!--<a href="leaveRequestReportForAll.jsp">Report</a>
--></div>	
<div id="dropmenu2" class="dropmenudiv">
    <!--<a href="EmployeeDetailsFormCommon.jsp">Employee Entry Form</a>  -->
    <a href="contractorReport.jsp">Contractor Master</a>
	<a href="TWApply.jsp" target = "_blank" >Application Form</a> 
</div>
<div id="dropmenu3" class="dropmenudiv">
 <%  
 if(empdept.equals("Sales") || empdept.equals("Sales&Marketing") || IsWorkFromHome.equals("Yes"))
	{%>
		<a href="checkinout.jsp?type=IN">Check IN</a>   
	<a href="checkinout.jsp?type=OUT">Check Out</a>
	<a href="checkinout.jsp?type=PASS">Pass</a>
	<%}
 //else{
	%>
	<!-- <a href="checkinout.jsp?type=IN">Check IN</a>   
	<a href="checkinout.jsp?type=OUT">Check Out</a>
	<a href="checkinout.jsp?type=PASS">Pass</a>  -->
	<%// }%>
	
	
	<a href="checkInOutReport.jsp">Attendance Report</a>
	<a href="">Individual Report(Under Construction)</a>
</div>
<div id="dropmenu4" class="dropmenudiv">
	<a href="IwrdScan.jsp">Upload Doc</a>   
	<a href="IwrdScanReport.jsp">Inward Uploaded Doc</a>
	<a href="inward.jsp">Inward Entry</a>
	<a href="inwardReport.jsp">Inward Report</a>
	<a href="billTracking.jsp">Tracking Report</a>
	<%if(chkDept.equalsIgnoreCase("Accounts")){%>
	<a href="billreport.jsp">Bill Report</a>  


	<%}%>
			<a href="inwardglobal.jsp">Inward Global Search</a> 
</div>
<div id="dropmenu5" class="dropmenudiv">
	<a href="incidentEntryForm.jsp">Enter Incident</a>
	<a href="incidentDataReport.jsp">Incident Report</a> 
</div>
<div id="dropmenu6" class="dropmenudiv">
    <a href="erp.jsp" target="_blank">ERP</a>   
<!-- <a href="fleetview.jsp" target="_blank">FleetView</a>   -->
	<a href="diary.jsp" target="_blank">Diary System</a>   
	<a href="siteadmin.jsp" target="_blank">Site Admin</a> 
	<a href="unitdispatch.jsp" target="_blank">Unit Dispatch</a>   
	<a href="unitorder.jsp" target="_blank">Unit Order</a>   
	<a href="quicktest.jsp" target="_blank">Quick Test</a>    
	<a href="Bedoccupancy.jsp" target="_blank">KEM</a>    
</div>



<%} %>
<div>
<a href="#" onclick="openpopup('<%=PageName %>')" title="Register Complaint">Register Complaint</a>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="black"> Report No.: <%=reportno %></font>

</div>
</div>
	
	
<script type="text/javascript">

cssdropdown.startchrome("menu");
</script>
</body>
</html>
