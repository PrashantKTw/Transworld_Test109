<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.io.*" import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ include file="headConn.jsp"%>
<html>
<head>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<script type="text/javascript" src="css/chrome.js"></script>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

#divheader {
	height: 50;
	background: White;
}

#header {
	background: #2675a8;
	font: large;
	color: green;
	width: 100%;
}

#leftcolumn {
	background: #0099CC;
	float: left;
	width: 35%;
	height: 400px;
}

#content {
	border: medium;
	border-color: blue;
	background:;
	float: left;
	width: 100%;
	height: 400px;
	/*overflow:scroll;*/
}

#myfooter {
	background: #df781c;
	clear: both;
	width: 100%;
}

#tooltip {
	position: relative;
	font-family: arial, sans-serif;
	font-size: 10px;
	color: #000;
	padding: 3px;
	border: 1px solid #000;
	background-color: #ffe;
}

table.mysortable {
	text-align: left;
	font-family: Arial, Verdana, Geneva, Helvetica, sans-serif;
	font-weight: normal;
	font-size: 11px;
	color: #fff;
	background-color: #1581AB; <!-- -->
	border: 0px;
	border-collapse: collapse;
	border-spacing: 0px;
}

table.mysortable td {
	background-color: #F8F8FF;
	color: #000;
	padding: 4px;
	border: 1px #808080 solid;
}

table.mysortable th {
	background-color: #1581AB;
	color: white;
	padding: 4px;
	border: 1px #808080 solid;
}

table.mysortable td.hed {
	background-color: #C6DEFF;
	color: #696969;
	padding: 4px;
	border-bottom: 2px #808080 solid;
	font-size: 12px;
	font-weight: bold;
}

table.mysortable td.hed1 {
	background-color: #C6DEFF;
	color: #696969;
	padding: 4px;
	border-bottom: 2px #808080 solid;
	font-size: 12px;
	font-weight: bold;
}
</style>

<script LANGUAGE="JavaScript" type="text/javascript">
function addresspaste()
{
	document.contactdata.address.value=document.contactdata.c_address.value;
    document.contactdata.city.value=document.contactdata.c_city.value;
    document.contactdata.state.value=document.contactdata.c_state.value;
    document.contactdata.zipcode.value=document.contactdata.c_zip.value;
    document.contactdata.country.value=document.contactdata.c_country.value;
}
function cancelentryform()
{
	
	document.contactdata.action ="addNewCustomer.jsp?companyName="+document.contactdata.companyname.value;
    document.forms["contactdata"].submit();
}

function showVisitingCardDetails(eName,empMail)
{
	document.getElementById("from1").value=eName;
	document.getElementById("comName").innerHTML=eName;
	document.getElementById("SelectedEmpMail").value=empMail;
	document.getElementById("EmpList").style.display='none';
	document.forms["selectCompany"].submit();
}
function getEmp123()
{
	document.getElementById("EmpList").style.display='block';
	var emp=document.getElementById("from1").value;
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
			//alert(">>>result "+reslt);
			document.getElementById("EmpList").innerHTML=reslt;
		} 
	}
	var queryString = "?emp=" +emp+"&crg=VisingCard";
	ajaxRequest.open("GET", "SearchBoxForFromCategory.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
}
function validate()
{
//	var val1 = document.getElementById("inno").value;
//	var val2 = document.getElementById("inrefno").value;
}
</script>

</head>
<body
	ONKEYDOWN="if (event.keyCode == 27){document.getElementById('EmpList').style.display = 'none';}">
	<%!
Connection con1;
static String cnm="";
%>
	<% 
