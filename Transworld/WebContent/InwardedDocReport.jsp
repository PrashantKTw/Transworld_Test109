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


</head>
<body>
	<%
		Statement stmt=null,st1=null;
		String sql=null;
		ResultSet rst=null;
		stmt=conn.createStatement();
		st1=conn.createStatement();
		%>

	<%
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
		%>
	<div
		style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
		<a>Inwarded Doc Report</a>
	</div>
	<br>

	<form name="customdetail" method="get" action="">
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
				</script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="submit" name="submit" id="search-submit" value="Go">
				</td>
			</tr>
		</table>
		<br>
		<br>

	</form>
	<% 
		try 
		{
			%><table width="70%" align="center">
		<tr>
			<td>&nbsp;</td>
			<td>
				<table bgcolor="white" align="center" class="sortable">
					<tr>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Sn.</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Inward Date</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Inward Reference No.</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Category</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Subject</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Inwarded To</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Files</b></font></td>
					</tr>
					<%
			int i=0;
		//	String sqlData="select * from t_incidentdata  where   TheDate>='"+dataDate1+"' and TheDate<='"+dataDate2+"' and Status in('Pending','Attended')";
			String sqlData="select * from t_inwarddetails where InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' and Enteredby like '"+session.getAttribute("empname").toString()+"' order by InwardDate,InwardTime asc";
			System.out.print(sqlData);
			rst=stmt.executeQuery(sqlData);
			while(rst.next())
			{
				i++;
				%>
					<tr>
						<td align="center"><div align="right">
								<font size="2" color="black"><%= i%></font>
							</div></td>
						<td align="right"><div align="right">
								<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
									.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
										.parse( rst.getString("InwardDate")+" "+rst.getString("InwardTime")))%></font>
							</div></td>
						<td align="center"><div align="right">
								<font size="2" color="black"><%= rst.getString("InwardRefNo")%></font>
							</div></td>
						<td align="center"><div align="left">
								<font size="2" color="black"><%= rst.getString("Category")%></font>
							</div></td>
						<td align="center"><div align="left">
								<font size="2" color="black"><%= rst.getString("Subject")%></font>
							</div></td>
						<td align="center"><div align="left">
								<font size="2" color="black"><%= rst.getString("ToEmploy")%></font>
							</div></td>
						<td align="center"><div align="left">
								<font size="2" color="black"> <% 
				System.out.println("=======================>>"+rst.getString("FileName"));
				String delims12= "[,]";
				String[] tok = rst.getString("FileName").split(delims12);
				
				for (String t1 : tok)
				{
					System.out.println("=======================>>"+t1);
					%> <a
									href="inwardLink.jsp?filename=<%=t1%>&iwno=<%=rst.getString("InwardRefNo")%>&empName=<%=rst.getString("ToEmploy")%>"><font
										size="2"><%=t1%></font><br></br> <%	
					
				}
				%></font>
							</div></td>


					</tr>
					<%  
			}
			%>
				</table>
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<%
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
%>