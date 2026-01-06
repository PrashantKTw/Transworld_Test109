<%@ page language="java"%>
<%@ include file="header.jsp"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/cpanel_002.css" rel="stylesheet" type="text/css" />
<title>Transworld Employee Registration</title>
</head>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script LANGUAGE="JavaScript" type="text/javascript">


function is_valid_url(url)
{   return url.match(/^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/);
    
}

function validate()
{//alert("call");
	
	var compName = document.getElementById("compName").value;
	var compAdd= document.getElementById("compAdd").value;
	var compGdAdd = document.getElementById("compGdAdd").value;
	var phNo = document.getElementById("phNo").value;
	var faxNo = document.getElementById("faxNo").value;
	var pNo = document.getElementById("pNo").value;
	var email = document.getElementById("email").value;
	var compBstNO =document.getElementById("compBstno").value;
	
	var compCstNO= document.getElementById("compCstno").value;
	var website= document.getElementById("website").value;
	var letters = /^[A-Za-z 1-9 ]+$/;  
	
	compAdd=compAdd.replace(/\s/g,"");
	compGdAdd=compGdAdd.replace(/\s/g,"");
	compName=compName.replace(/\s/g,"");
	phNo=phNo.replace(/\s/g,"");
	faxNo=faxNo.replace(/\s/g,"");
	pNo=pNo.replace(/\s/g,"");
	email=email.replace(/\s/g,"");
	compBstNO=compBstNO.replace(/\s/g,"");
	compCstNO=compCstNO.replace(/\s/g,"");
	website=website.replace(/\s/g,"");
	
	if(compName.length==0)
	{
		alert("Please Enter the Company Name");
		return false;
	}
	
	if(!isNaN(compName))
	{
	
	alert("Invalid name");
	return false;
	}
	
	if(phNo.length==0)
	{
		alert("Please Enter Phone Number");
		return false;
	}
	
	if(isNaN(phNo))
	{
	alert("Enter the Valid Phone Number");
	return false;
	}

	 if (phNo.length<10 || phNo.length>=14)
    {
		alert("The Phone number should be atleast 10 digit and maximum 13 digit ");
    return false;   
  }	 

	
	if(compAdd.length==0)
	{   
		alert("Please Enter the Company Address");
		return false;
    }
	
	if(compGdAdd.length==0)
	{
		alert("Please Enter the Company Godown Address");
		return false;
	}
	
	if(compBstNO.length==0)
	{
		alert("Please Enter the Company BST No.");
		return false;
	}
	
	if(isNaN(compBstNO))
		{
		
		alert("Enter Numaric Value for BSTNO Number");
		return false;
		}
	
	if (compBstNO.length>=11 )
    {
		alert("BST number's maximum limit is 10 Digit ");
    return false;   
  }	 
	
	if(compCstNO.length==0)
	{
		alert("Please Enter the Company CST NO.");
		return false;
	}
	
	if(isNaN(compCstNO))
	{
		alert("Enter Numaric Value for CSTNO Number.");
		return false;
	}
	
	if (compCstNO.length>=11 )
    {
		alert("CST number's maximum limit is 10 Digit ");
    return false;   
  }	 
	
	if(pNo.length==0)
	{
		alert("Please Enter the Pan Number");
		return false;
	}
	var letters1=letters.test(pNo);
    if(letters1==false)
     {     
        alert('Pan Cord No must have characters & Number only');    
       return false;  
      }  
	if(pNo.length>=10)
	{
		alert("PAN no should not be more than 10 digit");
		return false;
	}
		 
	if(faxNo.length==0)
	{
		alert("Please Enter the Fax Number");
		return false;
	}
	if(isNaN(faxNo))
	{
	alert("Please Enter the valid Fax number");
	return false;
	}

	 if (faxNo.length< 10 || faxNo.length>=14)
	    {
			alert("The Fax number should be atleast 10 digit and maximum 13 digit ");
	    return false;   
	  }	 
	
	
	if(email.length==0)
	{
		alert("Please Enter the Email ID");
		return false;
	}
	else
	{
		// var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{1,3})+\.)+([a-zA-Z0-9]{2,4})+$/;
		 var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    if (!filter.test(email)) {
		    alert('Please provide a valid email ID');
		    email.focus;
		    return false;
	} 
	}
	if(website.length==0)
	{
		alert("Please Enter the Website");
		return false;
	}
	else
	{
		var url=is_valid_url(website);
		if(!url)
			{
			   alert("Please Enter valid website URL");
			   return false;
			}
	}
	
	return true;
}


</script>
<body>
	<%


Date today = new Date();
String date=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

%>
	<br>
	<br>
	<form action="insertCompDet.jsp?action=Company" method="post"
		name="data">
		<div align="center">
			<table bgcolor="#E0DDFE" border="0" height="350" width="800"
				align="center">
				<tr>
					<td align="center"><b><font size="4" color="#151B54">Create
								Company Form</font></b></td>
				</tr>

				<tr bgcolor="white">
					<td>
						<table border="0" align="center" height="280">
							<tr>
								<td><label id="custype"><b>Company Name <font
											color="#990000">*</font> :
									</b></label></td>
								<td><input type="text" name="compName" id="compName"
									style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
								</td>
								<td><label id="custype"><b>&nbsp;&nbsp;&nbsp;&nbsp;Phone
											Number<font color="#990000">*</font> :
									</b></label></td>
								<td><input type="text" name="phNo" id="phNo"
									style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
								</td>

							</tr>

							<tr>
								<td><label id="custype"><b>Company Address <font
											color="#990000">*</font> :
									</b></label></td>
								<td><textarea name="compAdd" id="compAdd"
										style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;"> </textarea>
								</td>

								<td><label id="custype"><b>&nbsp;&nbsp;&nbsp;&nbsp;Company
											Godown Address <font color="#990000">*</font> :
									</b></label></td>
								<td><textarea name="compGdAdd" id="compGdAdd"
										style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;"></textarea>
								</td>
							</tr>


							<tr>
								<td><label id="custype"><b>Company BST No.<font
											color="#990000">*</font> :
									</b></label></td>
								<td><input type="text" name="compBstno" id="compBstno"
									style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
								</td>

								<td><label id="custype"><b>&nbsp;&nbsp;&nbsp;&nbsp;Company
											CST No.<font color="#990000">*</font> :
									</b></label></td>
								<td><input type="text" name="compCstno" id="compCstno"
									style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
								</td>
							</tr>

							<tr>
								<td><label id="custype"><b>Pan Number<font
											color="#990000">*</font> :
									</b></label></td>
								<td><input type="text" name="pNo" id="pNo"
									style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
								</td>


								<td><label id="custype"><b>&nbsp;&nbsp;&nbsp;&nbsp;Fax
											Number<font color="#990000">*</font> :
									</b></label></td>
								<td><input type="text" name="faxNo" id="faxNo"
									style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
								</td>
							</tr>


							<tr>
								<td><label id="custype"><b>Email<font
											color="#990000">*</font> :
									</b></label></td>
								<td><input type="text" name="email" id="email"
									style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
								</td>
								<td><label id="custype"><b>
											&nbsp;&nbsp;&nbsp;&nbsp;Website<font color="#990000">*</font>
											:
									</b></label></td>
								<td><input type="text" name="website" id="website"
									style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
								</td>
							</tr>

						</table>
						<table align="center" width="100%">
							<tr>
								<td align="center"><input type="submit" id="submit"
									value="Submit"
									onclick="javascript:try{return validate();}catch(e){alert(e)}"
									style="border: outset;">
								</div></td>
							</tr>
						</table> <br>
					</td>
				</tr>

			</table>
		</div>
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