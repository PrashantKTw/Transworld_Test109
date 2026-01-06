<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.sql.ResultSet"%><html>

<head>
<title>Forward Intimation</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<script type="text/javascript" src="css/chrome.js"></script>




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
var employeeList=null;

function selectoption()
{
	document.form1.to.focus();
}

onunload=function()
{
	window.close();
}
/*
function closeAllchildren()
{
	//window.opener=self;
	mywindow2.close(); 
} */
function showVisitingCardDetails(eName,empMail)
{
	document.getElementById("EmpNames").value=eName;
	document.getElementById("SelectedEmpMail").value=empMail;
	document.getElementById("EmpList").style.display='none';
}
function getEmp(deptName)
{
	deptName=escape(deptName);
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {
		  // code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else if (window.ActiveXObject)
		  {
		  // code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		else
		  {
		  alert("Your browser does not support XMLHTTP!");
		  }
		xmlhttp.onreadystatechange=function()
		{
		if(xmlhttp.readyState==4)
		  {
		  //alert(xmlhttp.responseText);
		  document.getElementById("to").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","getEmp.jsp?deptName="+deptName,true);
		xmlhttp.send(null);
}
function validate()
{
	var v1=document.getElementById("to").value;
	var v2=document.getElementById("senderCmts").value;
	if(v1=="" || v1==null)
	{
		alert("Please Select Employee");
		return false;
	}
	return true;
}
</script>
</head>

<body>
	<%
Statement st=conn.createStatement();

String refno=request.getParameter("refno");
System.out.println("************"+refno+"***********");
try
{
	String dept="";
	Statement stmt=conn.createStatement();
%>
	<form action="sendIntimation.jsp" name="intimationSend" method="get">
		<%//String sd1=request.getParameter("sd1"); %>
		<input type="hidden" name="rd" id="rd" value="<%=refno%>">
		<table style="background: #b0c4de;" align="center">
			<tr align="center">
				<td align="center">
					<h1>Forward Intimation</h1>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>

		<table border="0" cellpadding="3" width="100%"
			style="background: #b0c4de;" align="center">
			<tr>

				<td align="left"><label id="custype"><b>Department
							:</b></label></td>
				<td align="left"><select name="dept" id="dept"
					class="formElement" onchange="getEmp(this.value);">
						<option value="select" selected="selected">select</option>
						<%String sql="select distinct(TypeValue) as Dept from t_leaveadmin order by Dept asc" ;
   			ResultSet rst3=stmt.executeQuery(sql);
    		while(rst3.next())
    		{
    			dept=rst3.getString("Dept");
    		%>
						<option value="<%=rst3.getString("Dept") %>">
							<%=rst3.getString("Dept") %>
						</option>
						<%  
			}%>
				</select></td>

				<td align="left"><b>To :</b></td>
				<td align="left"><select name="to" id="to" class="formElement"
					multiple="multiple" size="5" style="width: 200px;"
					onchange="selectoption();"></select></td>

			</tr>
			<tr>
				<td align="left" align="right"><b>Comments :</b></td>
				<td><textarea name="senderCmts" rows="3" id="senderCmts"
						style='width: 205px; height: auto; border-color: activeborder;'></textarea>
				</td>
			</tr>
		</table>

		<table align="center">
			<tr>
				<td align="center"><input type="submit" id="search-submit"
					name="submitFollowUp" value="Submit" onclick="return validate();" /></td>
			</tr>
		</table>

	</form>
	<%
conn.close();
}
catch(Exception e)
{
System.out.println("==============>"+e);
e.printStackTrace();
}%>
</body>
</html>