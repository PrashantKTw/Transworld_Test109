<%@ page contentType="application/vnd.ms-excel; charset=gb2312"%>
<%@ page import="java.sql.Connection" import="java.util.*"
	import="java.sql.*"%>

<%@ include file="headConn.jsp"%>


<% 
System.out.println("Downloadexcel");
	String filename="payroll_excelFormat.xls";
	response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%
Statement st=null;
st=conn.createStatement();
java.util.Date date=new java.util.Date();

Calendar cal = Calendar.getInstance();
cal.setTime(date);
int month = cal.get(Calendar.MONTH);
int year=cal.get(Calendar.YEAR);

%>

<SCRIPT LANGUAGE="JavaScript1.2" SRC="js/graph.js"></SCRIPT>

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<body>
	<table border="1" width="100%" CELLPADDING=2
		style="background: #f8fcff;" class="mytable">
		<tr bgcolor="#E8EEF7">
			<th bgcolor="#E6E6E6"><font size="2">Srno</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Contractor ID</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Contractor Name</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Month</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Year</font></th>
			<th bgcolor="#E6E6E6"><font size="2">* payableDays</font></th>
			<th bgcolor="#E6E6E6"><font size="2">* performance Index
					% </font></th>
			<th bgcolor="#E6E6E6"><font size="2">Allowance4(Advance/Loan)</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Deduct(Security
					Deposit)</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Deduct1</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Deduct2</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Deduct3</font></th>
			<th bgcolor="#E6E6E6"><font size="2">previous Pay</font></th>
			<th bgcolor="#E6E6E6"><font size="2">variable</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Incentive</font></th>
		</tr>

		<%
int srno=0;
String sql="SELECT distinct EmpID,EmpName from t_employee where Status='Active'";
ResultSet rs =  st.executeQuery(sql);
System.out.println("The query is :"+sql);
while(rs.next()){
	
	String empid=rs.getString("EmpID");
	String name=rs.getString("EmpName");
	
%>
		<tr>
			<td align="right">
				<div align="right"><%=++srno %></div>
			</td>
			<td align="right">
				<div align="right"><%=empid%></a>
				</div>

			</td>
			<td align="left">
				<div align="left"><%=name%></div>
			<td align="right"><div align="right"><%=month%></div></td>
			<td align="right"><div align="right"><%=year%></div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>
			<td align="right"><div align="right">0</div></td>

		</tr>

		<%} 
 %>

	</table>