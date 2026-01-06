<%@ page language="java"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Transworld Left Employee Removal</title>
</head>
<script LANGUAGE="JavaScript" type="text/javascript">
function validate()
{
	
	var val2 = document.getElementById("cmpName").value;
	var val3 = document.getElementById("deptName").value;
	var val4 = document.getElementById("empDesg").value;
	var val5 = document.getElementById("empName").value;

	if(val2=="" || val2=="Select")
	{
		alert("Please select the Company Name");
		return false;
	}
	if(val3=="" || val3=="Select")
	{
		alert("Please select the Department");
		return false;
	}
	if(val4=="" || val4=="Select")
	{
		alert("Please select the Employee Designation");
		return false;
	}
	if(val5=="" || val5=="Select")
	{
		alert("Please Select the Employee  Name");
		return false;
	}

    var agree=confirm("Do You Want to Continue?");
    if(agree)
    {
        return true;
    }
    else
    {return false;
    }

	/*var ss=ContinueDeactivate();
	if(!ss)
	{
		return false;
	}*/
	return true;
}


function getDeptData(cmpCode)
{
	    //alert(cmpCode);
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
		  document.getElementById("deptName").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","AjxDeptData.jsp?cmpCode="+cmpCode,true);
		xmlhttp.send(null);
		
}
function getEmpData(EmpDept)
{
	     
        //alert(" In GetEmp Data"+EmpDept);
        var desg=document.empremove.empDesg.value;
        //alert(desg);
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
		  document.getElementById("empName").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","AjxEmpData.jsp?EmpDept="+EmpDept+"&desg="+desg,true);
		xmlhttp.send(null);
	
}
function getEmpFullData(EmpName)
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
		xmlhttp.open("GET","AjxEmpFullData.jsp?EmpName="+EmpName,true);
		xmlhttp.send(null);
		xmlhttp.onreadystatechange=function()
		{
		  if(xmlhttp.readyState==4)
		  {
	         //alert(xmlhttp.responseText);
	          var reslt=xmlhttp.responseText;
	        // alert(reslt);
             var data=reslt.split("##");
             //alert(data);
             document.empremove.empId.value = data[1];
             document.empremove.fName.value = data[2];
             document.empremove.mName.value = data[3];
             document.empremove.lName.value = data[4];
             document.empremove.email.value = data[5];
        
		  }
		}
		
}
</script>
<body>
	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
String desg="";
%>
	<br>
	<br>
	<form name="empremove" action="EmpRemoveData.jsp" method="post">
		<table bgcolor="#E0DDFE" border="0" height="400" width="450"
			align="center">
			<tr>
				<td align="center"><b><font size="4" color="#151B54">
							Employee Removal Form</font></b></td>
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
							<td><label id="custype"><b>Employee Designation
										<font color="#990000">*</font> :
								</b></label></td>
							<td><select name="empDesg" id="empDesg" class="formElement">
									<option value="Select">Select</option>
									<option value="hod">HOD</option>
									<option value="emp">Employee</option>
							</select></td>
						</tr>

						<tr>
							<td><label id="custype"><b>Department Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><select name="deptName" id="deptName"
								class="formElement" onchange="getEmpData(this.value);"></select>
							</td>
						</tr>
						<tr>
							<td><label id="custype"><b>Employee Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><select name="empName" id="empName" class="formElement"
								onchange="getEmpFullData(this.value);">

							</select></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Employee ID <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="empId" id="empId" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>

						<tr>
							<td></td>
						</tr>

						<tr>
							<td></td>
						</tr>

						<tr>
							<td></td>
						</tr>

						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>First Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="fName" id="fName" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Middle Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="mName" id="mName" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Last Name <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="lName" id="lName" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Email <font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="email" id="email" /></td>
						</tr>
						<tr>
							<td></td>
						</tr>


					</table>
					<table align="center">
						<tr>
							<td align="center"><input type="submit" id="submit1"
								value="Deactivate" onclick="return validate();"></td>
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