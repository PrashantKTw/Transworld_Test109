<!-- 
  Module Name : leave application
  Creator : sujata shinde
  Date of Creation : 2011/04/13
  Modifier :
  Date of Modification :
  Reason of Modification :
  Description : Through this page leave is applied-->
<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>

<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<title>Transworld - Leave Application</title>
<script type="text/javascript">
function validate(){
	 //  alert("in validate function");
	 var DaysApplied=document.leave.DaysApplied.value;
	 var name=document.leave.name.value;
	 //  alert(DaysApplied);
     var FirstDayOfLeave=document.leave.FirstDayOfLeave.value;
    // alert(FirstDayOfLeave);
     var reasonForLeave=document.leave.reasonForLeave.value;
  //  alert(reasonForLeave);
     var DateOfReporting= document.leave.DateOfReporting.value;  
   //  alert(DateOfReporting);
     var reason1=document.getElementById("reason1");
     var reason2=document.getElementById("reason2");  
     var reason3=document.getElementById("reason3");    
    if(reason1.checked==true){
    	//alert(reason1.value);
    }else if(reason2.checked==true){
    	// alert(reason2.value);
       }else if(reason3.checked==true){
        	// alert(reason3.value);
            }else{
					alert("Please select radio button");
					return false;
                }
     var Details= document.leave.Details.value;  
     if(DaysApplied==""){
    	 alert("Please enter Number of days requested");
 		return false;
         }

     if(FirstDayOfLeave==""){
    	 alert("Please enter First day of leave");
 		return false;
         }
     
     if(Details==""){
    	 alert("Please enter phone number");
 		return false;
         }else if(Details.length<10)
		{
			alert('Mobile Number must be 10 digits');
		
			return false;
		} 
		else if (Details.length>10) 
		{ 
		   
		   alert("Invalid Mobile Number ");
		
	       return false;
		   
		}else if(isNaN(Details)||Details.indexOf(" ")!=-1){
			//var sss=validateMobile(Details);
			//if(!sss){
			//		alert("enter only numbers");
			//		return false;
			//	}
			alert("Enter numeric value for mobile number");
            return false; 
			}else{
			}
     if(isNaN(DaysApplied)||DaysApplied.indexOf(" ")!=-1){
    	 alert("Enter numeric value for Days Applied");
         return false; 
         }
//     alert(Details);
   

     if(DateOfReporting==""){
    	 alert("Please select Date when reporting / reported ");
 		return false;
         }

     if(reasonForLeave==""){
    	 alert("Please enter Reason for leave ");
 		return false;
         }
     
     var emailAdd= document.leave.emailAdd.value;  
     //alert(emailAdd);
     if(emailAdd=="") 
     {
		alert("Please enter your Email Id");
		return false;
	}
	else
	{
		var sss=validateEmail(emailAdd);
		if(!sss)
			{
				alert("Please enter valid Email Id");
				return false;
			} 
	}
	
     var HODemailAdd= document.leave.HODemailAdd.value;  
     //alert(HODemailAdd);
     if(HODemailAdd=="") 
     {
		alert("Please enter HOD's Email Id");
		return false;
	}
	else
	{
		var sss=validateEmailHOD(HODemailAdd);
		if(!sss)
			{
				alert("Please enter valid HOD's Email Id");
				return false;
			} 
	}
     if(name==""){
    	 alert("Please enter your full name");
 		return false;
         }

     if(emailAdd==HODemailAdd){
 		alert("Please users emailid and HOD's email id should not be equal");
 		return false;
 		}

     return datevalidate();
}
function validateEmail(emailAdd)
{
     var splitted = emailAdd.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}
function validateEmailHOD(HODemailAdd)
{
     var splitted = HODemailAdd.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}
function datevalidate()
{
	
	 var date1=document.leave.FirstDayOfLeave.value;
	// alert(date1);
	 var date2=document.leave.DateOfReporting.value;
	// alert(date2);
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,dd22,yy22;

	yy11=date1.substring(0,4);
	yy22=date2.substring(0,4);
	
//	alert("yy11-->"+yy11+"yy22--->"+yy22);	
	mm1=date1.substring(5,7);
	mm2=date2.substring(5,7);
//	alert("mm1-->"+mm1+"mm2--->"+mm2);	

	
	dd11=date1.substring(8,11);
	dd22=date2.substring(8,11);
	//alert("dd11-->"+dd11+"dd22--->"+dd22);	
	
	if(yy11 > yy22)
	{
		alert("First day of leave year should not be greater than to Date Of Reporting year");
		
		return false;
	}
	else if(yy11==yy22)
	{
		 if(mm1>mm2)
	{
		alert("First day of leave month should not be greater than Date Of Reporting month");
		
		return false;
	}
	}
	if(mm1==mm2) 
	{
		if(yy11==yy22)
		{
		if(dd11 > dd22)
		{
			alert("First day of leave should not be greater than Date Of Reporting");
			
			return false;
		}
		}
	}
	else
		if(yy11<yy22)
		{
			return true;
		}
	else
		if(dd11 > dd22)
	{
			if(mm1<mm2)
			{	//alert("true");
				return true;
			}
			
		alert("First day of leave should not be greater than Date Of Reporting");
		
		return false;
	}
	
	return true;
}
function checkin(){
	alert("now in check in function");
}
</script>
</head>

<p></p>

