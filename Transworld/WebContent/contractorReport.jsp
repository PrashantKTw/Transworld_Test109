<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>

<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/cpanel_002.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/sorttable.js" type="text/javascript"></script>
<!--
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>

-->
<style>
table {
	border-collapse: collapse;
}

table, td {
	border: none;
}

th {
	background: #C6DEFF;
}
</style>
<script type="text/javascript" language="JavaScript1.2">
 
 
function gotoExcel (elemId, frmFldId)  
{  
         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.contractorReport.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["contractorReport"].submit();       // CHANGE FORM NAME HERE
//alert("after submit");
} 

function viewconDetails(id) 
{   
	var cnt=document.getElementById("cntcls").value;
	
	if(id =='cdet')
	{
		document.getElementById("imgcdet+").style.display='none';
		document.getElementById("imgcdet-").style.display="";
			document.getElementById("bdate").style.display="";
			for(var i=1;i<=cnt;i++)
			{
				document.getElementById("bdate"+i).style.display="";
			}
		
			document.getElementById("mstatus").style.display="";
			for(var i=1;i<=cnt;i++)
			{
				document.getElementById("mstatus"+i).style.display="";
			}
			
			document.getElementById("add").style.display="";
			for(var i=1;i<=cnt;i++)
			{
				document.getElementById("add"+i).style.display="";
			}
			
	}
	if(id=='creg')
			{
		document.getElementById("imgcreg+").style.display='none';
		document.getElementById("imgcreg-").style.display="";
		document.getElementById("cdate").style.display="";
			for(var i=1;i<=cnt;i++)
			{
				document.getElementById("cdate"+i).style.display="";
			}
		
			document.getElementById("cedate").style.display="";
			for(var i=1;i<=cnt;i++)
			{
				document.getElementById("cedate"+i).style.display="";
			}
			
			document.getElementById("camount").style.display="";
			for(var i=1;i<=cnt;i++)
			{
				document.getElementById("camount"+i).style.display="";
			}
	
		   
	}
	
	if(id=='bdet')
	{document.getElementById("imgbdet+").style.display='none';
	 document.getElementById("imgbdet-").style.display="";
		document.getElementById("accno").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("accno"+i).style.display="";
	}

	document.getElementById("bankname").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("bankname"+i).style.display="";
	}
	
	document.getElementById("brname").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("brname"+i).style.display="";
	}
	document.getElementById("ifcs").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("ifcs"+i).style.display="";
	}
	
	document.getElementById("pno").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("pno"+i).style.display="";
	}
   
}

	if(id=='mdet')
	{   document.getElementById("imgmdet+").style.display='none';
	document.getElementById("imgmdet-").style.display="";
	    document.getElementById("policyno").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("policyno"+i).style.display="";
	}

	document.getElementById("coname").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("coname"+i).style.display="";
	}
	
	document.getElementById("mfile").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("mfile"+i).style.display="";
	}
	document.getElementById("camount").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("camount"+i).style.display="";
	}
	
	document.getElementById("exdate").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("exdate"+i).style.display="";
	}
	}
	if(id=='icdet')
	{  document.getElementById("imgicdet+").style.display='none';
	document.getElementById("imgicdet-").style.display="";
		document.getElementById("contname").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("contname"+i).style.display="";
	}

	document.getElementById("contno").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("contno"+i).style.display="";
	}
	
	document.getElementById("cperadd").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("cperadd"+i).style.display="";
	}
	
	document.getElementById("rel").style.display="";
	for(var i=1;i<=cnt;i++)
	{
		document.getElementById("rel"+i).style.display="";
	}

}
}
	function hideconDetails(id) 
	{   
		var cnt=document.getElementById("cntcls").value;
		
		if(id =='cdet')
		{
			document.getElementById("imgcdet+").style.display="";
			document.getElementById("imgcdet-").style.display='none';
				document.getElementById("bdate").style.display='none';
				for(var i=1;i<=cnt;i++)
				{
					document.getElementById("bdate"+i).style.display='none';
				}
			
				document.getElementById("mstatus").style.display='none';
				for(var i=1;i<=cnt;i++)
				{
					document.getElementById("mstatus"+i).style.display='none';
				}
				
				document.getElementById("add").style.display='none';
				for(var i=1;i<=cnt;i++)
				{
					document.getElementById("add"+i).style.display='none';
				}
				
		}
		if(id=='creg')
				{document.getElementById("imgcreg+").style.display="";
				document.getElementById("imgcreg-").style.display='none';
			    document.getElementById("cdate").style.display='none';
				for(var i=1;i<=cnt;i++)
				{
					document.getElementById("cdate"+i).style.display='none';
				}
			
				document.getElementById("cedate").style.display='none';
				for(var i=1;i<=cnt;i++)
				{
					document.getElementById("cedate"+i).style.display='none';
				}
				
				document.getElementById("camount").style.display='none';
				for(var i=1;i<=cnt;i++)
				{
					document.getElementById("camount"+i).style.display='none';
				}
		
			   
		}
		
		if(id=='bdet')
		{document.getElementById("imgbdet+").style.display="";
		document.getElementById("imgbdet-").style.display='none';
			document.getElementById("accno").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("accno"+i).style.display='none';
		}

		document.getElementById("bankname").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("bankname"+i).style.display='none';
		}
		
		document.getElementById("brname").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("brname"+i).style.display='none';
		}
		document.getElementById("ifcs").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("ifcs"+i).style.display='none';
		}
		
		document.getElementById("pno").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("pno"+i).style.display='none';
		}
	   
	}

		if(id=='mdet')
		{ document.getElementById("imgmdet+").style.display="";
		   document.getElementById("imgmdet-").style.display='none';
			document.getElementById("policyno").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("policyno"+i).style.display='none';
		}

		document.getElementById("coname").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("coname"+i).style.display='none';
		}
		
		document.getElementById("mfile").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("mfile"+i).style.display='none';
		}
		document.getElementById("camount").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("camount"+i).style.display='none';
		}
		
		document.getElementById("exdate").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("exdate"+i).style.display='none';
		}
		}
		if(id=='icdet')
		{document.getElementById("imgicdet+").style.display="";
		   document.getElementById("imgicdet-").style.display='none';
			document.getElementById("contname").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("contname"+i).style.display='none';
		}

		document.getElementById("contno").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("contno"+i).style.display='none';
		}
		
		document.getElementById("cperadd").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("cperadd"+i).style.display='none';
		}
		
		document.getElementById("rel").style.display='none';
		for(var i=1;i<=cnt;i++)
		{
			document.getElementById("rel"+i).style.display='none';
		}

	}


}
	
	function DeleteRow(id)
	{
		    var agree=confirm("Do You Want to Delete this Record?");
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
					 // alert("<*****  "+data);
						if(data="Yes")
						{					
	                        alert("Data Deleted Successfully.");
					    	window.location.reload();
						}
						if(data="No")
						{					
	                       // alert("Data Not Deleted Successfully.");
					    	window.location.reload();
						}
		           } 
				}
				var queryString = "?action=delete&id="+id;
				ajaxRequest.open("GET", "AjaxContractDelete.jsp" + queryString, true);
				ajaxRequest.send(null); 
		    }
		    else
		    {return false;
		    }
	 }	
