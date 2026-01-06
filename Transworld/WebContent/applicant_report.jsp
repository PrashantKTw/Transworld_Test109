<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Applicant Report</title>
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

<script type="text/javascript">


</script>
</head>
<body>
	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st = conn.createStatement();
Statement st5=conn.createStatement();
Statement st6=conn.createStatement();


String datenew1="";
String datenew2="";
if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
}
else
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
%>
	<% 
		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
		String Dept=session.getAttribute("empdept").toString();
		String Role=session.getAttribute("emprole").toString();
		System.out.println("the dept is >>>>>:"+Dept);
		System.out.println("the Role is >>:"+Role);
		
		
%>
	<div
		style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
		<a>Applicant Report</a>
	</div>
	<br>

	<%
if(Dept.equals("Sales&Marketing") || Dept.equals("Service") || Dept.equals("Development") || Dept.equals("RnD") || Dept.equals("Software")) {
%>

	<form name="" method="get">
		<table align="center">
			<tr>
				<td align="left"><b>From&nbsp;&nbsp;</b> <input type="text"
					id="data" name="data" size="12" value="<%=datenew1%>"
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
					readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script></td>

				<td align="left"><b>To&nbsp;&nbsp;</b> <input type="text"
					id="data1" name="data1" size="12" value="<%=datenew2%>"
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
					readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script></td>
				<td bgcolor="#C6DEFF;"><input type="submit" name="submit"
					id="search-submit" value="Go"></td>

			</tr>
		</table>


	</form>
	<br />
	<%
int DeptHod=0;
if(request.getQueryString()!=null) {
	
	try
	{
		
		String SqlDept="Select DeptCode from t_department where DeptName='"+Dept+"'";
		ResultSet rs6= st6.executeQuery(SqlDept);
		
		while(rs6.next())
		  {
			  
			  	DeptHod = rs6.getInt("DeptCode");
			  	System.out.println("the DeptHod is :"+DeptHod);
			  
			  }
	}
	catch(Exception e)
	{
		System.out.println(">>>>>>>>>>>>Exception:"+e);
	}
	
	%>
	<table width="100%" bgcolor="white" align="center" class="sortable"
		style="width: 800px;">
		<tr>
			<td style="background-color: #C6DEFF; width: 5%;" align="center"><font
				size="2" color="black"><b>Sr.</b></font></td>
			<td style="background-color: #C6DEFF; width: 5%;" align="center"><font
				size="2" color="black"><b>ID</b></font></td>
			<td style="background-color: #C6DEFF; width: 35%;" align="center"><font
				size="2" color="black"><b>Applicant Name</b></font></td>
			<td style="background-color: #C6DEFF; width: 20%;" align="center"><font
				size="2" color="black"><b>Contact No</b></font></td>
			<td style="background-color: #C6DEFF; width: 20%;" align="center"><font
				size="2" color="black"><b>Qualification</b></font></td>
			<td style="background-color: #C6DEFF; width: 15%;" align="center"><font
				size="2" color="black"><b>Experience In Months</b></font></td>
		</tr>

		<%
	
	System.out.println(">>>>>>>>>>>>:"+request.getParameter("data1"));
	System.out.println(">>>>>>>>>>>>:"+request.getParameter("data"));
	String to_date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));
	String from_date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));System.out.println("the DeptHod is :"+DeptHod);
	String Query = "select * from t_applicant_details where UpdatedDateTime between '"+from_date+" 00:00:00'  and '"+to_date+" 00:00:00' AND DeptID='"+DeptHod+"'";
	System.out.println("query is :"+Query);
	ResultSet rs = st.executeQuery(Query);
	int i =1;
	while(rs.next()) {
		%>


		<tr>
			<td align="center"><div align="right">
					<font size="2" color="black"><%=i%></font>
				</div></td>
			<%System.out.println("i is:"+i); %>
			<td align="right"><div align="right">
					<font size="2" color="black"><%=rs.getString("EmpID")%></font>
				</div></td>
			<td align="left" width="5"><div align="left">
					<font size="2" color="black"><a
						href="application_report.jsp?emp_id=<%=rs.getString("EmpID")%>"
						target="_blank"><%=rs.getString("Name")%></a></font>
				</div></td>

			<td align="right"><div align="right">
					<font size="2" color="black"><%=rs.getString("ContactNo")%></font>
				</div></td>

			<%
					 String Qual="select Degree from t_empeduqualification where RId in (select Max(RId) from t_empeduqualification where EmpID='"+rs.getString("EmpID")+"')";
					 System.out.println("query is :"+Qual); 
					ResultSet rsq=st1.executeQuery(Qual);
					  if(rsq.next())
					  {
						  %>
			<td><div align="left">
					<font size="2" color="black"><%=rsq.getString("Degree") %></font>
				</div></td>
			<%
						  }
					  else
					  {
					%>
			<td><font size="2" color="black">-</font></td>
			<%} %>

			<% 	int experience=0;
	   						
								String exp="SELECT DATEDIFF(STR_TO_DATE(Todate,'%d-%M-%Y'),STR_TO_DATE(FromDate,'%d-%M-%Y')) /30 AS experience FROM t_workexperience WHERE EmpID='"+rs.getString("EmpID")+"'";
								System.out.println("query is :"+exp);
								ResultSet rs3=st1.executeQuery(exp);
								while(rs3.next()) {
									
									experience = experience + rs3.getInt("experience");
									System.out.println("experience is :"+experience); 
									
								
	   						}	
							
					   			%>

			<td><div align="right">
					<font size="2" color="black"><%= experience%></font>
				</div></td>
		</tr>

		<%		
			i++;
			}
}	

