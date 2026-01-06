<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.sql.ResultSet"%><html>



<head>


<title>Incident Update</title>
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
function closeAllchildren()
{
	 window.opener=self;
	 window.close(); 
} 
</script>
</head>

<body bgcolor="red">
	<%
Statement st=conn.createStatement();
System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");

String incidentDate=request.getParameter("incidentDate");
String complaintid=request.getParameter("complaintid");
String location=request.getParameter("location");
String relatedTo=request.getParameter("relatedTo");
String type=request.getParameter("type");
String category=request.getParameter("category");
String description=request.getParameter("description");
String spEsc=request.getParameter("spEsc");
String assetId=request.getParameter("assetId");
String status=request.getParameter("status");
%>
	<form action="incidentDataInsert.jsp" method="get">

		<table style="background: #b0c4de;" align="center">
			<tr align="center">
				<td align="center">
					<h1>Update Incident</h1>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="0" cellpadding="3" width="80%"
			style="background: #b0c4de;" align="center">

			<tr>
				<td align="left">Incident Date :</td>
				<td align="left"><%= incidentDate%> <input type="hidden"
					name="incidentDate" id="incidentDate" value="<%= incidentDate%>">
					<input type="hidden" name="spEsc" id="spEsc" value="<%= spEsc%>">
					<input type="hidden" name="assetId" id="assetId"
					value="<%= assetId%>"></td>
				<td align="left">Complaint ID :</td>
				<td align="left"><%= complaintid%> <input type="hidden"
					name="complaintid" id="complaintid" value="<%= complaintid%>">
				</td>
			</tr>
			<tr>
				<td valign="top" align="left">Location :</td>
				<td align="left"><%= location%> <input type="hidden"
					name="location" id="location" value="<%= location%>"></td>
				<td valign="top" align="left">Related To :</td>
				<td align="left"><%= relatedTo%> <input type="hidden"
					name="relatedTo" id="relatedTo" value="<%= relatedTo%>"></td>
			</tr>
			<tr>
				<td valign="top" align="left">Type :</td>
				<td align="left"><%= type%> <input type="hidden" name="type"
					id="type" value="<%= type%>"></td>
				<td valign="top" align="left">Category :</td>
				<td align="left"><%= category%> <input type="hidden"
					name="category" id="category" value="<%= category%>"></td>
			</tr>

		</table>
		<table border="0" cellpadding="3" width="80%"
			style="background: #b0c4de;" align="center">
			<tr>
				<td valign="top" align="left">Description :</td>
				<td align="left"><%= description%> <input type="hidden"
					name="description" id="description" value="<%= description%>">
				</td>
			</tr>
			<%
String cmt1="-",cmt2="-";
if(status.equals("Attended"))
{
	try
	{
		String sql1="select updateComment, permntSolution from t_incidentdata where complaintid='"+complaintid+"'";
		ResultSet rscmt=st.executeQuery(sql1);
		if(rscmt.next())
		{
			cmt1=rscmt.getString("updateComment");
			cmt2=rscmt.getString("permntSolution");
		}
	}
	catch(Exception e1)
	{
		System.out.println("Exception updatewindow------------->>"+e1);
	}
%>
			<tr>
				<td valign="top" align="left">Comment :</td>
				<td align="left"><%= cmt1%></td>
			</tr>
			<tr>
				<td valign="top" align="left">Solution :</td>
				<td align="left"><%= cmt2%></td>
			</tr>
			<%}
else{
%>

			<%} %>
			<tr>
				<td valign="top" align="left">Comment For Incident :</td>
				<td align="left"><textarea name="incdtCmt" rows="3"
						id="incdtCmt"
						style='width: 205px; height: auto; border-color: activeborder;'></textarea>

				</td>
			</tr>
			<tr>
				<td valign="top" align="left">Permanent Solution :</td>
				<td align="left"><textarea name="permanentSol" rows="3"
						id="permanentSol"
						style='width: 205px; height: auto; border-color: activeborder;'></textarea>
				</td>
			</tr>
			<tr>
				<td valign="top" align="left">Status :</td>
				<td align="left"><select name="incdntStat" id="incdntStat"
					style="width: 87px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"
					onchange="getAjxToolTip();">
						<option value="Attended">Attended</option>
						<option value="Resolved">Resolved</option>
				</select></td>
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