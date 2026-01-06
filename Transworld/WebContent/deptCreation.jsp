<%@ page language="java"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transworld Department Creation</title>

<script LANGUAGE="JavaScript" type="text/javascript">

function getsupplierDetails(i)
{
	//alert("IN ON CLICK   "+document.getElementById("hodname"+i).value);
	document.getElementById("hod").value=document.getElementById("hodname"+i).value;
	document.getElementById("supplierList").style.visibility='hidden'; 

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

function getHodName(hodname)
{
	document.getElementById("supplierList").style.display='block';
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
	  var reslt=xmlhttp.responseText;
	  //document.getElementById("hod").innerHTML=xmlhttp.responseText;
	  document.getElementById("supplierList").innerHTML=reslt;
	  }
	}
	xmlhttp.open("GET","AjxHodNameData.jsp?hodname="+hodname,true);
	xmlhttp.send(null);
	
}


function checkDuplicatedeptname(deptName)
{
	var cmpName = document.getElementById("cmpName").value;
	
		//alert("IN  duplicate FUINCTIOn");
		 
		if( deptName !="")
		{ 
		var ajaxRequest;  // The variable that makes Ajax possible!

		try
		{
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

	// Create a function that will receive data sent from the server0
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
			//alert("result-->"+reslt);
			reslt=reslt.replace(/^\s+|\s+$/g,"");
			//alert("result trim-->"+reslt);
			if(reslt=="yes")
			{
				document.getElementById("deptName").value="";
				//document.getElementById("accountno").value="";
				alert("Department already present!");
				document.getElementById("deptName").focus();
				
				return false;
				
			}else
			{
			}
			
			
			

		} 
	}
	
	 var queryString ="?deptName=" +deptName+"&cmpName="+cmpName;
	 ajaxRequest.open("GET", "ajaxDuplicatedeptname.jsp" + queryString, true);
	 ajaxRequest.send(null); 

		}//end of if
		else
		{
			//document.getElementById("accountno").value="";
			alert("Department Name is Empty");
			//document.getElementById("supplier").focus();
			return false;
		}
		
	}	//end ajax function

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
	<form name="departmentCreation" action="deptData.jsp" method="post">
		<table bgcolor="#E0DDFE" border="0" height="200" width="400"
			align="center">
			<tr>
				<td align="center"><b><font size="4" color="#151B54">Create
							New Department</font></b></td>
			</tr>
			<tr>
				<td align="center">
					<%String sendMsg=request.getParameter("sendMsg");
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
							<td><input type="text" name="deptName" id="deptName"
								onblur="checkDuplicatedeptname(this.value);" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Under Department <font
										color="#990000">*</font> :
								</b></label></td>
							<td><select name="underDept" id="underDept"
								class="formElement"></select> <input type="hidden" name="uD"
								id="uD"></input></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>HOD Name <font
										color="#990000">*</font> :
								</b></label></td>
							<!--				<td>
					<select name="hod" id="hod" class="formElement"></select>
			<input type="text" name="hod" id="hod" onblur="getHodName(this.value);" />
				</td>-->
							<td><input type="text" name="hod" id="hod" value=""
								onkeyup="getHodName(this.value);" style='height: 15px;' /></td>
							<td>
								<div style="position: absolute;">
									<table>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td>
												<div id='supplierList'></div>
											</td>
										</tr>
									</table>
								</div>
							</td>
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
	<div id="footer">
		<p>
			<a href="http://www.myfleetview.com"> Copyright &copy; 2009 by
				Transworld Compressor Technologies Ltd. All Rights Reserved.</a>
		</p>
	</div>
</body>
</html>