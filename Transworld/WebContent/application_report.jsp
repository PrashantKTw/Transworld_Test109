<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.io.File"%><html
	xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Application Report</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />
<link rel=StyleSheet href="css/css/mystyle.css" type="text/css"
	media="all" />
<script type="text/javascript">
function validateForm() {
	alert("Are you want to submit your details!");
}
function getFTPImage(ftpFile)
{
	try
	{
		//alert(escape(ftpFile));
		//alert(ftpFile);
		window.open('showDocs.jsp?ftpFile='+ftpFile+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
	}
	catch(e)
	{
		alert(e);
	}
}




</script>
</head>
<body id="main_body">
	<%
String emp_id=request.getParameter("emp_id");
System.out.println("emp_id is<><><><><>1111111 :"+emp_id);
Connection conn=null;
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","erp","1@erp");
//conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");
}
catch(Exception e)
{
	System.out.println("Exception=========>>"+e);
}
try {
Statement st=conn.createStatement();
String query = "select * from t_applicant_details where EmpID = "+emp_id+"";
System.out.println("query :"+query);
ResultSet rs = st.executeQuery(query);
%>
	<img id="top" src="newimages/top.png" alt="" />

	<div id="form_container">



		<h1 align="center">
			<a>Application Report</a>
		</h1>
		<form id="application3" name="application3" class="appnitro"
			enctype="multipart/form-data" method="get"
			action="application_edit.jsp">
			<div class="form_container1"></div>

			<ul>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="1" width="100%" align="center">
						<%
Statement st15=conn.createStatement();
String query15 = "select * from t_applicant_details where EmpID ="+emp_id+"";
ResultSet rs15 = st15.executeQuery(query15);
while(rs15.next())
{
	%>

						<tr id="tredu11">

							<div align="right">
								<b>Applied Post :</b>
								<%=rs15.getString("AppliedFor") %>
							</div>

						</tr>
					</table>
					<br />
				</div>
			</ul>
			<%} %>

			<ul>

				<font size="3" style="margin-left: 0.4em;">Personal Details</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<% 
	if(rs.next())
{
		System.out.println(">>>>>>>>>>>In if>>>>>>>>>>>>");
	%>
					<div align="left">
						<b>Name : <%=rs.getString("Name") %></b>
					</div>

					<table width="100%" border="1">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Permanent
								Address</th>
						</tr>
						<tr>
							<td width="100%" colspan="1"><%=rs.getString("Address1") %>
							</td>
						</tr>
					</table>
					<br />

					<table width="100%" border="1">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Address
								of Correspondence</th>
						</tr>
						<tr>
							<td width="100%" colspan="1"><%=rs.getString("Address2") %>
							</td>
						</tr>
					</table>
					<br />



					<table width="100%" border="1">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">State
							</th>
							<th style="background-color: #C6DEFF;" align="center">City</th>
							<th style="background-color: #C6DEFF;" align="center">Pin
								code</th>
						</tr>
						<tr>
							<td width="33%"><%=rs.getString("State") %></td>
							<td width="33%"><%=rs.getString("City") %></td>

							<td width="33%"><div align="right"><%=rs.getString("Pincode") %></div>
							</td>
						</tr>
					</table>
					<br />
					<table width="100%" border="1">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Contact
								Number</th>
							<th style="background-color: #C6DEFF;" align="center">Date
								Of Birth</th>
							<th style="background-color: #C6DEFF;" align="center">Drivers'
								License No</th>
							<th style="background-color: #C6DEFF;" align="center">Passport
								No</th>
						</tr>
						<tr>
							<td width="25%">
								<div align="right">
									<%=rs.getString("ContactNo") %>
								</div>
							</td>
							<td width="25%">
								<div align="right">
									<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-mm-dd").parse(rs.getString("DateOfBirth"))) %>
								</div>
							</td>
							<td width="25%">
								<div align="right">
									<%=rs.getString("DriversLicenseNo") %>
								</div>
							</td>
							<td width="25%"><%=rs.getString("PassportNo") %></td>
						</tr>
					</table>
					<br />
					<table width="100%" border="1">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Father's/Spouse's
								Name</th>
							<th style="background-color: #C6DEFF;" align="center">His/Her
								Occupation</th>
						</tr>
						<tr>
							<td width="50%"><%=rs.getString("FathersName") %></td>
							<td width="50%"><%=rs.getString("FathersOccupation") %></td>
						</tr>
					</table>
					<br />

					<table width="100%" border="1">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Email
								ID</th>
							<th style="background-color: #C6DEFF;" align="center">Gender</th>
							<th style="background-color: #C6DEFF;" align="center">PAN
								card No</th>
						</tr>
						<tr>
							<td width="33%" colspan="1"><%=rs.getString("EmailID") %></td>
							<td width="33%" colspan="1"><%=rs.getString("Gender") %></td>
							<td width="33%" colspan="1"><%=rs.getString("PanCard") %></td>
						</tr>
					</table>
					<br />
					<%
	}
%>
				</div>

			</ul>


			<ul>
				<font size="3" style="margin-left: 0.4em;">Educational
					Details</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">

					<table border="1" width="100%" align="center">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Degree</th>
							<th style="background-color: #C6DEFF;" align="center">Board</th>
							<th style="background-color: #C6DEFF;" align="center">Year</th>
							<th style="background-color: #C6DEFF;" align="center">Specialization</th>
							<th style="background-color: #C6DEFF;" align="center">Marks/Percentage</th>
						</tr>

						<tr id="tredu1">
							<% 
Statement st1=conn.createStatement();
String query1 = "select * from t_empeduqualification where EmpID ="+emp_id+" AND Degree = 'S.S.C'";
ResultSet rs1 = st1.executeQuery(query1);
while(rs1.next())
{
	%>

						</tr>
						<tr id="tredu2">
							<td colspan="0" width="15%">

								<div>S.S.C</div>
							</td>
							<td colspan="0" width="30%">

								<div>
									<%=rs1.getString("Board") %>
								</div>
							</td>
							<td colspan="1" width="15%">

								<div align="right">
									<%=rs1.getString("Year") %>
								</div>
							</td>
							<td colspan="1" width="20%">

								<div>
									<%=rs1.getString("Specialisation") %>
								</div>
							</td>
							<td colspan="1" width="20%">

								<div align="right">
									<%=rs1.getString("Marks_Percentage") %>
								</div>
							</td>
						</tr>
						<%} %>
						<tr id="tredu3">
							<% 
Statement st2=conn.createStatement();
String query2 = "select * from t_empeduqualification where EmpID ="+emp_id+" AND Degree = 'H.S.C'";
ResultSet rs2 = st1.executeQuery(query2);
while(rs2.next())
{
	%>

						</tr>

						<tr id="tredu4">
							<td colspan="0">

								<div>H.S.C</div>
							</td>
							<td colspan="1">

								<div>
									<%=rs2.getString("Board") %>
								</div>
							</td>
							<td colspan="1">

								<div align="right">
									<%=rs2.getString("Year") %>
								</div>
								</li>
							</td>
							<td colspan="1">

								<div>
									<%=rs2.getString("Specialisation") %>
								</div>
							</td>
							<td>

								<div align="right">
									<%=rs2.getString("Marks_Percentage") %>
								</div>
							</td>
						</tr>
						<%} %>
						<tr id="tredu5">
							<% 
Statement st3=conn.createStatement();
String query3 = "select * from t_empeduqualification where EmpID ="+emp_id+" AND Degree = 'Graduation'";
ResultSet rs3 = st1.executeQuery(query3);
while(rs3.next())
{
	%>
						</tr>
						<tr id="tredu6">
							<td colspan="0">

								<div>Graduation</div>
							</td>
							<td colspan="1">

								<div>
									<%=rs3.getString("Board") %>
								</div>
							</td>
							<td colspan="1">

								<div align="right">
									<%=rs3.getString("Year") %>
								</div>
							</td>
							<td colspan="1">
								<div>
									<%=rs3.getString("Specialisation") %>
								</div>
							</td>
							<td>

								<div align="right">
									<%=rs3.getString("Marks_Percentage") %>
								</div>
							</td>
						</tr>
						<%} %>
						<tr id="tredu7">
							<% 
Statement st4=conn.createStatement();
String query4 = "select * from t_empeduqualification where EmpID ="+emp_id+" AND Degree = 'Post Graduation'";
ResultSet rs4 = st1.executeQuery(query4);
while(rs4.next())
{
	%>
						</tr>
						<tr id="tredu8">
							<td colspan="0">

								<div>Post Graduation</div>
							</td>
							<td colspan="1">

								<div>
									<%=rs4.getString("Board") %>
								</div>
							</td>
							<td colspan="1">

								<div align="right">
									<%=rs4.getString("Year") %>
								</div>
							</td>
							<td colspan="1">

								<div>
									<%=rs4.getString("Specialisation") %>
								</div>
							</td>
							<td>

								<div align="right">
									<%=rs4.getString("Marks_Percentage") %>
								</div>
							</td>
						</tr>
						<%} %>
						<tr>

							<input type="hidden" name="emp_id" id="emp_id"
								value="<%=emp_id %>"></input>

						</tr>
					</table>
					<br />

				</div>
			</ul>


			<ul>
				<font size="3" style="margin-left: 0.4em;">Additional
					Qualifications</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="1" width="100%" align="center">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Institution</th>
							<th style="background-color: #C6DEFF;" align="center">Year</th>
							<th style="background-color: #C6DEFF;" align="center">Specialization</th>
							<th style="background-color: #C6DEFF;" align="center">Marks/Grade</th>
						</tr>

						<%! int count=0;%>
						<% 
Statement st5=conn.createStatement();
String query5 = "select count(*) from t_empadditionalQualification where EmpID ="+emp_id+"";
ResultSet rs5 = st5.executeQuery(query5);
if(rs5.next())
{
	count = rs5.getInt(1);
	%>

						<% 	if(count>0) 
	   {
		Statement st6=conn.createStatement();
		String query6 = "select * from t_empadditionalQualification where EmpID ="+emp_id+"";
		System.out.println(">>>>>>>>>>query6:"+query6);
		ResultSet rs6 = st6.executeQuery(query6);
		while(rs6.next())
		{
		%>
						<tr id="tredu11">
							<td colspan="1" width="30%">
								<div>
									<%=rs6.getString("Institute") %>
								</div>
							</td>
							<td colspan="1" width="20%">
								<div align="right">
									<%=rs6.getString("Year") %>
								</div>
							</td>
							<td colspan="1" width="30%">
								<div>
									<%=rs6.getString("Specialisation") %>
								</div>
							</td>
							<td colspan="1" width="20%">
								<div>
									<%=rs6.getString("Marks_Percentage") %>
								</div>
							</td>
						</tr>
						<%} }}%>
					</table>
					<br />
				</div>
			</ul>

			<ul>
				<font size="3" style="margin-left: 0.4em;">Work Experience</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="1" width="100%" align="center">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Company</th>
							<th style="background-color: #C6DEFF;" align="center">Position
								Held</th>
							<th style="background-color: #C6DEFF;" align="center">Salary
								PA</th>
							<th style="background-color: #C6DEFF;" align="center">Reason
								For Leaving</th>
							<th style="background-color: #C6DEFF;" align="center">From
								Date</th>
							<th style="background-color: #C6DEFF;" align="center">To
								Date</th>
						</tr>
						<% 
Statement st7=conn.createStatement();
String query7 = "select count(*) from t_workexperience where EmpID ="+emp_id+"";
ResultSet rs7 = st7.executeQuery(query7);
if(rs7.next())
{
	count = rs7.getInt(1);
	%>

						<% 	if(count>0) 
	   {
		Statement st8=conn.createStatement();
		String query8 = "select * from t_workexperience where EmpID ="+emp_id+"";
		System.out.println(">>>>>>>>>>query8:"+query8);
		ResultSet rs8 = st8.executeQuery(query8);
		while(rs8.next())
		{
		%>

						<tr id="trwork11">
							<td colspan="1">
								<div>
									<%=rs8.getString("Company") %>
								</div>
							</td>
							<td colspan="1">
								<div>
									<%=rs8.getString("PositionHeld") %>
								</div>
							</td>
							<td colspan="1">
								<div align="right">
									<%=rs8.getString("SalaryPA") %>
								</div>
							</td>
							<td colspan="1">
								<div>
									<%=rs8.getString("ReasonforLeaving") %>
								</div>
							</td>
							<td colspan="1">
								<div align="right">
									<%=rs8.getString("FromDate") %>
								</div>
							</td>
							<td colspan="1">
								<div align="right">
									<%=rs8.getString("Todate") %>
								</div>
							</td>

						</tr>
						<%} }}%>
					</table>
					<br />
				</div>
			</ul>


			<ul>
				<font size="3" style="margin-left: 0.4em;">Skills</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="1" width="100%" align="center">

						<%
Statement st9=conn.createStatement();
String query9 = "select * from t_skills where EmpID = "+emp_id+"";
System.out.println(">>>>>>>>>>query9:"+query9);
ResultSet rs9 = st9.executeQuery(query9);
%>

						<tr>
							<%
while(rs9.next()) {
	System.out.println(">>>>>>>>>>query9:"+query9);	
%>

							<th style="background-color: #C6DEFF;" align="center">MS
								Office</th>
							<th style="background-color: #C6DEFF;" align="center">Windows</th>
							<th style="background-color: #C6DEFF;" align="center">AutoCAD</th>
							<th style="background-color: #C6DEFF;" align="center">Tally</th>
						</tr>
						<tr>
							<td width="25%" colspan="1"><%=rs9.getString("MSOffice") %>
							</td>
							<td width="25%" colspan="1"><%=rs9.getString("Windows") %></td>
							<td width="25%" colspan="1"><%=rs9.getString("AutoCAD") %></td>
							<td width="25%" colspan="1"><%=rs9.getString("Tally") %></td>
						</tr>
					</table>
					<br />
					<table border="1" width="100%" align="center">

						<tr>
							<th style="background-color: #C6DEFF;" align="center">Typing(wpm)</th>
							<th style="background-color: #C6DEFF;" align="center">Shorthand(wpm)</th>
							<th style="background-color: #C6DEFF;" align="center">Any
								Other skills</th>
							<th style="background-color: #C6DEFF;" align="center">Command
								Over English</th>
						</tr>
						<tr id="trwork29">
							<td colspan="1" width="25%">
								<div>
									<%=rs9.getString("Typing") %>
								</div>
							</td>
							<td colspan="1" width="25%">
								<div>
									<%=rs9.getString("Shorthand") %>
								</div>
							</td>
							<td colspan="1" width="25%">
								<div>
									<%=rs9.getString("AnyOtherSkills") %>
								</div>
							</td>
							<td colspan="1" width="25%">
								<div>
									<%=rs9.getString("CommandOverEnglish") %>
								</div>
							</td>
						</tr>
					</table>
					<br />
					<%} %>
				</div>
			</ul>


			<ul>
				<font size="3" style="margin-left: 0.4em;">Other Details</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="1" width="100%" align="center">
						<%
Statement st10=conn.createStatement();
String query10 = "select * from t_otherdetails where EmpID ="+emp_id+"";
System.out.println(">>>>>>>>>>query10:"+query10);
ResultSet rs10 = st10.executeQuery(query10);
while(rs10.next()) {
%>
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Other
								Details</th>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_1"><font size="2">What
										are your achievements? </font></label>
								<div>
									Ans :
									<%=rs10.getString("Achievements") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_2"><font size="2">Where
										do you see yourself 5 years from now? </font></label>
								<div>
									Ans :
									<%=rs10.getString("Seeyourself5YearsFromNow") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_3"><font size="2">What
										are your strenghts and weaknesses? </font></label>
								<div>
									Ans :
									<%=rs10.getString("StrengthsWeakness") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_4"><font size="2">What
										are your extra-curricular activities?</font> </label>
								<div>
									Ans :
									<%=rs10.getString("ExtraCurricular") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_5"><font size="2">Expected
										salary ? </font></label>
								<div>
									Ans :
									<%=rs10.getString("ExpectedSalary") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_6"><font size="2">How
										would it benefit the company if we hire you? </font></label>
								<div>
									Ans :
									<%=rs10.getString("BenefitToCompany") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_7"><font size="2">Why
										do you want to leave your present job? </font> </label>
								<div>
									Ans :
									<%=rs10.getString("whyYouWantToLeaveYourPresentJob") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_8"><font size="2">Do
										you suffer from any health problems,if any please specify:
										Heart Attacks/High BP/Low BP/Broachitis/Any Other ? </font></label>
								<div>
									Ans :
									<%=rs10.getString("HealthProblem") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_9"><font size="2">Do
										you have any litigation? </font></label>
								<div>
									Ans :
									<%=rs10.getString("AnyLitigation") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_10"><font size="2">Do
										you have any police record? If yes, please specify: </font></label>
								<div>
									Ans :
									<%=rs10.getString("AnyPoliceRecord") %>
								</div></td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;"><label
								class="description" for="element_11"><font size="2">References
										:(Starte Name ,Address and phone nos. of two references who
										are not relatives) </font></label>
								<div>
									Ans :
									<%=rs10.getString("References1") %>
								</div></td>
						</tr>
					</table>

				</div>
			</ul>
			<br />

			<ul>
				<font size="3" style="margin-left: 0.4em;">Uploaded Documents
				</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="" width="100%" align="center">
						<tr>
							<th style="background-color: #C6DEFF;" align="center">Uploaded
								Documents :</th>
						</tr>

						<tr>
							<%
      try {
      if(rs.getString("AddressProof")=="-" || rs.getString("AddressProof").equals("-") || rs.getString("AddressProof")==null || rs.getString("AddressProof").equals("null"))
				{
					
				}
				else
      			{
			%>
							<td align="right"><div align="left">
									<a href="#"
										onclick="getFTPImage('<%=rs.getString("AddressProof").substring(rs.getString("AddressProof").lastIndexOf("/")+1) %>')">
										<font size="2"><%= rs.getString("AddressProof").substring(rs.getString("AddressProof").lastIndexOf("/")+1)%></font>
								</div></td>
							<%
		}
      %>
						</tr>
						<tr>
							<%
      if(rs.getString("IdProof")=="-" || rs.getString("IdProof").equals("-") || rs.getString("IdProof")==null || rs.getString("IdProof").equals("null"))
				{
					
				}
				else
      			{
			%>
							<td align="right"><div align="left">
									<a href="#"
										onclick="getFTPImage('<%=rs.getString("IdProof").substring(rs.getString("IdProof").lastIndexOf("/")+1) %>')">
										<font size="2"><%= rs.getString("IdProof").substring(rs.getString("IdProof").lastIndexOf("/")+1)%></font>
								</div></td>
							<%
		}
      %>
						</tr>
						<tr>
							<%
      if(rs10.getString("documentUpload1")=="-" || rs10.getString("documentUpload1").equals("-") || rs10.getString("documentUpload1")==null || rs10.getString("documentUpload1").equals("null"))
				{
					
				}
				else
      			{
			%>
							<td align="right"><div align="left">
									<a href="#"
										onclick="getFTPImage('<%=rs10.getString("documentUpload1").substring(rs10.getString("documentUpload1").lastIndexOf("/")+1) %>')">
										<font size="2"><%= rs10.getString("documentUpload1").substring(rs10.getString("documentUpload1").lastIndexOf("/")+1)%></font>
								</div></td>
							<%
		}
      %>
						</tr>
						<tr>
							<%
      if(rs10.getString("documentUpload2")=="-" || rs10.getString("documentUpload2").equals("-") || rs10.getString("documentUpload2")==null || rs10.getString("documentUpload2").equals("null"))
		{
			
		}
		else
		{
	%>
							<td align="right"><div align="left">
									<a href="#"
										onclick="getFTPImage('<%=rs10.getString("documentUpload2").substring(rs10.getString("documentUpload2").lastIndexOf("/")+1) %>')">
										<font size="2"><%= rs10.getString("documentUpload2").substring(rs10.getString("documentUpload2").lastIndexOf("/")+1)%></font>
								</div></td>
							<%
}
      %>
						</tr>
						<tr>
							<%
      if(rs10.getString("documentUpload3")=="-" || rs10.getString("documentUpload3").equals("-") || rs10.getString("documentUpload3")==null || rs10.getString("documentUpload3").equals("null"))
		{
			
		}
		else
		{
	%>
							<td align="right"><div align="left">
									<a href="#"
										onclick="getFTPImage('<%=rs10.getString("documentUpload3").substring(rs10.getString("documentUpload3").lastIndexOf("/")+1) %>')">
										<font size="2"><%= rs10.getString("documentUpload3").substring(rs10.getString("documentUpload3").lastIndexOf("/")+1)%></font>
								</div></td>
							<%
}
      %>
						</tr>
						<tr>
							<%
      if(rs10.getString("documentUpload4")=="-" || rs10.getString("documentUpload4").equals("-") || rs10.getString("documentUpload4")==null || rs10.getString("documentUpload4").equals("null"))
		{
			
		}
		else
		{
	%>
							<td align="right"><div align="left">
									<a href="#"
										onclick="getFTPImage('<%=rs10.getString("documentUpload4").substring(rs10.getString("documentUpload4").lastIndexOf("/")+1) %>')">
										<font size="2"><%= rs10.getString("documentUpload4").substring(rs10.getString("documentUpload4").lastIndexOf("/")+1)%></font>
								</div></td>
							<%
}
      %>
						</tr>
					</table>
					<br />
				</div>
			</ul>


			<%
      }catch(Exception e) {
    	  System.out.println("exception e :"+e );
      }
      %>

			<%} %>
			<input type="hidden" name="emp_id" value='"+emp_id+"'></input> <br />
			<br />

			<center>
				<input type="button" name="submit" value="Submit"
					onclick='window.location="application_submit.jsp";'
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff" />
				<input type="submit" name="edit" value="Edit"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff"></input>
			</center>

			<%


//response.sendRedirect("application_submit.jsp?emp_id='"+emp_id+"'");

%>
		</form>
	</div>

	<%
      } catch(Exception e) {
	
}
%>
</body>
</html>