<%@ page language="java"%>
<%@ page import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Personal Details</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />

<script type="text/javascript">

function validateForm() 
{	
	var name = document.application1.name.value;
	var invalid=/[^A-Za-z\s]/;
	if(name=="") {
		alert("Enter your Name!");    
		return false;
		}
	if(invalid.test(name)){
		alert("Enter valid Name!");
		return false;
	}

	var address1 = document.application1.add1.value;
	if(address1=="") {
		alert("Enter Permanent Address!");
		return false;
		}

	var address2 = document.application1.add2.value;
	if(address2=="") {
		alert("Enter Address of Correspondence!");
		return false;
		}

	var gender= document.getElementById("gender").options[document.getElementById("gender").selectedIndex].value;
	if(gender=="select") {
			
			alert("Please select a gender!");
		return false;
		}

		if(document.getElementById("state").style.display=="block") {
		var state= document.getElementById("state").options[document.getElementById("state").selectedIndex].value;
			if(state=="select") {
				alert("Please enter a state!");
			return false;
		}
}
			if(document.getElementById("add_state").style.display=="block") {
					var add_state = document.application1.add_state.value;
					var invalid=/[^A-Za-z\s]/;
					if(add_state=="") {
					alert("Enter state name!!");
					return false;
					}
					if(invalid.test(add_state)) {
						alert("Please enter a valid state name!!");
						return false;
					}
					
				}
		
	if(document.getElementById("city").style.display=="block") {
	var city= document.getElementById("city").options[document.getElementById("city").selectedIndex].value;
	var add_city = document.getElementById("add_city");
	if(city=="select") {
			
			alert("Please select a city!");
		return false;
		}
	}
	
	if(document.getElementById("add_city").style.display=="block") {
		var add_city = document.application1.add_city.value;
		var invalid=/[^A-Za-z\s]/;
		if(add_city=="") {
		alert("Enter city name!!");
		return false;
		}
		if(invalid.test(add_city)) {
			alert("Please enter a valid city name!!");
			return false;
		}
		
	}
	
	var pin=document.application1.pin.value;
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
	var mno=document.application1.contact.value;
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
	var dd =document.application1.dd.value;
	var mm=document.application1.mm.value;
	var yyyy=document.application1.yyyy.value;
	invalid =/[^0-9]/;
	if(dd=="" || mm=="" || yyyy=="") {
			alert("Enter Date of Birth!");
			return false;
	}
	if(invalid.test(dd) || invalid.test(mm) || invalid.test(yyyy)) {
	alert("enter valid Date of Birth!");
	return false;
		}
	if(dd>31 || mm>12 || yyyy<1950) {
	alert("Enter valid Date of Birth!");
	return false;
		}
	var f_name=document.application1.f_name.value;
	var invalid=/[^A-Za-z\s]/; //only numbers are  permitted
	if(f_name==""){
		alert("Enter your Father's Name!");
		return false;
	}
	if(invalid.test(f_name)){
		alert("Invalid Father's Name!");
		return false;
	}
	var openings= document.getElementById("job_opening").options[document.getElementById("job_opening").selectedIndex].value;
	if(openings=="select") {
		alert("Please select a post applying for!");
	return false;
	}

//validation for email id
		var email1=document.application1.email.value;
		if(email1==""){
			alert("Enter your Email ID!");
			return false;
		}
   		var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i;
        var email=emailfilter.test(document.application1.email.value);
        if(email==false)
        {
        alert("Please Enter valid E-Mail ID");
        //document.AddNewUser.emailid.focus();
        return false;
        }
    
return true;
}



function demoDisplay()
{
document.getElementById("add_state").style.display="block";
document.getElementById("state").style.display="none";
document.getElementById("add").style.display="none";
document.getElementById("img1").style.display="";
}

function AddID()
{
document.getElementById("idFile").style.display="block";
document.getElementById("idproof").style.display="none";
document.getElementById("idproof1").style.display="block";
}
function demoDisplay1()
{
document.getElementById("add_city").style.display="block";
document.getElementById("city").style.display="none";
document.getElementById("ad").style.display="none";
document.getElementById("img2").style.display="";
}
function removestate()
{
	document.getElementById("state").style.display="block";
	document.getElementById("add_state").style.display="none";
	document.getElementById("add").style.display="";
	document.getElementById("img1").style.display="none";
}
function removecity()
{
	document.getElementById("city").style.display="block";
	document.getElementById("add_city").style.display="none";
	document.getElementById("ad").style.display="";
	document.getElementById("img2").style.display="none";
}

function RemoveID()
{
document.getElementById("idFile").style.display="none";
document.getElementById("idproof").style.display="block";
document.getElementById("idproof1").style.display="none";
}

function AddProof()
{
document.getElementById("addproof").style.display="none";
document.getElementById("addFile").style.display="block";
document.getElementById("addproof1").style.display="block";
}

function RemoveProof()
{
document.getElementById("addproof").style.display="block";
document.getElementById("addFile").style.display="none";
document.getElementById("addproof1").style.display="none";
}


</script>
</head>
<body id="main_body">
	<%
