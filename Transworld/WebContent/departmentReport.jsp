<%@ page language="java" import="java.sql.*" import="java.util.*"
	import="java.text.*" errorPage="" pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Department Report</title>
<style>
th {
	background: #C6DEFF;
}

div, h1, h2, h3, h4, p, ul, ol, li, form, fieldset, table, td, th {
	margin: 0;
	padding: 0
}

ul {
	list-style: none
}

html {
	font-size: 62.5%;
	height: 100%
}

body {
	font-family: Arial;
	font-size: 1.3em;
	margin: 0;
	min-width: 1000px;
	background: #fff;
	height: 100%
}

div#mainbody {
	padding: .5em 1.5em 0 1.5em
}

h1 {
	font-size: 1.5em
}

h2, .gwtNav2-header {
	font-size: 1.5em
}

h3, .gwtNav3-header {
	font-size: 1.2em
}

h4 {
	font-size: 1.1em
}

.main1 {
	font-size: 1.2em;
	font-weight: bold
}

.clear, .clrflt, .spacer {
	clear: both
}

.divider {
	clear: both;
	width: 100%;
	margin: 15px 0;
	border-bottom: 1px solid #eee
}

.divider2 {
	clear: both;
	width: 100%;
	margin: 15px 0;
	padding: 15px 0;
	border-bottom: 1px solid #ccc
}

.inlinetext {
	display: inline;
	padding-right: 6px
}

.newuser, .adm {
	color: green
}

.err, .sus, .req, .new, a.new:link, a.new:hover, a.new:visited {
	color: #c00
}

sup.new {
	margin-left: 3px
}

.u {
	color: #767676
}

.u a:link, .u a:active, .u a:visited {
	color: #59d
}

a:link, a:visited {
	color: #06c
}

a:hover {
	color: #c60
}

a {
	outline: none
}

a, .nowrap {
	white-space: nowrap
}

a img {
	border: 0
}

a.cancellink {
	text-decoration: none
}

#hidden1, #hidden2, #hidden3, #hidden4, .hidden {
	display: none
}

.rightbar {
	text-align: right
}

.nowrap {
	white-space: nowrap
}

.left-space {
	margin-left: 1em
}

.d {
	margin: 10px 10px 10px 0;
	padding: 10px;
	background-color: #fff4c2;
	border: solid 1px #fc3;
	width: 50%
}

.left_float {
	float: left;
	padding-right: 1em
}

.si {
	margin: 10px 10px 0 0;
	padding: 10px;
	background-color: #eee;
	border: solid 1px #aaa;
	width: 50%
}

div#header {
	min-height: 45px
}

div#logo {
	float: left;
	height: 70px /*tw header:logo height*/
}

div#logo img {
	border: none;
	padding-top: 10px /*tw header: tw logo */ 
	 padding-left: 6px
}

div#logo1 {
	float: right;
	height: 70px /*tw header:logo height*/
}

div#logo1 img {
	border: none;
	padding-top: 10px /*tw header: tw logo */ 
	 padding-right: 6px
}

div#header ul {
	float: right
}

div#header li {
	display: inline;
	padding-left: 6px
}

div#header p, div#header form {
	margin: 0 0 0 133px;
	padding-bottom: 2px
}

div#header form label {
	display: none
}

span#premium {
	color: #c60;
	font: bold .8em Verdana, Arial, Helvetica, sans-serif
}

div#navigation table {
	width: 100%
}

div#navigation ul {
	clear: both;
	/*background:
		url(https://ssl.gstatic.com/apps/cpanel/resources/img/img/navbar_bg.png)
		;*/
	float: left;
	width: 100%
}

div#navigation li {
	float: left;
	border-right: 1px solid #e3e9ff;
	/*tw header: light blue border of main menu */
	position: inherit; /*tw header: width of main menu */
	display: inline-table;
}

div#navigation li a, .topTab {
	display: block;
	padding: 5px 10px 5px 10px;
	color: #fff; /*tw header: font color of main menu */
	font-weight: bold; /*tw header: font-weight of main menu */
	position: relative;
	text-decoration: none;
	cursor: pointer
}

