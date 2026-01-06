<%@ page language="java"%>
<%@ include file="header.jsp"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<style>
 #mainpage {
     display: flex;
     flex-direction: column;
    min-height: 100vh; /* Ensure full viewport height */
    margin: 0;
}

.container-fluid {
    flex: 1; /* Flex grow to push footer to bottom */
}
</style>
<script type="text/javascript">

function showVisitingCardDetailsHod(username,hodid)
{
	 //alert("in fun");
	 document.getElementById("hod").value=username;
	 document.getElementById("hodid").value=hodid;

	 //Changing(username);
	 document.getElementById("userlist").style.visibility='hidden';
	 
}
function getUserHod()
{
	 //alert(" in fun");
	 
	 //alert("1");
	 var uname=document.getElementById("hod").value;
	 //alert("uname..."+uname);

	
		 if(uname.length=="")
			{
			 document.getElementById("userlist").style.visibility="hidden";
			 document.getElementById("hod").value="";
			}
		 else
		 {
			 document.getElementById("userlist").style.visibility='visible';
		 
	 		//alert(username);
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

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				//alert(">>>    "+reslt);
				
				//alert(reslt);
				document.getElementById("userlist").innerHTML=reslt;
			} 
		}
		
		var queryString = "?action=hod&name="+uname;
		//alert(queryString);
		
		ajaxRequest.open("GET", "AjaxGetHOD.jsp" + queryString, true);
		ajaxRequest.send(null); 

		 }//end of else
	 
}

/////////////////////////////////////////////
function getHodDetails(transporter)
{
	//alert("**********************************   ");
	//alert(transporter);
	//alert("**********66666666666 ************   ");
	
	document.getElementById("transporterlist").style.visibility="hidden";
	document.getElementById("reportingto").value=transporter;
	
}

function getHod(num)
{
	try{
	//alert("Hii");
	var b=0;
	var hodName=document.getElementById("reportingto").value;
    if(hodName.length>0)
    {
	document.getElementById("transporterlist").style.visibility="visible";
	//alert(transporter);
	//var user=document.getElementById("usertypevalue").value;
	//var counter=document.leave.counter.value;
	/*if(counter>100)
	{
		counter=0;
	}*/
	if(num==1)
	{
		counter=20;
	}
	else if(num==2)
	{
		counter=0;
	}
	
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
			document.getElementById("transporterlist").innerHTML=reslt;
			var b=document.getElementById("element").value;
			//alert("b "+b);
			document.editempfrm.counter.value=b;
			//alert("counter "+document.editempfrm.counter.value);
			document.editempfrm.counter.value=b*document.editempfrm.counter.value;
			counter=document.editempfrm.counter.value;
			//alert("counter "+counter);
		} 
	};
	var queryString = "?hodName="+hodName+"&limitcount="+counter+"";
	ajaxRequest.open("GET", "AjaxGetHodName.jsp" + queryString, true);
	ajaxRequest.send(null); 
    }
    else
    {
    	document.getElementById("transporterlist").style.visibility="hidden";
    }
	}catch(e)
	{
		//alert(e);
	}
}

</script>
<title>Transworld Contractor Edition</title>

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script LANGUAGE="JavaScript" type="text/javascript">