%>
	</table>

	<%} 



// for hr login
else if(Dept.equals("Accounts") && Role.equals("HR")) {
	
	%>

	<form name="" method="get">
		<table align="center">
			<tr>
				<td><b>Department :</b></td>
				<td bgcolor="#C6DEFF;">
					<div>
						<select class="element select medium" id="dept_select"
							name="dept_select"
							style="width: 100px; padding: 1px 5px 2px 5px; border: 1px solid #DEDEDE;" />
						<option value="All">All</option>
						<option value="Sales&Marketing">Sales&Marketing</option>
						<option value="Service">Service</option>
						<option value="Accounts">Accounts</option>
						<option value="Development">Development</option>
						<option value="RnD">RnD</option>
						<option value="Software">Software</option>
						</select>
					</div>
				</td>

				<td align="left"><b>From&nbsp;&nbsp;</b> <input type="text"
					id="data" name="data" size="12" value="<%=datenew1%>"
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
					readonly /> <script type="text/javascript">
				  Calendar.setup(
				    {
				      inputField  : "data",         // ID of the input field
				      ifFormat    : "%d-%b-%Y",    // the date format
				      button      : "data"       // ID of the button
				    }
				  );
			</script></td>

				<td align="left"><b>To&nbsp;&nbsp;</b> <input type="text"
					id="data1" name="data1" size="12" value="<%=datenew2%>"
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
					readonly /> <script type="text/javascript">
				  Calendar.setup(
				    {
				      inputField  : "data1",         // ID of the input field
				      ifFormat    : "%d-%b-%Y",    // the date format
				      button      : "trigger1"       // ID of the button
				    }
				  );
			</script></td>
				<td bgcolor="#C6DEFF;"><input type="submit" name="submit"
					id="search-submit" value="Go"></td>

			</tr>
		</table>

	</form>
	<br />
	<%


int DeptHod=0;
if(request.getQueryString()!=null) {
	
	
	String dept_name = request.getParameter("dept_select");
	System.out.println("the dept_name is :"+dept_name);
	if(dept_name.equals("Sales&Marketing") || dept_name.equals("Service") || dept_name.equals("Accounts") || dept_name.equals("Development") || dept_name.equals("RnD") || dept_name.equals("Software")) {
try
{
	
	String SqlDept="Select DeptCode from t_department where DeptName='"+dept_name+"'";
	ResultSet rs6= st6.executeQuery(SqlDept);
	
	while(rs6.next())
	  {
		  
		  	DeptHod = rs6.getInt("DeptCode");
		  	System.out.println("the DeptHod is :"+DeptHod);
		  
		  }
}
catch(Exception e)
{
	System.out.println(">>>>>>>>>>>>Exception:"+e);
}

%>
	<table width="100%" bgcolor="white" align="center" class="sortable"
		style="width: 800px;">
		<tr>
			<td style="background-color: #C6DEFF; width: 5%;" align="center"><font
				size="2" color="black"><b>Sr.</b></font></td>
			<td style="background-color: #C6DEFF; width: 5%;" align="center"><font
				size="2" color="black"><b>ID</b></font></td>
			<td style="background-color: #C6DEFF; width: 35%;" align="center"><font
				size="2" color="black"><b>Applicant Name</b></font></td>
			<td style="background-color: #C6DEFF; width: 20%;" align="center"><font
				size="2" color="black"><b>Contact No</b></font></td>
			<td style="background-color: #C6DEFF; width: 20%;" align="center"><font
				size="2" color="black"><b>Qualification</b></font></td>
			<td style="background-color: #C6DEFF; width: 15%;" align="center"><font
				size="2" color="black"><b>Experience In Months</b></font></td>
		</tr>

		<%

System.out.println(">>>>>>>>>>>>:"+request.getParameter("data1"));
System.out.println(">>>>>>>>>>>>:"+request.getParameter("data"));
String to_date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));
String from_date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));System.out.println("the DeptHod is :"+DeptHod);
String Query = "select * from t_applicant_details where UpdatedDateTime between '"+from_date+" 00:00:00'  and '"+to_date+" 00:00:00' AND DeptID='"+DeptHod+"'";
System.out.println("query is :"+Query);
ResultSet rs = st.executeQuery(Query);
int i =1;
while(rs.next()) {
	%>


		<tr>
			<td align="center"><div align="right">
					<font size="2" color="black"><%=i%></font>
				</div></td>
			<%System.out.println("i is:"+i); %>
			<td align="right"><div align="right">
					<font size="2" color="black"><%=rs.getString("EmpID")%></font>
				</div></td>
			<td align="left" width="5"><div align="left">
					<font size="2" color="black"><a
						href="http://62.72.42.109:3307:8080/Transworld/application_report.jsp?emp_id=<%=rs.getString("EmpID")%>"
						target="_blank"><%=rs.getString("Name")%></a></font>
				</div></td>

			<td align="right"><div align="right">
					<font size="2" color="black"><%=rs.getString("ContactNo")%></font>
				</div></td>

			<%
				 String Qual="select Degree from t_empeduqualification where RId in (select Max(RId) from t_empeduqualification where EmpID='"+rs.getString("EmpID")+"')";
				 System.out.println("query is :"+Qual); 
				ResultSet rsq=st1.executeQuery(Qual);
				  if(rsq.next())
				  {
					  %>
			<td><div align="left">
					<font size="2" color="black"><%=rsq.getString("Degree") %></font>
				</div></td>
			<%
					  }
				  else
				  {
				%>
			<td><font size="2" color="black">-</font></td>
			<%} %>

			<% 	int experience=0;
   						
							String exp="SELECT DATEDIFF(STR_TO_DATE(Todate,'%d-%M-%Y'),STR_TO_DATE(FromDate,'%d-%M-%Y')) /30 AS experience FROM t_workexperience WHERE EmpID='"+rs.getString("EmpID")+"'";
							System.out.println("query is :"+exp);
							ResultSet rs3=st1.executeQuery(exp);
							while(rs3.next()) {
								
								experience = experience + rs3.getInt("experience");
								System.out.println("experience is :"+experience); 
								
							
   						}	
						
				   			%>

			<td><div align="right">
					<font size="2" color="black"><%= experience%></font>
				</div></td>
		</tr>


		<%		
		i++;
		}
