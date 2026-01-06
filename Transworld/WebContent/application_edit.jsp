<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>application edit</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />
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
function validateForm() 
{	
	var name = document.application4.name.value;
	if(name=="") {
		alert("Enter your Name!");
		return false;
		}
		var state= document.application4.state.value;
		var invalid=/[^A-Za-z\s]/;
			if(state=="") {
				alert("Please enter a state!");
			return false;
		}
			if(invalid.test(state))
			{
				alert("Invalid state name!");
				return false;
			}

			var gender= document.getElementById("gender").options[document.getElementById("gender").selectedIndex].value;
			if(gender=="select") {
					
					alert("Please select a gender!");
				return false;
				}

			var city= document.application4.city.value;
			var invalid=/[^A-Za-z\s]/;
				if(city=="") {
					alert("Please enter a city!");
				return false;
			}
				if(invalid.test(city))
				{
					alert("Invalid city name!");
					return false;
				}

	var pin=document.application4.pin.value;
	var invalid=/[^0-9]/; //digits only allowed
	if(pin==""){
	alert("Enter Pin code!");
	return false;
	}
	if(invalid.test(pin))
	{
		alert("Invalid Pincode!");
		return false;
	}
	if(pin.length<6 || pin.length>6){
		alert("Pincode must contain 6 numbers!");
		return false;
	}
	var mno=document.application4.contact.value;
	var invalid=/[^0-9]/; //only numbers are  permitted
	if(mno==""){
		alert("Enter your Contact Number!");
		return false;
	}
	if(invalid.test(mno)){
		alert("Invalid Contact Number!");
		return false;
	}
	if(mno.length<10 || mno.length>10){ //contact number must be 10 digits length
		alert("Contact Number must be 10 numbers length!");
		return false;
	}
	var f_name=document.application4.f_name.value;
 //only numbers are  permitted
	if(f_name==""){
		alert("Enter your Father's Name!");
		return false;
	}

	var s_board = document.application4.s_board.value;
	var invalid=/[^A-Za-z\s]/;
		if(s_board=="") {
			alert("Enter your S.S.C Board!");
			return false;
		}
		if(invalid.test(s_board)) {
			alert("Enter valid S.S.C Board Name!");
			return false;
 	}
		var s_year = document.application4.s_year.value;
		var invalid = /[^0-9]/;
		if(s_year=="") {
		alert("Enter your S.S.C Year!");
		return false;
		}
		if(invalid.test(s_year)) {
		alert("Enter valid S.S.C Year!");
		return false;
		}
		if(s_year.length<4 || s_year.length>4){ 
			alert("S.S.C Year must be in 4 digits !");
			return false;
		}
		var s_marks = document.application4.s_marks.value;
		if(s_marks=="") {
		alert("Enter your S.S.C Percentage!");
		return false;
		}

 		
		if(s_marks.indexOf(".") != -1)
			{
			if(!/\.[0-9]{1,2}$/.test(s_marks))
			{
			alert("S.S.C percentage should be two fractional positions required");
			return false;
			}
			} 
		//validation for hsc
		var h_board = document.application4.h_board.value;
		var invalid=/[^A-Za-z\s]/;
		if(h_board=="") {
			alert("Enter your H.S.C Board!");
			return false;
		}
		if(invalid.test(h_board)) {
			alert("Enter valid H.S.C Board Name!");
			return false;
 	}
		var h_year = document.application4.h_year.value;
		var invalid = /[^0-9]/;
		if(h_year=="") {
		alert("Enter your H.S.C Year!");
		return false;
		}
		if(invalid.test(h_year)) {
		alert("Enter valid H.S.C Year!");
		return false;
		}
		if(h_year.length<4 || h_year.length>4){ 
			alert("H.S.C Year must be in 4 digits !");
			return false;
		}
		var h_spe = document.application4.h_spe.value;
		var invalid = /[^A-Za-z]/;
		if(h_spe=="") {
		alert("Enter your H.S.C Specialization!");
		return false;
			}
		if(invalid.test(h_spe)) {
		alert("Enter valid H.S.C specialization!");
		return false;
		}
		var h_marks = document.application4.h_marks.value;
		if(h_marks=="") {
		alert("Enter your H.S.C Percentage!");
		return false;
		}
		if(h_marks.indexOf(".") != -1)
		{
		if(!/\.[0-9]{1,2}$/.test(h_marks))
		{
		alert("H.S.C percentage should be two fractional positions required");
		return false;
		}
	}
		var g_board = document.application4.g_board.value;
		var invalid=/[^A-Za-z\s]/;
			if(g_board!="") {

				if(invalid.test(g_board)) {
					alert("Enter valid Graduation Board Name!");
					return false;
					}
					var g_year = document.application4.g_year.value;
			 		var invalid = /[^0-9]/;
			 		if(g_year=="") {
						alert("Enter your Graduation Year!");
						return false;
			 		}
			 		if(invalid.test(g_year)) {
						alert("Enter valid Graduation Year!");
						return false;
	 				}
			 		if(g_year.length<4 || g_year.length>4){ 
			 			alert("Graduation Year must be in 4 digits !");
			 			return false;
			 		}
			 		var g_spe = document.application4.g_spe.value;
			 		var invalid=/[^A-Za-z\s]/;
		 			if(g_spe=="") {
						alert("Enter your Graduation Specialization!");
						return false;
			 			}
		 			if(invalid.test(g_spe)) {
						alert("Enter valid Graduation specialization!");
						return false;
			 		}
		 			var g_marks = document.application4.g_marks.value;
		 			if(g_marks=="") {
						alert("Enter your Graduation Percentage!");
						return false;
			 		}
		 			if(g_marks.indexOf(".") != -1)
		 			{
		 			if(!/\.[0-9]{1,2}$/.test(g_marks))
		 			{
		 			alert("Graduation percentage should be two fractional positions required");
		 			return false;
		 			}
		 			}
			}
			else
				var g_board = document.application4.g_board.value;
			    var g_year = document.application4.g_year.value;
			    var g_spe = document.application4.g_spe.value;
			    var g_marks = document.application4.g_marks.value;
			    if((g_year!="" || g_spe!="" || g_marks!="") && g_board==""){
						alert("Enter your graduation board!");
						return false;
				    }


			    var p_board = document.application4.p_board.value;
			    var invalid=/[^A-Za-z\s]/;
				if(p_board!="") {

					if(invalid.test(p_board)) {
						alert("Enter valid Post Graduation Board Name!");
						return false;
						}
						var p_year = document.application4.p_year.value;
				 		var invalid = /[^0-9]/;
				 		if(p_year=="") {
							alert("Enter your Post Graduation Year!");
							return false;
				 		}
				 		if(invalid.test(p_year)) {
							alert("Enter valid Post Graduation Year!");
							return false;
		 				}
				 		if(p_year.length<4 || p_year.length>4){ 
				 			alert("Post Graduation Year must be in 4 digits !");
				 			return false;
				 		}
				 		var p_spe = document.application4.p_spe.value;
				 		var invalid=/[^A-Za-z\s]/;
			 			if(p_spe=="") {
							alert("Enter your Post Graduation Specialization!");
							return false;
				 			}
			 			if(invalid.test(p_spe)) {
							alert("Enter valid Post Graduation specialization!");
							return false;
				 		}
			 			var p_marks = document.application4.p_marks.value;
			 			if(p_marks=="") {
							alert("Enter your Post Graduation Percentage!");
							return false;
				 		}
			 			if(p_marks.indexOf(".") != -1)
			 			{
			 			if(!/\.[0-9]{1,2}$/.test(p_marks))
			 			{
			 			alert("Post Graduation percentage should be two fractional positions required");
			 			return false;
			 			}
			 			}
				}
				else
					var p_board = document.application4.p_board.value;
				    var p_year = document.application4.p_year.value;
				    var p_spe = document.application4.p_spe.value;
				    var p_marks = document.application4.p_marks.value;
				    if((p_year!="" || p_spe!="" || p_marks!="" ) && p_board==""){
							alert("Enter your Post graduation board!");
							return false;
					    }
				    var g_board = document.application4.g_board.value;
				    var p_board = document.application4.p_board.value;
				    if(g_board=="" && (p_board!="" || p_spe!="" || p_marks!="")) {
							alert("enter valid education!!");
							return false;
					    }
		 	
		 		
			
	
return true;
}