div#navigation li#services {
	border-right: 0
}

div#navigation li#services a img {
	border: none;
	padding-bottom: 2px;
	padding-left: 3px
}

div#navigationRight {
	float: right;
	visibility: visible
}

.selected, div#navigation li.selected a:hover, div#navigation li.selected:hover
	{
	font-weight: bold
}

div#navigation li#services ul#servicelist {
	display: none;
	position: absolute;
	background: #ecf0f6;
	border: 1px solid #fff;
	border-right: 1px solid #899dad;
	border-bottom: 1px solid #899dad;
	width: auto;
	z-index: 1000
}

div#navigation li#services li {
	float: none;
	border: none;
	border-bottom: 1px solid #ecf0f6
}

div#navigation li#services li a {
	display: block;
	background: none;
	padding: 3px 6px 3px 6px;
	color: #333;
	font-weight: normal;
	white-space: nowrap
}

div#navigation li#services li.selected a {
	background: #c9d1db;
	font-weight: bold
}

ul#services li ul {
	margin-left: 25px
}

ul#services li h3 {
	float: left;
	padding-left: 5px
}

ul#services span {
	color: #767676;
	padding-left: .2em
}

ul#services span.err, ul#services span.errormsg {
	color: #c00
}

ul#services li .beta, th span.beta {
	color: #c60;
	font: bold .8em Verdana, Arial, Helvetica, sans-serif;
	margin-left: 3px
}

ul#services li p {
	margin-left: 25px
}

.disabled-app, .license-expired-app, .license-expiring-app,
	.licensed-app, .unlicensed-app, ul#services li .update-data-access-requirements,
	ul#services li .license-expired-app, ul#services li .license-expiring-app,
	ul#services li .licensed-app, ul#services li .unlicensed-app {
	font-weight: bold;
	margin-right: 4px;
	padding-left: 0
}

.license-expired-app, .license-expiring-app, .unlicensed-app, ul#services li .license-expired-app,
	ul#services li .license-expiring-app, ul#services li .unlicensed-app,
	ul#services li .update-data-access-requirements {
	color: #dd3e43
}

ul#services li .disabled-app, ul#services li .licensed-app {
	color: #000
}

ul#services li .update-data-access-requirements a {
	font-weight: normal;
	padding-left: 5px
}

ul.features {
	list-style-type: none;
	border-top: 1px solid #c6dff9;
	border-bottom: 1px solid #c6dff9;
	margin: 15px 0;
	padding-bottom: 25px
}

ul.features li {
	padding: 25px 40px 0;
	min-height: 34px
}

ul.features .users {
	background:
		url(https://ssl.gstatic.com/apps/cpanel/resources/img/img/user_pic.gif)
		no-repeat left 25px
}

ul.features .org {
	background:
		url(https://ssl.gstatic.com/apps/cpanel/resources/img/img/org_pic.gif)
		no-repeat left 25px
}

ul.subtabs {
	margin: 16px 0 20px;
	padding: 0 0 2px 5px;
	border-bottom: 1px solid #c6dff9
}

div#disable_add_button {
	background-color: #fff;
	float: left;
	opacity: .3
}

ul#services span.added {
	color: #767676;
	font-weight: bold;
	background:
		url(https://ssl.gstatic.com/apps/cpanel/resources/img/img/nodisplay2.gif)
		no-repeat;
	padding-left: 15px;
	line-height: 2.5em
}

ul.inlinelist2 {
	display: inline
}

ul.palette {
	clear: left;
	width: 50%
}

ul.palette li {
	float: left;
	width: 50%;
	margin-bottom: 15px
}

ul.palette li.custom {
	width: 100%;
	margin-left: 25px
}

ul.palette li.custom input {
	float: none
}

ul.palette li input {
	float: left
}

ul.palette div {
	margin-left: 25px;
	padding: 5px 0 5px 0;
	width: 100px;
	text-align: center
}

ul.points {
	list-style: outside;
	margin-left: 2em;
	line-height: 1.5em
}

#footer {
	clear: both;
	margin: 2em 0 0 0;
	padding: 2px 0 0 0;
	text-align: center;
	color: #999;
	border-top: 3px solid #59d
}

