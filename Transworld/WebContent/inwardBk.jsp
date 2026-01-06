<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<%@ include file="header.jsp"%>

<html>

<head>

<title>Transworld</title>
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

var crg=null;

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

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function MultiSelector( list_target, max ){

	var dispAtchFile=null;
	var dispDelFile=null;
	
	var fileList=null;
	this.list_target = list_target;
	this.count = 0;
	this.id = 0;
	if( max ){
		this.max = max;
	} else {
		this.max = -1;
	};
	this.addElement = function( element ){
		if( element.tagName == 'INPUT' && element.type == 'file' ){

			element.name = 'file_' + this.id++;
			element.multi_selector = this;
			element.onchange = function(){
				var new_element = document.createElement( 'input' );
				new_element.type = 'file';
				this.parentNode.insertBefore( new_element, this );
				this.multi_selector.addElement( new_element );
				this.multi_selector.addListRow( this );
				this.style.position = 'absolute';
				this.style.left = '-1000px';
				
				
				
			};
			if( this.max != -1 && this.count >= this.max ){
				element.disabled = true;
			};

			// File element counter
			this.count++;
			// Most recent element
			this.current_element = element;
			
		} else {
			// This can only be applied to file input elements!
			alert( 'Error: not a file input element' );
		};

	};

	/**
	 * Add a new row to the list of files
	 */
	this.addListRow = function( element ){

		// Row div
		var new_row = document.createElement( 'div' );

		// Delete button
		var new_row_button = document.createElement( 'input' );
		new_row_button.type = 'button';
		new_row_button.value = 'Delete';

		// References
		new_row.element = element;

		//**cal 2 add atched files*****************************************
		if(dispAtchFile==null)
		{
			dispAtchFile=new_row.element.value;
		}
		else
		{
			dispAtchFile=dispAtchFile+","+new_row.element.value;
		}
			//-----------------------------------------------------------------
			getFileList(dispAtchFile);
			//-----------------------------------------------------------------
	//	alert(dispAtchFile);
		//******************************************************************

		// Delete function
		new_row_button.onclick= function(){

			// Remove element from form
			this.parentNode.element.parentNode.removeChild( this.parentNode.element );

			// Remove this row from the list
			this.parentNode.parentNode.removeChild( this.parentNode );

			//***cal 2 remove deltd files***************************************
			if(dispDelFile==null)
			{
				dispDelFile=this.parentNode.element.value;
			}
			else
			{
				dispDelFile=dispDelFile+","+this.parentNode.element.value;
			}
			
	//		alert(dispDelFile);

			//-----------------------------------------------------------------
			removeFileList(dispAtchFile,dispDelFile);
			//-----------------------------------------------------------------	
			
			//******************************************************************
			

			// Decrement counter
			this.parentNode.element.multi_selector.count--;

			// Re-enable input element (if it's disabled)
			this.parentNode.element.multi_selector.current_element.disabled = false;
				
			// Appease Safari
			//    without it Safari wants to reload the browser window
			//    which nixes your already queued uploads
			return false;
		};

		// Set row value
		new_row.innerHTML = element.value;
		if(fileList==null)
		{
			fileList=new_row.innerHTML;
		}
		else
		{
			fileList=fileList+","+new_row.innerHTML;
		}
		
//		getFileList(fileList);//Ajx fun
		
		// Add button
		new_row.appendChild( new_row_button );
		//alert(fileList);
			
		// Add it to the list
		this.list_target.appendChild( new_row );
		
		
	};

	

	
//	response.sendRedirect("fileData.jsp?fileList="+fileList);
};



function getFileList(fName)
{
		var xmlhttp;
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
		  //alert(xmlhttp.responseText);
		  document.getElementById("fileName").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","fileData.jsp?fName="+fName,true);
		xmlhttp.send(null);
}

