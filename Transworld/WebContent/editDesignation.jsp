<%@ page language="java"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transworld Department Creation</title>

<script LANGUAGE="JavaScript" type="text/javascript">
function getDeptData(cmpCode)
{
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
	//	  alert(xmlhttp.responseText);
		  document.getElementById("underDept").innerHTML=xmlhttp.responseText;
	//	  alert(document.getElementById("underDept").value);
		  
		  }
		}
		xmlhttp.open("GET","AjxDeptData.jsp?cmpCode="+cmpCode,true);
		xmlhttp.send(null);
		
}
function getHodData(deptCode)
{
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
		  document.getElementById("hod").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","AjxHodData.jsp?deptCode="+deptCode,true);
		xmlhttp.send(null);
		
}
function validate()
{
	var val1 = document.getElementById("cmpName").value;
	var val2 = document.getElementById("deptName").value;
	var val3 = document.getElementById("underDept").value;
	var val4 = document.getElementById("hod").value;

	if(val1=="" || val1=="Select")
	{
		alert("Please select the Company Name ");
		return false;
	}
	if(val2=="" || val2=="Select")
	{
		alert("Please select the Department");
		return false;
	}
	if(val3=="" || val3=="Select")
	{
		alert("Please select the Under Department");
		return false;
	}
	if(val4=="" || val4=="Select")
	{
		alert("Please select the HOD for Department");
		return false;
	}
	return true;
}


function getDesigData(deptCode)
{

	//alert("In desgnation data fun");
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
	  document.getElementById("hod").innerHTML=xmlhttp.responseText;
	  }
	}
	xmlhttp.open("GET","AjaxDesignationData.jsp?deptCode="+deptCode,true);
	xmlhttp.send(null);
}
</script>

</head>
<body>
	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
%>
	<br>
	<br>
	<form action="insertdesignation.jsp" method="post">
		<input type="hidden" name="type" id="type" value="2">
		<table bgcolor="#E0DDFE" border="0" height="200" width="400"
			align="center">
			<tr>
				<td align="center"><b><font size="4" color="#151B54">Edit
							Designation</font></b></td>
			</tr>
			<tr>
				<td align="center">
					<%String sendMsg=request.getParameter("sendMsg");
	System.out.println("MSG AFETR SENDING  "+sendMsg);
	if(!(sendMsg==null))
			{
	%> <b><font size="2" color="#151B54"><%= sendMsg%></font></b> <%} %>
				</td>
			</tr>
			<tr bgcolor="white">
				<td>
					<table>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Company Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><select name="cmpName" id="cmpName" class="formElement"
								onchange="getDeptData(this.value);">
									<option value="Select">Select</option>
									<% 
						try
						{
							String sqlCat="select CompanyCode,OurCompanyName from t_ourcompanydet";
						    ResultSet rsCat=st1.executeQuery(sqlCat);
						    while(rsCat.next())
						    { %>
									<option value="<%=rsCat.getString("CompanyCode") %>">
										<%=rsCat.getString("OurCompanyName") %>
									</option>
									<%  } 
						}
						catch(Exception e)
						{
							System.out.println("Exception======>>"+e);
						}
						%>
							</select></td>
						</tr>
						<tr>
							<td></td>
						</tr>

						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Under Department <font
										color="#990000">*</font> :
								</b></label></td>
							<td><select name="underDept" id="underDept"
								class="formElement" onchange="getDesigData(this.value);"></select>
								<input type="hidden" name="uD" id="uD"></input></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Designation To Be
										Changed: <font color="#990000">*</font> :
								</b></label></td>
							<td><select name="hod" id="hod" class="formElement"
								onchange=""></select></td>
						</tr>
						<tr>
							<td></td>
						</tr>

						<tr>
							<td><label id="custype"><b>New Designation :<font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="deptName" id="deptName" /></td>
						</tr>

						<tr>
							<td></td>
						</tr>
					</table>
					<table align="center">
						<tr>
							<td align="center"><input type="submit" id="submit1"
								value="Submit" onclick="return validate();"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%
conn.close();
%>
</body>
</html>