<%@ page language="java"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.sql.ResultSet"%><html>

<head>
<title>Edit Documents</title>
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
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<script type="text/javascript" src="css/chrome.js"></script>
<script type="text/javascript">
var employeeList=null;
onunload=function()
{
	window.close();
}
/* 
function closeAllchildren()
{
	//window.opener=self;
	mywindow2.close(); 
} */
function otherCategory() 
{
	alert("@@@@@@@@@");	
} 
function validate()
{
	var v1=document.getElementById("to").value;
	var v2=document.getElementById("senderCmts").value;
	if(v1=="" || v1==null)
	{
		alert("Please Select Employee");
		return false;
	}
	return true;
}
function showVisitingCardDetails(eName,empMail)
{
	document.getElementById("from1").value=eName;
	document.getElementById("SelectedEmpMail").value=empMail;
	document.getElementById("EmpList").style.display='none';
}
function getEmp123()
{
	//alert("============================>>"+crg);
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
			document.getElementById("EmpList").innerHTML=reslt;
		} 
	}
	var queryString = "?emp=" +emp+"&crg="+crg;
	ajaxRequest.open("GET", "SearchBoxForFromCategory.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
}
function getCategory(catgry)
{
	var ct=catgry;
	crg=ct;

	if(crg=="Bills")
	{
		document.getElementById("frmParty1").style.display='none';
		document.getElementById("frmParty").style.display="";
		document.getElementById("billno").style.display="";
		document.getElementById("billamt").style.display="";
		document.getElementById("billdate").style.display="";
		document.getElementById("billduedate").style.display="";
	}
	else if(crg=="customer")
	{
		document.getElementById("frmParty1").style.display='none';
		document.getElementById("frmParty").style.display="";
		document.getElementById("billno").style.display='none';
		document.getElementById("billamt").style.display='none';
		document.getElementById("billdate").style.display='none';
		document.getElementById("billduedate").style.display='none';
	}
	else
	{
		document.getElementById("frmParty1").style.display="";
		document.getElementById("frmParty").style.display='none';
		document.getElementById("billno").style.display='none';
		document.getElementById("billamt").style.display='none';
		document.getElementById("billdate").style.display='none';
		document.getElementById("billduedate").style.display='none';
	}
}

</script>
</head>

<body>
	<%