#footer p {
	font-size: .9em;
	padding: 2px
}

div#navigationRight li {
	float: right;
	border-left: 1px solid #e3e9ff;
	background-color: #0B216;
	color: #fff;
	position: relative;
	font-size: 1em;
	font-weight: bold
}

div#navigationRight li a {
	color: #fff
}

a.header {
	text-decoration: none !important
}

a.header div.helpPanel-item div.gwt-Label {
	color: #559 !important;
	font-weight: bold;
	font-size: 13px
}

#dropmenudiv {
	position: absolute;
	border: 1px solid black;
	border-bottom-width: 0;
	font: normal 12px Verdana, Arial, Helvetica, sans-serif;
	line-height: 18px;
	z-index: 100;
}

#dropmenudiv a {
	width: 100%; /*tw header: dropdown*/
	display: block;
	text-indent: 3px;
	border-bottom: 1px solid black;
	padding: 1px 0;
	text-decoration: none;
	font-weight: bold;
	background-color: #9db5e5;
	color: #fff
}

#dropmenudiv a:hover { /*hover background color*/
	background-color: #465ea6;
}

table.sortable { /*tw header: sortable table*/
	text-align: center;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: normal;
	font-size: 11px;
	color: blue;
	width: 100%;
	background-color: #9db5e5; /*tw header: sortable table background*/
	border: 0px;
	border-collapse: inherit;
	border-spacing: 1px;
	border-color: grey
}

table.sortable td {
	color: blue;
	padding: 4px;
	text-align: center;
	border-spacing: 1px;
}

table.sortable th {
	background-color: #8596FA;
	color: white;
	padding: 4px;
	text-align: center;
	border: 1px solid #808080;
	border-spacing: 14px;
}

table.sortable td.hed { /*tw header: sortable table header*/
	background-color: #8596FA;
	color: white;
	padding: 1px;
	text-align: center;
	border-bottom: 1px #808080 solid;
	font-size: 12px;
	font-weight: bold;
	border-spacing: 1px;
}

table.sortable_scroll td.hed1 {
	background-color: #EEEEEE;
	color: #696969;
	padding: 1px;
	text-align: center;
	border-bottom: 2px #808080 solid;
	font-size: 12px;
	font-weight: bold;
}

table.sortable_scroll { /*tw header: sortable table*/
	text-align: center;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: normal;
	font-size: 11px;
	color: blue;
	width: 100%;
	background-color: #e3e9ff;
	/*tw header: sortable_sroll table background*/
	border: 1px;
	border-collapse: inherit;
	border-spacing: 0px;
	width: 150px;
	display: block;
	border-width: 0px;
	border-style: solid;
	border-color: fff;
	padding: 50px;
	margin-top: 25px;
	width: 100%;
	height: 300px;
	overflow-x: auto;
	overflow-y: auto;
}

table.sortable_scroll td {
	background-color: white;
	color: blue;
	padding: 5px;
	text-align: center;
	border: 1px #808080 solid;
}

table.sortable_scroll td.hed { /*tw header: sortable table header*/
	background-color: white;
	color: blue;
	padding: 4px;
	text-align: center;
	border-bottom: 1px #808080 solid;
	font-size: 12px;
	font-weight: bold;
}

table.sortable_scroll td.hed1 {
	background-color: #EEEEEE;
	color: #696969;
	padding: 4px;
	text-align: center;
	border-bottom: 2px #808080 solid;
	font-size: 12px;
	font-weight: bold;
}

table.sortable_entry { /*tw header: sortable table*/
	position: relative;
	text-align: center;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: normal;
	font-size: 11px;
	color: black;
	width: 60%;
	background-color: #e3e9ff;
	/*tw header: sortable_sroll table background*/
	border: 0px;
	border-collapse: inherit;
	border-spacing: 0px;
	margin-left: 200px
}

table.sortable_entry td {
	background-color: #e3e9ff;
	color: black;
	padding: 0px;
	padding-left: 10px;
	text-align: left;
	border: 0px #808080 solid;
}