%>
	</table>
	<%
}
	else {
		//System.out.println("my name is khan");	
			try
			{		  
			  }
			catch(Exception e)
			{
				System.out.println(">>>>>>>>>>>>Exception:"+e);
			}
			
			%>
	<table width="100%" bgcolor="white" align="center" class="sortable"
		style="width: 800px;">
		<tr>
			<td style="background-color: #C6DEFF; width: 5%;" align="center"><font
				size="2" color="black"><b>Sr.</b></font></td>
			<td style="background-color: #C6DEFF; width: 5%;" align="center"><font
				size="2" color="black"><b>ID</b></font></td>
			<td style="background-color: #C6DEFF; width: 35%;" align="center"><font
				size="2" color="black"><b>Applicant Name</b></font></td>
			<td style="background-color: #C6DEFF; width: 20%;" align="center"><font
				size="2" color="black"><b>Contact No</b></font></td>
			<td style="background-color: #C6DEFF; width: 20%;" align="center"><font
				size="2" color="black"><b>Qualification</b></font></td>
			<td style="background-color: #C6DEFF; width: 15%;" align="center"><font
				size="2" color="black"><b>Experience In Months</b></font></td>
		</tr>

		<%
			
			System.out.println(">>>>>>>>>>>>:"+request.getParameter("data1"));
			System.out.println(">>>>>>>>>>>>:"+request.getParameter("data"));
			String to_date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));
			String from_date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));
			String Query = "select * from t_applicant_details where UpdatedDateTime between '"+from_date+" 00:00:00'  and '"+to_date+" 00:00:00'";
			System.out.println("query is :"+Query);
			ResultSet rs = st.executeQuery(Query);
			int i =1;
			while(rs.next()) {
				%>


		<tr>
			<td><div align="right">
					<font size="2" color="black"><%=i%></font>
				</div></td>
			<%System.out.println("i is:"+i); %>
			<td><div align="right">
					<font size="2" color="black"><%=rs.getString("EmpID")%></font>
				</div></td>
			<td align="left" width="5"><div align="left">
					<font size="2" color="black"><a
						href="http://62.72.42.109:3307:8080/Transworld/application_report.jsp?emp_id=<%=rs.getString("EmpID")%>"
						target="_blank"><%=rs.getString("Name")%></a></font>
				</div></td>

			<td align="right"><div align="right">
					<font size="2" color="black"><%=rs.getString("ContactNo")%></font>
				</div></td>

			<%
							 String Qual="select Degree from t_empeduqualification where RId in (select Max(RId) from t_empeduqualification where EmpID='"+rs.getString("EmpID")+"')";
							 System.out.println("query is :"+Qual); 
							ResultSet rsq=st1.executeQuery(Qual);
							  if(rsq.next())
							  {
								  %>
			<td><div align="left">
					<font size="2" color="black"><%=rsq.getString("Degree") %></font>
				</div></td>
			<%
								  }
							  else
							  {
							%>
			<td><font size="2" color="black">-</font></td>
			<%} %>

			<% 	int experience=0;
			   						    try
			   						    {
										String exp="SELECT DATEDIFF(STR_TO_DATE(Todate,'%d-%M-%Y'),STR_TO_DATE(FromDate,'%d-%M-%Y')) /30 AS experience FROM t_workexperience WHERE EmpID='"+rs.getString("EmpID")+"'";
										System.out.println("query is :"+exp);
										ResultSet rs3=st1.executeQuery(exp);
										while(rs3.next()) {
											
											experience = experience + rs3.getInt("experience");
											System.out.println("experience is :"+experience); 
											
										}	
			   						    }
			   						    catch(Exception e)
			   						    {
			   						    	System.out.println("Exception is :"+e); 
			   						    }
							   			%>

			<td><div align="right">
					<font size="2" color="black"><%= experience%></font>
				</div></td>
		</tr>


		<%		
					i++;
					}
			
			%>

	</table>
	<%
			

			



		}	
	
}


	
	
	
	
}

%>
</body>
</html>