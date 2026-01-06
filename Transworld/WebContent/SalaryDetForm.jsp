<%@ page language="java"%>
<%@ include file="header.jsp"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Transworld Employee Registration</title>
</head>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script LANGUAGE="JavaScript" type="text/javascript">

function showSelectedSuppliers(empName,empid){
	
	document.data.empName.value=empName;
	document.data.empId.value=empid;
	document.getElementById("empNamelist").style.display='none';
	//document.data.isCheckedAll.checked=false;"empId"
}

function getName1()
{// alert("call");
	var cid=document.getElementById("cId").value;
	var ajaxRequest;  // The variable that makes Ajax possible!
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{	// Internet Explorer Browsers
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

	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
			//alert(">>>>>>>>>>"+reslt);
			document.getElementById("empName").value=reslt.trim();
			
		} 
	}
  // alert("end of ajax");
	try{
   var query="?cid="+cid+"&action=action";
	ajaxRequest.open("GET","AjaxGetEmpName.jsp" +query ,true);
	ajaxRequest.send(null); 
	}
	catch(e){alert(e);}
}

</script>
<script LANGUAGE="JavaScript" type="text/javascript">

function getName()
{//alert("call");
	document.getElementById("empName").style.display='block';
	var empname=document.data.empName.value;//alert("name"+empname);
	var ajaxRequest;  // The variable that makes Ajax possible!

	try{
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

	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
			//alert(">>>>>>>>>>"+reslt);
			document.getElementById("empNamelist").innerHTML=reslt;
		} 
	}
	
	 var query="?empname="+empname+"&action=action1";
	ajaxRequest.open("GET", "AjaxGetEmpName.jsp"+query, true);
	ajaxRequest.send(null); 
	
}

function validate()
{//alert("call");
	var empname = document.getElementById("empName").value.replace(/\s/g,"");
	var cid = document.getElementById("cId").value.replace(/\s/g,"");
	var basic = document.getElementById("basic").value.replace(/\s/g,"");
	var allow = document.getElementById("allow").value.replace(/\s/g,"");
	var allow1 = document.getElementById("allow1").value.replace(/\s/g,"");
	var allow2 = document.getElementById("allow2").value.replace(/\s/g,"");
	var allow3 = document.getElementById("allow3").value.replace(/\s/g,"");
	var allow4 = document.getElementById("allow4").value.replace(/\s/g,"");
	var deduct = document.getElementById("deduct").value.replace(/\s/g,"");
	var deduct1 = document.getElementById("deduct1").value.replace(/\s/g,"");
	var deduct2 = document.getElementById("deduct2").value.replace(/\s/g,"");
	var deduct3 = document.getElementById("deduct3").value.replace(/\s/g,"");
	var deduct4 = document.getElementById("deduct4").value.replace(/\s/g,"");
	var tds= document.data.tds.value;
	
	if(empname.length==0)
	{
		alert("Please Enter the Employee Name ");
		return false;
	}
	if(cid.length==0)
	{
		alert("Please Enter the Paydays");
		return false;
	}
	if(isNaN(cid))
	{
	alert("Paydays should be Numaric");
	return false;
	}
	if(basic.length==0)
	{
		alert("Please Enter the Basic Amount");
		return false;
	}
	if(isNaN(basic))
	{
	alert("Basic should be Numaric");
	return false;
	}
	
	if(tds=="")
	{
		alert("Please Enter the TDS %");
		return false;
	}
	if(isNaN(tds))
	{
	alert("TDS should be Numaric");
	return false;
	}
	if(isNaN(allow)||isNaN(allow1)||isNaN(allow2)||isNaN(allow3)||isNaN(allow4))
	{
	alert("Deduction Amount should be Numaric");
	return false;
	}
	if(isNaN(deduct)||isNaN(deduct1)||isNaN(deduct2)||isNaN(deduct3)||isNaN(deduct4))
	{
	alert("Deduction Amount should be Numaric");
	return false;
	}
	return true;
}

function Pdfredirect(webadd)
{
	window.open(webadd);
}
</script>
<body>
	<%


Date today = new Date();
String date=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

%>

	<form action="payableData.jsp?action=addfeedet" method="get"
		name="data">
		<table bgcolor="#E0DDFE" border="0" height="400" width="600"
			align="center">
			<tr>
				<td align="center"><b><font size="4" color="#151B54">Contractor
							Fee Detail Form </font></b></td>
			</tr>
			<% Date curdate=new Date();