table.sortable_entry td.hed { /*tw header: sortable table header*/
	background-color: #e3e9ff;
	color: blue;
	padding: 4px;
	text-align: center;
	border-bottom: 0px #808080 solid;
	font-size: 12px;
	font-weight: bold;
}

table.sortable_entry td.hed1 {
	background-color: #EEEEEE;
	color: #696969;
	padding: 4px;
	text-align: center;
	border-bottom: 0px #808080 solid;
	font-size: 12px;
	font-weight: bold;
}
</style>
<!--<link href="css/cpanel_002.css" rel="stylesheet" type="text/css" />-->
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

          document.departmentReport.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["departmentReport"].submit();       // CHANGE FORM NAME HERE

} 
//
function DeleteRow(id,compcode,Status)
{
	    
	//alert("id-->"+id+"Control inside deldte function"+compcode);
	if(Status=="Deactive")
	{
		alert("Department already deactivated");
		return false;
	}
	else
	{
	var agree=confirm("Do You Want to Deactivate this Record?");
	    //alert(agree);
	    if(agree)
	    {
		 var ajaxRequest;  // The variable that makes Ajax possible!
		    try
		    {	// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
		    }  
			catch (e)
			{	// Internet Explorer Browsers
				try
				{	ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} 
				catch (e)
				{	try
					{
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} 
					catch (e)
					{	// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}
			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function()
			{	//alert("ddddddddddddddddddddddd");
				if(ajaxRequest.readyState == 4)
				{	var reslt=ajaxRequest.responseText;
				   //alert(">>>    "+reslt);
				  var data=reslt.trim();
				  
				 // alert("<***data**  "+data);
				  //var mySplitResult = reslt.split("#");
                  //var mySplitResult1=  mySplitResult[0]; 
                  //var mySplitResult2=  mySplitResult[1]
				  
				  
                 // alert("<***mySplitResult1**  "+mySplitResult);
				 //alert("<***mySplitResult1**  "+mySplitResult1);
                //alert("<***mySplitResult2**  "+mySplitResult2);
					if(data="Yes")
					{					
                        alert("Department Deactivated Successfully.");
				    	window.location.reload();
					}
					if(data="No")
					{					
                       // alert("Data Not Deleted Successfully.");
				    	window.location.reload();
					}
	           } 
			}
			var queryString = "?action=delete&id="+id+"&companycode="+compcode;
			ajaxRequest.open("GET", "AjaxDepartmentDelete.jsp" + queryString, true);
			ajaxRequest.send(null); 
	    }
	    else
	    {return false;
	    }

	}//end of else
 }	
</script>
</head>
<body>
	<div align="center" style="width: 100%;">
		<table width="100%" border="0" align="center">
			<tr>
				<td align="center" colspan="2"><a align="center"
					style="font-size: 1.3em"><b>Department Report</b></a></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="deptCreation.jsp"><b>Add</b></a>
					&nbsp; <!--<a href=""><b>Delete</b></a></td>-->
				<td align="right"><a href="#" title="Export to Excel"
					onclick="gotoExcel('dept','tableHTML');"><img
						src="images/excel.jpg" width="15px" height="15px"></a><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>

		</table>
	</div>
	<div align="center">
		<form action="" method="post" name="departmentReport">
			<%
String exportFileName="department_report.xls";   // GIVE YOUR REPORT NAME
%>
			<div id='dept' align="center" style="width: 950px;">

				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> <input
					type="hidden" id="fileName" name="fileName"
					value="<%= exportFileName%>" />

				<table align="center" class="sortable" border="1" height="400"
					width="600" style="color: black; border-collapse: collapse;">
					<tr>
						<th><b>Edit</b></th>
						<th><b>Delete</b></th>
						<th><b>Sr No.</b></th>
						<th><b>ComapanyName</b></th>
						<th><b>Department <br>Code
						</b></th>
						<th><b>Department <br>Name
						</b></th>
						<th><b>UnderDept Name</b></th>
						<th><b>HOD Name</b></th>
						<th><b>Status</b></th>
						<th><b>Entered By</b></th>
						<th><b>Updated Date & Time</b></th>
						<!-- <th><b>CompResInCharge</b></th> -->
					</tr>
					<%
 Statement st=conn.createStatement();
 Statement st1=conn.createStatement();
 Statement st2=conn.createStatement();
 String date="";
 String sql = "select * from t_department";
 ResultSet rs = st.executeQuery(sql);
 String name="",empname="",hodname="",udeptname="";
 int i=0;
 while(rs.next())
 {  String sql1 = "select OurCompanyName from t_ourcompanydet where CompanyCode='"+rs.getString("ComapanyCode")+"'";
 	ResultSet rs1 = st1.executeQuery(sql1);
	if(rs1.next())
	{
		name = rs1.getString(1);
		System.out.print("name============>"+name);
	}
	String sqlempname = "select Name from t_leaveadmin where empid='"+rs.getString("TWEmpID")+"'";
 	ResultSet rs2= st2.executeQuery(sqlempname);
	if(rs2.next())
	{
		empname = rs2.getString(1);
		System.out.print("Emp name============>"+empname);
	}
	
	String sqlHOD="select Name from t_leaveadmin where EmpID='"+rs.getString("HODId")+"'";
			
		ResultSet rsHOD=st1.executeQuery(sqlHOD);
		
		if(rsHOD.next())
		{
			hodname=rsHOD.getString(1);
		}
		
		String sqludept="select DeptName from t_department where DeptCode='"+rs.getString("UnderDeptCode")+"'";
		
		ResultSet rsdept=st1.executeQuery(sqludept);
		System.out.println("und dept name"+sqludept);
		if(rsdept.next())
		{
			udeptname=rsdept.getString(1);
		}	
 try
   { 
	 date = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("UpdateDatetime")));
   }
 catch(Exception e){}
 String color="";
 if (rs.getString("Status").equalsIgnoreCase("active")) {
		color = "#CCFF99";

	} else 
	{

		color = "#FF8080";
	}
	System.out.println("colorrrrrrr"+color+"date-->"+date);
 %>
					<tr style="background: <%=color%>;">
						<td width="1%" align="right"><a
							href="editDepartment.jsp?dptcode=<%=rs.getString("DeptCode")%>&companyname=<%=name%>&companycode=<%=rs.getString("ComapanyCode")%>&deptname=<%=rs.getString("DeptName")%>&hod=<%=hodname%>&udeptname=<%=udeptname%>&udeptcode=<%=rs.getString("UnderDeptCode") %>&status=<%=rs.getString("Status") %>"><img
								src="images/edit1.jpeg" width="18px" height="18px"></a></td>
						<td width="1%" align="right"><a href="#"
							onclick="DeleteRow('<%=rs.getString("DeptCode")%>','<%=rs.getString("ComapanyCode") %>','<%=rs.getString("Status") %>');"><img
								src="images/delete.jpeg" width="18px" height="18px"></a></td>
						<td width="2%" align="right"><div align="right"><%=rs.getString("RId")%></div></td>
						<td width="11%" align="left"><div align="left"><%=name%></div></td>
						<td width="2%" align="right"><div align="right"><%=rs.getString("DeptCode")%></div></td>
						<td width="2%" align="left"><div align="left"><%=rs.getString("DeptName")%></div></td>
						<td width="2%" align="left"><div align="left"><%=udeptname%></div></td>
						<td width="2%" align="left"><div align="left"><%=hodname%></div></td>
						<td width="2%" align="left"><div align="left"><%=rs.getString("Status") %></div></td>
						<td width="7%" align="left"><div align="left"><%=empname%></div></td>
						<td width="2%" align="right"><div align="right"><%=date%></div></td>
						<%--  <td width="2%" align="left"><div align="left"><%=rs.getString("CompResInCharge") %></div></td> --%>
					</tr>
					<% } %>
				</table>
			</div>
		</form>
	</div>
	<div id="footer">
		<p>
			<a href="http://www.myfleetview.com"> Copyright &copy; 2009 by
				Transworld Compressor Technologies Ltd. All Rights Reserved.</a>
		</p>
	</div>
</body>
</html>