function removeFileList(AddName,DelName)
{
		var xmlhttp;
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
		  //alert(xmlhttp.responseText);
		  document.getElementById("fileName").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","fileDataDelete.jsp?AddName="+AddName+"&DelName="+DelName,true);
		xmlhttp.send(null);
		
}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function getEmp(deptName)
{
		var xmlhttp;
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
		  //alert(xmlhttp.responseText);
		  document.getElementById("to").innerHTML=xmlhttp.responseText;
		  }
		}
		xmlhttp.open("GET","getEmp.jsp?deptName="+deptName,true);
		xmlhttp.send(null);
		
}

function validate()
{
	
	var val1 = document.getElementById("inno").value;
	var val2 = document.getElementById("inrefno").value;
	var val3 = document.getElementById("from").value;
	var frm = document.getElementById("from1").value;
	var val4 = document.getElementById("prno").value;
	var val8 = document.getElementById("dept").value;
	var val5 = document.getElementById("to").value;//document.to.value;
	var val7 = document.getElementById("sub").value;
	var val9 = document.getElementById("cat").value;
	var actDate= document.getElementById("data").value;
	var priority=document.getElementById("priority").value;
	var val10 = document.getElementById("fileName").value;
//	var rdbtn=document.getElementsById("rd1").value;
	/*
	var rdbtn;
	if(document.registrationform.rd[0].checked==true)
	{
		rdbtn= document.getElementById("rd1").value;
	}
	if(document.registrationform.rd[1].checked==true)
	{
		rdbtn= document.getElementById("rd2").value;
	}
	if(document.registrationform.rd[2].checked==true)
	{
		rdbtn= document.getElementById("rd3").value;
	}
*/
//	alert(rdbtn);
	
	if(val3=="" && frm==""){
		alert("Please Enter Inward From Party Name");
		return false;
	}
	if(val4==""){
		alert("Please Enter Party Ref. No");
		return false;
	}
	if(val8==""){
		alert("Please Enter Department");
		return false;
	}
	if(val5==""){
		alert("Please Select To Party Name");
		return false;
	}
	if(val7==""){
		alert("Please Enter Subject");
		return false;
	}
	if(val9=="" || val9=="Select"){
		alert("Please Select Category");
		return false;
	}
	if(priority=="" || priority=="Select"){
		alert("Please Select Priority");
		return false;
	}
	/*
	if(val10=="" || val10==","){
		alert("Please Select File for Upload");
		return false;
	}
	*/
/*
	if(rdbtn="" || rdbtn==null)
	{
		alert("Please Select Mail Type");
		return false;
	}
	*/
	return true;
}
function getCategory(catgry)
{
	var ct=catgry;
	crg=ct;

	if(crg=="Bills")
	{
		document.getElementById("billno").style.display="";
		document.getElementById("billamt").style.display="";
		document.getElementById("billdate").style.display="";
		document.getElementById("billduedate").style.display="";

		document.getElementById("frmParty1").style.display="";
		document.getElementById("frmParty").style.display='none';
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
		document.getElementById("billno").style.display='none';
		document.getElementById("billamt").style.display='none';
		document.getElementById("billdate").style.display='none';
		document.getElementById("billduedate").style.display='none';

		document.getElementById("frmParty1").style.display="";
		document.getElementById("frmParty").style.display='none';
	}
}


</script>
</head>

<body
	ONKEYDOWN="if (event.keyCode == 27){document.getElementById('EmpList').style.display = 'none';}">

	<%
String datenew1=request.getParameter("data");
if(null==datenew1)
{
	datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}
%>
	<% 
	String sterm,sterm2;
//	Connection conn=null;
	Statement stmt=null;
	Statement stmt1=null;
	String sql=null;

%>




	<div align="center">
		<%
