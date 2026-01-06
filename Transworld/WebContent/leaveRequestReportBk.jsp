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
<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/ajax-tooltip.js"></script>
<script src="js/sorttable.js" type="text/javascript"></script>
<title>Transworld - Leave Application</title>


<script type="text/javascript">

function selectAll()
{
	//alert("in select all");
	var cntr=document.leave.cntr.value;
	//alert(cntr);
	cntr=cntr-1;
	//alert(cntr);
	//alert(document.leave.maincb.checked);
	if(document.leave.maincb.checked==true)
	{
		//alert("true value appered");
		for(var j=1;j<=cntr;j++)
		{	

			document.getElementById("cb"+j).checked=true;
		//	alert(document.getElementById("cb"+j).checked);
		}
	}
	else
	{
		
		for(var j=1;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=false;
		}
	}
}

function onSubmit(rid,index)
{
	//alert(rid);
	//alert(index);
	var msg=confirm("To confirm approval,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		document.leave.action=url+"?rid="+rid+"&type=update&index="+index;
		document.leave.submit();
	}
	else
	{
		return false;
	}
}
function onSubmitForNot(rid,index)
{
	//alert(rid);
	//alert(index);
	var msg=confirm("To disconfirm approval,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		document.leave.action=url+"?rid="+rid+"&type=not&index="+index;
		document.leave.submit();
	}
	else
	{
		return false;
	}
}
function onSubmitForCancle(rid,index)
{
	//alert(rid);
	//alert(index);
	var msg=confirm("To cancle leave,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		document.leave.action=url+"?rid="+rid+"&type=cancel&index="+index;
		document.leave.submit();
	}
	else
	{
		return false;
	}
}
function onSubmitForRevert(rid,index)
{
	//alert(rid);
	//alert(index);
	var msg=confirm("To Revert,Please click on OK");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		document.leave.action=url+"?rid="+rid+"&type=revert&index="+index;
		document.leave.submit();
	}
	else
	{
		return false;
	}
}
function submit()
{
	alert("in submit function");
	alert(document.selection.name.value);
	//alert(index);
	
}

</script>
</head>
<body>
	<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DAY_OF_MONTH, 1);

String today1=new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
System.out.println("2dat1======>>"+today1);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
System.out.println("======>>"+today);
%>


	<table border="0" align="left" width="70%">
		<tr>

			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td align="left"><b><font size="4" color="#151B54">Leave
						Application Report</font></b></td>
			<form action="" name="form1" id="form1" method="get">
				<td align="left"><font size="2" color="#16B836"><a
						href="leaveLink.jsp?st=Pending1" style="color: #16B836"
						onclick="getTypePending();">Pending leave</a></font>&nbsp &nbsp <font
					size="2" color="#491FE2"><a
						href="leaveLink.jsp?st=Approved1" style="color: #491FE2"
						onclick="getTypeApprvd();">Approved leave</a></font>&nbsp &nbsp <font
					size="2" color="#E21F25"><a
						href="leaveLink.jsp?st=NotApproved1" style="color: #E21F25"
						onclick="getTypeRejctd();">Rejected leave</a></font>&nbsp&nbsp <font
					size="2" color="#330000"><a href="leaveLink.jsp?st=cancel1"
						style="color: #FF9933" onclick="getTypeCancld();">Canceled
							leave</a></font></td>
				<%
