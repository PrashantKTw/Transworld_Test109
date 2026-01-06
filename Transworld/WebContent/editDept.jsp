<%@ page language="java"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transworld Edit Department</title>

<script LANGUAGE="JavaScript" type="text/javascript">
function validate()
{
	var val1 = document.getElementById("cmpName").value;
	if(val1=="" || val1=="Select")
	{
		alert("Please select the Company Name");
		return false;
	}
	
	var val3 = document.getElementById("undDept").value;
	if(val3=="" || val3=="Select")
	{
		alert("Please select the Under Department");
		return false;
	}
	var val4 = document.getElementById("h1").value;
	if(val4=="" || val4=="Select")
	{
		alert("Please select the HOD");
		return false;
	}
	var val2 = document.getElementById("status").value;
	if(val2=="" || val2=="Select")
	{
		alert("Please select the Status");
		return false;
	}
}
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
function getUdDept(deptCode)
{
	var xmlhttp;
	var l1;
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
		l1=xmlhttp.responseText;
//		alert(l1);
         var mySplitResult = l1.split("#");
      // alert(mySplitResult[1]+"===="+mySplitResult[2]+"====="+mySplitResult[3]+"====="+mySplitResult[4]+"======"+mySplitResult[5]+"======"+mySplitResult[6]+"===="+mySplitResult[7]);
         document.getElementById("ud1").value=mySplitResult[6];
         document.getElementById("hd1").value=mySplitResult[7];
         document.getElementById("sd1").value=mySplitResult[8];
 //        alert(mySplitResult[9]);
         document.getElementById("UdDept").innerHTML=mySplitResult[9];
         document.getElementById("hod").innerHTML=mySplitResult[10];
         
	//	document.getElementById("UdDept").innerHTML=xmlhttp.responseText;
		
	  }
	}
	xmlhttp.open("GET","AjxUdtDept.jsp?deptCode="+deptCode,true);
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
	<form action="EditDeptData.jsp" method="post">
		<table bgcolor="#E0DDFE" border="0" height="200" width="500"
			align="center">
			<tr>
				<td align="center"><b><font size="4" color="#151B54">Edit
							Department</font></b></td>
			</tr>
			<tr>
				<%
String sendMsg=request.getParameter("sendMsg");
if(!(sendMsg==null))
{
%>
				<td align="center"><b><font size="2" color="#151B54"><%=sendMsg%></font></b>
				</td>
				<%} %>
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
						 }%>
							</select></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Department Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><select name="underDept" id="underDept"
								class="formElement" onchange="getUdDept(this.value);"></select>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Under Department <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="ud1" id="ud1"
								readonly="readonly" value="" /></td>
							<td>
								<div id="UdDept"></div>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>HOD Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="hd1" id="hd1"
								readonly="readonly" value="" /></td>
							<td>
								<div id="hod"></div>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Status <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="sd1" id="sd1"
								readonly="readonly" value="" /></td>
							<td><select name="status" id="status" class="formElement">
									<option value="Select">Select</option>
									<option value="active">Activate</option>
									<option value="deactive">DeActivate</option>
							</select></td>
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