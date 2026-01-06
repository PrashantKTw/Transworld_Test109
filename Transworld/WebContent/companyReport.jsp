<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp"%>

<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/sorttable.js" type="text/javascript"></script>
<!--<link href="css/cpanel_002.css" rel="stylesheet" type="text/css"  />
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
-->
<style>
th {
	background: #C6DEFF;
}
</style>
<script type="text/javascript">
function gotoExcel (elemId, frmFldId)  
{  
//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.companyReport.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["companyReport"].submit();       // CHANGE FORM NAME HERE

} 
</script>
</head>
<body>
	<table width="100%" border="0">
		<tr>
			<td colspan="2" align="center"><a style="font-size: 1.60em">Company
					Report</a></td>
		</tr>

		<tr align="left">
			<td><a href="createComp.jsp"><b>Add</b></a>&nbsp <a href=""><b>Delete</b></a></td>
			<td align="right"><a href="#" title="Export to Excel"
				onclick="gotoExcel('comp','tableHTML');"><img
					src="images/excel.jpg" width="15px" height="15px"></a></td>
		</tr>

	</table>
	<form action="" method="post" name="companyReport">
		<%
String exportFileName="company_report.xls";   // GIVE YOUR REPORT NAME
%>
		<div id='comp' align="center" style="height: 400px; overflow: scroll;">

			<input type="hidden" id="tableHTML" name="tableHTML" value="" /> <input
				type="hidden" id="fileName" name="fileName"
				value="<%= exportFileName%>" />
			<table align="center" class="sortable" border="1"
				style="color: black; border-collapse: collapse;">
				<tr>
					<th>Edit</th>
					<th>Company<br>Code</th>
					<th>Company Name</th>
					<th>Company Adress</th>
					<th>Godown Adress</th>
					<th>BSTNo</th>
					<th>CSTNo</th>
					<th>Phone No</th>
					<th>FAX No</th>
					<th>Email</th>
					<th>Website</th>
					<th>PAN No</th>
					<th>Entered By</th>
					<th>Date/Time</th>
				</tr>


				<%   
  Statement st = conn.createStatement();
 String date = null;
 String qry = "select * from t_ourcompanydet Order By CompanyCode";
 
 ResultSet rs = st.executeQuery(qry);  
		  
  
  while(rs.next())
  { 
	  try
	  {
         date = new SimpleDateFormat("dd-MMM-yyyy /HH:mm:SS").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:SS").parse(rs.getString("UpdateDatetime")));  
	  }
	  
    catch(Exception e) {System.out.println("Date Format Exception"+e);}
    %>
				<tr>
					<td align="right"><a
						href="editCompany.jsp?cmpCode=<%=rs.getString("CompanyCode")%>"><img
							src="images/edit1.jpeg" width="18px" height="18px"></a></td>
					<td width="10px" align="right"><div align="right"><%=rs.getString("CompanyCode") %></div></td>
					<td width="15%" align="left"><div align="left"><%=rs.getString("OurCompanyName") %></div></td>
					<td align="left"><div align="left"><%=rs.getString("OurCompanyAddress") %></div></td>
					<td align="left"><div align="left"><%=rs.getString("OurCompanyGodownAddress") %></div></td>
					<td width="30px" align="right"><div align="right"><%=rs.getString("OurCompanyBSTNo") %></div></td>
					<td width="30px" align="right"><div align="right"><%=rs.getString("OurCompanyCSTNo") %></div></td>
					<td align="right"><div align="right"><%=rs.getString("PhoneNo") %></div></td>
					<td align="right"><div align="right"><%=rs.getString("FaxNo") %></div></td>
					<td align="left"><div align="left"><%=rs.getString("Email") %></div></td>
					<td align="left"><div align="left"><%=rs.getString("Website") %></div></td>
					<td align="right"><div align="right"><%=rs.getString("PanNo") %></div></td>
					<td width="100px" align="left"><div align="left"><%=rs.getString("TWEmpName") %></div></td>
					<td align="left"><div align="left"><%=date %></div></td>
				</tr>

				<% } %>
			</table>
		</div>
	</form>
	<div id="footer">
		<p>
			<a href="http://www.myfleetview.com"> Copyright &copy; 2009 by
				Transworld Compressor Technologies Ltd. All Rights Reserved.</a>
		</p>
	</div>
</body>
</html>