</script>
</head>
<body>
	<%
String fromDateCal="",toDateCal="";
Date today = new Date();
Calendar cal = Calendar.getInstance();
cal.setTime(today);
cal.add(Calendar.DAY_OF_MONTH, -30);
Date today30 = cal.getTime();
fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
String joinDate="",dateOfDate="",conexdate="",contractDate="",claimexdate="",companyName="",deptName="";
Statement st =conn.createStatement();
Statement st1 =conn.createStatement();
Statement st2 =conn.createStatement();
%>
	<%
String dspData1=request.getParameter("EmpID");
String dspData2=request.getParameter("EmpName");
String dspData3=request.getParameter("Empemail");
String dspData4=request.getParameter("sendMsg");
%>
	<input type="hidden" name="dspData1" id="dspData1"
		value="<%=dspData1 %>"></input>
	<input type="hidden" name="dspData2" id="dspData2"
		value="<%=dspData2 %>"></input>
	<input type="hidden" name="dspData3" id="dspData3"
		value="<%=dspData3 %>"></input>
	<input type="hidden" name="dspData4" id="dspData4"
		value="<%=dspData4 %>"></input>
	<%
if(!(dspData4==null))
 {
 	System.out.println("==="+dspData1+"====="+dspData2+"======"+dspData3+"======="+dspData4+"=======");
 %>
	<script LANGUAGE="JavaScript" type="text/javascript">
 	var d1=document.getElementById("dspData1").value;
 	var d2=document.getElementById("dspData2").value;
 	var d3=document.getElementById("dspData3").value;
 	var d4=document.getElementById("dspData4").value;
 	alert("\t"+d4+"\n\nEmp ID:"+d1+"\nEmp Name:"+d2+"\nEmp Mail:"+d3);
 	</script>
	<% 
 }
