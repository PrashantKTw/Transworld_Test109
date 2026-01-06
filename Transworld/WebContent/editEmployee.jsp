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
</script>
</head>


<table border="0" height="400" width="650" align="center">
	<tr>
		<td align="center"><b><font size="4" color="#151B54">Edit
					Employee</font></b></td>
	</tr>
	<%
//Connection conn,conn1;
Statement st,st1,st2,st3;

//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();

String username=session.getAttribute("email").toString();

System.out.println(username);
String sql="select * from t_leaveadmin where UName='"+username+"'";
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
	

%>
	<tr>
		<td>
			<form method="post" name="leave" action="inserteditemp.jsp"
				onsubmit="return validate();">

				<table bgcolor="white" border="0" height="300" width="400"
					align="center">

					<%
String updated="",already="";
updated=request.getParameter("inserted");
System.out.println("updated-->"+updated);
already=request.getParameter("already");
System.out.println("updated-->"+updated);
if(already==null){
	
}else if(already.equalsIgnoreCase("yes")){
	%>
					<tr>
						<td align="center"><b><font size="3" color="blue">Employee
									ID is already exist</font></b></td>
					</tr>

					<%	
}
if(updated==null){
	
}
else if(updated.equalsIgnoreCase("yes")){
	%>
					<tr>
						<td align="center"><b><font size="2" color="blue">Employee
									Edited Successfully</font></b></td>
					</tr>

					<%
}
//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();

System.out.println(username);
String sql11="select * from t_leaveadmin where UName='"+username+"'";
ResultSet rs11=st.executeQuery(sql11);
if(rs11.next()){
	

%>
					<tr>
						<td>
							<form method="post" name="leave" action="addEmployeeInsert.jsp"
								onsubmit="return validate();">

								<table bgcolor="white" border="0" height="300" width="600"
									align="center">
									<tr>
										<td align="left"><font color="#990000">* Required</font></td>
									</tr>
									<tr>
										<td align="center"><table>
												<tr>
													<td><b>Employee ID<font color="#990000">*</font></b></td>
												</tr>
												<tr>
													<td><font color="blue">Please enter employees
															ID</font></td>
												</tr>
												<tr>
													<td><input type="text" id="empid" name="empid"
														value="<%=rs11.getString("empid")%>" /> <input
														type="hidden" id="username" name="username"
														value="<%=username%>" /></td>
												</tr>
											</table></td>
										<td align="center"><table>
												<tr>
													<td><b>Full Name<font color="#990000">*</font></b></td>
												</tr>
												<tr>
													<td><font color="blue">Please enter employees
															full name</font></td>
												</tr>
												<tr>
													<td><input type="text" id="name" name="name"
														value="<%=rs11.getString("Name")%>" /></td>
												</tr>
											</table></td>
									</tr>

									<tr>
										<td align="center"><table>
												<tr>
													<td><b>Type Of User<font color="#990000">*</font></b>
													</td>
												</tr>

												<tr>
													<td><input type="radio" name="reason" id="reason1"
														value="emp" />Employee</td>
												</tr>
												<tr>
													<td><input type="radio" name="reason" id="reason2"
														value="hod" />HOD</td>
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
											</table></td>

										<td align="center"><table>
												<tr>
													<td><b>Type Of Department<font color="#990000">*</font></b>
													</td>
												</tr>

												<tr>
													<td><input type="radio" name="reason11" id="reason11"
														value="Software" />Software</td>
												</tr>
												<tr>
													<td><input type="radio" name="reason11" id="reason12"
														value="RnD" />R&D</td>
												</tr>
												<tr>
													<td><input type="radio" name="reason11" id="reason13"
														value="Service" />Service</td>
												</tr>
												<tr>
													<td><input type="radio" name="reason11" id="reason14"
														value="Accounts" />Accounts</td>
												</tr>
												<tr>
													<td><input type="radio" name="reason11" id="reason15"
														value="Sales&Marketing" />Sales & Marketing</td>
												</tr>
												<tr>
													<td><input type="radio" name="reason11" id="reason16"
														value="Production" />Production</td>
												</tr>
											</table></td>
									</tr>

									<tr>
										<td align="right"><input type="submit" value="Submit" /></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>

				</table>
			</form>
		</td>
		<%}} %>
	</tr>

</table>
<p></p>
</body>
</html>