</script>

</head>
<body id="main_body">

	<%

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
String datenew1="";
String datenew2="";
if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
  }

else {
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}

%>

	<% 
		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
		
		
%>

	<img id="top" src="newimages/top.png" alt="" />

	<div id="form_container">

		<h1 align="center">
			<a>Application Form</a>
		</h1>
		<br />
		<%

String emp_id=request.getParameter("emp_id");
System.out.println("emp_id is ****************************************************** :"+request.getParameter("emp_id"));
try {
	
	//if(request.getParameter("edit")!=null) {
		System.out.println("in if>>");	
	
%>
		<form id="application4" name="application4" class="appnitro"
			enctype="multipart/form-data" method="get"
			action="application_final.jsp" onsubmit="return validateForm()">
			<div class="form_container1"></div>
			<ul>
				<font size="3" style="margin-left: 0.4em;">Personal Details</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">
						<%
Statement st=conn.createStatement();
String query = "select * from t_applicant_details where EmpID = "+emp_id+"";
System.out.println("query :"+query);
ResultSet rs = st.executeQuery(query);
while(rs.next()) {
%>
						<tr>
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_4" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_4"
										style="width: 150px;"><font size="2">Name *</font></label>
									<div>
										<input id="name" name="name" class="element text medium"
											type="text" maxlength="255" value="<%=rs.getString("Name")%>"
											style="width: 400px; height: 16px;" />
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="1" style="width: 30%;">
								<div style="width: 10em;">
									<li id="li_7"><label class="description" for="element_8"
										style="width: 170px;"><font size="2">Permanent
												Address </font></label>
										<div>
											<textarea name="add1" id="add1"
												class="element textarea small" style="width: 460px;"><%=rs.getString("Address1") %></textarea>
										</div></li>
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="1" style="width: 30%;">
								<div style="width: 10em;">
									<li id="li_7"><label class="description" for="element_8"
										style="width: 170px;"><font size="2">Address of
												Correspondence </font></label>
										<div>
											<textarea name="add2" id="add2"
												class="element textarea small" style="width: 460px;"><%=rs.getString("Address2") %></textarea>
										</div></li>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="1" style="width: 30%;">
								<div style="width: 10em;">
									<li id="li_7"><label class="description" for="element_8"
										style="width: 170px;"><font size="2">Email ID*
										</font></label>
										<div>
											<input id="email" name="email" class="element text medium"
												type="text" maxlength="255"
												value="<%=rs.getString("EmailID") %>"
												style="width: 200px; height: 16px;"></input>
										</div></li>
								</div>
							</td>
							<td style="width: 10%;"></td>
							<td colspan="1" style="width: 5em;">
								<div style="width: 15%; margin-left: -5em;">
									<li id="li_8"><label class="description" for="element_8"
										style="width: 100px;"><font size="2">Gender * </font></label>
										<div>
											<select class="element select medium" id="gender"
												name="gender" style="width: 100px; height: 20px;">
												<option value="select" selected="selected">select</option>
												<option value="Male">Male.</option>
												<option value="Female">Female</option>

											</select>
										</div></li>
								</div>
							</td>
						</tr>


						<td colspan="1" style="width: 5em;">
							<div style="width: 15%;">
								<li id="li_10" style="width: 150px;"><label
									class="description" for="element_11" style="width: 170px;"><font
										size="2">State * </font></label>
									<div>
										<input type="text" id="state" name="state"
											value="<%=rs.getString("State") %>"
											class="element text medium" maxlength="200"
											style="width: 147px; height: 16px;"></input>
									</div></li>
							</div>
						</td>
						<td colspan="1" style="width: 10%;">
							<div style="width: 10em; margin-left: -3em;">
								<li id="li_11" style="margin-left: 7.4em;"><label
									class="description" for="element_12" style="width: 150px;"><font
										size="2">City *</font></label>
									<div>
										<input type="text" id="city" name="city"
											value="<%=rs.getString("city") %>"
											class="element text medium" maxlength="200"
											style="width: 147px; height: 16px;"></input>
									</div></li>
							</div>
						</td>
						<td></td>
						<td style="width: 15em;">
							<div style="width: 15%; margin-left: 1em" id="li_12">

								<label class="description" for="element_13"
									style="width: 150px;"><font size="2">PinCode *</font></label>
								<div>
									<input id="pin" name="pin" class="element text medium"
										type="text" maxlength="255"
										value="<%=rs.getString("Pincode") %>"
										style="width: 100px; height: 14px; text-align: right"></input>
								</div>
							</div>
						</td>
						</tr>
						<tr>
							<td id="tr3" colspan="1">
								<li id="li_1" style="width: 190px;"><label
									class="description" for="element_1"><font size="2">Contact
											Number *</font></label>
									<div>
										<input id="element_1" name="contact"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs.getString("ContactNo") %>"
											style="width: 150px; height: 14px; text-align: right" />
									</div></li>
							</td>
							<td style="width: 10%;"></td>
							<td id="tr3" colspan="1">
								<li id="li_2" style="width: 190px; margin-left: -3em;"><label
									class="description" for="element_2"><font size="2">Date
											Of Birth *</font></label> <%
		String dob = rs.getString("DateOfBirth");
		//String[] strDob = dob.split(",");
		// for (String str : strDob) {
			     //System.out.println(str);
			 //}
		StringTokenizer st50 = new StringTokenizer(dob, "-"); 
		while(st50.hasMoreTokens()) {
			String yyyy = st50.nextToken();
			String mm = st50.nextToken();
			String dd = st50.nextToken();
		
		%> <span> <input id="element_2_1" name="dd"
										class="element text" size="2" maxlength="2" value="<%=dd%>"
										type="text" style="text-align: right" /> <label
										for="element_2_1"><font size="2">DD</font></label>
								</span> <span> <input id="element_2_2" name="mm"
										class="element text" size="2" maxlength="2" value="<%=mm%>"
										type="text" style="text-align: right" /> <label
										for="element_2_2"><font size="2">MM</font></label>
								</span> <span> <input id="element_2_3" name="yyyy"
										class="element text" size="4" maxlength="4" value="<%=yyyy%>"
										type="text" style="text-align: right" /> <label
										for="element_2_3"><font size="2">YYYY</font></label>
								</span></li>
							</td>
						</tr>
						<%} %>
						<tr>
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_41" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_4"
										style="width: 170px;"><font size="2">Father's/Spouse's
											Name *</font></label>
									<div>
										<input id="f_name" name="f_name" class="element text medium"
											type="text" maxlength="255"
											value="<%=rs.getString("FathersName") %>"
											style="width: 400px; height: 16px;" />
									</div>
								</div>
								<div>
									<li id="li_91"><label class="description"
										for="element_101" style="width: 150px"><font size="2">His/Her
												Occupation </font></label>
										<div>
											<input id="element_101" name="occupation"
												class="element text medium" type="text" maxlength="255"
												value="<%=rs.getString("FathersOccupation") %>"
												style="width: 200px; height: 16px;"></input>
										</div></li>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="1" style="width: 30%;">
								<div style="width: 10em;">
									<li id="li_7"><label class="description" for="element_81"
										style="width: 170px;"><font size="2">Drivers'
												License No</font></label>
										<div>
											<input id="element_81" name="dl_no"
												class="element text medium" type="text" maxlength="255"
												value="<%=rs.getString("DriversLicenseNo") %>"
												style="width: 200px; height: 16px;"></input>
										</div></li>
								</div>
							</td>
							<td style="width: 10%;"></td>
							<td colspan="1" style="width: 5em;">
								<div style="width: 15%; margin-left: -5em;">
									<li id="li_8"><label class="description" for="element_92"
										style="width: 150px;"><font size="2">Passport
												No </font></label>
										<div>
											<input id="element_92" name="pass_no"
												class="element text medium" type="text" maxlength="255"
												value="<%=rs.getString("PassportNo") %>"
												style="width: 200px; height: 16px;"></input>
										</div></li>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="1" style="width: 30%;">
								<div style="width: 10em;">
									<li id="li_7"><label class="description" for="element_8"
										style="width: 170px;"><font size="2">PAN Card
												No </font></label>
										<div>
											<input id="pancard" name="pancard"
												class="element text medium" type="text" maxlength="255"
												value="<%=rs.getString("PanCard") %>"
												style="width: 200px; height: 16px;"></input>
										</div></li>
								</div>
							</td>
							<td style="width: 10%;"></td>


						</tr>
					</table>
					<%} %>
				</div>
			</ul>

			<ul>
				<font size="3" style="margin-left: 0.4em;">Educational
					Details *</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">
						<tr id="tredu1">
							<% 
Statement st1=conn.createStatement();
String query1 = "select * from t_empeduqualification where EmpID ="+emp_id+" AND Degree = 'S.S.C'";
ResultSet rs1 = st1.executeQuery(query1);
while(rs1.next())
{
	%>
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_33"
										style="width: 120px;"><b><font size="2">S.S.C</font></b></label>
								</div>
							</td>
						</tr>
						<tr id="tredu2">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_25" style="width: 150px;"><font
										size="2">Board </font></label>
									<div>
										<input id="element_25" name="s_board"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs1.getString("Board") %>"
											style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="s_year" name="s_year" class="element text medium"
											type="text" maxlength="255"
											value="<%=rs1.getString("Year") %>	"
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_27" name="s_spe"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs1.getString("Specialisation") %>"
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td>
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Percentage </font></label>
									<div>
										<input id="element_28" name="s_marks"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs1.getString("Marks_Percentage") %>"
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
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
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_34"
										style="width: 120px;"><b><font size="2">H.S.C/Diploma</font></b></label>
								</div>
							</td>
						</tr>
						<tr id="tredu4">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_35" style="width: 150px;"><font
										size="2">Board/University </font></label>
									<div>
										<input id="element_35" name="h_board"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs2.getString("Board") %>"
											style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_36" name="h_year"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs2.getString("Year") %>	"
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_37" name="h_spe"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs2.getString("Specialisation") %>"
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td>
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Percentage </font></label>
									<div>
										<input id="element_38" name="h_marks"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs2.getString("Marks_Percentage") %>"
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
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
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_33"
										style="width: 120px;"><b><font size="2">Graduation</font></b></label>
								</div>
							</td>
						</tr>
						<tr id="tredu6">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Board/University </font></label>
									<div>
										<input id="element_45" name="g_board"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs3.getString("Board") %>"
											style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_46" name="g_year"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs3.getString("Year") %>"
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="g_spe"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs3.getString("Specialisation") %>"
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td>
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Percentage </font></label>
									<div>
										<input id="element_48" name="g_marks"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs3.getString("Marks_Percentage") %>"
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
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
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_42" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_33"
										style="width: 120px;"><b><font size="2">Post
												Graduation</font></b></label>
								</div>
							</td>
						</tr>
						<tr id="tredu8">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_25" style="width: 150px;"><font
										size="2">Board/University </font></label>
									<div>
										<input id="element_55" name="p_board"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs4.getString("Board") %>"
											style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Year </font></label>
									<div>
										<input id="element_56" name="p_year"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs4.getString("Year") %>	"
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_57" name="p_spe"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs4.getString("Specialisation") %>"
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td>
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Percentage </font></label>
									<div>
										<input id="element_58" name="p_marks"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs4.getString("Marks_Percentage") %>"
											style="width: 100px; height: 20px; text-align: right" />
									</div></li>
							</td>
						</tr>
						<%} %>
					</table>
				</div>
			</ul>

			<ul>
				<font size="3" style="margin-left: 0.4em;">Additional
					Qualifications</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">

						<%! int count=0;%>
						<% 
Statement st5=conn.createStatement();
String query5 = "select count(*) from t_empadditionalQualification where EmpID ="+emp_id+"";
ResultSet rs5 = st1.executeQuery(query5);
if(rs5.next())
{
	count = rs5.getInt(1);
	%>

						<% 	if(count>0) 
	   {
		Statement st6=conn.createStatement();
		int k = 1;
		String query6 = "select * from t_empadditionalQualification where EmpID ="+emp_id+"";
		System.out.println(">>>>>>>>>>query6:"+query6);
		ResultSet rs6 = st6.executeQuery(query6);
		while(rs6.next())
		{
		%>
						<tr id="tredu11">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Institute </font></label>
									<div>
										<input id="element_45" name="inst<%=k %>"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs6.getString("Institute") %>"
											style="width: 150px; height: 18px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25"><label class="description" for="element_26"
									style="width: 150px;"><font size="2">Year </font></label>
									<div>
										<input id="element_46" name="year<%=k %>"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs6.getString("Year") %>"
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Specialization </font></label>
									<div>
										<input id="element_47" name="spe<%=k %>"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs6.getString("Specialisation") %>"
											style="width: 150px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 170px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Marks/Grade </font></label>
									<div>
										<input id="element_48" name="marks<%=k %>"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs6.getString("Marks_Percentage") %>"
											style="width: 100px; height: 20px;" />
									</div></li>
							</td>
							<td><input type="hidden" name="rid<%=k %>"
								value="<%=rs6.getString("Rid") %>"></input></td>
						</tr>
						<%
		
		k++;} }}%>
					</table>
				</div>
			</ul>

			<ul>
				<font size="3" style="margin-left: 0.4em;">Work Experience</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">
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
		int k = 1;
		String query8 = "select * from t_workexperience where EmpID ="+emp_id+"";
		System.out.println(">>>>>>>>>>query8:"+query8);
		ResultSet rs8 = st8.executeQuery(query8);
		while(rs8.next())
		{
		%>

						<tr id="trwork11">
							<td colspan="1">
								<li id="li_24" style="width: 95px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Company </font></label>
									<div>
										<input id="element_45" name="comp<%=k %>"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs8.getString("Company") %>"
											style="width: 100px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 95px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Position </font></label>
									<div>
										<input id="element_46" name="post<%=k %>"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs8.getString("PositionHeld") %>"
											style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 95px;"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Salary </font></label>
									<div>
										<input id="element_47" name="sal<%=k %>"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs8.getString("SalaryPA") %>"
											style="width: 90px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 120px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">Reason For Leaving </font></label>
									<div>
										<input id="element_48" name="reason<%=k %>"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs8.getString("ReasonforLeaving") %>"
											style="width: 120px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">From Date </font></label>
									<div>
										<input type="text" id="data<%=k %>" name="from_date<%=k %>"
											size="12" value="<%=rs8.getString("FromDate") %>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data<%=k %>",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data<%=k %>"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_27" style="width: 95px;"><label
									class="description" for="element_28" style="width: 150px;"><font
										size="2">To Date </font></label>
									<div>
										<input type="text" id="data1<%=k %>" name="to_date<%=k %>"
											size="12" value="<%=rs8.getString("Todate")  %>"
											style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
											readonly />
										<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1<%=k %>",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1<%=k %>"       // ID of the button
					    }
					  );
				</script>
									</div></li>
							</td>
							<td><input type="hidden" name="r_id<%=k %>"
								value="<%=rs8.getString("Rid") %>"></input></td>
						</tr>
						<%
		k++;	}}}%>
					</table>
				</div>
			</ul>

			<ul>
				<font size="3" style="margin-left: 0.4em;">Skills</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">
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
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">MS Office </font></label>
									<div>
										<input name="ms_office" class="element text medium"
											type="text" maxlength="255"
											value="<%=rs9.getString("MSOffice") %>"
											style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Windows </font></label>
									<div>
										<input name="windows" class="element text medium" type="text"
											maxlength="255" value="<%=rs9.getString("Windows") %>"
											style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">AutoCAD</font></label>
									<div>
										<input name="autocad" class="element text medium" type="text"
											maxlength="255" value="<%=rs9.getString("AutoCAD") %>"
											style="width: 90px; height: 20px;" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Tally</font></label>
									<div>
										<input name="tally" class="element text medium" type="text"
											maxlength="255" value="<%=rs9.getString("Tally") %>"
											style="width: 90px; height: 20px;" />
									</div></li>
							</td>


						</tr>

						<tr id="trwork29">
							<td colspan="1">
								<li id="li_24" style="width: 170px;"><label
									class="description" for="element_45" style="width: 150px;"><font
										size="2">Typing(wpm) </font></label>
									<div>
										<input id="element_45" name="typing"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs9.getString("Typing") %>"
											style="width: 150px; height: 18px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_25" style="width: 170px;"><label
									class="description" for="element_26" style="width: 150px;"><font
										size="2">Shorthand(wpm) </font></label>
									<div>
										<input id="element_46" name="shorthand"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs9.getString("Shorthand") %>"
											style="width: 150px; height: 20px; text-align: right" />
									</div></li>
							</td>
							<td colspan="1">
								<li id="li_26" style="width: 170px; margin-left: 1.3em"><label
									class="description" for="element_27" style="width: 150px;"><font
										size="2">Any Other skills </font></label>
									<div>
										<input id="element_47" name="other"
											class="element text medium" type="text" maxlength="255"
											value="<%=rs9.getString("AnyOtherSkills") %>"
											style="width: 200px; height: 20px;" />
									</div></li>
							</td>


						</tr>
						<tr>
							<li id="li_1" style="width: 170px;">
								<td align="left" colspan="1" style="width: 40%;"><label
									class="description" for="element_27" style="width: 150px;"><b><font
											size="2">Command Over English</font></b></label>
									<div>
										<input name="english" class="element text medium" type="text"
											maxlength="255"
											value="<%=rs9.getString("CommandOverEnglish") %>"
											style="width: 150px; height: 20px;" />
									</div></td>
						</tr>
						</li>
					</table>
					<%} %>
				</div>
			</ul>

			<ul>
				<font size="3" style="margin-left: 0.4em;">Other Details</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">
						<%