%>
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.4em; margin-bottom: 0.4em; height: 4px; background-color: #339CCB">
	</div>
	<table width="100%">
		<tr>

			<td>
				<div align="center" style="font-size: 1.6em;">
					<a> Contractor Report</a>
				</div>
			</td>
		</tr>
	</table>
	<br>
	<div align="center">
		<table class="sortable" width="100%"
			style="color: black; border-collapse: collapse;">
			<tr>


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
				System.out.println(">>>>>>>>>>>>dtoday:"+dtoday);
			//========================================================
%>

				<td align="left"><a href="employeeRegistration.jsp"><b>&nbsp;&nbsp;&nbsp;Add</b></a>
					&nbsp;&nbsp;&nbsp;</td>

				<td align="center" id="cdet"><a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{viewconDetails('cdet');} catch(e){alert(e);}">
						<img id="imgcdet+" src="images/add02.png" width="13px"
						height="10px" border="0">
				</a><a>Contractor's Details</a> <a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{hideconDetails('cdet');} catch(e){alert(e);}">
						<img id="imgcdet-" style="display: none;" src="images/minus-.jpeg"
						width="15px" height="7px" border="0">
				</a>
				<td align="center" id="creg"><a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{viewconDetails('creg');} catch(e){alert(e);}">
						<img id="imgcreg+" src="images/add02.png" width="13px"
						height="10px" border="0">
				</a><a>Contractor Registration</a> <a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{hideconDetails('creg');} catch(e){alert(e);}">
						<img id="imgcreg-" style="display: none;" src="images/minus-.jpeg"
						width="15px" height="7px" border="0">
				</a>
				<td id="bdet"><a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{viewconDetails('bdet');} catch(e){alert(e);}">
						<img id="imgbdet+" src="images/add02.png" width="13px"
						height="10px" border="0">
				</a><a>Bank Detail's</a> <a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{hideconDetails('bdet');} catch(e){alert(e);}">
						<img id="imgbdet-" style="display: none;" src="images/minus-.jpeg"
						width="15px" height="7px" border="0">
				</a></td>
				<td id="mdet"><a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{viewconDetails('mdet');} catch(e){alert(e);}">
						<img id="imgmdet+" src="images/add02.png" width="13px"
						height="10px" border="0">
				</a><a>MediClaim Detail's </a> <a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{hideconDetails('mdet');} catch(e){alert(e);}">
						<img id="imgmdet-" style="display: none;" src="images/minus-.jpeg"
						width="15px" height="7px" border="0">
				</a>
				<td id="icdet"><a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{viewconDetails('icdet');} catch(e){alert(e);}">
						<img id="imgicdet+" src="images/add02.png" width="13px"
						height="10px" border="0">
				</a><a>Immidiate Contact Detail's </a> <a href="#"
					style="font-weight: bold; color: black;"
					onclick="javascript:try{hideconDetails('icdet');} catch(e){alert(e);}">
						<img id="imgicdet-" style="display: none;"
						src="images/minus-.jpeg" width="15px" height="7px" border="0">
				</a>
				<td align="right" colspan="4"><a href="#"
					title="Export to Excel"
					onclick="gotoExcel('contractor','tableHTML');"><img
						src="images/excel.jpg" width="15px" height="15px"></a></td>

			</tr>
		</table>
	</div>
	<form action="" method="post" name="contractorReport"
		id="contractorReport">
		<%