int year = Calendar.getInstance().get(Calendar.YEAR);
   %>

			<tr bgcolor="white">
				<td>
					<table border="0" align="center" height="350">
						<tr>
							<td><label id="custype"><b>Contractor ID<font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="cId" id="cId"
								style="width: 180px;" class="input" onkeyup="getName1();" /></td>

						</tr>
						<tr>
							<td><label id="custype"><b>Contractor Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="hidden" id="empId" name="empId" /> <input
								type="text" name="empName" id="empName" style="width: 180px;"
								autocomplete="off" class="input" value=""
								onkeyup="if (event.keyCode == 27){document.getElementById('empNamelist').style.display = 'none';} else {javascript:try{getName();} catch(e){alert(e);}}" />
								&nbsp;&nbsp;&nbsp;<br>
								<div style="position: absolute;">
									<table>
										<tr>
											<td>
												<div id='empNamelist'></div>
											</td>
										</tr>
									</table>
								</div></td>



						</tr>

						<tr>
							<td><label id="custype"><b>Basic <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="basic" id="basic"
								style="width: 120px;" class="input" /></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Allowance <font
										color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="allow" id="allow"
								style="width: 120px;" class="input" /></td>

						</tr>
						<tr>
							<td id="showallow1"><label id="custype"><b>Allowance
										1<font color="#990000"></font> :
								</b></label></td>
							<td id="showallow11"><input type="text" name="allow1"
								id="allow1" style="width: 120px;" class="input" /></td>

							<td id="showallow2"><label id="custype"><b>Allowance
										2<font color="#990000"></font> :
								</b></label></td>
							<td id="showallow21"><input type="text" name="allow2"
								id="allow2" style="width: 120px;" class="input" /></td>
						</tr>
						<tr>
							<td id="showallow3"><label id="custype"><b>
										Allowance 3<font color="#990000"></font> :
								</b></label></td>

							<td id="showallow31"><input type="text" name="allow3"
								id="allow3" style="width: 120px;" class="input" /></td>
							<td id="showallow4"><label id="custype"><b>Allowance
										4<font color="#990000"></font> :
								</b></label></td>
							<td id="showallow41"><input type="text" name="allow4"
								id="allow4" style="width: 120px;" class="input" /></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Deduction <font
										color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="deduct" id="deduct"
								style="width: 120px;" class="input" /></td>


						</tr>
						<tr>
							<td id="showdedct1"><label id="custype"><b>Deduction
										1<font color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="deduct1" id="deduct1"
								style="width: 120px;" class="input" /></td>

							<td id="showdedct2"><label id="custype"><b>Deduction
										2<font color="#990000"></font> :
								</b></label></td>
							<td id="showdedct21"><input type="text" name="deduct2"
								id="deduct2" style="width: 120px;" class="input" /></td>
						</tr>
						<tr>
							<td id="showdedct3"><label id="custype"><b>
										Deduction 3<font color="#990000"></font> :
								</b></label></td>

							<td id="showdedct31"><input type="text" name="deduct3"
								id="deduct3" style="width: 120px;" class="input" /></td>
							<td id="showdedct4"><label id="custype"><b>Deduction
										4<font color="#990000"></font> :
								</b></label></td>
							<td id="showdedct41"><input type="text" name="deduct4"
								id="deduct4" style="width: 120px;" class="input" /></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Tds % : <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="tds" id="tds"
								style="width: 120px;" class="input" /></td>
						</tr>


					</table>
					<table align="center">
						<tr>
							<td align="center"><input type="submit" id="submit1"
								value="Submit" onclick="return validate();"
								style="border: outset;"></td>

						</tr>
						<tr>
							<td><input type="hidden" name="action" value="addfeedet" /></td>
						</tr>
					</table> <br>
				</td>
			</tr>

		</table>

	</form>
	<br>
	<br>
	<br>
	<%

String sendMsg=request.getParameter("sendMsg");
%>
	<input type="hidden" name="sendMsg" id="sendMsg" value="<%=sendMsg %>"></input>
	<%
if(!(sendMsg==null))
{
	System.out.println("======="+sendMsg+"=======");
	%>
	<script LANGUAGE="JavaScript" type="text/javascript">
	
	//alert("company created");
	var sendMsg=document.getElementById("sendMsg").value;
	alert(sendMsg+"\n");
	</script>
	<%
}
%>
	<%
conn.close();
%>
</body>
</html>

<br>
<div id="footer">
	<p>
		<a href="http://www.192.168.2.133"> Copyright &copy; 2009 by
			Transworld Compressor Technologies Ltd. All Rights Reserved.</a>
	</p>
</div>