try
{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con1 = DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307:3306/twsql_twalldata","erp","1@erp");
	//	con1 = DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307:3306/twsql_twalldata","erp","1@erp");
		Statement st=con1.createStatement();
		String sql="";
		/*
		sql="SELECT * from t_prospectivecustmaster where customercode="+request.getParameter("customercode")+" limit 1";				
        System.out.println("customer query---->>"+sql);
        ResultSet rs= st.executeQuery(sql);
        String maddress="";
        String mcity="";
        String mcountry="";
        String mstate="";
        String mzip="";
        while (rs.next())
        {
            maddress=rs.getString("address");
            mcity=rs.getString("city");
            mcountry=rs.getString("country");
            mstate=rs.getString("state");
            mzip=rs.getString("zip");
        	
        }
        */
%>




	<div style="width: 100%; height: 32px; text-align: center;">
		<h3>
			Add Contacts
			</h1>
	</div>

	<table align="center" width="40%">

	</table>


	<%
int custCode=0, salesCustCode=0, contid=0 ;
String cty="", adr="", cntry="", state="", zip="";
try
{
	
	String sqlcont="select * from t_prospectivecustmaster where CompanyName like '"+request.getParameter("from1")+"'";
	System.out.println(sqlcont);
	ResultSet rscont=st.executeQuery(sqlcont);
	if(rscont.next())
	{
		custCode=rscont.getInt("CustomerCode");
		salesCustCode=rscont.getInt("SalesCustomerCode");
		cty=rscont.getString("City"); 
		adr=rscont.getString("Address"); 
		cntry=rscont.getString("Country"); 
		state=rscont.getString("State"); 
		zip=rscont.getString("Zip");
	}
}
catch(Exception e)
{
	System.out.println("Exception : !!! contactdetails--->"+e);
}
%>
	<%
//cnm=request.getParameter("from1");
try
{
	if(cnm==null)
	{
		cnm="-";
	}
}
catch(Exception e){}
%>
	<div id="content">
		<div id="dataentry"
			style="position: absolute; width: 50%; background-color: #94ECF6; border: solid thin black; -moz-border-radius-topleft: 20px; -moz-border-radius-bottomleft: 20px; -moz-border-radius-topright: 20px; -moz-border-radius-bottomright: 20px;">
			<div
				style="border: thin solid blue; background-color: #457FC2; height: 26px; -moz-border-radius-topleft: 20px; -moz-border-radius-topright: 20px;">
				<table style="color: white; align: center; width: 100%">
					<tr style="color: white; text-align: center;">
						<td style="width: 80%; color: white;"><strong>Contact
								Entry</strong></td>
						<td align="right"><a href="#"
							style="font-weight: bold; color: black;"
							onclick="cancelentryform()"> <img src="images/end.JPG"
								width="25px" height="22px" style="border-style: none"></img>
						</a>&nbsp; <!-- <input type="button" name="cancel" id="cancel" value="X"  onclick="cancelentryform()" style="width:20; color:red;" /> -->
						</td>
					</tr>
				</table>
			</div>
			<table style="width: 100%;" border="0">

				<form name="contactdata" action="AjaxSaveContact.jsp" method="post"
					autocomplete="off">
					<tr>
						<td align="left" width="30%"><b>Company Name:</b></td>
						<td id="frmParty"><input type="hidden" name="SelectedEmpMail"
							id="SelectedEmpMail" value="" /> <input type="text" name="from1"
							id="from1" autocomplete="off" style="width: 250px;" value=""
							onkeyup="if (event.keyCode == 27 || event.keyCode == 13){document.getElementById('EmpList').style.display = 'none';} else {getEmp123();}" />
							&nbsp;&nbsp;&nbsp;<br>
								<div style="position: absolute;">
									<table>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td>
												<div id='EmpList'
													style="position: absolute; width: 50%; background-color: #94ECF6; border: solid thin black; -moz-border-radius-topleft: 20px; -moz-border-radius-bottomleft: 20px; -moz-border-radius-topright: 20px; -moz-border-radius-bottomright: 20px;"></div>
											</td>
										</tr>
									</table>
								</div></td>
					</tr>

					<tr>
						<td></td>
						<td><div id="comName"></div></td>
					</tr>
					<tr>
						<td align="left" width="30%"><b>Contact Person:</b></td>
						<td width="70%"><select name="salutation" id="salutation"
							style="width: 50px; height: 22px;">
								<option value='Mr.'>Mr.</option>
								<option value='Mrs.'>Mrs.</option>
								<option value='Ms.'>Ms.</option>
								<option value='Dr.'>Dr.</option>
						</select> <input type="text" name="firstname" style="width: 90px;" /> <input
							type="text" name="middlename" style="width: 90px;" /> <input
							type="text" name="lastname" style="width: 90px;" /></td>
					</tr>
					<tr>
						<td><b>Designation:</b></td>
						<td><input type="text" name="designation"
							style="width: 225px;" /></td>

					</tr>
					<tr>
						<td><b>Address:</b></td>
						<td><textarea name="address" rows="2" id="search-text"
								style='width: 225px; height: auto;'></textarea> <input
							type="button" name="copyaddress" id="copyaddress"
							value="Copy Company Address" onclick="addresspaste()"
							style="width: 170px;" /></td>
					</tr>
					<tr>
						<td><b>City:</b></td>
						<td><input type="text" name="city" style="width: 100px;" />
						</td>
					</tr>
					<tr>
						<td><b>Zip Code:</b></td>
						<td><input type="text" name="zipcode" style="width: 100px;" />
						</td>
					</tr>

					<tr>
						<td><b>State:</b></td>
						<td><input type="text" name="state" style="width: 150px;" />
						</td>
					</tr>
					<tr>
						<td><b>Country:</b></td>
						<td><input type="text" name="country" style="width: 150px;" />
						</td>
					</tr>

					<tr>
						<td><b>Mobile No:</b></td>
						<td><input type="text" name="mobileno" style="width: 225px;" />
						</td>
					</tr>
					<tr>
						<td><b>Email Ids:</b></td>
						<td><input type="text" name="emailids" style="width: 225px;" />
						</td>
					</tr>
					<tr>
						<td><b>Phone Nos.:</b></td>
						<td><input type="text" name="phoneno" style="width: 225px;" />
						</td>
					</tr>
					<tr>
						<td><b>Fax No.:</b></td>
						<td><input type="text" name="faxno" style="width: 190px;" />
							<input type="hidden" name="entryflag" value="ADD" /> <input
							type="hidden" name="customercode" value="<%=custCode%>" /> <input
							type="hidden" name="salescustomercode" value="<%=salesCustCode%>" />
							<input type="hidden" name="companyname" value="<%=cnm%>" /> <input
							type="hidden" name="c_address" value="<%=adr %>" /> <input
							type="hidden" name="c_city" value="<%=cty%>" /> <input
							type="hidden" name="c_country" value="<%=cntry%>" /> <input
							type="hidden" name="c_state" value="<%=state%>" /> <input
							type="hidden" name="c_zip" value="<%=zip%>" /></td>
					</tr>
			</table>
			<table style="width: 100%;">
				<tr>
					<td style="text-align: center;"><input type="submit"
						name="add" value="Save" style="width: 70px;" /></td>
				</tr>
			</table>
		</div>

		<div>
			<%
		String sql1="";
			if(custCode!=0)
			{
				sql1="SELECT * from t_contactdet where customercode="+custCode+" and companyname='"+cnm+"' order by firstname,middlename,lastname";				
	            System.out.println("customer query---->>"+sql1);	
			}
			else
			{
				sql1="SELECT * from t_contactdet where salesCustomerCode="+salesCustCode+" and companyname='"+cnm+"' order by firstname,middlename,lastname";				
	            System.out.println("customer query---->>"+sql1);
			}
		    
        
            ResultSet rs1= st.executeQuery(sql1);
            %>
			<div
				style="border: thin solid black; width: 48%; height: 400px; margin-left: 51%; position: absolute; background: color:aqua;">
				<table class="mysortable"
					style="width: 100%; background-color: #457FC2;">
					<tr>
						<td
							style="background-color: #457FC2; color: white; border: thin solid white; height: 32px; text-align: center;"><h3
								style="color: white">Contact List</h3></td>
					</tr>
				</table>
				<div style="overflow: auto;"></div>
				<table class="mysortable">
					<tr>
						<th style="width: 400px;">Contact Person</th>
						<th style="width: 200px;">Mobile No</th>
						<th style="width: 200px;">Email ID</th>

					</tr>
					<%
            while (rs1.next())
        	{
        		%>
					<tr>
						<td><%=rs1.getString("contactperson") %></td>
						<td><%=rs1.getString("mobileno") %></td>
						<td><%=rs1.getString("email") %></td>
					</tr>
					<%
        	}
   
}
catch(Exception e)
{
	System.out.println( "Exception ::"+e );
}
finally
{
	con1.close();
}
        %>
				</table>
			</div>

		</div>


	</div>
	</form>
	<%
	
	%>
</body>
</html>