try {
		
//	Class.forName("com.mysql.cj.jdbc.Driver");
//conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");
//   conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");
	stmt=conn.createStatement();
	stmt1=conn.createStatement();
String emailid="";	
//String iwno=request.getParameter("iwno");
//String refno=request.getParameter("refno");
String msg = (String)session.getAttribute("errormsg");

%>
		<%
//======Get new iwno and iwrefno============================================================================
int i=0,j=0,iwno=0;
String refno="",dt="",a="";
try
{
		
		String sqlIwno="select rid, InwardNo, InwardDate from t_inwarddetails order by rid Desc limit 1";
		stmt=conn.createStatement();
		ResultSet rst=stmt.executeQuery(sqlIwno);
		if(rst.next())
		{
			iwno=rst.getInt("rid");
			java.util.Date d1=rst.getDate("InwardDate");
			java.util.Date d2=new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
		//	out.println("==="+d1.toString()+"====="+d2.toString()+"==");
			if(d1 != null)
			{
				j=d1.compareTo(d2);
				if(j<0)
				{
					i=1;
					a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
					refno="IW"+a+"00"+i;
				}
				else
				{
					i=rst.getInt("InwardNo")+1;
					if(i<10)
					{
						a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
						refno="IW"+a+"00"+i;
					}
					else if(i>10 && i<100)
					{
						a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
						refno="IW"+a+"0"+i;
					}
					else
					{
						a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
						refno="IW"+a+""+i;
					}
				}
			}
		}
		else
		{
			i=1;
			a=new SimpleDateFormat("ddMMyyyy").format(new java.util.Date());
			refno="IW"+a+"00"+i;
		}
}
catch(Exception e)
{
	out.println("Exception=================>>"+e);
}
//==================================================================================
%>
		<form action="inwardTest.jsp" method="post"
			enctype="multipart/form-data" name="form1" id="form1">
			<table align="left">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td align="left">
						<table bgcolor="#E0DDFE" border="0" height="500" width="450"
							align="left">
							<tr>
								<td align="center">
									<table align="center">
										<tr>
											<td align="center"><b><font size="4" color="#151B54">Inward
														Entry</font></b></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table bgcolor="white" border="0" height="440" width="490"
										align="center">
										<input type="hidden" name="path" id="path"
											value="<%=request.getContextPath()%>">
										<%
			String getMsg=request.getParameter("getMsg");
			if(!(getMsg==null))
			{
				%>
										<tr>
											<td align="center"><font size="3"><%=getMsg%></font></td>
										</tr>
										<% 
			}
			iwno=iwno+1;
			%>

										<tr>
											<td>
												<table align="center">
													<tr>
														<td><font color="#990000">* Required</font></td>
													</tr>

													<tr>
														<td><label id="custype"><b>Inward No<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><label id="custype1"><%=iwno%></label> <input
															type="hidden" name="inno" id="inno" value="<%=iwno%>"
															readonly /></td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<td><label id="custype"><b>Inward Ref. No<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><label id="custype1"><%=refno%></label> <input
															type="hidden" name="inrefno" id="inrefno"
															value="<%=refno%>" readonly /></td>
													</tr>
													<tr>
														<td></td>
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
		   ResultSet rsCat=stmt1.executeQuery(sqlCat);
		    while(rsCat.next())
		    { %>
																<option value="<%=rsCat.getString("InwrdCategory") %>">
																	<%=rsCat.getString("InwrdCategory") %>
																</option>
																<%  } 
		}
		catch(Exception e){System.out.println("Exception======>>"+e);}%>
														</select>
													<tr>
														<td></td>
													</tr>
													</td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<td><label id="custype"><b>From<font
																	color="#990000">*</font> :
															</b></label></td>
														<td id="frmParty" style="display: none"><input
															type="hidden" name="SelectedEmpMail" id="SelectedEmpMail"
															value="" /> <input type="text" name="from1" id="from1"
															autocomplete="off" value=""
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
														<td id="frmParty1" style="display:"><input
															type="text" name="from" id="from" /></td>
													</tr>

													<tr>
														<td></td>
													</tr>
													<tr>
														<td><label id="custype"><b>Party Ref. No<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><input type="text" name="prno" id="prno" /></td>
													</tr>
													<tr>
														<td></td>
													</tr>

													<tr id="billno" style="display: none">
														<td><label id="custype"><b>Bill No.<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><input type="text" name="blno" id="blno" /></td>
													</tr>
													<tr id="billamt" style="display: none">
														<td><label id="custype"><b>Bill Amt.<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><input type="text" name="blamt" id="blamt" /></td>
													</tr>
													<tr id="billdate" style="display: none">
														<td><label id="custype"><b>Bill Date<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><input type="text" id="bldate" name="bldate"
															size="12" value="<%=datenew1%>" readonly /> <script
																type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "bldate",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format									
						      button      : "bldate"       // ID of the button
						    }
						  );
					</script></td>
													</tr>
													<tr id="billduedate" style="display: none">
														<td><label id="custype"><b>Bill Due Date<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><input type="text" id="blduedate"
															name="blduedate" size="12" value="<%=datenew1%>" readonly />
															<script type="text/javascript">
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
														<td><label id="custype"><b>Department<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><select name="dept" id="dept" class="formElement"
															onchange="getEmp(this.value);">

																<% sql="select distinct(TypeValue) as Dept from t_leaveadmin order by Dept asc" ;
   ResultSet rst3=stmt.executeQuery(sql);
    while(rst3.next())
    { %>
																<option value="<%=rst3.getString("Dept") %>">
																	<%=rst3.getString("Dept") %>
																</option>
																<%  } %>
														</select></td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<td><label id="custype"><b>To<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><select name="to" id="to" class="formElement"
															multiple="multiple" size="2" style="width: 200px;"></select>

														</td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<td><label id="custype"><b>Subject<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><input type="text" name="sub" id="sub" /></td>
													</tr>

													<tr>
														<td><label id="custype"><b>Action Date<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><input type="text" id="data" name="data"
															size="12" value="<%=datenew1%>" readonly /> <script
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
														<td></td>
													</tr>
													<tr>
														<td><label id="custype"><b>Priority<font
																	color="#990000">*</font> :
															</b></label></td>
														<td><select name="priority" id="priority"
															class="formElement">
																<option value="Low">Low</option>
																<option value="Medium">Medium</option>
																<option value="High">High</option>
														</select></td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<td><label id="custype"><b>Remarks<font
																	color="#990000"></font> :
															</b></label></td>
														<td><textarea name="remark" rows="3" id="remark"></textarea>
														</td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<td><label id="custype"><b>File
																	Name/Location<font color="#990000">*</font> :
															</b><br>
															<font size="1">max 5 files can be uploaded</font></label></td>
														<td><input type="file" name="MyFile" id="MyFile" /> <input
															type="hidden" name="fileName" id="fileName" value=""></input>

														</td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<table align="center">
														<tr>
															<td><input TYPE="radio" id="rd1" name="rd"
																VALUE="link" size="2" />Send Intimation &nbsp;&nbsp; <input
																TYPE="radio" id="rd2" name="rd" VALUE="attch" size="2" />Send
																Attachment &nbsp;&nbsp; <input TYPE="radio" id="rd3"
																name="rd" VALUE="save" size="2" />Save File</td>
														</tr>
													</table>
													<table align="center">
														<tr>
															<td align="center"><input type="button"
																value="Reset"
																onclick="javascript:document.registrationform.reset();">
															</td>
															<td align="center"><input type="submit"
																id="submitButton1" value="Send"
																onclick="return validate();"></td>
														</tr>
													</table>
													</td>
													</tr>

												</table>
											</td>
										</tr>
										<input type="hidden" name="flag" id="flag" value="false"></input>



									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<%
}catch(Exception e)
{
	out.print("Exception -->"+e);
}
finally
{
	conn.close();
}
%>
		</form>
	</div>
	<table bgcolor="#E0DDFE" border="1">
		<tr>
			<td align="center"><b>List Of Documents</b></td>
		</tr>
		<tr bgcolor="white">
			<td align="center"><div id="files_list"></div></td>
		</tr>
	</table>



</body>
<script type="text/javascript">
var multi_selector = new MultiSelector( document.getElementById('files_list'), 5 );
multi_selector.addElement( document.getElementById('MyFile'));
//alert(valId);
</script>
</html>
