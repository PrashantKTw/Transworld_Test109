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

function showSelectedSuppliers(companyName){
	//alert("in"+companyName);
	document.data.empName.value=companyName;
	//alert(document.data.customerCode.value=customerCode);
	document.getElementById("empNamelist").style.display='none';
	//document.data.isCheckedAll.checked=false;
}

function getnetpay()
{ 
	var year=document.getElementById("year").value;
	var month=document.getElementById("month").value;
	var empName=document.getElementById("empName").value;
	var paydays=document.getElementById("paydays").value;
	var basic=document.getElementById("basic").value;
	var allow=document.getElementById("allow").value;
	var allow1=document.getElementById("allow1").value;
	var allow2=document.getElementById("allow2").value;
	var allow3=document.getElementById("allow3").value;
	var allow4=document.getElementById("allow4").value;
	var deduct=document.getElementById("deduct").value;
	var deduct1=document.getElementById("deduct1").value;
	var deduct2=document.getElementById("deduct2").value;
	var deduct3=document.getElementById("deduct3").value;
	var deduct4=document.getElementById("deduct4").value;
	var tds=document.getElementById("tds").value;
	var pIndex=document.getElementById("pIndex").value;
	var Incentive=document.getElementById("Incentive").value;
	var Variable=document.getElementById("Variable").value;prePay
	var prePay=document.getElementById("prePay").value;
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
			var st=reslt.split(",");
			var gross=st[0];
			var net=st[1];
			
			document.getElementById("gross").value=gross;
			document.getElementById("netpay").value=net;
 		
			
		} 
	}
  // alert("end of ajax");
	try{
   var query="?action=edit&year="+year+"&month="+month+"&empName="+empName+"&prePay="+prePay+"&pIndex="+pIndex+"&Incentive="+Incentive+"&Variable="+Variable+"&tds="+tds+"&paydays="+paydays+"&basic="+basic+"&allow="+allow+"&allow1="+allow1+"&allow2="+allow2+"&allow3="+allow3+"&allow4="+allow4+"&deduct="+deduct+"&deduct1="+deduct1+"&deduct2="+deduct2+"&deduct3="+deduct3+"&deduct4="+deduct4;
	ajaxRequest.open("GET","AjaxGetNetpay.jsp" +query ,true);
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
	
	 var query="?empname="+empname;
	ajaxRequest.open("GET", "AjaxGetEmpName.jsp"+query, true);
	ajaxRequest.send(null); 
	
}