Connection conn=null;
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
//conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");
conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","erp","1@erp");
}
catch(Exception e)
{
	System.out.println("Exception=========>>"+e);
}
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
%>
	<img id="top" src="newimages/top.png" alt="" />

	<div id="form_container">

		<h1 align="center">
			<table width="100%">
				<tr>
					<td><a href="http://www.mobile-eye.in" target="_blank"><img
							src="images/mobile.jpg" style="height: 80px; width: 100px;"
							title="Mobile-eye" id="logo" alt="Logo" /></a></td>
					<td
						style="vertical-align: bottom; text-align: center; margin-left: 2em;"><div
							style="text-align: center;">
							<a>Application Form</a>
						</div></td>
					<td style="vertical-align: bottom; text-align: right;"><font
						style="font-size: 0.5em;"><a
							href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td>
				</tr>
			</table>
		</h1>
		<br />
		<form id="application1" name="application1" class="appnitro"
			enctype="multipart/form-data" method="post"
			action="application_conn1.jsp" onsubmit="return validateForm()">
			<div class="form_container1"></div>
			<ul>

				<table border="0" width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<tr>
						<td style="width: 50%;"><font size="3"
							style="margin-left: 0.4em;">Please select the post for
								which you want to apply *</font></td>
						<td colspan="1" style="width: 50%;">
							<div style="width: 10em;">
								<li id="li_7">
									<div>
										<select class="element select medium" id="job_opening"
											name="job_opening" style="width: 150px; height: 20px;">
											<option value="select">select</option>
											<%
            String query5 = "select distinct(JobOpening) from t_jobOpenings order by RId";
             ResultSet rs5 = st1.executeQuery(query5);
             while(rs5.next())
              {
%>
											<option value="<%=rs5.getString("JobOpening") %>"><%=rs5.getString("JobOpening")%></option>
											<%} %>
										</select>
									</div>
								</li>
							</div>
						</td>
					</tr>
				</table>
				<br />
				<font size="3" style="margin-left: 0.4em;">Personal Details</font>
				<div width="100%" align="center"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff">
					<table border="0" width="100%" align="center">

						<tr>
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_4" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_4"
										style="width: 150px;"><font size="2">Name *</font></label>
									<div>
										<select class="element select medium" id="element_4"
											name="title" style="width: 45px; height: 20px;">
											<option value="Mr." selected="selected">Mr.</option>
											<option value="Ms.">Ms.</option>

										</select> &nbsp;&nbsp; <input id="name" name="name"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 400px; height: 16px;" />
									</div>
								</div>

							</td>
						</tr>

						<tr>
							<td colspan="1" style="width: 30%;">
								<div style="width: 10em;">
									<li id="li_7"><label class="description" for="element_8"
										style="width: 170px;"><font size="2">Permanent
												Address * </font></label>
										<div>
											<textarea name="add1" id="add1"
												class="element textarea small" style="width: 460px;"></textarea>
										</div></li>
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="1" style="width: 30%;">
								<div style="width: 10em;">
									<li id="li_7"><label class="description" for="element_8"
										style="width: 190px;"><font size="2">Address of
												Correspondence *</font></label>
										<div>
											<textarea name="add2" id="add2"
												class="element textarea small" style="width: 460px;"></textarea>
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
												type="text" maxlength="255" value=""
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
							<td colspan="1" style="width: 15em;">
								<div>
									<li id="li_9"><label class="description" for="element_10"
										style="width: 150px"><font size="2">Address
												Proof </font></label>
										<div>
											<a href="javascript: showbox1(2);" onclick="AddProof()"
												id="addproof">Add Address Proof</a> <input type="file"
												style="width: 25em; display: none" name="addFile"
												id="addFile" value="" onchange="upload();"
												class="element text" /> <a href="javascript: showbox1(2);"
												onclick="RemoveProof();" id="addproof1"
												style="display: none">Remove</a>
										</div></li>
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="1" style="width: 5em;">
								<div style="width: 15%;">
									<li id="li_10" style="width: 150px;"><label
										class="description" for="element_11" style="width: 170px;"><font
											size="2">State * </font></label>
										<div>
											<select class="element select medium" id="state" name="state"
												style="width: 150px; height: 20px;">
												<option value="select">select</option>
												<%
            String query1 = "select distinct(State) from t_citystctryinfo order by State";
             ResultSet rs1 = st1.executeQuery(query1);
             while(rs1.next())
              {
%>
												<option value="<%=rs1.getString("State") %>"><%=rs1.getString("State")%></option>
												<%} %>

											</select> <input type="text" id="add_state" name="add_state" value=""
												class="element text medium" maxlength="200"
												style="width: 147px; height: 16px;"></input> <a
												href="javascript: showbox1(1);" onclick="demoDisplay()"
												id="add">Add State</a>
											<!-- <img alt="Delete" src="images/Delete-Icon.png" onclick="removestate();" id="img1" align="top" style="display: none"></img>-->
											<a href="javascript: showbox1(1);" onclick="removestate();"
												id="img1" style="display: none">Remove</a>
										</div></li>
								</div>
							</td>
							<td colspan="1" style="width: 10%;">
								<div style="width: 10em; margin-left: -3em;">
									<li id="li_11" style="margin-left: 7.4em;"><label
										class="description" for="element_12" style="width: 150px;"><font
											size="2">City *</font></label>
										<div>
											<select class="element select medium" id="city" name="city"
												style="width: 150px; height: 20px;">
												<option value="select">select</option>
												<%
            String query = "select distinct(City) from t_citystctryinfo order by City";
             ResultSet rs = st.executeQuery(query);
             while(rs.next())
              {
%>
												<option value="<%=rs.getString("City") %>"><%=rs.getString("City")%></option>
												<%} %>
											</select> <input type="text" id="add_city" name="add_city" value=""
												class="element text medium" maxlength="200"
												style="width: 147px; height: 16px;"></input> <a
												href="javascript: showbox1(2);" onclick="demoDisplay1()"
												id="ad">Add City</a>
											<!--<img alt="Delete" src="images/Delete-Icon.png" onclick="removecity();" id="img2" align="top" style="display: none"></img> -->
											<a href="javascript: showbox1(2);" onclick="removecity();"
												id="img2" style="display: none">Remove</a>
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
											type="text" maxlength="255" value=""
											style="width: 100px; height: 14px; text-align: right"></input>
									</div>
									<br>
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
											value=""
											style="width: 150px; height: 16px; text-align: right" />
									</div></li>
							</td>
							<td style="width: 10%;"></td>
							<td id="tr3" colspan="1">
								<li id="li_2" style="width: 190px; margin-left: -3em;"><label
									class="description" for="element_2"><font size="2">Date
											Of Birth *</font></label> <span> <input id="element_2_1" name="dd"
										class="element text" size="2" maxlength="2" value=""
										type="text" style="text-align: right" /> <label
										for="element_2_1"><font size="2">DD</font></label>
								</span> <span> <input id="element_2_2" name="mm"
										class="element text" size="2" maxlength="2" value=""
										type="text" style="text-align: right" /> <label
										for="element_2_2"><font size="2">MM</font></label>
								</span> <span> <input id="element_2_3" name="yyyy"
										class="element text" size="4" maxlength="4" value=""
										type="text" style="text-align: right" /> <label
										for="element_2_3"><font size="2">YYYY</font></label>
								</span></li>

							</td>

						</tr>

						<tr>
							<td align="left" colspan="4" style="width: 30%;">
								<div id="li_41" style="width: 800px; margin-left: 0.9em">
									<label class="description" for="element_4"
										style="width: 170px;"><font size="2">Father's/Spouse's
											Name *</font></label>
									<div>
										<select class="element select medium" id="element_41"
											name="f_title" style="width: 45px; height: 20px;">
											<option value="Mr." selected="selected">Mr.</option>
											<option value="Ms.">Ms.</option>

										</select> &nbsp;&nbsp; <input id="f_name" name="f_name"
											class="element text medium" type="text" maxlength="255"
											value="" style="width: 400px; height: 16px;" />
									</div>
								</div>
								<div>
									<li id="li_91"><label class="description"
										for="element_101" style="width: 150px"><font size="2">His/Her
												Occupation </font></label>
										<div>
											<input id="element_101" name="occupation"
												class="element text medium" type="text" maxlength="255"
												value="" style="width: 200px; height: 16px;"></input>
										</div></li>
								</div>

							</td>



						</tr>

						<tr>
							<td colspan="1" style="width: 30%;">
								<div style="width: 10em;">
									<li id="li_7"><label class="description" for="element_81"
										style="width: 170px;"><font size="2">Drivers'
												Licence No</font></label>
										<div>
											<input id="element_81" name="dl_no"
												class="element text medium" type="text" maxlength="255"
												value="" style="width: 200px; height: 16px;"></input>
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
												value="" style="width: 200px; height: 16px;"></input>
										</div></li>
								</div>
							</td>
							<td colspan="1" style="width: 15em;">
								<div>
									<li id="li_9"><label class="description" for="element_10"
										style="width: 150px"><font size="2">ID Proof </font></label>
										<div>
											<a href="javascript: showbox1(2);" onclick="AddID()"
												id="idproof">Add Id Proof</a> <input type="file"
												style="width: 25em; display: none" name="idFile" id="idFile"
												value="" onchange="upload();" class="element text" /> <a
												href="javascript: showbox1(2);" onclick="RemoveID();"
												id="idproof1" style="display: none">Remove</a>
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
												value="" style="width: 200px; height: 16px;"></input>
										</div></li>
								</div>
							</td>
							<td style="width: 10%;"></td>


						</tr>

					</table>
				</div>

			</ul>
			<br />
			<br />
			<div align="right">
				&nbsp;&nbsp; <input type="submit" id="sub" name="submit"
					value="Next page"
					style="background: url(newimages/main_col_bg1.png) no-repeat top left #f8fcff" />
			</div>
			<br />
		</form>
	</div>
	<script>document.getElementById("state").style.display="block";
document.getElementById("city").style.display="block";

document.getElementById("add_state").style.display="none";
document.getElementById("add_city").style.display="none";

</script>
</body>
</html>