Statement st=conn.createStatement();
String refno=request.getParameter("refno");
try
{
	String dept="";
	Statement stmt=conn.createStatement();
%>
	<form action="EditInwardEmail.jsp" name="editform" method="get">
		<input type="hidden" name="rd" id="rd" value="<%=refno%>">
		<table style="" align="center">
			<tr align="center">
				<td align="center">
					<h1>Edit Document</h1>
				</td>
			</tr>
		</table>
		<%


String sql="";
String manref="", iwno="", addr="", to="" ,category="", frm="", partyRef="",frmid="" ,subject="", actionDate="", priority="", remarks="", FileName="", BillNo="", BillAmt="", BillDate="", BillDueDate="";
String sqlEdit="select * from db_leaveapplication.t_inwarddetails where InwardRefNo='"+refno+"'";
System.out.println(sqlEdit);
System.out.println("\n\n after.......");
try
{
	ResultSet rsEdit=st.executeQuery(sqlEdit);
	if(rsEdit.next())
	{
		System.out.println("\n\n in try if.........");
		manref=rsEdit.getString("ManualRef");
		addr=rsEdit.getString("Address");
		category=rsEdit.getString("Category");
		frm=rsEdit.getString("FromParty");
		partyRef=rsEdit.getString("PartyRefNo");
		subject=rsEdit.getString("Subject");
		actionDate=rsEdit.getString("ActionDate");
		priority=rsEdit.getString("InwrdPriority");
		remarks=rsEdit.getString("senderRemark");
		FileName=rsEdit.getString("FileName");
		BillNo=rsEdit.getString("BillNo");
		BillAmt=rsEdit.getString("BillAmt");
		try
		{
			BillDate=rsEdit.getString("BillDate");
			BillDueDate=rsEdit.getString("BillDueDate");	
		}
		catch(Exception e)
		{
			System.out.println(e);
			e.printStackTrace();
		}
		
		iwno=rsEdit.getString("InwardNo");
		to=rsEdit.getString("ToEmailID");
		frmid=rsEdit.getString("EnteredById");
		 
	}
}
catch(Exception e)
{
	System.out.println(e);
	e.printStackTrace();
}
System.out.println(to+"******"+frmid);
System.out.println(manref+"==="+iwno+"==="+addr+"==="+category+"==="+frm+"==="+partyRef+"==="+subject+"==="+actionDate+"==="+priority+"==="+remarks+"==="+FileName+"==="+BillNo+"==="+BillAmt+"==="+BillDate+"==="+BillDueDate);
String ss="display:none";
%>
		<table border="0" cellpadding="3" width="100%"
			style="background: #b0c4de;" align="center">
			<tr>
			</tr>
		</table>

		<input type="hidden" name="AllFileNames" id="AllFileNames"
			value="<%= FileName%>"> <input type="hidden" name="to"
			id="to" value="<%= to%>"> <input type="hidden" name="frmMail"
			id="frmMail" value="<%= frmid%>">
		<table align="center">
			<br></br>

			<tr>
				<td><label id="custype"><b>Inward Ref. No<font
							color="#990000"></font> :
					</b></label></td>
				<td><label id="custype1"><%=refno%></label> <input
					type="hidden" name="inrefno" id="inrefno" value="<%=refno%>"
					readonly /></td>
			</tr>

			<tr>
				<td><label id="custype"><b>Ref. No<font
							color="#990000"></font> :
					</b></label></td>
				<td><input type="text" name="manualref" id="manualref"
					value="<%=manref%>" /></td>
			</tr>

			<tr>
				<td><label id="custype"><b>Category<font
							color="#990000">*</font> :
					</b></label></td>
				<td><select name="cat" id="cat" class="formElement"
					onchange="getCategory(this.value);">
						<% 
				try{
				String sqlCat="select distinct(InwrdCategory) from t_InwardCategory" ;
				   ResultSet rsCat=st.executeQuery(sqlCat);
				    while(rsCat.next())
				    { %>
						<option value="<%=rsCat.getString("InwrdCategory") %>">
							<%=rsCat.getString("InwrdCategory") %>
						</option>
						<%  } 
				}
				catch(Exception e){System.out.println("Exception======>>"+e);}%>
				</select></td>
			</tr>

			<tr>
				<td><label id="custype"><b>From<font
							color="#990000">*</font> :
					</b></label></td>
				<%/*
		if( category.equals("Bills") || category.equals("customer"))
		{
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%");
			*/%>

				<td id="frmParty" style="display: none"><input type="hidden"
					name="SelectedEmpMail" id="SelectedEmpMail" value="" /> <input
					type="text" name="from1" id="from1" autocomplete="off"
					value="<%= frm%>"
					onkeyup="if (event.keyCode == 27){document.getElementById('EmpList').style.display = 'none';} else { getEmp123(); }" />
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
				<%/*}
		else
		{
			System.out.println("#########################");
		*/%>

				<td id="frmParty1" style="display: ''"><input type="text"
					name="from" id="from" value="<%= frm%>" /></td>
				<%//} %>
			</tr>
			<%
		if(category.equals("Bills"))
		{
			ss="";
		}
		%>


			<tr id="billno" style="<%=ss%>">
				<td><label id="custype"><b>Bill No.<font
							color="#990000">*</font> :
					</b></label></td>
				<td><input type="text" name="blno" id="blno"
					value="<%=BillNo%>" /></td>
			</tr>
			<tr id="billamt" style="<%=ss%>">
				<td><label id="custype"><b>Bill Amt.<font
							color="#990000">*</font> :
					</b></label></td>
				<td><input type="text" name="blamt" id="blamt"
					value="<%=BillAmt%>" /></td>
			</tr>


			<tr id="billdate" style="<%=ss%>">
				<td><label id="custype"><b>Bill Date<font
							color="#990000">*</font> :
					</b></label></td>
				<td><input type="text" id="bldate" name="bldate" size="12"
					value="<%=BillDate%>" readonly /> <script type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "bldate",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format									
						      button      : "bldate"       // ID of the button
						    }
						  );
					</script></td>
			</tr>
			<tr id="billduedate" style="<%=ss%>">
				<td><label id="custype"><b>Bill Due Date<font
							color="#990000">*</font> :
					</b></label></td>
				<td><input type="text" id="blduedate" name="blduedate"
					size="12" value="<%=BillDueDate%>" readonly /> <script
						type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "blduedate",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format
						      button      : "blduedate"       // ID of the button
						    }
						  );
					</script></td>
			</tr>


			<tr>
				<td><label id="custype"><b>Party Ref. No<font
							color="#990000">*</font> :
					</b></label></td>
				<td><input type="text" name="prno" id="prno"
					value="<%=partyRef%>" /></td>
			</tr>

			<tr>
				<td><label id="custype"><b>Address<font
							color="#990000"></font> :
					</b></label></td>
				<td><textarea name="address" rows="2" id="address""><%=addr%></textarea>
				</td>
			</tr>

			<tr>
				<td><label id="custype"><b>Subject<font
							color="#990000">*</font> :
					</b></label></td>
				<td><input type="text" name="sub" id="sub" value="<%=subject%>" />
				</td>
			</tr>



			<tr>
				<td><label id="custype"><b>Action Date<font
							color="#990000">*</font> :
					</b></label></td>
				<td><input type="text" id="data" name="data" size="12"
					value="<%=actionDate%>" readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script></td>
				<td>
			</tr>

			<tr>
				<td><label id="custype"><b>Priority<font
							color="#990000">*</font> :
					</b></label></td>
				<td><select name="priority" id="priority" class="formElement">
						<option value="Low">Low</option>
						<option value="Medium">Medium</option>
						<option value="High">High</option>
				</select></td>
			</tr>



			<tr>
				<td><label id="custype"><b>Remarks<font
							color="#990000"></font> :
					</b></label></td>
				<td><textarea name="remark" rows="3" id="remark"><%=remarks%></textarea>
				</td>
			</tr>
		</table>



		<table align="center">
			<tr>
				<td align="center"><input type="submit" id="search-submit"
					name="submitFollowUp" value="Submit" onclick="return validate();" /></td>
			</tr>
		</table>

	</form>
	<%
conn.close();
}
catch(Exception e)
{
e.printStackTrace();
}%>
</body>
</html>