Statement st10=conn.createStatement();
String query10 = "select * from t_otherdetails where EmpID ="+emp_id+"";
System.out.println(">>>>>>>>>>query10:"+query10);
ResultSet rs10 = st10.executeQuery(query10);
while(rs10.next()) {
%>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">

								<li id="li_1"><label class="description" for="element_1"><font
										size="2">What are your achievements? </font></label>
									<div>
										<textarea id="element_1" name="achievements"
											class="element textarea small"><%=rs10.getString("Achievements") %></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_2"><label class="description" for="element_2"><font
										size="2">Where do you see yourself 5 years from now? </font></label>
									<div>
										<textarea id="element_2" name="seeafter5"
											class="element textarea small"><%=rs10.getString("Seeyourself5YearsFromNow")%></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_3"><label class="description" for="element_3"><font
										size="2">What are your strenghts & weaknesses? </font></label>
									<div>
										<textarea id="element_3" name="strengths"
											class="element textarea small"><%=rs10.getString("StrengthsWeakness") %></textarea>
									</div></li>
							</td>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_4"><label class="description" for="element_4"><font
										size="2">What are your extra-curricular activities?</font> </label>
									<div>
										<textarea id="element_4" name="curricular"
											class="element textarea small"><%=rs10.getString("ExtraCurricular") %></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_5"><label class="description" for="element_5"><font
										size="2">Expected salary ? </font></label>
									<div>
										<input type="text" id="element_5" name="exp_sal"
											class="element text medium"
											value="<%=rs10.getString("ExpectedSalary") %>"
											style="width: 200px; height: 16px; text-align: right" />
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_6"><label class="description" for="element_6"><font
										size="2">How would it benefit the company if we hire
											you? </font></label>
									<div>
										<textarea id="element_6" name="benefit"
											class="element textarea small"><%=rs10.getString("BenefitToCompany") %></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_7"><label class="description" for="element_7"><font
										size="2">Why do you want to leave your present job? </font> </label>
									<div>
										<textarea id="element_7" name="leaving_reason"
											class="element textarea small"><%=rs10.getString("whyYouWantToLeaveYourPresentJob") %></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_8"><label class="description" for="element_8"><font
										size="2">Do you suffer from any health problems,if any
											please specify: Heart Attacks/High BP/Low BP/Broachitis/Any
											Other ? </font></label>
									<div>
										<textarea id="element_8" name="health_prob"
											class="element textarea small"><%=rs10.getString("HealthProblem") %></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_9"><label class="description" for="element_9"><font
										size="2">Do you have any litigation? </font></label>
									<div>
										<textarea id="element_9" name="litigation"
											class="element textarea small"><%=rs10.getString("AnyLitigation") %></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_10"><label class="description" for="element_10"><font
										size="2">Do you have any police record? If yes, please
											specify: </font></label>
									<div>
										<textarea id="element_10" name="police_record"
											class="element textarea small"><%=rs10.getString("AnyPoliceRecord") %></textarea>
									</div></li>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="width: 60%;">
								<li id="li_11"><label class="description" for="element_11"><font
										size="2">References :(Starte Name ,Address & phone nos.
											of two references who are not relatives) </font></label>
									<div>
										<textarea id="element_11" name="reference"
											class="element textarea small"><%=rs10.getString("References1") %></textarea>
									</div>
							</td>
						</tr>
					</table>
					<%} %>
				</div>
			</ul>
			<br />
			<br />
			<tr>
				<td><input type="hidden" name="emp_id" id="emp_id"
					value="<%=emp_id %>"></input></td>
			</tr>
			<center>
				<input type="submit" value="submit" name="submit"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff"></input>
			</center>


		</form>

	</div>

	<%
}catch(Exception e) {
	}
%>


</body>

</html>