String exportFileName="contractor_report.xls";   // GIVE YOUR REPORT NAME
%>
		<div id="contractor" align="center">
			<input type="hidden" id="tableHTML" name="tableHTML" value="" /> <input
				type="hidden" id="fileName" name="fileName"
				value="<%= exportFileName%>" />

			<table border='1' id="tab" class="sortable" align="center"
				style="color: black;">

				<tr>
					<th width="2%">Delete</th>
					<th width="2%">Edit</th>
					<th width="2%">SrNo</th>
					<th width="2%">Contractor<br>ID
					</th>
					<th id="cname" width="8%">Contractor Name</th>
					<th id="compname" width="8%">Company Name</th>
					<th id="jdate" width="6%">Joining Date</th>

					<th id="dept" width="6%">Department</th>
					<th id="desg" width="8%">Designation</th>

					<th id="cno" width="6%">Contact No</th>
					<th id="email" width="5%">Email</th>
					<th id="bdate" width="6%" style="display: none;">Date Of Birth</th>
					<th id="mstatus" width="6%" style="display: none;">Marial
						Status</th>
					<th id="add" width="8%" style="display: none;">Address</th>

					<th id="cdate" width="8%" style="display: none;">Contract Date</th>
					<th id="cedate" width="8%" style="display: none;">Contract <br>Expiry
						Date
					</th>
					<th id="dfile" width="8%" style="display: none;">Contract<br>Document
						File
					</th>

					<th id="accno" width="8%" style="display: none;">Account No</th>
					<th id="bankname" width="6%" style="display: none;">Bank Name</th>
					<th id="brname" width="8%" style="display: none;">Branch Name</th>
					<th id="ifcs" width="8%" style="display: none;">IFCS Code</th>
					<th id="pno" width="8%" style="display: none;">Pan No.</th>

					<th id="policyno" width="8%" style="display: none;">Policy No.</th>
					<th id="coname" width="8%" style="display: none;">Company Name</th>
					<th id="exdate" width="8%" style="display: none;">Date Of
						Expiry</th>
					<th id="camount" width="8%" style="display: none;">Claim
						Amount</th>
					<th id="mfile" width="8%" style="display: none;">Mediclaim
						File</th>

					<th id="contname" width="8%" style="display: none;">Contact
						Person Name</th>
					<th id="contno" width="8%" style="display: none;">Contact No</th>
					<th id="cperadd" width="8%" style="display: none;">Address</th>
					<th id="rel" width="8%" style="display: none;">Relationship</th>
				</tr>

				<% 
int i=0;
String sql="select * from t_employee where Status='Active'";
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{ i++;
     try{
    	 String sql1="select OurCompanyName from t_ourcompanydet where CompanyCode='"+rs.getString("CompanyCode")+"'";
    	  ResultSet rs1=st1.executeQuery(sql1);
	     if(rs1.next())
	     {
	    	 companyName=rs1.getString(1);
	     }
         
	     String sql2="select DeptName from t_department where ComapanyCode='"+rs.getString("CompanyCode")+"' and DeptCode='"+rs.getString("DeptID")+"'";
   	     ResultSet rs2=st2.executeQuery(sql2);
	     if(rs2.next())
	     {
	    	 deptName=rs2.getString(1);
	     }
       
	     
     joinDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DateofJoining"))); 
     dateOfDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DateOfBirth"))); 
      contractDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("ContractDate"))); 
      conexdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("ContractExpDate"))); 
      claimexdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("ExpiryDateClaim"))); 
     }catch(Exception e){}
