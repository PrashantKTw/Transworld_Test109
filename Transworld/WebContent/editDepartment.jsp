<%@ page language="java"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transworld Edit Department</title>

<script LANGUAGE="JavaScript" type="text/javascript">

function getsupplierDetails(i)
{
	//alert("IN ON CLICK   "+document.getElementById("hodname"+i).value);
	document.getElementById("hod").value=document.getElementById("hodname"+i).value;
	document.getElementById("supplierList").style.visibility='hidden'; 

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
/*function getDeptData(cmpCode)
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
		
}*/
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
	
}//

function checkDuplicatedeptname(deptName)
{
	var cmpName = document.getElementById("cmpcode").value;
	
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
				document.getElementById("dept").value="";
				//document.getElementById("accountno").value="";
				alert("Department already present!");
				document.getElementById("dept").focus();
				
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


</script>

</head>
<body>
	<%
	Statement st1 = conn.createStatement();
	Statement st2 = conn.createStatement();
	Statement st3 = conn.createStatement();
%>
	<br>
	<br>
	<form action="EditDepartmentData.jsp" method="post">
		<table bgcolor="#E0DDFE" border="0" height="200" width="500"
			align="center">
			<tr>
				<td align="center"><b><font size="4" color="#151B54">Edit
							Department</font></b></td>
			</tr>
			<tr>
				<%
			String sendMsg = request.getParameter("sendMsg");
			if (!(sendMsg == null)) {
		%>
				<td align="center"><b><font size="2" color="#151B54"><%=sendMsg%></font></b>
				</td>
				<%
			}
		%>
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
							<td><input type="text" name="cmpName" id="cmpName"
								readonly="readonly"
								value="<%=request.getParameter("companyname")%>" /><input
								type="hidden" name="cmpcode" id="cmpcode"
								value="<%=request.getParameter("companycode")%>" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Department Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="dept" id="dept"
								onblur="checkDuplicatedeptname(this.value);"
								value="<%=request.getParameter("deptname")%>" /> <input
								type="hidden" name="deptcode" id="deptcode"
								value="<%=request.getParameter("dptcode")%>" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Under Department <font
										color="#990000">*</font> :
								</b></label></td>

							<td><select name="underDept" id="underDept"
								class="formElement"><%=request.getParameter("udeptname")%>
									<%
				String cmpCd=request.getParameter("companycode");
				String sqlDept="select * from t_department where ComapanyCode="+cmpCd+"  and status='Active' ORDER BY `DeptName` ASC";
				ResultSet rsDept=st1.executeQuery(sqlDept);%>
									<option
										value="<%=request.getParameter("udeptcode")+","+cmpCd%>"><%=request.getParameter("udeptname")%></option>
									<%
				while(rsDept.next())
	{ 
		%>
									<option value="<%=rsDept.getInt("DeptCode")+","+cmpCd %>">
										<%=rsDept.getString("DeptName") %>
									</option>
									<%
	}
		%>
							</select></td>

						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>HOD Name <font
										color="#990000">*</font> :
								</b></label></td>

							<td><input type="text" name="hod" id="hod"
								value="<%= request.getParameter("hod")%>"
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



							<!--				<td>-->
							<!--					<div id="hod"></div>-->
							<!--				</td>-->
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Status <font
										color="#990000">*</font> :
								</b></label></td>
							<!--				<td>-->
							<!--					<input type="text" name="sd1" id="sd1" readonly="readonly" value=""/>-->
							<!--				</td>-->
							<td><select name="status" id="status" class="formElement">
									<option value="<%= request.getParameter("status")%>"><%= request.getParameter("status")%></option>
									<option value="Active">Activate</option>
									<option value="Deactive">DeActivate</option>
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
	<div id="footer">
		<p>
			<a href="http://www.myfleetview.com"> Copyright &copy; 2009 by
				Transworld Compressor Technologies Ltd. All Rights Reserved.</a>
		</p>
	</div>
</body>
</html>