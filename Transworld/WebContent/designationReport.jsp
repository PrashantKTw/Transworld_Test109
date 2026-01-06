<%@ page language="java" import="java.sql.*" import="java.util.*"
	import="java.text.*" errorPage="" pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Department Report</title>
<link href="css/cpanel_002.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/ajax-tooltip.js"></script>
<script src="js/sorttable.js" type="text/javascript"></script>

<script type="text/javascript">
function gotoExcel (elemId, frmFldId)  
{  
//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.desgReport.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["desgReport"].submit();       // CHANGE FORM NAME HERE

} 

</script>
</head>
<body>

	<table width="100%">
		<tr>
			<td align="center" colspan="2"><a align="center"
				style="font-size: 1.6em"><b>Designation Reports</b></a></td>
		</tr>
		<tr>
			<td><a href="designationCreation.jsp"><b>Add</b></a> &nbsp <a
				href=""><b>Delete</b></a></td>
			<td align="right"><a href="#" title="Export to Excel"
				onclick="gotoExcel('dept','tableHTML');"><img
					src="images/excel.jpg" width="18px" height="18px"></a></td>
		</tr>
	</table>
	<div align="center">
		<form action="" method="post" name="desgReport">
			<%
String exportFileName="designation_report.xls";   // GIVE YOUR REPORT NAME
%>
			<div id='dept' align="center"
				style="height: 400px; overflow: scroll;">

				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> <input
					type="hidden" id="fileName" name="fileName"
					value="<%= exportFileName%>" />

				<table align="center" class="sortable" border="1" width="50%"
					hight="50%">
					<tr>
						<th><b>Edit</b></th>
						<th><b>SrNo</b></th>
						<th><b>desgId</b></th>
						<th><b>designation</b></th>
						<th><b>TWEmpID</b></th>
						<th><b>UpdateDate</b></th>
						<th><b>CompanyName</b></th>
						<th><b>CompanyCode</b></th>
						<th><b>Status</b></th>
					</tr>

					<%

 Statement st=conn.createStatement();
 Statement st1=conn.createStatement();
 String date="";
 String sql = "select * from t_designation";
 ResultSet rs = st.executeQuery(sql);
 String name="";
 
 while(rs.next())
 {  String sql1 = "select OurCompanyName from t_ourcompanydet where CompanyCode='"+rs.getString("CompanyCode")+"'";
	ResultSet rs1 = st1.executeQuery(sql1);
	if(rs1.next())
	{
		name = rs1.getString(1);
		System.out.print("name============>"+name);
	}
 try
   { 
	 date = new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("UpdateDatetime")));
   }
 catch(Exception e){}
 %>
					<tr>
						<td width="1%" align="right"><a
							href="editDesignation.jsp?dstid=<%=rs.getString("desgId")%>"><img
								src="images/edit1.jpeg" width="18px" height="18px"></a></td>
						<td width="2%" align="right"><div align="right"><%=rs.getString("SrNo")%></div></td>
						<td width="2%" align="right"><div align="right"><%=rs.getString("desgId") %></div></td>
						<td width="1%" align="left"><div align="left"><%=rs.getString("designation") %></div></td>
						<td width="2%" align="right"><div align="right"><%=rs.getString("TWEmpID") %></div></td>
						<td width="2%" align="right"><div align="right"><%=date %></div></td>
						<td width="4%" align="left"><div align="left"><%=name%></div></td>
						<td width="2%" align="right"><div align="right"><%=rs.getString("CompanyCode") %></div></td>
						<td width="2%" align="left"><div align="left"><%=rs.getString("Status") %></div></td>
					</tr>
					<% } %>
				</table>
			</div>
		</form>
	</div>
</body>
</html>