%>
				<tr>
					<td style="width: 1%"><a href="#"
						style="font-weight: bold; color: black;"
						onclick="DeleteRow('<%=rs.getString("EmpID")%>');"><img
							src="images/delete.jpeg" width="20px" height="18px"
							style="border-style: none"></img></a></td>
					<td style="width: 2%"><a
						href="EmployeeEditForm.jsp?empid=<%=rs.getString("EmpID")%>"
						style="font-weight: bold; color: black;" onclick=""><img
							src="images/edit1.jpeg" width="20px" height="18px"
							style="border-style: none"></img></a></td>
					<td align="right"><div align="right"><%=i%></div></td>
					<td align="right"><div align="right"><%=rs.getString("EmpID") %></div></td>
					<td align="left"><div align="left"><%=rs.getString("EmpName") %></div></td>
					<td align="left"><div align="left"><%=companyName%></div></td>
					<td align="left"><div align="left"><%=joinDate%></div></td>
					<td align="left"><div align="left"><%=deptName%></div></td>
					<td align="left"><div align="left"><%=rs.getString("designation") %></div></td>
					<td align="right"><div align="right"><%=rs.getString("EmpContactNo")%></div></td>
					<td align="left"><div align="left"><%=rs.getString("Empemail")%></div></td>
					<td align="right" id="bdate<%=i%>" style="display: none;"><div
							align="right"><%=dateOfDate%></div></td>
					<td align="left" id="mstatus<%=i%>" style="display: none;"><div
							align="left"><%=rs.getString("MarialStatus")%></div></td>
					<td align="left" id="add<%=i%>" style="display: none;"><div
							align="left"><%=rs.getString("AddressEmp")%></div></td>

					<td width="8%" id="cdate<%=i%>" align="right"
						style="display: none;"><div align="right"><%=contractDate%></div></td>
					<td width="8%" id="cedate<%=i%>" align="right"
						style="display: none;"><div align="right"><%=conexdate%></div></td>
					<td width="8%" id="dfile<%=i%>" align="left" style="display: none;"><div
							align="left"><%=rs.getString("ContractFileName")%></div></td>

					<td width="8%" id="accno<%=i%>" align="right"
						style="display: none;"><div align="right"><%=rs.getString("AccNo")%></div></td>
					<td width="8%" id="bankname<%=i%>" align="left"
						style="display: none;"><div align="left"><%=rs.getString("BankName")%></div></td>
					<td width="8%" id="brname<%=i%>" align="left"
						style="display: none;"><div align="left"><%=rs.getString("BankBranch")%></div></td>
					<td width="8%" id="ifcs<%=i%>" align="right" style="display: none;"><div
							align="right"><%=rs.getString("IFSC")%></div></td>
					<td width="8%" id="pno<%=i%>" align="right" style="display: none;"><div
							align="right"><%=rs.getString("PanNo")%></div></td>

					<td width="8%" id="policyno<%=i%>" align="right"
						style="display: none;"><div align="right"><%=rs.getString("PolicyNo")%></div></td>
					<td width="8%" id="coname<%=i%>" align="left"
						style="display: none;"><div align="left"><%=rs.getString("NameOfClaimCompany")%></div></td>
					<td width="8%" id="exdate<%=i%>" align="right"
						style="display: none;"><div align="right"><%=claimexdate%></div></td>
					<td width="8%" id="camount<%=i%>" align="right"
						style="display: none;"><div align="right"><%=rs.getString("ClaimAmount")%></div></td>
					<td width="8%" id="mfile<%=i%>" align="left" style="display: none;"><div
							align="left"><%=rs.getString("MediclaimFileName")%></div></td>

					<td width="8%" id="contname<%=i%>" align="left"
						style="display: none;"><div align="left"><%=rs.getString("ContactImeediate")%></div></td>
					<td width="8%" id="contno<%=i%>" align="right"
						style="display: none;"><div align="right"><%=rs.getString("ContactNoImmediate")%></div></td>
					<td width="8%" id="cperadd<%=i%>" align="left"
						style="display: none;"><div align="left"><%=rs.getString("AddressContact")%></div></td>
					<td width="8%" id="rel<%=i%>" align="left" style="display: none;"><div
							align="left"><%=rs.getString("RelationShip")%></div></td>
				</tr>


				<%}conn.close(); %>
				<input type="hidden" name="cntcls" id="cntcls" value="<%=i%>">
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