function validate()
{//alert("call");
	var empname = document.getElementById("empName").value.replace(/\s/g,"");
	var paydays = document.getElementById("paydays").value.replace(/\s/g,"");
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
	var pIndex = document.getElementById("pIndex").value.replace(/\s/g,"");
	var tds= document.data.tds.value.replace(/\s/g,"");
	var gross = document.getElementById("gross").value.replace(/\s/g,"");
	if(empname.length==0)
	{
		alert("Please Enter the Employee Name ");
		return false;
	}
	if(paydays.length==0)
	{
		alert("Please Enter the Paydays");
		return false;
	}
	if(isNaN(paydays))
	{
	alert("Paydays should be Numaric");
	return false;
	}
	if (paydays >=32 )
    {
		alert("Invalid Paydays ");
    return false;   
  }	 
	if(pIndex.length==0)
	{
		alert("Please Enter the Performance Index %");
		return false;
	}
	if(isNaN(pIndex))
	{
	alert("Performance Index % should be Numaric");
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
	if(tds.length==0)
	{
		alert("Please Enter the TDS %");
		return false;
	}
	if(isNaN(tds))
	{
	alert("TDS should be Numaric");
	return false;
	}
	if(gross.length==0)
	{
		alert("Please Click the Gross Amount");
		return false;
	}
	
	if(isNaN(allow)||isNaN(allow1)||isNaN(allow2)||isNaN(allow3)||isNaN(allow4))
	{
	alert("Allowance Amount should be Numaric");
	return false;
	}
	if(isNaN(deduct)||isNaN(deduct1)||isNaN(deduct2)||isNaN(deduct3)||isNaN(deduct4))
	{
	alert("Deduction Amount should be Numaric");
	return false;
	}
	return true;
}



function show(id) 
{
  //  alert(id);
    if(id=='showallow')
    	{
    document.getElementById("showallow").style.display='none';
    document.getElementById("showallow13").style.display="";
    document.getElementById("showallow1").style.display="";
	document.getElementById("showallow11").style.display="";
	document.getElementById("showallow12").style.display="";
    	}
    
    if(id=='showallow12')
	{
document.getElementById("showallow12").style.display='none';
document.getElementById("showallow13").style.display='none';
document.getElementById("showallow22").style.display="";
document.getElementById("showallow2").style.display="";
document.getElementById("showallow21").style.display="";
	}
    if(id=='showallow22')
	{
    	document.getElementById("showallow23").style.display='none';
document.getElementById("showallow22").style.display='none';
document.getElementById("showallow32").style.display="";
document.getElementById("showallow3").style.display="";
document.getElementById("showallow31").style.display="";
	}
    if(id=='showallow32')
	{
document.getElementById("showallow32").style.display='none';
document.getElementById("showallow33").style.display='none';
document.getElementById("showallow4").style.display="";
document.getElementById("showallow41").style.display="";
	}
    
    
    
    if(id=='showdedct')
	{
document.getElementById("showdedct").style.display='none';
document.getElementById("showdedct13").style.display="";
document.getElementById("showdedct1").style.display="";
document.getElementById("showdedct11").style.display="";
document.getElementById("showdedct12").style.display="";
	}

if(id=='showdedct12')
{
document.getElementById("showdedct12").style.display='none';
document.getElementById("showdedct13").style.display='none';
document.getElementById("showdedct22").style.display="";
document.getElementById("showdedct2").style.display="";
document.getElementById("showdedct21").style.display="";
}
if(id=='showdedct22')
{
	document.getElementById("showdedct23").style.display='none';
document.getElementById("showdedct22").style.display='none';
document.getElementById("showdedct32").style.display="";
document.getElementById("showdedct3").style.display="";
document.getElementById("showdedct31").style.display="";
}
if(id=='showdedct32')
{
document.getElementById("showdedct32").style.display='none';
document.getElementById("showdedct33").style.display='none';
document.getElementById("showdedct4").style.display="";
document.getElementById("showdedct41").style.display="";
}

}


function hide(id) {
	//alert(id);
	if(id=='showallow42')
	{
		document.getElementById("showallow32").style.display="";
		document.getElementById("showallow33").style.display="";
		document.getElementById("showallow4").style.display='none';
		document.getElementById("showallow41").style.display='none';
	}
	
	if(id=='showallow13')
	{
		document.getElementById("showallow13").style.display="none";
	    document.getElementById("showallow").style.display="";
		document.getElementById("showallow12").style.display='none';
		document.getElementById("showallow1").style.display='none';
		document.getElementById("showallow11").style.display='none';
	}
	if(id=='showallow23')
	{
		document.getElementById("showallow13").style.display="";
	    document.getElementById("showallow12").style.display="";
		document.getElementById("showallow22").style.display='none';
		document.getElementById("showallow2").style.display='none';
		document.getElementById("showallow21").style.display='none';
	}
	if(id=='showallow33')
	{   document.getElementById("showallow23").style.display="";
	    document.getElementById("showallow22").style.display="";
		document.getElementById("showallow32").style.display='none';
		document.getElementById("showallow3").style.display='none';
		document.getElementById("showallow31").style.display='none';
	}
//***********************deduction****************
	if(id=='showdedct42')
	{
		document.getElementById("showdedct32").style.display="";
		document.getElementById("showdedct33").style.display="";
		document.getElementById("showdedct4").style.display='none';
		document.getElementById("showdedct41").style.display='none';
	}
	
	if(id=='showdedct13')
	{
		document.getElementById("showdedct13").style.display="none";
	    document.getElementById("showdedct").style.display="";
		document.getElementById("showdedct12").style.display='none';
		document.getElementById("showdedct1").style.display='none';
		document.getElementById("showdedct11").style.display='none';
	}
	if(id=='showdedct23')
	{
		document.getElementById("showdedct13").style.display="";
	    document.getElementById("showdedct12").style.display="";
		document.getElementById("showdedct22").style.display='none';
		document.getElementById("showdedct2").style.display='none';
		document.getElementById("showdedct21").style.display='none';
	}
	if(id=='showdedct33')
	{   document.getElementById("showdedct23").style.display="";
	    document.getElementById("showdedct22").style.display="";
		document.getElementById("showdedct32").style.display='none';
		document.getElementById("showdedct3").style.display='none';
		document.getElementById("showdedct31").style.display='none';
	}
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
	<% Statement st=conn.createStatement();
	      String payno=request.getParameter("payno");		
			String sql="select * from t_payable where PayNo='"+payno+"'";
		    ResultSet rs=st.executeQuery(sql);
		    while(rs.next())
		    {
   %>
	<form
		action="payableData.jsp?action=editpay&PayNo=<%=rs.getString("PayNo") %>"
		method="post" name="data">
		<table bgcolor="#E0DDFE" border="0" height="400" width="600"
			align="center">
			<tr>
				<td align="center"><b><font size="4" color="#151B54">Edit
							Payroll Calculation </font></b></td>
			</tr>
			<% Date curdate=new Date();
int year = Calendar.getInstance().get(Calendar.YEAR);
   %>



			<tr bgcolor="white" align="center" height="50">
				<td><b>Year :</b><select name="year" id="year"
					style="width: 100px" class="select" onclick="getYear();"><div
							id="yyy"></div>
						<%for(int i=year;i>1996;i--){ %>
						<option value="<%=i%>"><%=i%></option>
						<%} %>
				</select>&nbsp;&nbsp;&nbsp;&nbsp; <b>Month :</b> <select name="month"
					id="month" style="width: 100px" class="select">
						<option value="1">January</option>
						<option value="2">February</option>
						<option value="3">March</option>
						<option value="4">April</option>
						<option value="5">May</option>
						<option value="6">June</option>
						<option value="7">July</option>
						<option value="8">August</option>
						<option value="9">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
				</select></td>
			</tr>
			<tr bgcolor="white">
				<td>
					<table border="0" align="center" height="430">

						<tr>
							<td><label id="custype"><b>Contractor Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="empName" id="empName"
								value="<%=rs.getString("contractorName") %>" readonly="readonly"
								style="width: 180px;" autocomplete="off" class="input" value="" />
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
							<td><label id="custype"><b>Payable Days<font
										color="#990000">*</font> :
								</b></label></td>
							<td><input name="paydays" id="paydays" style="width: 120px"
								value="<%=rs.getString("payableDays") %>" class="input" /></td>
							<td><label id="custype"><b>Performance <br>Index
										%<font color="#990000">*</font> :
								</b></label></td>
							<td><input name="pIndex" id="pIndex" style="width: 120px"
								value="<%=rs.getString("perIndex") %>" class="input" /></td>

						</tr>


						<tr>
							<td><label id="custype"><b>Basic <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="basic" id="basic"
								style="width: 120px;" class="input"
								value="<%=rs.getString("basic") %>" /></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Allowance <font
										color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="allow" id="allow"
								style="width: 120px;" class="input"
								value="<%=rs.getString("allowance") %>" /></td>
							<td id="showallow1"><label id="custype"><b>Allowance
										1<font color="#990000"></font> :
								</b></label></td>
							<td id="showallow11"><input type="text" name="allow1"
								id="allow1" style="width: 120px;" class="input"
								value="<%=rs.getString("allowance1") %>" /></td>

						</tr>
						<tr>
							<td id="showallow2"><label id="custype"><b>Allowance
										2<font color="#990000"></font> :
								</b></label></td>
							<td id="showallow21"><input type="text" name="allow2"
								id="allow2" style="width: 120px;" class="input"
								value="<%=rs.getString("allowance2") %>" /></td>

							<td id="showallow3"><label id="custype"><b>
										Allowance 3<font color="#990000"></font> :
								</b></label></td>

							<td id="showallow31"><input type="text" name="allow3"
								id="allow3" style="width: 120px;" class="input"
								value="<%=rs.getString("allowance3") %>" />
						</tr>
						<tr>
							</td>
							<td id="showallow4"><label id="custype"><b>Allowance
										4<font color="#990000"></font> :
								</b></label></td>
							<td id="showallow41"><input type="text" name="allow4"
								id="allow4" style="width: 120px;" class="input"
								value="<%=rs.getString("allowance4") %>" /></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Deduction <font
										color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="deduct" id="deduct"
								style="width: 120px;" class="input"
								value="<%=rs.getString("deduction") %>" /></td>

							<td id="showdedct1"><label id="custype"><b>Deduction
										1<font color="#990000"></font> :
								</b></label></td>
							<td id="showdedct11"><input type="text" name="deduct1"
								id="deduct1" style="width: 120px;" class="input"
								value="<%=rs.getString("deduction1") %>" /></td>
						</tr>
						<tr>
							<td id="showdedct2"><label id="custype"><b>Deduction
										2<font color="#990000"></font> :
								</b></label></td>
							<td id="showdedct21"><input type="text" name="deduct2"
								id="deduct2" style="width: 120px;" class="input"
								value="<%=rs.getString("deduction2") %>" /></td>

							<td id="showdedct3"><label id="custype"><b>
										Deduction 3<font color="#990000"></font> :
								</b></label></td>

							<td id="showdedct31"><input type="text" name="deduct3"
								id="deduct3" style="width: 120px;" class="input"
								value="<%=rs.getString("deduction3") %>" /></td>
						</tr>
						<tr>
							<td id="showdedct4"><label id="custype"><b>Deduction
										4<font color="#990000"></font> :
								</b></label></td>
							<td id="showdedct41"><input type="text" name="deduct4"
								id="deduct4" style="width: 120px;" class="input"
								value="<%=rs.getString("deduction4") %>" /></td>
						</tr>

						<tr>
							<td><label id="custype"><b> Incentive<font
										color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="Incentive" id="Incentive"
								style="width: 120px;" class="input"
								value="<%=rs.getString("deduction4") %>" /></td>
							<td><label id="custype"><b> Variable<font
										color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="Variable" id="Variable"
								style="width: 120px;" class="input"
								value="<%=rs.getString("deduction4") %>" /></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Previous Pay<font
										color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="prePay" id="prePay"
								style="width: 120px;" class="input"
								value="<%=rs.getString("PreviousPay") %>" /></td>
							<td><label id="custype"><b>Tds % : <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="tds" id="tds"
								style="width: 120px;" class="input"
								value="<%=rs.getString("tds") %>" /></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Gross Pay Amount<font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="gross" id="gross"
								value="<%=rs.getString("grosspay") %>"
								onclick="javascript:try{getnetpay();}catch(e){alert(e);}"
								style="width: 120px;" class="input" /></td>

							<td><label id="custype"><b>Net Payable Amount<font
										color="#990000"></font> :
								</b></label></td>
							<td><input type="text" name="netpay" id="netpay"
								value="<%=rs.getString("Netpay") %>"
								onclick="javascript:try{getnetpay();}catch(e){alert(e);}"
								style="width: 120px;" class="input" /></td>
							<%} %>
						
						<tr>
							<td align="center" colspan="4"><input type="submit"
								id="submit1" value="Update" onclick="return validate();"
								style="border: outset;"></td>

						</tr>
						<tr align="left">
							<td align="left" colspan="4"><b>Note :All * Fildes are
									Mandatery .</b></td>
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
