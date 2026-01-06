<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.sql.ResultSet"%><html>



<head>


<title>Check In-Out</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<script type="text/javascript" src="css/chrome.js"></script>



<style type="text/css">
table {
	font-size: 2;
	font-family: Georgia, "Gill Sans MT", "Gill sans", "Trebuchet ms",
		sans-serif;
	line-height: 1.4em;
	color: #5B0006;
	background-color: #FFEDEF;
	width: 100%;
	border-collapse: collapse;
}

caption {
	color: #F8EFF0;
	background-color: inherit;
	font-size: 25px;
	background-image: url(poetryforbrowser/caption.jpg);
	background-repeat: repeat-x;
	background-position: 0 0;
	padding: 28px 10px 7px 5px;
	text-align: right;
}

tfoot th, tfoot td {
	color: #F8EFF0;
	background-color: inherit;
	font-size: 25px;
	background-image: url(poetryforbrowser/tfoot.jpg);
	background-repeat: repeat-x;
	background-position: 0 -2px;
}

tfoot {
	text-align: right;
}

tfoot td {
	padding: 7px 10px 28px 5px;
}

tfoot th {
	padding: 7px 2px 28px 2px;
}

thead th, tbody th {
	background-color: #FAE5E7;
	color: #5B0006;
	padding: 7px;
	text-align: left;
}

tbody tr:hover, tbody tr th:hover {
	background-color: #FDF9F9;
	color: #000;
}

td {
	padding: 7px;
}

thead th {
	border-bottom: 1px dotted #908F8B;
}

thead th:first-child {
	border: none;
}

tbody th {
	border-right: 1px dotted #908F8B;
}

table a {
	width: 100%;
	display: block;
	color: #5B0006;
	background-color: inherit;
	line-height: 1.5em;
}

table a:visited {
	color: #908F8B;
	background-color: inherit;
}

tbody td+td+td+td a:before {
	content: "\21D3";
	text-align: right;
}

table a:hover {
	color: #C9020F;
	background-color: inherit;
}
</style>


<style type="text/css">
body {
	background-color: #b0c4de;
}
</style>

<style type="text/css">
p {
	font-family: "Times New Roman", font-size : "60%", Times, serif;
}
</style>

<script type="text/javascript">
/*
function closeAllchildren()
{
	 window.opener=self;
	 window.close(); 
}
*/
onunload=function()
{
	window.close();
}
</script>
</head>

<body bgcolor="red">
	<%
Statement st=conn.createStatement();


String reqStat=request.getParameter("reqStat");
String inTime=request.getParameter("inTime");
String outTime=request.getParameter("outTime");
String inCmt="",outCmt="";

if( (!(inTime.equals(""))) && (!(inTime.equals("-"))) && (!(inTime==null)) )
{
	String sql1="select EntryComments from t_checkinout where CheckinDateTime='"+inTime+"'";
	ResultSet rs1=st.executeQuery(sql1);
	if(rs1.next())
	{
		inCmt=rs1.getString("EntryComments");
	}
}

if( (!(outTime.equals(""))) && (!(outTime.equals("-"))) && (!(outTime==null)) )
{
	String sql2="select EntryComments from t_checkinout where CheckinDateTime='"+outTime+"'";
	ResultSet rs2=st.executeQuery(sql2);
	if(rs2.next())
	{
		outCmt=rs2.getString("EntryComments");
	}
}

%>
	<form action="checkInOutSubmit.jsp" method="get">

		<table style="background: #b0c4de;" align="center">
			<tr align="center">
				<td align="center">
					<h1>Approve/Reject Attendance</h1>
				</td>
			</tr>
		</table>
		<br></br> <br></br>
		<table border="0" cellpadding="3" width="60%"
			style="background: #b0c4de;" align="center">

			<input type="hidden" name="reqStat" id="reqStat"
				value="<%= reqStat%>">
			<input type="hidden" name="inTime" id="inTime" value="<%= inTime%>">
			<input type="hidden" name="outTime" id="outTime"
				value="<%= outTime%>">

			<%if(!(inCmt==null) && (!(inCmt==""))) 
{%>
			<tr>

				<td align="left">In Time Comment :</td>
				<td align="left"><%= inCmt%></td>
			</tr>
			<%}
if(!(outCmt==null) && (!(outCmt=="")))
{%>
			<tr>
				<td align="left">Out Time Comment :</td>
				<td align="left"><%= outCmt%></td>
			</tr>
			<%} %>
			<tr>
				<td align="left"><input TYPE="radio" id="rd" name="rd"
					VALUE="Approved" size="2" checked="checked" />Approve</td>
				<td align="left"><input TYPE="radio" id="rd" name="rd"
					VALUE="Rejected" size="2" />Reject</td>
			</tr>
			<tr>
				<td align="left">Appr/Reject Comment :</td>
				<td align="left"><textarea name="aprrejCmt" rows="3"
						id="aprrejCmt"
						style='width: 205px; height: auto; border-color: activeborder;'></textarea>
				</td>
			</tr>
		</table>
		<table border="0" cellpadding="3" width="80%"
			style="background: #b0c4de;" align="center">
			<tr>
				<td align="center"><input type="submit" id="search-submit"
					name="submitFollowUp" value="Submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>