<table bgcolor="#E0DDFE" border="0" height="500" width="750"
	align="center">
	<tr>
		<td align="center"><b><font size="4" color="#151B54">Transworld
					- Leave Application</font></b></td>
	</tr>

	<%
String IP=request.getParameter("IP");
if(IP==null){
	
}else{
	%>
	<tr>
		<td align="center"><b><font size="3" color="blue"></font></b></td>
	</tr>
	<%
}

String updated="";
updated=request.getParameter("inserted");
System.out.println("updated-->"+updated);
if(updated==null){
	
}
else if(updated.equalsIgnoreCase("yes")){
	%>
	<tr>
		<td align="center"><b><font size="3" color="blue">Leave
					Added Successfully</font></b></td>
	</tr>

	<%
}else if(updated.equalsIgnoreCase("no")){
	%>
	<tr>
		<td align="center"><b><font size="3" color="blue">Leave
					is not added</font></b></td>
	</tr>

	<%
}
// Connection conn,conn1;
Statement st,st1,st2,st3;

// conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
//String username=session.getValue("user").toString();
String username=session.getAttribute("email").toString();
System.out.println(username);
String sql="select * from t_leaveadmin where UName='"+username+"'";
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
	

%>
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
		<td>Please enter your request for leave here. Please note that
			application for leave does not automatically mean your request is
			granted. Provide a reason as detailed as possible. Please obtain
			confirmation in writing from your HOD or person authorised to grant
			leave. In certain circumstances, leave may be revoked or cancelled
			prematurely. Any holiday between two days of leave is counted as
			leave.</td>
	</tr>
	<tr>
		<td>Please refer to all the applicable rules, they are available
			on request from the Accounts and Personnel department. All sick leave
			applications require to be supported by medical certificates. It
			should require about 3 minutes to fill in this form.</td>
	</tr>
	<tr></tr>
	<tr>
		<td>
			<form method="post" name="leave" action="leaveApplicationInsert.jsp"
				onsubmit="return validate();">
				<p></p>

				<table bgcolor="white" border="0" height="400" width="950"
					align="center">
					<tr>
						<td><font color="#990000">* Required</font></td>
					</tr>

					<tr>
						<td><b>Days applied <font color="#990000">*</font></b></td>

						<td><b>First day of leave <font color="#990000">*</font></b>
						</td>
						<td align="right"><b>Type of leave required <font
								color="#990000">*</font></b></td>
					</tr>

					<tr>
						<td><font color="blue">Number of days requested (0.5
								for half day)</font></td>

						<td><font color="blue">Enter first day of leave</font></td>
						<td align="right"><font color="blue">Medical cert reqd
								for sick leave</font></td>
					</tr>
					<tr>
						<td><input type="text" id="DaysApplied" name="DaysApplied"
							value="" /></td>

						<td><input type="text" id="FirstDayOfLeave"
							name="FirstDayOfLeave" size="13" class="formElement" value=""
							readonly class="formElement" /> <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "FirstDayOfLeave",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger"       // ID of the button
               }
                             );
               </script></td>
						<td align="right"><input type="radio" name="reason"
							id="reason1" value="casual leave" />Casual Half or 1 day <input
							type="radio" name="reason" id="reason2" value="long leave" />Long
							leave <input type="radio" name="reason" id="reason3"
							value="sick leave" />Sick leave</td>
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
						<td></td>
					</tr>
					<tr>


						<td><b>Date when reporting / reported <font
								color="#990000">*</font></b></td>
						<td><b>Email address<font color="#990000">*</font></b></td>
						<td align="right"><b>HOD's Email address<font
								color="#990000">*</font></b></td>
					</tr>
					<tr>
						<td><font color="blue">Enter date when reported back
								from leave</font></td>
						<td><font color="blue">Enter your email address</font></td>
						<td align="right"><font color="blue">Enter your HOD's
								email address</font></td>
					</tr>

					<tr>
						<td><input type="text" id="DateOfReporting"
							name="DateOfReporting" size="13" class="formElement" value=""
							readonly class="formElement" /> <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "DateOfReporting",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger"       // ID of the button
               }
                             );
               </script></td>
						<td><input type="text" name="emailAdd" id="emailAdd"
							value="<%=rs.getString("Email") %>" readonly /></td>

						<td align="right"><input type="text" name="HODemailAdd"
							id="HODemailAdd" /></td>
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
						<td></td>
					</tr>





					<tr>
						<td><b>Reason for leave <font color="#990000">*</font></b></td>
						<td><b>Your full name <font color="#990000">*</font></b></td>
						<td align="right"><b>Your phone number <font
								color="#990000">*</font></b></td>
					</tr>
					<tr>
						<td><font color="blue">Give details. In case of sick
								leave, submit medical certificate. </font></td>
						<td><font color="blue">Enter your name</font></td>
						<td align="right"><font color="blue">Enter your mobile
								number</font></td>
					</tr>
					<tr>
						<td><textarea cols="50" rows="5" name="reasonForLeave"></textarea></td>
						<td><input type="text" name="name" id="name"
							value="<%=rs.getString("Name") %>" readonly />
						</textarea></td>

						<td align="right"><input type="text" name="Details"
							id="Details" /></td>
					</tr>


					<tr>
						<td></td>
						<td align="center"><input type="submit" value="Submit" /></td>
					</tr>
				</table>
			</form>
		</td>
		<%} %>
	</tr>

</table>
<p></p>
</body>
</html>