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
<script src="sorttable.js" type="text/javascript"></script>
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
        	 var v2=dropdown.value;
             //alert(v2);
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
                         
                   // Create a function that will receive data sent from the server
                     ajaxRequest.onreadystatechange = function()
                     {
              	       if(ajaxRequest.readyState == 4)
                         {
                               var reslt=ajaxRequest.responseText;

                               reslt = reslt.replace(/^\s+|\s+$/g,"");//trim
                             //  alert(reslt);
                               document.unitaddform.limit.value=reslt;
                              // document.getElementById("limit").value=reslt;
     
          	     		  } 
                     }
                     
           
                    var queryString = "?rid="+rid+"&type=update&index="+index;
          	   ajaxRequest.open("GET", "leaveapproved.jsp" + queryString, true);
          	   ajaxRequest.send(null); 

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
		document.leave.action=url+"?rid="+rid+"&type=cancle&index="+index;
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
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
	<p></p>
	<p></p>
	<table border="0" align="center">
		<tr>
			<td align="center"><b><font size="6" color="#151B54">Transworld
						- Leave Application Report</font></b></td>
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
			<td><font size="2" color="#16B836">Pending leave </font>&nbsp
				&nbsp <font size="2" color="#491FE2">Accepted leave </font>&nbsp
				&nbsp <font size="2" color="#E21F25">Rejected leave</font>&nbsp&nbsp
				<font size="2" color="#F6E712">Canceled leave </font></td>
		</tr>
		<tr></tr>
		<tr>
			<td align="center">
				<form action="" name="form1" id="form1" method="get">

					<select name="status">
						<option value="Pending">Pending</option>
						<option value="Approved">Approved</option>
						<option value="NotApproved">Not Approved</option>
						<option value="Cancel">Cancled</option>
					</select>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input type="text" id="fromDate" name="fromDate" size="13"
						value="<%=today%>" readonly />
					<script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "fromDate",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger"       // ID of the button
			             }
			                           );
			        </script>
					<input type="text" id="toDate" name="toDate" size="13"
						value="<%=today%>" readonly />
					<script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "toDate",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger1"       // ID of the button
			             }
			                           );
            		 </script>

					<input type="Submit" name="Submit" Value="Submit">
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<%
			
			String data=request.getParameter("status");
			String fromDate=request.getParameter("fromDate");
			String toDate=request.getParameter("toDate");
			System.out.println(data);
			if(data==null){
			%>
				<form method="post" name="leave" action="leaveapproved.jsp"
					onsubmit="return validate();">
					<p></p>

					<%
String uroleofuser=session.getAttribute("emprole").toString();
%>
					<table bgcolor="white" border="1" align="center" class="sortable">
						<tr>
							<td><div align="center">
									<input type="checkbox" name="maincb" value="maincb"
										onClick="selectAll();" />
								</div> <select name="values"
								onChange="if(this.options[this.selectedIndex].value) window.location.href=this.options[this.selectedIndex].value;">
									<option>Accept</option>
									<option value="reject">Reject</option>
							</select></td>
							<td><font size="2" color="black"><b>Sr no</b></font></td>
							<td><font size="2" color="black"> <b>Days applied
								</b></font></td>
							<td><font size="2" color="black"><b>From</b></font></td>
							<td><font size="2" color="black"><b>Type of leave</b></font></td>
							<td><font size="2" color="black"><b>Reason</b></font></td>
							<td><font size="2" color="black"><b>Report on</b></font></td>
							<td><font size="2" color="black"><b>Name</b></font></td>
							<td><font size="2" color="black"><b>Contact</b></font></td>
							<td><font size="2" color="black"><b>Status</b></font></td>
							<td><font size="2" color="black"><b>HOD</b></font></td>
							<td><font size="2" color="black"><b>Applied Date</b></font></td>
						</tr>
						<%
Statement st,st1,st2,st3;

st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();

String typevalue=session.getAttribute("empdept").toString();

System.out.println(typevalue);
String username=session.getAttribute("email").toString();
//out.println("typevalue-->"+typevalue);
java.util.Date d= new java.util.Date();
//out.println(d);
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
//out.println(datetoday);
String sql="";

	sql="select * from t_leaverequest";
ResultSet rs=st.executeQuery(sql);
System.out.println(sql);
int i=1;
while(rs.next()){
	if(rs.getString("status").equalsIgnoreCase("Pending")){
	%>
						<tr bgcolor="#AEF8B1">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>"></input>
							<%
	}else if(rs.getString("status").equalsIgnoreCase("Approved")){
	%>
						
						<tr bgcolor="#C7C1F7">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>"></input>
							<% 
	}else if(rs.getString("status").equalsIgnoreCase("NotApproved")){
		%>
						
						<tr bgcolor="#FB9BA5">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>"></input>
							<%
	}else{
		%>
						
						<tr bgcolor="#FCF6A0">
							<input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>"></input>
							<%
	}
	%>
							<td>
								<div align="center">
									<input type="checkbox" name="cb<%=i%>" id="cb<%=i%>"
										value="cb<%=i%>"> </input>
								</div>
							</td>
							<td><font size="2" color="black"><%=i %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("daysapplied") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("firstdayofleave") %></font></td>
							<td><font size="2" color="black"><%=rs.getString("typeofleave") %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("reasonforleave") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("dateofreporting") %></font></td>
							<td><font size="2" color="black"><%=rs.getString("name") %></font></td>
							<td><font size="2" color="black"><%=rs.getString("details") %></font></td>
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
	
		String hodname="select Name from db_CustomerComplaints.t_leaveadmin where Email='"+rs.getString("HOD")+"'";
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
			}else{
				%>
				<form method="post" name="leave" action="leaveapproved.jsp"
					onsubmit="return validate();">
					<p></p>

					<%
				String uroleofuser=session.getAttribute("emprole").toString();
				%>
					<table bgcolor="white" border="1" align="center" class="sortable">
						<tr>
							<td><div align="center">
									<input type="checkbox" name="maincb" value="maincb"
										onClick="selectAll();" />
								</div></td>
							<td><font size="2" color="black"><b>Sr no</b></font></td>
							<td><font size="2" color="black"> <b>Days applied
								</b></font></td>
							<td><font size="2" color="black"><b>From</b></font></td>
							<td><font size="2" color="black"><b>Type of leave</b></font></td>
							<td><font size="2" color="black"><b>Reason</b></font></td>
							<td><font size="2" color="black"><b>Report on</b></font></td>
							<td><font size="2" color="black"><b>Name</b></font></td>
							<td><font size="2" color="black"><b>Contact</b></font></td>
							<td><font size="2" color="black"><b>Status</b></font></td>
							<td><font size="2" color="black"><b>HOD</b></font></td>
							<td><font size="2" color="black"><b>Applied Date</b></font></td>
						</tr>
						<%
	//			Connection conn,conn1;
				Statement st,st1,st2,st3;
	//			conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	//			conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
				st=conn.createStatement();
				st1=conn.createStatement();
				st2=conn.createStatement();
				st3=conn.createStatement();
				String typevalue=session.getAttribute("empdept").toString();
				System.out.println(typevalue);
				String username=session.getAttribute("email").toString();
				//out.println("typevalue-->"+typevalue);
				java.util.Date d= new java.util.Date();
				//out.println(d);
				String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
				//out.println(datetoday);
				String sql="";
				
					sql="select * from db_leaveapplication.t_leaverequest where Status='"+data+"' and firstdayofleave between '"+fromDate+"' and '"+toDate+"' ";
				ResultSet rs=st.executeQuery(sql);
				System.out.println(sql);
				int i=1;
				while(rs.next()){
					if(rs.getString("status").equalsIgnoreCase("Pending")){
					%>
						<tr bgcolor="#AEF8B1">
							<td><input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" /> <%
					}else if(rs.getString("status").equalsIgnoreCase("Approved")){
					%>
						<tr bgcolor="#C7C1F7">
							<td><input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" /> <% 
					}else if(rs.getString("status").equalsIgnoreCase("NotApproved")){
						%>
						<tr bgcolor="#FB9BA5">
							<td><input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" /> <%
					}else{
						%>
						<tr bgcolor="#FCF6A0">
							<td><input type="hidden" name="rid<%=i%>" id="rid<%=i%>"
								value="<%=rs.getString("srno")%>" /> <%
					}
					%>


								<div align="center">
									<input type="checkbox" name="cb<%=i%>" id="cb<%=i%>"
										value="cb<%=i%>">
								</div></td>
							<td><font size="2" color="black"><%=i %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("daysapplied") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("firstdayofleave") %></font></td>
							<td><font size="2" color="black"><%=rs.getString("typeofleave") %></font></td>
							<td><div align="left" style="overflow: auto; width: 80px;">
									<font size="2" color="black"><%=rs.getString("reasonforleave") %></font>
								</div></td>
							<td><font size="2" color="black"><%=rs.getString("dateofreporting") %></font></td>
							<td><font size="2" color="black"><%=rs.getString("name") %></font></td>
							<td><font size="2" color="black"><%=rs.getString("details") %></font></td>
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
						String hodname="select Name from db_CustomerComplaints.t_leaveadmin where Email='"+rs.getString("HOD")+"'";
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