function validate()
{
	//alert("Inside Validate");
	var name=document.getElementById("Name").value;
	var uname=document.getElementById("UName").value;
	var Email =document.getElementById("Email").value;
	var URole = document.getElementById("URole").checked;
	var URole1 = document.getElementById("URole1").checked;
	//var TypeValue = document.getElementById("TypeValue").value;
	//var weekOff = document.getElementById("weekOff").value;
	var department=document.getElementById("deptName").value;
	var hod =document.getElementById("hod").value;
	//alert("hod"+hod);

//	alert("Inside Validate"+name+"uname"+uname+"typeeeeeeee"+URole+"typpp1"+URole1);
	if(name=="")
	{
		alert("Please Enter the Contractor Name");
		return false;
	}
	if(uname=="")
	{
		
		alert("Please Enter the User Name");
		return false;
	}
	else
	{
		// var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{1,3})+\.)+([a-zA-Z0-9]{2,4})+$/;
		 var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    if (!filter.test(uname)) {
		    alert('Please provide a valid User Name');
		    return false;
					} 
	}

	if(Email=="")
	{
		alert("Please Enter the Email ID");
		return false;
	}
	else
	{
		// var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{1,3})+\.)+([a-zA-Z0-9]{2,4})+$/;
		 var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    if (!filter.test(Email)) {
		    alert('Please provide a valid email ID');
		   
		    return false;
			} 
	}
	if( department == "-1" )
	{
  	alert( "Please Select Department" );
  	return false;
	}
	
	

	if( URole==true )
	{
		//alert("hi");
	}else if(URole1==true)
	{//alert("hi1");
	}else
	{	alert("Please select Type Of User");
		return false;
	}

	if(hod=="")
	{
		alert("Please Enter HOD");
		return false;
	}
	/*
 
 if((!URole.checked) || (!URole1.checked))
	{
	 alert("Please select Type Of User");
	 return false;
 	}
 */
	return true;
}


</script>
</head>
<body>
	<%


//Date today = new Date();
//String date=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
String EmpID="";
String qry=""; 
Statement st =conn.createStatement();
Statement st2 =conn.createStatement();
Statement st3 =conn.createStatement();

String deptname="",deptcode="",ReportingtoHod="";
%>
	<% 

