<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>


<html>
<head>
<style type="text/css">
@import url(jscalendar-1.0/calendar-blue.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script type="text/javascript">
	function dateValidate(dt,today)
	{
		var d=new Date().getMonth();
		
		dy1=dt.substring(7,11);
		dy2=today.substring(0,4);
		
		dm1=d+1;
		dm2=today.substring(5,7);
		
		dd1=dt.substring(0,2);
		dd2=today.substring(8,10);

		//alert(dy1+"=="+dy2+"=="+dm1+"=="+dm2+"=="+dd1+"=="+dd2);

		if( (dd1>dd2 && dm1>=dm2) || (dm1>dm2 && dy1>=dy2) || (dy1>dy2) )
		{
			alert("Please Select Valid Date");
			return false;
		}
		
		return true;
	}
	function getAjxToolTip()
	{
		var v=document.getElementById("cat").value;
		if(v=="C1")
		{
			alert("\tServer Down, Access restricted,potential loss of data (Anything which is critical to business) \n\n"+
					"Immediate: CISO, Sys Admin, If not solved withing in turn around time, then report to CEO \n\n"+ 
					"Production server: 1Hr ERP:4 Hrs, Tally: 12 Any other C1 type incident: 4 Hrs");
		}
		else if(v=="C2")
		{
			alert("\tInternet down, infrastructure down etc (Anything which is causing delay in executing day to day tasks) \n\n"+
					"Immediate: System Admin If not solved within turn aroud time, then report to CEO \n\n"+
					"Internet access for any office: 4 hrs Infrastructure failure(Scanner/printer): 4 hrs");
		}
		else
		{
			alert("\tPC not functional, can not access internet, mail client not working,serial port not working etc(Anything which does not have major impact but needs to be resolved ) \n\n"+
					"Immediate: System Admin. If not solved withing turn aroud time, then report to CEO \n\n"+
					"2 days");
		}
	}
	function validate()
	{
		  var intFlag = 0;
		  var strErrMsg = "You have entered future date. Please enter valid date and try again !!!";

		 // var dtDate= document.incident.incidentDate.value;  Tue Oct 11 2011 13:51:3
		
		var description=document.incident.desc.value;
		var type=document.incident.type.value;
		var cat=document.incident.cat.value;
		if(description=="")
		{
			alert("Please describe the Incident");
			return false;
		}
		if(type=="Select")
		{
			alert("Please enter type of the incident");
			return false;
		}
		if(cat=="Select")
		{
			alert("Please enter Category");
			return false;
		}

	    return true ;
	}
	function showVisitingCardDetails(eName,empMail)
	{
		document.getElementById("EmpNames").value=eName;
		document.getElementById("SelectedEmpMail").value=empMail;
		document.getElementById("EmpList").style.display='none';
	}
	function getEmp()
	{
		document.getElementById("EmpList").style.display='block';
		var emp=document.getElementById("EmpNames").value;
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
				document.getElementById("EmpList").innerHTML=reslt;
			} 
		}
		var queryString = "?emp=" +emp;
		ajaxRequest.open("GET", "GenericAjaxSearch.jsp" + queryString, true);
		ajaxRequest.send(null); 
		
	}
	function getEquipment(eqm)
	{
		var xmlhttp;
		var l1;
		if(eqm=="Equipment")
		{
			if (window.XMLHttpRequest)
			  {
			  // code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			  }
			else if (window.ActiveXObject)
			  {
			  // code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			else
			  {
			  alert("Your browser does not support XMLHTTP!");
			  }
			xmlhttp.onreadystatechange=function()
			{
			if(xmlhttp.readyState==4)
			  {
			  //	alert(xmlhttp.responseText);
				l1=xmlhttp.responseText;
				var mySplitResult = l1.split("#");
				document.getElementById("equipment").innerHTML=mySplitResult[1];
			  
			  }
			}
			xmlhttp.open("GET","AjxEqipmentDetails.jsp",true);
			xmlhttp.send(null);
		}
		else
		{
			document.getElementById("equipment").innerHTML=null;
		}
	}


</script>
</head>
<body
	ONKEYDOWN="if (event.keyCode == 27){document.getElementById('EmpList').style.display = 'none';}">
	<%
			Statement st = null, st1 = null, st3 = null, st4 = null;
			Statement st2 = null;
			String selectedName;
			String FollowUpType = "";
			String date=new SimpleDateFormat("dd-MMM-yyyy").format(new Date());
		//String date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	%>
	<%
		if (null == request.getParameter("repName"))
				selectedName = "All";
			else
				selectedName = request.getParameter("repName");

			try {
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
				st3 = conn.createStatement();
				st4 = conn.createStatement();
			} catch (Exception e) {
			}
			if (null == request.getParameter("division"))
				selectedName = "All";
			else
				selectedName = request.getParameter("division");
	%>


	<div
		style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
		<a>Transworld Incident Tracker</a>
	</div>
	<br>
		<form name="incident" method="post" action="generateIncident.jsp"
			onSubmit="return validate();">
			<table align="center" border="0" cellpadding="3" width="40%"
				style="background: white;">

				<tr>
					<td valign="top"><font color="#990000">*</font></td>
					<td valign="top" align="left"><b>Description : </b></td>
					<td><textarea name="desc" rows="3" id="search-text"
							style='width: 205px; height: auto; border-color: activeborder;'></textarea>
					</td>
				</tr>
				<%
			//====Get Syst Crnt Time==================================
				Date d=new Date();
					
				Format df1= new SimpleDateFormat("yyyy-MM-dd");
				String dtoday=df1.format(d);
				
				DateFormat df= new SimpleDateFormat("dd-MMM-yyyy");
				DateFormat d1= new SimpleDateFormat("yyyy-MM-dd");
				
				Format d2= new SimpleDateFormat("HH:mm:ss");
				String incdReg=d2.format(d);
				String hrTime=incdReg.substring(0,2);
				String minTime=incdReg.substring(3,5);
			//========================================================
			%>
				<tr>
					<td valign="top"><font color="#990000">*</font></td>
					<td valign="top" align="left"><b>Incident Date-time :</b></td>
					<td align="left" valign="top"><input type="text"
						id="incidentDate" name="incidentDate" value='<%=date %>'
						onchange="dateValidate(this.value,'<%=dtoday %>');" size="15"
						readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" />
						<script type="text/javascript">
						Calendar.setup( {
							inputField : "incidentDate", // ID of the input field
							ifFormat : "%d-%b-%Y", // the date format
							button : "incidentDate" // ID of the button
						});
					</script> &nbsp;&nbsp; <select name="hrs" id="hrs"
						style="width: 45px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="<%= hrTime%>"><%= hrTime%></option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<%
			for(int i=10;i<24;i++)
			{
			%>
							<option value="<%=i%>"><%=i%></option>
							<%
			}		
		%>
					</select> <select name="mins" id="mins" value="<%=minTime %>"
						style="width: 45px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="<%= minTime%>"><%= minTime%></option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<%
			for(int i=10;i<60;i++)
			{
			%>
							<option value="<%=i%>"><%=i%></option>
							<%
			}		
		%>

					</select></td>
				</tr>
				<tr>
					<td valign="top"><font color="#990000">*</font></td>
					<td valign="top" align="left"><b>Type:</b></td>
					<td align="left"><select name="type"
						style="width: 87px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">

							<option>IT</option>
							<option>Non IT</option>
					</select></td>

				</tr>
				<tr>
					<td valign="top"><font color="#990000">*</font></td>
					<td valign="top" align="left"><b>Location :</b></td>
					<td align="left"><select name="location" id="location"
						style="width: 180px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="PG2 Service and Accounts">PG2 Service and
								Accounts</option>
							<option value="KP Marketing">KP Marketing</option>
							<option value="PG1 R and D">PG1 R and D</option>
					</select></td>
				</tr>
				<tr>
					<td valign="top"><font color="#990000">*</font></td>
					<td valign="top" align="left"><b>Category :</b></td>
					<td align="left"><select name="cat" id="cat"
						style="width: 87px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"
						onchange="getAjxToolTip();">
							<option value="Select">Select</option>
							<option value="C1">C1</option>
							<option value="C2">C2</option>
							<option value="C3">C3</option>
					</select></td>
				</tr>
				<tr>
					<td valign="top"><font color="#990000">*</font></td>
					<td valign="top" align="left"><b>Related To :</b></td>
					<td align="left"><select name="relTo" id="relTo"
						onchange="getEquipment(this.value);"
						style="width: 87px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="Location">Location</option>
							<option value="Server">Server</option>
							<option value="Client">Client</option>
							<option value="Email">Email</option>
							<option value="Internet">Internet</option>
							<option value="Equipment">Equipment</option>
					</select></td>
					<td>
						<table>
							<tr>
								<td><div id="equipment"></div></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr></tr>

				<tr>
					<td valign="top"></td>
					<td valign="top" align="left"><b>Special Escalation : </b></td>
					<td><input type="hidden" name="SelectedEmpMail"
						id="SelectedEmpMail" value="" /> <input type="text"
						name="EmpNames" id="EmpNames"
						style="width: 230px; border-color: activeborder;"
						autocomplete="off" value=""
						onkeyup="if (event.keyCode == 27){document.getElementById('EmpList').style.display = 'none';} else { getEmp(); }" />
						&nbsp;&nbsp;&nbsp;<br>
							<div style="position: absolute;">
								<table>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td>
											<div id='EmpList'></div>
										</td>
									</tr>
								</table>
							</div></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td valign="bottom" align="center" colspan="2">
						<div>
							<input type="submit" id="search-submit" name="submitFollowUp"
								value="Submit" />
						</div>
					</td>
				</tr>



			</table>

		</form> <br> <br> <br>
</body>
</html>
