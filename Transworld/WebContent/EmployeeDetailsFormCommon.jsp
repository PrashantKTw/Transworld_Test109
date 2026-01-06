<%@ page language="java"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Transworld Employee Details Form</title>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/ajax-tooltip.js"></script>
<script src="sorttable.js" type="text/javascript"></script>
<script LANGUAGE="JavaScript" type="text/javascript">
var g1=0,g2=0,g3=0;
function tabview_switch(TabViewId, id) {
	tabview_aux(TabViewId, id);
}

function tabview_initialize(TabViewId) {
	tabview_aux(TabViewId, 1);
}
function tabview_aux(TabViewId, id) 
{
	var TabView = document.getElementById(TabViewId);

	var Tabs = TabView.firstChild;
	while (Tabs.className != "Tabs")
		Tabs = Tabs.nextSibling;

	var Tab = Tabs.firstChild;
	var i = 0;

	do {
		if (Tab.tagName == "A") {
			i++;
			Tab.href = "javascript:tabview_switch('" + TabViewId + "', "
					+ i + ");";
			Tab.className = (i == id) ? "Active" : "";
			Tab.blur();
		}
	} while (Tab = Tab.nextSibling);

	var Pages = TabView.firstChild;
	while (Pages.className != 'Pages')
		Pages = Pages.nextSibling;

	var Page = Pages.firstChild;
	var i = 0;

	do {
		if (Page.className == 'Page') {
			i++;
			if (Pages.offsetHeight)
				Page.style.height = (Pages.offsetHeight - 2) + "px";
			Page.style.overflow = "auto";
			Page.style.display = (i == id) ? 'block' : 'none';
		}
	} while (Page = Page.nextSibling);
}