String strLeaveVal=request.getParameter("statLeave");
System.out.println("status+++++++++++++++++++++==================================>>"+strLeaveVal); 
%>
			
		</tr>
	</table>
	<table border="0" align="center">

		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>

		<tr></tr>
		<tr>
			<td align="left"><select name="status">
					<option value="Pending">Pending</option>
					<option value="Approved">Approved</option>
					<option value="NotApproved">Rejected</option>
					<option value="Cancel">Canceled</option>
			</select> &nbsp&nbsp&nbsp&nbsp <input type="text" id="fromDate"
				name="fromDate" size="13" value="<%=today1%>" readonly /> <script
					type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "fromDate",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger"       // ID of the button
			             }
			                           );
			        </script> <input type="text" id="toDate" name="toDate" size="13"
				value="<%=today%>" readonly /> <script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "toDate",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger1"       // ID of the button
			             }
			                           );
            		 </script> <input type="Submit" name="Submit" Value="Submit">
				</form></td>
		</tr>
		<tr>
			<td>
				<%
			
			String data=request.getParameter("status");
			System.out.println("========Data b4========>>"+data);
			if(data==null)//if(data.equals("null"))
			{
				System.out.println("========in IF========>>");
				data=strLeaveVal;
			}
			System.out.println("========Data==========>>>:"+data);
			String fromDate=request.getParameter("fromDate");
			String toDate=request.getParameter("toDate");
			System.out.println(data);
			if(data==null){
				System.out.println("========if==========");
			%>
				<form method="post" name="leave" action="leaveapproved.jsp"
					onsubmit="return validate();">
					<p></p>

					<%
//String uroleofuser=session.getAttribute("urole").toString();
String uroleofuser=session.getAttribute("emprole").toString();
%>
					<table bgcolor="white" border="1" align="center" class="sortable">
						<tr>
							<td><font size="2" color="black"><b>Sn</b></font></td>
							<td><font size="2" color="black"> <b>No Of Days</b></font></td>
							<td><font size="2" color="black"><b>From</b></font></td>
							<td><font size="2" color="black"><b>Type</b></font></td>
							<td><font size="2" color="black"><b>Reason</b></font></td>
							<td><font size="2" color="black"><b>Report on</b></font></td>
							<td><font size="2" color="black"><b>Name</b></font></td>
							<td><font size="2" color="black"><b>Status</b></font></td>
							<td><font size="2" color="black"><b>HOD</b></font></td>
							<td><font size="2" color="black"><b>Action</b></font></td>
							<td><font size="2" color="black"><b>Applied Date</b></font></td>
							<%
	//	if(uroleofuser.equalsIgnoreCase("emp")||uroleofuser.equalsIgnoreCase("HR")){
			%>

							<%	
	//		}else{
		%>


							<%
	//	}
		%>

						</tr>
						<%
//Connection conn,conn1;
Statement st,st1,st2,st3;

//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();

String typevalue=session.getAttribute("empdept").toString();
System.out.println("dept===============>>"+typevalue);
String username=session.getAttribute("email").toString();
System.out.println("username===============>>"+username);
//out.println("typevalue-->"+typevalue);
java.util.Date d= new java.util.Date();
//out.println(d);
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
//out.println(datetoday);
String sql="";
if("emp".equalsIgnoreCase(uroleofuser)){
	sql="select * from t_leaverequest where  TypeValue='"+typevalue+"' and emailid='"+username+"' and status='Pending'";
	
}else if("All".equalsIgnoreCase(typevalue)){
	sql="select * from t_leaverequest where URole='hod' and status='Pending'";
}else{
	sql="select * from t_leaverequest where  TypeValue='"+typevalue+"' and status='Pending'";
}
ResultSet rs=st.executeQuery(sql);
System.out.println("Qry============>>"+sql);
int i=1;
while(rs.next()){
	if(rs.getString("status").equalsIgnoreCase("Pending")){
		System.out.println("Status============>>"+rs.getString("status"));
		System.out.println("srno============>>"+rs.getString("srno"));
	%>
						<tr bgcolor="#AEF8B1">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>"></input>
							<%
	}
	%>


							<td><font size="2" color="black"><%=i %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("daysapplied") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("firstdayofleave") %></font></td>
							<td><font size="2" color="black"><%=(rs.getString("typeofleave")).substring(0, (rs.getString("typeofleave")).length()-6) %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("reasonforleave") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("dateofreporting") %></font></td>
							<td a href=""
								onmouseover="ajax_showTooltip(window.event,'showEmpDetails.jsp?empName=<%=rs.getString("name")%>',this);return false"
								onMouseOut="ajax_hideTooltip();"><font size="2"
								color="black"><%=rs.getString("name")%> </font></td>
							<% if("Approved".equalsIgnoreCase(rs.getString("status"))){
						%>
							<td><font size="2" color="black">Accepted</font></td>
							<%}else if("NotApproved".equalsIgnoreCase(rs.getString("status"))){
							%>
							<td><font size="2" color="black">Rejected</font></td>
							<%
						}else{
							%>
							<td><font size="2" color="black"><%=rs.getString("status") %></font></td>
							<%
						}
	
		String hodname="select Name from t_leaveadmin where Email='"+rs.getString("HOD")+"'";
		ResultSet rsHodname=st1.executeQuery(hodname);
		System.out.println(hodname);
		if(rsHodname.next()){
		%>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rsHodname.getString("Name") %></font>
								</div></td>
							<%}else{
			%>
							<td></td>
							<%
		}
		%>

							<%
		if(uroleofuser.equalsIgnoreCase("emp")||rs.getString("emailid").equalsIgnoreCase(username))
		{
			if((rs.getString("status").equalsIgnoreCase("Pending"))&&(uroleofuser.equalsIgnoreCase("emp") || rs.getString("emailid").equalsIgnoreCase(username)))
			{ 
			%>
							<td><a href="#"
								onclick="return onSubmitForCancle('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Cancel</font></a></td>
							<%
			}
			else
			{
				%><td></td>
							<%
			}
		}
		else
		{ 
							if(rs.getString("status").equalsIgnoreCase("NotApproved") || rs.getString("status").equalsIgnoreCase("Approved"))
							{
								%>
							<td><br>
							<a href="#"
								onclick="return onSubmitForRevert('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Revert</font></a></td>
							<%
							}
							else if(rs.getString("status").equalsIgnoreCase("Cancel"))
							{
								%>
							<td></td>
							<%
							}
							else
							{
								%>
							<td align="center"><a href="#"
								onclick="return onSubmit('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Approve</font></a> <br>
							<a href="#"
								onclick="return onSubmitForNot('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Reject</font></a></td>
							<%
							}
	   } %>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("inserteddatetime") %></font>
								</div></td>
						</tr>

						<%
i++;	
}
%>
						<input type="hidden" name="cntr" value="<%=i%>" />
					</table>
				</form> <%
			}
			else if(data.equals("Pending1") || data.equals("Approved1") || data.equals("NotApproved1") || data.equals("cancel1"))
			{
				//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				System.out.println("========++++++++++++++++++++else if+++++++++++++++++++++++==========");
				%>
				<form method="post" name="leave" action="leaveapproved.jsp"
					onsubmit="return validate();">
					<p></p>

					<%
				//String uroleofuser=session.getAttribute("urole").toString();
				String uroleofuser=session.getAttribute("emprole").toString();
				System.out.println("========"+uroleofuser+"==========");
				%>
					<table bgcolor="white" border="1" align="center" class="sortable">
						<tr>
							<td><font size="2" color="black"><b>Sn</b></font></td>
							<td><font size="2" color="black"> <b>No Of Days</b></font></td>
							<td><font size="2" color="black"><b>From</b></font></td>
							<td><font size="2" color="black"><b>Type</b></font></td>
							<td><font size="2" color="black"><b>Reason</b></font></td>
							<td><font size="2" color="black"><b>Report on</b></font></td>
							<td><font size="2" color="black"><b>Name</b></font></td>
							<td><font size="2" color="black"><b>Status</b></font></td>
							<td><font size="2" color="black"><b>HOD</b></font></td>
							<td><font size="2" color="black"><b>Action</b></font></td>
							<td><font size="2" color="black"><b>Applied Date</b></font></td>
						</tr>
						<%
				Statement st,st1,st2,st3;
				st=conn.createStatement();
				st1=conn.createStatement();
				st2=conn.createStatement();
				st3=conn.createStatement();
				
				String typevalue=session.getAttribute("empdept").toString();
				System.out.println("typevalue=========>>"+typevalue);
				
				String username=session.getAttribute("email").toString();
				java.util.Date d= new java.util.Date();
				String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
				
				//============================
				int len=data.length();
				data=data.substring(0,len-1);
				//============================
				
				String sql="";
				if("emp".equalsIgnoreCase(uroleofuser)){
					sql="select * from db_leaveapplication.t_leaverequest where  TypeValue='"+typevalue+"' and emailid='"+username+"' and Status='"+data+"' order by inserteddatetime desc";
					
				}else if("All".equalsIgnoreCase(typevalue)){
					sql="select * from db_leaveapplication.t_leaverequest where URole='hod' and Status='"+data+"' order by inserteddatetime desc";
				}else{
					sql="select * from db_leaveapplication.t_leaverequest where  TypeValue='"+typevalue+"' and Status='"+data+"' order by inserteddatetime desc";
				}
				ResultSet rs=st.executeQuery(sql);
				System.out.println(sql);
				int i=1;
				while(rs.next()){
					if(rs.getString("status").equalsIgnoreCase("Pending")){
					%>
						<tr bgcolor="#AEF8B1">
							<%
					}else if(rs.getString("status").equalsIgnoreCase("Approved")){
					%>
						
						<tr bgcolor="#C7C1F7">
							<% 
					}else if(rs.getString("status").equalsIgnoreCase("NotApproved")){
						%>
						
						<tr bgcolor="#FB9BA5">
							<%
					}else{
						%>
						
						<tr bgcolor="#FF9933">
							<%
					}
					%>

							<td><input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" /><font size="2" color="black"><%=i %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("daysapplied") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("firstdayofleave") %></font></td>
							<td><font size="2" color="black"><%=(rs.getString("typeofleave")).substring(0, (rs.getString("typeofleave")).length()-6) %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("reasonforleave") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("dateofreporting") %></font></td>
							<td a href=""
								onmouseover="ajax_showTooltip(window.event,'showEmpDetails.jsp?empName=<%=rs.getString("name")%>',this);return false"
								onMouseOut="ajax_hideTooltip();"><font size="2"
								color="black"><%=rs.getString("name")%> </font></td>
							<%
						if("Approved".equalsIgnoreCase(rs.getString("status")))
						{
							%>
							<td><font size="2" color="black">Accepted</font></td>
							<%
						}
						else if("NotApproved".equalsIgnoreCase(rs.getString("status")))
						{
							%>
							<td><font size="2" color="black">Rejected</font></td>
							<%
						}
						else
						{
							%>
							<td><font size="2" color="black"><%=rs.getString("status") %></font></td>
							<%
						}
						
						String hodname="select Name from t_leaveadmin where Email='"+rs.getString("HOD")+"'";
						ResultSet rsHodname=st1.executeQuery(hodname);
						System.out.println(hodname);
						if(rsHodname.next())
						{
							%>
							<td><font size="2" color="black"><%=rsHodname.getString("Name") %></font></td>
							<%
						}
						else
						{
							%>
							<td></td>
							<%
						}
						%>
							<%
						if(uroleofuser.equalsIgnoreCase("emp")||rs.getString("emailid").equalsIgnoreCase(username))
						{
							if((rs.getString("status").equalsIgnoreCase("Pending"))&&(uroleofuser.equalsIgnoreCase("emp") || rs.getString("emailid").equalsIgnoreCase(username)))
							{ 
							%>
							<td><a href="#"
								onclick="return onSubmitForCancle('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Cancel</font></a></td>
							<%
							}
							else
							{
								%><td></td>
							<%
							}
						}
						else
						{ 
							if(rs.getString("status").equalsIgnoreCase("NotApproved") || rs.getString("status").equalsIgnoreCase("Approved"))
							{
								%>
							<td><br>
							<a href="#"
								onclick="return onSubmitForRevert('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Revert</font></a></td>
							<%
							}
							else if(rs.getString("status").equalsIgnoreCase("Cancel"))
							{
								%>
							<td></td>
							<%
							}
							else
							{
								%>
							<td align="center"><a href="#"
								onclick="return onSubmit('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Approve</font></a> <br>
							<a href="#"
								onclick="return onSubmitForNot('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Reject</font></a></td>
							<%
							}
								
						
					   } %>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("inserteddatetime") %></font>
								</div></td>
						</tr>

						<%
				i++;	
				}
				%>
						<input type="hidden" name="cntr" value="<%=i%>" />
					</table>
				</form> <%
			
				//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			}
			else{
				
				System.out.println("========else==========");
				%>
				<form method="post" name="leave" action="leaveapproved.jsp"
					onsubmit="return validate();">
					<p></p>

					<%
				//String uroleofuser=session.getAttribute("urole").toString();
				String uroleofuser=session.getAttribute("emprole").toString();
				System.out.println("========"+uroleofuser+"==========");
				%>
					<table bgcolor="white" border="1" align="center" class="sortable">
						<tr>
							<td><font size="2" color="black"><b>Sn</b></font></td>
							<td><font size="2" color="black"> <b>No Of Days</b></font></td>
							<td><font size="2" color="black"><b>From</b></font></td>
							<td><font size="2" color="black"><b>Type</b></font></td>
							<td><font size="2" color="black"><b>Reason</b></font></td>
							<td><font size="2" color="black"><b>Report on</b></font></td>
							<td><font size="2" color="black"><b>Name</b></font></td>
							<td><font size="2" color="black"><b>Status</b></font></td>
							<td><font size="2" color="black"><b>HOD</b></font></td>
							<td><font size="2" color="black"><b>Action</b></font></td>
							<td><font size="2" color="black"><b>Applied Date</b></font></td>
						</tr>
						<%
		//		Connection conn,conn1;
				Statement st,st1,st2,st3;
	//			conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	//			conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
				st=conn.createStatement();
				st1=conn.createStatement();
				st2=conn.createStatement();
				st3=conn.createStatement();
				
			//	String typevalue=session.getAttribute("typeval").toString();//empdept
				String typevalue=session.getAttribute("empdept").toString();
				System.out.println("typevalue=========>>"+typevalue);
				
			//	String username=session.getAttribute("user").toString();
				String username=session.getAttribute("email").toString();
				//out.println("typevalue-->"+typevalue);
				java.util.Date d= new java.util.Date();
				//out.println(d);
				String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
				//out.println(datetoday);
				String sql="";
				if("emp".equalsIgnoreCase(uroleofuser)){
					sql="select * from db_leaveapplication.t_leaverequest where  TypeValue='"+typevalue+"' and emailid='"+username+"' and Status='"+data+"' and firstdayofleave between '"+fromDate+"' and '"+toDate+"'  ";
					
				}else if("All".equalsIgnoreCase(typevalue)){
					sql="select * from db_leaveapplication.t_leaverequest where URole='hod' and Status='"+data+"' and firstdayofleave between '"+fromDate+"' and '"+toDate+"'  ";
				}else{
					sql="select * from db_leaveapplication.t_leaverequest where  TypeValue='"+typevalue+"' and Status='"+data+"' and firstdayofleave between '"+fromDate+"' and '"+toDate+"' ";
				}
				ResultSet rs=st.executeQuery(sql);
				System.out.println(sql);
				int i=1;
				while(rs.next()){
					if(rs.getString("status").equalsIgnoreCase("Pending")){
					%>
						<tr bgcolor="#AEF8B1">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" />
							<%
					}else if(rs.getString("status").equalsIgnoreCase("Approved")){
					%>
						
						<tr bgcolor="#C7C1F7">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" />
							<% 
					}else if(rs.getString("status").equalsIgnoreCase("NotApproved")){
						%>
						
						<tr bgcolor="#FB9BA5">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" />
							<%
					}else{
						%>
						
						<tr bgcolor="#FF9933">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" />
							<%
					}
					%>
							<td><font size="2" color="black"><%=i %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("daysapplied") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("firstdayofleave") %></font></td>
							<td><font size="2" color="black"><%=(rs.getString("typeofleave")).substring(0, (rs.getString("typeofleave")).length()-6) %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("reasonforleave") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("dateofreporting") %></font></td>
							<td a href=""
								onmouseover="ajax_showTooltip(window.event,'showEmpDetails.jsp?empName=<%=rs.getString("name")%>',this);return false"
								onMouseOut="ajax_hideTooltip();"><font size="2"
								color="black"><%=rs.getString("name")%> </font></td>
							<%
						if("Approved".equalsIgnoreCase(rs.getString("status"))){
						%>
							<td><font size="2" color="black">Accepted</font></td>
							<%}else if("NotApproved".equalsIgnoreCase(rs.getString("status"))){
							%>
							<td><font size="2" color="black">Rejected</font></td>
							<%
						}else{
							%>
							<td><font size="2" color="black"><%=rs.getString("status") %></font></td>
							<%
						}
						String hodname="select Name from t_leaveadmin where Email='"+rs.getString("HOD")+"'";
						ResultSet rsHodname=st1.executeQuery(hodname);
						System.out.println(hodname);
						if(rsHodname.next()){
						%>
							<td><font size="2" color="black"><%=rsHodname.getString("Name") %></font></td>
							<%}else{
							%>
							<td></td>
							<%
						}
						%>

							<%
						if(uroleofuser.equalsIgnoreCase("emp")||rs.getString("emailid").equalsIgnoreCase(username))
						{
							if((rs.getString("status").equalsIgnoreCase("Pending"))&&(uroleofuser.equalsIgnoreCase("emp") || rs.getString("emailid").equalsIgnoreCase(username)))
							{ 
							%>
							<td><a href="#"
								onclick="return onSubmitForCancle('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Cancel</font></a></td>
							<%
							}
							else
							{
								%><td></td>
							<%
							}
						}
						else
						{ 
							if(rs.getString("status").equalsIgnoreCase("NotApproved") || rs.getString("status").equalsIgnoreCase("Approved"))
							{
								%>
							<td><br>
							<a href="#"
								onclick="return onSubmitForRevert('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Revert</font></a></td>
							<%
							}
							else if(rs.getString("status").equalsIgnoreCase("Cancel"))
							{
								%>
							<td></td>
							<%
							}
							else
							{
								%>
							<td align="center"><a href="#"
								onclick="return onSubmit('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Approve</font></a> <br>
							<a href="#"
								onclick="return onSubmitForNot('<%=rs.getString("srno") %>','<%=i%>')"><font
									size="2" color="#09195B">Reject</font></a></td>
							<%
							}
						} %>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("inserteddatetime") %></font>
								</div></td>
						</tr>

						<%
				i++;	
				}
				%>
						<input type="hidden" name="cntr" value="<%=i%>" />
					</table>
				</form> <%
			}
%>
			</td>
		</tr>

	</table>
	<p></p>
</body>
</html>