String status=request.getParameter("status");
System.out.println("emp status----->"+status);
if(status.equalsIgnoreCase("Yes"))
{
try
{
	EmpID= request.getParameter("EmpID");
	System.out.println("EmpID"+EmpID);

//qry = "select * from t_leaveadmin where EmpID='"+EmpID+"'";
qry = "select * from t_leaveadmin where EmpID='"+EmpID+"' and status='Yes'";
// and status='Yes'";
//System.out.println("EmpID================"+qry);
ResultSet rs = st.executeQuery(qry);
System.out.println("ROleeeeeeeeeeeeee-->"+qry);
while(rs.next())
{
	
	deptname=rs.getString("TypeValue");
	//System.out.println("deptname-->"+deptname);

	String sqldc="select DeptCode,DeptName from t_department where DeptName='"+deptname+"'";
	//System.out.println("sqldc-->"+sqldc);

    ResultSet rsdc=st3.executeQuery(sqldc);
    if(rsdc.next())
    {
    	deptcode=rsdc.getString("DeptCode");

    }
	//System.out.println("deptcode-->"+deptcode);

  %>

	<br>
	<br>	
<div class="container-fluid" id="mainpage">
	
	<table align="center" width="100%">
<tr>
<td width="30%"></td>
<td width="20%">
	<form name="editempfrm" action="addEmployeeInsert.jsp?action=editemp"
		method="post">
		<table bgcolor="#E0DDFE" border="0" height="350" width="800"
			align="center">

			<tr>
				<td align="center"><b><font size="4" color="#151B54">Edit
							Contractor</font></b></td>
			</tr>

			<tr bgcolor="white">
				<td>
					<table border="0" align="center" height="280">

						<tr>
							<td><label id="custype"><b>Contractor Id<font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="EmpID" id="EmpID"
								readonly="readonly" value="<%=rs.getString("EmpID")%>"
								style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
							</td>
						</tr>
						<tr>
							<td><label id="custype"><b>Contractor Name<font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="Name" id="Name"
								value="<%=rs.getString("Name") %>"
								style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
							</td>
						</tr>
						<tr>
							<td><label id="custype"><b>User Name<font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="UName" id="UName"
								value="<%=rs.getString("UName") %>"
								style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
							</td>
						</tr>
						<tr>
							<td><label id="custype"><b>Email ID<font
										color="#990000">*</font> :
								</b></label></td>
							<td><input type="text" name="Email" id="Email"
								value="<%=rs.getString("Email") %>"
								style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
							</td>
						</tr>
						<tr>
							<td><label id="custype"><b>Type of User<font
										color="#990000">*</font> :
								</b></label></td>
							<!--<td><input type="radio" name="UR"  id="UR" value="contractor" />Contractor1 <input type="radio" name="UR"  id="UR1" value="hod" />HOD1</td>
				-->
							<td>
								<% if(rs.getString("URole").contains("contractor"))
			    {
					System.out.println("ROleeeeeeeeeeeeee-->"+rs.getString("URole"));
			    %> <input type="radio" name="URole" id="URole" value="contractor"
								checked="checked" />Contractor <% 
			    }
			    else
			    { %> <input type="radio" name="URole" id="URole"
								value="contractor" />Contractor <% 
			    }
			    %> <% if(rs.getString("URole").contains("hod"))
			    {	%> <input type="radio" name="URole" id="URole1" value="hod"
								checked="checked" />HOD <% 
			    }
			    else
			    { %> <input type="radio" name="URole" id="URole1" value="hod" />HOD
								<% 
			    }
			    %>

							</td>
						</tr>
						<tr>
							<td style="vertical-align: top;"><label id="custype"><b>Type
										Of Department<font color="#990000">*</font> :
								</b></label></td>

							<td style="vertical-align: bottom;"><select name="deptName"
								id="deptName" class="formElement">
                                <%
                                if(deptname!=null){ %>
                                <option value="<%=deptcode%>"><%=deptname%></option>
							<%  
							Statement st1=conn.createStatement();
							try
							{
								String sqlCat="select DeptCode,DeptName from t_department where status='Active' and DeptName!='"+deptname+"'";
							    ResultSet rsCat=st1.executeQuery(sqlCat);
							    while(rsCat.next())
							    { %>
										<option value="<%=rsCat.getString("DeptCode") %>">
											<%=rsCat.getString("DeptName") %>
										</option>
										<%  } 
							}
							catch(Exception e)
							{
								System.out.println("Exception======>>"+e);
							 } 
                                
                                
                                
                                } 
                                else{
                                %>
									<option value="-1">Select</option>
									<%
						Statement st1=conn.createStatement();
						try
						{
							String sqlCat="select DeptCode,DeptName from t_department where status='Active'";
						    ResultSet rsCat=st1.executeQuery(sqlCat);
						    while(rsCat.next())
						    { %>
									<option value="<%=rsCat.getString("DeptCode") %>">
										<%=rsCat.getString("DeptName") %>
									</option>
									<%  } 
						}
						catch(Exception e)
						{
							System.out.println("Exception======>>"+e);
						 }
						 
						 }%>
							</select></td>
						</tr>
						<%
						String HodName="";
						ReportingtoHod=rs.getString("ReportingtoHod");
				    	//System.out.println("ReportingtoHod----------------->"+ReportingtoHod);

						String sqlhodname="select Name from t_leaveadmin where EmpID='"+ReportingtoHod+"'";
					    ResultSet rshodname=st2.executeQuery(sqlhodname);
					    if(rshodname.next())
					    { 
					    	HodName=rshodname.getString("Name");
					    	//System.out.println("HodName"+HodName);

					    } 
						%>
                                   <tr>
                                      <td><b>HOD:</b><font color="#990000">*</font></td>                     
                                  <td><input type="text" name="hod" id="hod" onkeyup="getUserHod()" value="<%=HodName%>" class="input"/></input></td>
                                   </tr>
                                   
                                     <input type="hidden" name="hodid" id="hodid" value="<%=ReportingtoHod%>"/>
                                   
						<tr>
							<td align="left"><b>Weekly Off<font color="#990000">*</font></b></td>
							<td align="left"><select name="weekOff" id="weekOff"
								class="formElement">
									<% if(rs.getString("weekOff").contains("0"))
			    {	%>

									<option value="0" selected="selected">Sunday</option>
									<option value="1">Monday</option>
									<option value="2">Tuesday</option>
									<option value="3">Wednesday</option>
									<option value="4">Thursday</option>
									<option value="5">Friday</option>
									<option value="6">Saturday</option>

									<%  }%>
									<% if(rs.getString("weekOff").contains("1"))
			    {	%>

									<option value="1" selected="selected">Monday</option>
									<option value="2">Tuesday</option>
									<option value="3">Wednesday</option>
									<option value="4">Thursday</option>
									<option value="5">Friday</option>
									<option value="6">Saturday</option>
									<option value="0">Sunday</option>

									<%  }
			      else if(rs.getString("weekOff").contains("2"))
			    {	%>

									<option value="2" selected="selected">Tuesday</option>
									<option value="3">Wednesday</option>
									<option value="4">Thursday</option>
									<option value="5">Friday</option>
									<option value="6">Saturday</option>
									<option value="0">Sunday</option>
									<option value="1">Monday</option>
									<%  }
			        else if(rs.getString("weekOff").contains("3"))
			    {	%>

									<option value="3" selected="selected">Wednesday</option>
									<option value="4">Thursday</option>
									<option value="5">Friday</option>
									<option value="6">Saturday</option>
									<option value="0">Sunday</option>
									<option value="1">Monday</option>
									<option value="2">Tuesday</option>

									<%  }
			      else if(rs.getString("weekOff").contains("4"))
			    {	%>

									<option value="4" selected="selected">Thursday</option>
									<option value="5">Friday</option>
									<option value="6">Saturday</option>
									<option value="0">Sunday</option>
									<option value="1">Monday</option>
									<option value="2">Tuesday</option>
									<option value="3">Wednesday</option>
									<%  }
			      else if(rs.getString("weekOff").contains("5"))
			    {	%>

									<option value="5" selected="selected">Friday</option>
									<option value="6">Saturday</option>
									<option value="0">Sunday</option>
									<option value="1">Monday</option>
									<option value="2">Tuesday</option>
									<option value="3">Wednesday</option>
									<option value="4">Thursday</option>
									<%  }
			      else if(rs.getString("weekOff").contains("6"))
			    {	%>

									<option value="6" selected="selected">Saturday</option>
									<option value="0">Sunday</option>
									<option value="1">Monday</option>
									<option value="2">Tuesday</option>
									<option value="3">Wednesday</option>
									<option value="4">Thursday</option>
									<option value="5">Friday</option>
									<%  }%>

							</select></td>
						</tr>
						<tr>
							<td><label id="custype"><b>Status <font
										color="#990000">*</font> :
								</b></label></td>
							<!--				<td>-->
							<!--					<input type="text" name="sd1" id="sd1" readonly="readonly" value=""/>-->
							<!--				</td>-->
							<td><select name="status" id="status" class="formElement">
									<%
				String stats=request.getParameter("status");
				String stat="";
				if(stats.equalsIgnoreCase("Yes"))
				{
					stat="Activate";
				}
				else
				{
					stat="DeActivate";
				}
				%>
									<option value="<%= request.getParameter("status")%>"><%=stat%></option>
										<% if(stat.equalsIgnoreCase("Activate")){ %>
											<option value="No">DeActivate</option>
                                     <%}else{ %>
									<option value="Yes">Activate</option>
									<%} %>
							</select></td>
						</tr>
						<!--<tr>
	<td style="vertical-align:top;">
	<b>Reporting to Hod<font  color="#990000">*</font></b>
	</td>
	<td style="vertical-align:top;"><input type="text" id="reportingto" name="reportingto" onkeyup="getHod(1)"  class="input"/></td>
	<td align="left">
<div id='transporterlist' align="left" style="border: thin;">
<div style="height: 110px; width: 300px; overflow: auto;">
<table style="display: none;">
</table>
<input type="hidden" name="counter" id="counter" value="10"/>
  <input type="hidden" name="usertypevalue" id="usertypevalue" value="< %=session.getValue("usertypevaluemain").toString() %>"/>
<input type="hidden" name="counter" id="counter" value="10"/>
<input type="hidden" name="anothercounter" id="anothercounter" value="10"/>
</div>
									
									</div>
									</td>
	</tr>
				
			
			
              -->
						<%} %>
						<%
		
} catch(Exception e){}
}else
{
	//
	try
	{
		EmpID= request.getParameter("EmpID");
		System.out.println("EmpID"+EmpID);

	//qry = "select * from t_leaveadmin where EmpID='"+EmpID+"'";
	qry = "select * from t_leaveadmin where EmpID='"+EmpID+"' and status='No'";
	// and status='Yes'";
	//System.out.println("EmpID================"+qry);
	ResultSet rs = st.executeQuery(qry);
	System.out.println("ROleeeeeeeeeeeeee-->"+qry);
	while(rs.next())
	{
		deptname=rs.getString("TypeValue");
		//System.out.println("deptname-->"+deptname);

		String sqldc="select DeptCode,DeptName from t_department where DeptName='"+deptname+"'";
		//System.out.println("sqldc-->"+sqldc);

	    ResultSet rsdc=st3.executeQuery(sqldc);
	    if(rsdc.next())
	    {
	    	deptcode=rsdc.getString("DeptCode");

	    }
		//System.out.println("deptcode-->"+deptcode);

	  %>

						<br>
						<br>
						<form name="editempfrm"
							action="addEmployeeInsert.jsp?action=editemp" method="post">
							<table bgcolor="#E0DDFE" border="0" height="350" width="800"
								align="center">

								<tr>
									<td align="center"><b><font size="4" color="#151B54">Edit
												Contractor</font></b></td>
								</tr>

								<tr bgcolor="white">
									<td>
										<table border="0" align="center" height="280">

											<tr>
												<td><label id="custype"><b>Contractor Id<font
															color="#990000">*</font> :
													</b></label></td>
												<td><input type="text" name="EmpID" id="EmpID"
													readonly="readonly" value="<%=rs.getString("EmpID")%>"
													style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
												</td>
											</tr>
											<tr>
												<td><label id="custype"><b>Contractor Name<font
															color="#990000">*</font> :
													</b></label></td>
												<td><input type="text" name="Name" id="Name"
													value="<%=rs.getString("Name") %>"
													style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
												</td>
											</tr>
											<tr>
												<td><label id="custype"><b>User Name<font
															color="#990000">*</font> :
													</b></label></td>
												<td><input type="text" name="UName" id="UName"
													value="<%=rs.getString("UName") %>"
													style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
												</td>
											</tr>
											<tr>
												<td><label id="custype"><b>Email ID<font
															color="#990000">*</font> :
													</b></label></td>
												<td><input type="text" name="Email" id="Email"
													value="<%=rs.getString("Email") %>"
													style="width: 200px; padding: 4px 5px 2px 5px; border-color: activeborder; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" />
												</td>
											</tr>
											<tr>
												<td><label id="custype"><b>Type of User<font
															color="#990000">*</font> :
													</b></label></td>
												<!--<td><input type="radio" name="UR"  id="UR" value="contractor" />Contractor1 <input type="radio" name="UR"  id="UR1" value="hod" />HOD1</td>
					-->
												<td>
													<% if(rs.getString("URole").contains("contractor"))
				    {
						System.out.println("ROleeeeeeeeeeeeee-->"+rs.getString("URole"));
				    %> <input type="radio" name="URole" id="URole"
													value="contractor" checked="checked" />Contractor <% 
				    }
				    else
				    { %> <input type="radio" name="URole" id="URole"
													value="contractor" />Contractor <% 
				    }
				    %> <% if(rs.getString("URole").contains("hod"))
				    {	%> <input type="radio" name="URole" id="URole1" value="hod"
													checked="checked" />HOD <% 
				    }
				    else
				    { %> <input type="radio" name="URole" id="URole1" value="hod" />HOD
													<% 
				    }
				    %>

												</td>
											</tr>
											<tr>
												<td style="vertical-align: top;"><label id="custype"><b>Type
															Of Department<font color="#990000">*</font> :
													</b></label></td>

												<td style="vertical-align: bottom;"><select
													name="deptName" id="deptName" class="formElement">
          <%
                                if(deptname!=null){ %>
                                <option value="<%=deptcode%>"><%=deptname%></option>
							<%  
							Statement st1=conn.createStatement();
							try
							{
								String sqlCat="select DeptCode,DeptName from t_department where status='Active' and DeptName!='"+deptname+"'";
							    ResultSet rsCat=st1.executeQuery(sqlCat);
							    while(rsCat.next())
							    { %>
										<option value="<%=rsCat.getString("DeptCode") %>">
											<%=rsCat.getString("DeptName") %>
										</option>
										<%  } 
							}
							catch(Exception e)
							{
								System.out.println("Exception======>>"+e);
							 } 
                                
                                
                                
                                } 
                                else{
                                %>
									<option value="-1">Select</option>
									<%
						Statement st1=conn.createStatement();
						try
						{
							String sqlCat="select DeptCode,DeptName from t_department where status='Active'";
						    ResultSet rsCat=st1.executeQuery(sqlCat);
						    while(rsCat.next())
						    { %>
									<option value="<%=rsCat.getString("DeptCode") %>">
										<%=rsCat.getString("DeptName") %>
									</option>
									<%  } 
						}
						catch(Exception e)
						{
							System.out.println("Exception======>>"+e);
						 }
						 
						 }%>
												</select></td>
											</tr>
												<%
						String HodName="";
						ReportingtoHod=rs.getString("ReportingtoHod");
				    	//System.out.println("ReportingtoHod--------------------->"+ReportingtoHod);

						String sqlhodname="select Name from t_leaveadmin where EmpID='"+ReportingtoHod+"'";
					    ResultSet rshodname=st2.executeQuery(sqlhodname);
					    if(rshodname.next())
					    { 
					    	HodName=rshodname.getString("Name");
					    	//System.out.println("HodName"+HodName);
					    } 
						%>
 <tr>
                                      <td><b>HOD:</b><font color="#990000">*</font></td>                     
                                  <td><input type="text" name="hod" id="hod" onkeyup="getUserHod()" value="<%=HodName%>" class="input"/></input></td>
                                   </tr>
                                 
                                              <input type="hidden" name="hodid" id="hodid" value="<%=ReportingtoHod%>"/>
											<tr>
												<td align="left"><b>Weekly Off<font color="#990000">*</font></b></td>
												<td align="left"><select name="weekOff" id="weekOff"
													class="formElement">
														<% if(rs.getString("weekOff").contains("0"))
				    {	%>

														<option value="0" selected="selected">Sunday</option>
														<option value="1">Monday</option>
														<option value="2">Tuesday</option>
														<option value="3">Wednesday</option>
														<option value="4">Thursday</option>
														<option value="5">Friday</option>
														<option value="6">Saturday</option>

														<%  }%>
														<% if(rs.getString("weekOff").contains("1"))
				    {	%>

														<option value="1" selected="selected">Monday</option>
														<option value="2">Tuesday</option>
														<option value="3">Wednesday</option>
														<option value="4">Thursday</option>
														<option value="5">Friday</option>
														<option value="6">Saturday</option>
														<option value="0">Sunday</option>

														<%  }
				      else if(rs.getString("weekOff").contains("2"))
				    {	%>

														<option value="2" selected="selected">Tuesday</option>
														<option value="3">Wednesday</option>
														<option value="4">Thursday</option>
														<option value="5">Friday</option>
														<option value="6">Saturday</option>
														<option value="0">Sunday</option>
														<option value="1">Monday</option>
														<%  }
				        else if(rs.getString("weekOff").contains("3"))
				    {	%>

														<option value="3" selected="selected">Wednesday</option>
														<option value="4">Thursday</option>
														<option value="5">Friday</option>
														<option value="6">Saturday</option>
														<option value="0">Sunday</option>
														<option value="1">Monday</option>
														<option value="2">Tuesday</option>

														<%  }
				      else if(rs.getString("weekOff").contains("4"))
				    {	%>

														<option value="4" selected="selected">Thursday</option>
														<option value="5">Friday</option>
														<option value="6">Saturday</option>
														<option value="0">Sunday</option>
														<option value="1">Monday</option>
														<option value="2">Tuesday</option>
														<option value="3">Wednesday</option>
														<%  }
				      else if(rs.getString("weekOff").contains("5"))
				    {	%>

														<option value="5" selected="selected">Friday</option>
														<option value="6">Saturday</option>
														<option value="0">Sunday</option>
														<option value="1">Monday</option>
														<option value="2">Tuesday</option>
														<option value="3">Wednesday</option>
														<option value="4">Thursday</option>
														<%  }
				      else if(rs.getString("weekOff").contains("6"))
				    {	%>

														<option value="6" selected="selected">Saturday</option>
														<option value="0">Sunday</option>
														<option value="1">Monday</option>
														<option value="2">Tuesday</option>
														<option value="3">Wednesday</option>
														<option value="4">Thursday</option>
														<option value="5">Friday</option>
														<%  }%>

												</select></td>
											</tr>
											<tr>
												<td><label id="custype"><b>Status <font
															color="#990000">*</font> :
													</b></label></td>
												<!--				<td>-->
												<!--					<input type="text" name="sd1" id="sd1" readonly="readonly" value=""/>-->
												<!--				</td>-->
												<td><select name="status" id="status"
													class="formElement">
														<%
				String stats=request.getParameter("status");
				String stat="";
				if(stats.equalsIgnoreCase("Yes"))
				{
					stat="Activate";
				}
				else
				{
					stat="DeActivate";
				}
				%>
				<option value="<%=request.getParameter("status")%>"><%=stat%></option>
										<% if(stat.equalsIgnoreCase("Activate")){ %>
											<option value="No">DeActivate</option>
                                     <%}else{ %>
									<option value="Yes">Activate</option>
									<%} %>
														
												</select></td>
											</tr>
											<!--<tr>
		<td style="vertical-align:top;">
		<b>Reporting to Hod<font  color="#990000">*</font></b>
		</td>
		<td style="vertical-align:top;"><input type="text" id="reportingto" name="reportingto" onkeyup="getHod(1)"  class="input"/></td>
		<td align="left">
	<div id='transporterlist' align="left" style="border: thin;">
	<div style="height: 110px; width: 300px; overflow: auto;">
	<table style="display: none;">
	</table>
	<input type="hidden" name="counter" id="counter" value="10"/>
	  <input type="hidden" name="usertypevalue" id="usertypevalue" value="< %=session.getValue("usertypevaluemain").toString() %>"/>
	<input type="hidden" name="counter" id="counter" value="10"/>
	<input type="hidden" name="anothercounter" id="anothercounter" value="10"/>
	</div>
										
										</div>
										</td>
		</tr>
					
				
				
	              -->
											<%} %>
											<%
			
	} catch(Exception e){}
	
//	response.sendRedirect("alertGoTo.jsp?msg=Selected Employee is deactvated Please select another&goto=employeeReport.jsp");	
}//end of else
  conn.close();%>

										</table>
										<table align="center">
											<tr>
												<td align="center"><input type="submit" id="submit1"
													value="Update" onclick="return validate();"
													style="border: outset;"></td>
											</tr>
										</table> <br>
									</td>
								</tr>

							</table>
						</form>
						</td>
<td width="10%">
<div>
<table border="0" align="center" style="font-family: arial;font-size:12; border-left: 120px">
<tr><td></td></tr>
  <tr><td>
  <div id='userlist' style="width:160px; height:200px;overflow: auto; background:#94ECF6;border:thin solid black;" >
	</div>
  </td></tr>
</table>
</div>
<script type="text/javascript">document.getElementById("userlist").style.visibility="hidden";</script>

</td>
<td width="20%">
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</td>
</tr>
</table>
</div>

						<br>
						<br>
						<br>
						<%

String sendMsg=request.getParameter("sendMsg");
%>
						<input type="hidden" name="sendMsg" id="sendMsg"
							value="<%=sendMsg %>"></input>
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

						<%}%>

</body>
		<%@ include file="footer.jsp"%>

</html>