function validate1()
{   
	var val1 = document.getElementById("empId").value;
	var val2 = document.getElementById("addr").value;
	var val3 = document.getElementById("tempaddr").value;
	var val4 = document.getElementById("city").value;
	var val5 = document.getElementById("state").value;
	var val6 = document.getElementById("tempcity").value;
	var val7 = document.getElementById("dob").value;
	var val8 = document.getElementById("phone").value;
	var val9 = document.getElementById("mob").value;
	var val10 = document.getElementById("fname").value;
	var val11 = document.getElementById("fOcc").value;
	var val12 = document.getElementById("license").value;
	var val13 = document.getElementById("passport").value;
	var val14 = document.getElementById("kinName").value;
	var val15 = document.getElementById("kinaddr").value;

	if(val1=="")
	{
		alert("Please Enter the Employee ID ");
		return false;
	}
	if(val2=="")
	{
		alert("Please Enter the Address ");
		return false;
	}
	if(val3=="")
	{
		alert("Please Enter the Temporary Address");
		return false;
	}
	if(val4=="")
	{
		alert("Please Enter City");
		return false;
	}
	if(val5=="")
	{
		alert("Please Enter State");
		return false;
	}
	if(val6=="")
	{
		alert("Please Enter Temporary City");
		return false;
	}
	if(val7=="")
	{
		alert("Please Select The DOB");
		return false;
	}
	if(val8=="")
	{
		alert("Please Enter Phone No.");
		return false;
	}

	if(val9=="")
	{
		alert("Please Enter Mobile No.");
		return false;
	}
	if(val10=="")
	{
		alert("Please Enter Father's/Spouse's Name");
		return false;
	}
	if(val11=="")
	{
		alert("Please Enter Father's/Spouse's Occupation");
		return false;
	}
/*	if(val12=="")
	{
		alert("Please Enter Phone No.");
		return false;
	}
	if(val13=="")
	{
		alert("Please Enter Phone No.");
		return false;
	}
	if(val14=="")
	{
		alert("Please Enter Phone No.");
		return false;
	}
	if(val15=="")
	{
		alert("Please Enter Phone No.");
		return false;
	}*/
	return true;
}
function AjaxSetId(g,tabID)
{
	var xmlhttp;
	var l1;
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
		l1=xmlhttp.responseText;
        var mySplitResult = l1.split("#");
        var tId=mySplitResult[1];
	 	  if(tId=="edu")
	 	  {
	 		document.getElementById("sn").innerHTML=mySplitResult[2];
	 		document.getElementById("degree").innerHTML=mySplitResult[3];
	 		document.getElementById("bu").innerHTML=mySplitResult[4];
	 		document.getElementById("year").innerHTML=mySplitResult[5];
	 		document.getElementById("sp").innerHTML=mySplitResult[6];
	 		document.getElementById("mp").innerHTML=mySplitResult[7];
	 		document.getElementById("upDoc1").innerHTML=mySplitResult[8];
		  }
	 	  else if(tId=="aq1")
	 	  {
	 		 	document.getElementById("Asn").innerHTML=mySplitResult[2];
		 		document.getElementById("Ainst").innerHTML=mySplitResult[3];
		 		document.getElementById("Ayear").innerHTML=mySplitResult[4];
		 		document.getElementById("Asp").innerHTML=mySplitResult[5];
		 		document.getElementById("Amp").innerHTML=mySplitResult[6];
		 		document.getElementById("upDoc2").innerHTML=mySplitResult[7];
	 	  }
	 	  else
	 	  {
	 		 	document.getElementById("Wsn").innerHTML=mySplitResult[2];
		 		document.getElementById("Wcomp").innerHTML=mySplitResult[3];
		 		document.getElementById("Wpos").innerHTML=mySplitResult[4];
		 		document.getElementById("WfDate").innerHTML=mySplitResult[5];
		 		document.getElementById("WtDate").innerHTML=mySplitResult[6];
		 		document.getElementById("Wsal").innerHTML=mySplitResult[7];
		 		document.getElementById("Wreason").innerHTML=mySplitResult[8];
		 		document.getElementById("upDoc3").innerHTML=mySplitResult[9];
	 	  }
	 }
	}
	xmlhttp.open("GET","AjxSetId.jsp?g="+g+"&tabID="+tabID,true);
	xmlhttp.send(null);
}
function addRow(tableID) 
{
	var table = document.getElementById(tableID);
    var rowCount = table.rows.length;
    if(rowCount<=5)
    {
    	if(tableID=="edu")
    	{
    		g1++;
    		document.getElementById("gv1").value=g1;
    		AjaxSetId(g1,tableID);
    	}
    	else if(tableID=="aq1")
    	{
    		g2++;
    		 document.getElementById("gv2").value=g2;
    		AjaxSetId(g2,tableID);
    	}
    	else
    	{
    		g3++;
    		document.getElementById("gv3").value=g3;
    		AjaxSetId(g3,tableID);
    	}
        
	    var row = table.insertRow(rowCount);
	    var colCount = table.rows[0].cells.length;
	    for(var i=0; i<colCount; i++) 
	    {
	        var newcell = row.insertCell(i);
	        newcell.innerHTML = table.rows[1].cells[i].innerHTML;///
	//        alert(newcell.innerHTML);
	        //====Call 2 Ajax to setb id===========
	        //	AjaxSetId(newcell.innerHTML,tableID);
	        //=====================================
	        switch(newcell.childNodes[0].type) 
	        {
	            case "text":
	                    newcell.childNodes[0].value = "";
	                    break;
	        }
	    }
	    
	   
	    
    }
    else
    {
        	alert("Cannot Add Rows Further");
    }
}
function deleteRow(tableID) 
{
    try 
    {
    	  var tbl = document.getElementById(tableID);
    	  var lastRow = tbl.rows.length;
    	  if(lastRow > 3)
    	  {
    		if(tableID=="edu")
  	    	{
  	    		g1--;
  	    		document.getElementById("gv1").value=g1;
  	    		alert("===="+g1+"=====");
  	    	}
  	    	else if(tableID=="aq1")
  	    	{
  	    		g2--;
  	    		document.getElementById("gv2").value=g2;
  	    		alert("===="+g2+"=====");
  	    	}
  	    	else
  	    	{
  	    		g3--;
  	    		document.getElementById("gv3").value=g3;
  	    		alert("===="+g3+"=====");
  	    	}
    	  }
    	  if (lastRow > 3)
    	  {
    		  tbl.deleteRow(lastRow - 1);
    	  }
			alert(g1+"-----"+g2+"------"+g3);
    }
    catch(e) 
    {
        alert(e);
    }
}
function datevalidate()
{
	var date1=document.getElementById("data").value;
//	var date2=document.getElementById("data1").value;
  
	var dm1,dd1,dy1;//,dm2,dd2,dy2;
	dy1=date1.substring(0,4);
//	dy2=date2.substring(0,4);
	dm1=date1.substring(5,7);
//	dm2=date2.substring(5,7);
	dd1=date1.substring(8,10);
//	dd2=date2.substring(8,10);
//    var d2date=date2.substring(0,2);
    var d1date=date1.substring(0,2);
    var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	return true;
}
</script>
</head>
<body>

	<form method="post" id="tab" name="tab"
		action="EmployeeDetFormData.jsp" enctype="multipart/form-data">
		<div class="TabView" id="TabView">
			<div class="Tabs" style="width: 700px;">
				<a>Employee Details</a><a>Educational Details</a><a>Mediclaim
					Details</a><a>Contract</a>
			</div>
			<div class="Pages" style="width: 1500px; height: 500px; border: 0;">

				<div class="Page">
					<div class="Pad">
						<table bgcolor="#E0DDFE" border="0" height="400" width="1000"
							align="center">
							<tr>
								<td align="center"><b><font size="4" color="#151B54">Employee
											Details Form</font></b></td>
							</tr>
							<% 
							String sendStatMsg=request.getParameter("sendStatMsg");
							if(!(sendStatMsg==null))
							{
								
							
							%>
							<tr>
								<td align="center"><b><font size="2" color="#151B54"><%=sendStatMsg %></font></b>
								</td>
							</tr>
							<%} %>
							<tr bgcolor="white">
								<td>
									<table>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Employee ID <font
														color="#990000">*</font> :
												</b></label> <input type="text" name="empId" id="empId" size="5" /></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Address <font
														color="#990000">*</font> :
												</b></label> <textarea cols="30" rows="3" name="addr" id="addr"></textarea>
											</td>
											<td><label id="custype"><b>Temp. Address <font
														color="#990000">*</font> :
												</b></label> <textarea cols="30" rows="3" name="tempaddr" id="tempaddr"></textarea>
											</td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>City<font
														color="#990000">*</font> :
												</b></label> <input type="text" name="city" id="city" /></td>
											<td><label id="custype"><b>State<font
														color="#990000">*</font> :
												</b></label> <input type="text" name="state" id="state" /></td>
											<td><label id="custype"><b>Temp. City<font
														color="#990000">*</font> :
												</b></label> <input type="text" name="tempcity" id="tempcity" /></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>DOB <font
														color="#990000">*</font> :
												</b></label> <input type="text" name="dob" id="dob" /></td>
											<td><label id="custype"><b>Phone No. <font
														color="#990000">*</font> :
												</b></label> <input type="text" name="phone" id="phone" /></td>
											<td><label id="custype"><b>Mobile No. <font
														color="#990000">*</font> :
												</b></label> <input type="text" name="mob" id="mob" /></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Father's/Spouse's
														Name <font color="#990000">*</font> :
												</b></label> <input type="text" name="fname" id="fname" /></td>
											<td><label id="custype"><b>His/Her
														Occupation <font color="#990000">*</font> :
												</b></label> <input type="text" name="fOcc" id="fOcc" /></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Drivers' License
														No <font color="#990000">*</font> :
												</b></label> <input type="text" name="license" id="license" /></td>
											<td><label id="custype"><b>Passport No <font
														color="#990000">*</font> :
												</b></label> <input type="text" name="passport" id="passport" /></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><b>Next To Kin</b></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Name <font
														color="#990000">*</font> :
												</b></label> <input type="text" name="kinName" id="kinName" /></td>
											<td><label id="custype"><b>Address <font
														color="#990000">*</font> :
												</b></label> <textarea cols="30" rows="3" name="kinaddr" id="kinaddr"></textarea>
											</td>
										</tr>
										<tr>
											<td></td>
										</tr>

									</table>

								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="Page">
					<div class="Pad">
						<table align="center" width="60%">
							<tr>
								<td><input type="hidden" name="gv1" id="gv1" value=""></input>
									<input type="hidden" name="gv2" id="gv2" value=""></input> <input
									type="hidden" name="gv3" id="gv3" value=""></input> <font
									size="2" color="black"><b>Educational Background:</b></font></td>
							</tr>
							<tr>
								<td><INPUT type="button" value="Add Row"
									onclick="addRow('edu')" /> <INPUT type="button"
									value="Delete Row" onclick="deleteRow('edu')" /></td>
							</tr>
							<tr>
								<td>
									<table id="edu" bgcolor="white" border="1" width="50"
										align="center" class="sortable">
										<tr>
											<td width="10"><font size="2" color="black"><b>Sn.</b></font></td>
											<td width="10"><font size="2" color="black"> <b>Degree</b></font></td>
											<td width="10"><font size="2" color="black"><b>Board/University</b></font></td>
											<td width="10"><font size="2" color="black"><b>Year</b></font></td>
											<td width="10"><font size="2" color="black"><b>Specialization</b></font></td>
											<td width="10"><font size="2" color="black"><b>Marks/Percentage</b></font></td>
											<td width="10"><font size="2" color="black"><b>Upload
														Doc</b></font></td>
										</tr>
										<tr>
											<td width="10"><div id="sn"></div></td>
											<td width="10"><div id="degree"></div></td>
											<td width="10"><div id="bu"></div></td>
											<td width="10"><div id="year"></div></td>
											<td width="10"><div id="sp"></div></td>
											<td width="10"><div id="mp"></div></td>
											<td width="10"><div id="upDoc1"></div></td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td><font size="2" color="black"><b>Details Of
											Additional Qualification:</b></font></td>
							</tr>
							<tr>
								<td><INPUT type="button" value="Add Row"
									onclick="addRow('aq1')" /> <INPUT type="button"
									value="Delete Row" onclick="deleteRow('aq1')" /></td>
							</tr>
							<tr>
								<td>
									<table id="aq1" bgcolor="white" border="1" width="50"
										align="center" class="sortable">
										<tr>
											<td><font size="2" color="black"><b>Sn.</b></font></td>
											<td><font size="2" color="black"> <b>Institute</b></font></td>
											<td><font size="2" color="black"><b>Year</b></font></td>
											<td><font size="2" color="black"><b>Specialization</b></font></td>
											<td><font size="2" color="black"><b>Marks/Percentage</b></font></td>
											<td><font size="2" color="black"><b>Upload
														Doc</b></font></td>
										</tr>
										<tr>
											<td width="10"><div id="Asn"></div></td>
											<td width="10"><div id="Ainst"></div></td>
											<td width="10"><div id="Ayear"></div></td>
											<td width="10"><div id="Asp"></div></td>
											<td width="10"><div id="Amp"></div></td>
											<td width="10"><div id="upDoc2"></div></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td><font size="2" color="black"><b>Work
											Experience:</b></font></td>
							</tr>
							<tr>
								<td><INPUT type="button" value="Add Row"
									onclick="addRow('woExp')" /> <INPUT type="button"
									value="Delete Row" onclick="deleteRow('woExp')" /></td>
							</tr>
							<tr>
								<td>
									<table id="woExp" bgcolor="white" border="1" width="50"
										align="center" class="sortable">
										<tr>
											<td><font size="2" color="black"><b>Sn.</b></font></td>
											<td><font size="2" color="black"> <b>Company</b></font></td>
											<td><font size="2" color="black"><b>Position
														held</b></font></td>
											<td><font size="2" color="black"><b>From Date</b></font></td>
											<td><font size="2" color="black"><b>To Date</b></font></td>
											<td><font size="2" color="black"><b>Salary
														p.a.</b></font></td>
											<td><font size="2" color="black"><b>Reason
														For Leaving</b></font></td>
											<td><font size="2" color="black"><b>Upload
														Doc</b></font></td>
										</tr>
										<tr>
											<td width="10"><div id="Wsn"></div></td>
											<td width="10"><div id="Wcomp"></div></td>
											<td width="10"><div id="Wpos"></div></td>
											<td width="10"><div id="WfDate"></div></td>
											<td width="10"><div id="WtDate"></div></td>
											<td width="10"><div id="Wsal"></div></td>
											<td width="10"><div id="Wreason"></div></td>
											<td width="10"><div id="upDoc3"></div></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td align="center">
						</table>
					</div>
				</div>

				<div class="Page">
					<div class="Pad">
						<%
								String datenew1=request.getParameter("data");
								if(null==datenew1)
								{
									datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
								}
							%>
						<table bgcolor="#E0DDFE" border="0" height="300" width="500"
							align="center">

							<tr>
								<td align="center"><b><font size="4" color="#151B54">Employee
											Mediclaim Details</font></b></td>
							</tr>
							<tr bgcolor="white">
								<td>
									<table align="center" border="0">
										<tr>
											<td><label id="custype"><b>Mediclaim Agency
														<font color="#990000">*</font> :
												</b></label></td>
											<td><input type="text" name="medi" id="medi" /></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Expiry Date <font
														color="#990000">*</font> :
												</b></label></td>
											<td><input type="text" id="data" name="data" size="12"
												value="<%=datenew1%>" readonly /> <script
													type="text/javascript">
												  Calendar.setup(
												    {
												      inputField  : "data",         // ID of the input field
												      ifFormat    : "%d-%b-%Y",    // the date format
												      button      : "data"       // ID of the button
												    }
												  );
											</script></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Status <font
														color="#990000">*</font> :
												</b></label></td>
											<td><select name="status" id="status"
												class="formElement">
													<option value="Select">Select</option>
													<option value="Active">Active</option>
													<option value="Expired">Expired</option>
											</select></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Upload File <font
														color="#990000">*</font> :
												</b></label></td>
											<td><input type="file" name="mediFile" id="mediFile" />
											</td>
										</tr>
										<tr>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="Page">
					<div class="Pad">
						<%
								String contractDate=request.getParameter("conDate");
								if(null==contractDate)
								{
									contractDate=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
								}
								
								String conDueDate=request.getParameter("dueDate");
								if(null==conDueDate)
								{
									conDueDate=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
								}
							%>
						<table bgcolor="#E0DDFE" border="0" height="300" width="500"
							align="center">

							<tr>
								<td align="center"><b><font size="4" color="#151B54">Employee
											Contract Details</font></b></td>
							</tr>
							<tr bgcolor="white">
								<td>
									<table align="center" border="0">

										<tr>
											<td><label id="custype"><b>Contract Date <font
														color="#990000">*</font> :
												</b></label></td>
											<td><input type="text" id="conDate" name="conDate"
												size="12" value="<%=contractDate%>" readonly /> <script
													type="text/javascript">
												  Calendar.setup(
												    {
												      inputField  : "conDate",         // ID of the input field
												      ifFormat    : "%d-%b-%Y",    // the date format
												      button      : "conDate"       // ID of the button
												    }
												  );
											</script></td>
										</tr>

										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Contract Due Date
														<font color="#990000">*</font> :
												</b></label></td>
											<td><input type="text" id="dueDate" name="dueDate"
												size="12" value="<%=conDueDate%>" readonly /> <script
													type="text/javascript">
												  Calendar.setup(
												    {
												      inputField  : "dueDate",         // ID of the input field
												      ifFormat    : "%d-%b-%Y",    // the date format
												      button      : "dueDate"       // ID of the button
												    }
												  );
											</script></td>
										</tr>

										<tr>
											<td></td>
										</tr>
										<tr>
											<td><label id="custype"><b>Upload Doc <font
														color="#990000">*</font> :
												</b></label></td>
											<td><input type="file" name="mediFile" id="mediFile" />
											</td>
										</tr>
										<tr>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table align="center">
							<tr>
								<td align="center"><input type="submit" id="submit1"
									value="Submit"></td>
							</tr>
						</table>
					</div>
				</div>

			</div>
		</div>


	</form>
	<script type="text/javascript">
tabview_initialize('TabView');
</script>








</body>
</html>