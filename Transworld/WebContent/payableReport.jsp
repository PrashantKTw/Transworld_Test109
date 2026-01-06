<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp"%>

<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/sorttable.js" type="text/javascript"></script>
<!--
<link href="css/cpanel_002.css"  rel="stylesheet" type="text/css"/>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
-->
<style>
th {
	background: #C6DEFF;
}
</style>
<script type="text/javascript">
function gotoExcel (elemId, frmFldId)  
{  
//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.payableReport.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["payableReport"].submit();       // CHANGE FORM NAME HERE

} 

	function allcheck(count)
	{ //alert("call"+count); 
		if(document.getElementById("checkAll").checked==true)
	   {	for(var i=1;i<=count;i++)
			{document.getElementById("check"+i).checked=true;
		    }
	   }
	   else
	   {
		   for(var i=1;i<=count;i++)
			{document.getElementById("check"+i).checked=false;
		    }
	   }
	}

	
	function Pdfredirect(webadd,count)
	{
	 var payno="";
	 
	 	 for(var i=1;i<=count;i++)
		 {if(document.getElementById("check"+i).checked==true)
		   { 
			payno=payno+" "+document.getElementById(i).innerHTML;
		   }
		  }
	 	 payno.trim();
	 	 if(payno=="")
	 	 {alert("Please Select the CheckBox.");
		 return false;}
	 	 //alert(payno);
		window.open(webadd+'?Payno='+payno);
	}
</script>
</head>
<body>

	<table width="100%" border="0">
		<tr>
			<td align="center" colspan="4"><a style="font-size: 1.60em"
				href="test.jsp">Payroll Report</a><br></br></td>
		</tr>
		<tr valign="top">
			<td valign="top" colspan="2">
				<form name="registrationform" enctype="multipart/form-data"
					action="payrollUpload.jsp" method="post">

					<div id="imageDiv" align="left" valign="top">
						<input type="hidden" name="uploadedby"
							value="<%=session.getAttribute("empname")%>" /> Upload Payroll
						Excel :<input type="file" name="Filename" style="valign: top;" />
						<a valign="Top"
							href="javascript:document.registrationform.submit();"><font
							size="3">Upload</font></a>
					</div>
				</form>
			</td>
			<%int yyyy = Calendar.getInstance().get(Calendar.YEAR); %>

			<td align="center">
				<form>
					<%String m1="";
int year=0;
try{ m1=request.getParameter("month");System.out.println(",,,,,,,,,,,,,,"+m1);
    year=Integer.parseInt(request.getParameter("year"));%>
					<%}catch(Exception e){System.out.println(",,,,,,,,,,,,,,"+e);}%>
					<b>Month :</b> <select name="month" id="month" style="width: 100px"
						class="select">
						<%if(m1==null)
 		        	{%>
						<option value="1">January</option>
						<option value="2">February</option>
						<option value="3">March</option>
						<option value="4">April</option>
						<option value="5">May</option>
						<option value="6">June</option>
						<option value="7">July</option>
						<option value="8">August</option>
						<option value="9">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
						<%}
 		          else{%>
						<%if(m1.equals("1")){ %><option value="1" selected="selected">January</option>
						<%}else{%><option value="1">January</option>
						<%} 
 		         
 		         if(m1.equals("2")){ %><option value="2" selected="selected">February</option>
						<%}else{%><option value="2">February</option>
						<%} 
 		         
			     if(m1.equals("3")){ %><option value="3" selected="selected">March</option>
						<%}else{%><option value="3">March</option>
						<%} 
 		         
			     if(m1.equals("4")){ %><option value="4" selected="selected">April</option>
						<%}else{%><option value="4">April</option>
						<%}
 		         
			     if(m1.equals("5")){ %><option value="5" selected="selected">May</option>
						<%}else{%><option value="5">May</option>
						<%} 
			     
			     if(m1.equals("6")){ %><option value="6" selected="selected">June</option>
						<%}else{%>
						<option value="6">June</option>
						<%}
 		         
			     if(m1.equals("7")){ %><option value="7" selected="selected">July</option>
						<%}else{%><option value="7">July</option>
						<%} 
 		         
			     if(m1.equals("8")){ %><option value="8" selected="selected">August</option>
						<%}else{%><option value="8">August</option>
						<%}
 		         
			   if(m1.equals("9")){ %><option value="9" selected="selected">September</option>
						<%}else{%><option value="9">September</option>
						<%} 
			     
			      if(m1.equals("10")){ %><option value="10" selected="selected">October</option>
						<%}else{%><option value="10">October</option>
						<%} 
 		         
			    if(m1.equals("11")){ %><option value="11" selected="selected">November</option>
						<%}else{%><option value="11">November</option>
						<%} 
			     
			    if(m1.equals("12")){ %><option value="12" selected="selected">December</option>
						<%}else{%><option value="12">December</option>
						<%} 
 		         }%>

					</select> <b>Year :</b> <select name="year" id="year" style="width: 100px"
						class="select" onclick="getYear();"><div id="yyy"></div>
						<%for(int i=yyyy;i>2000;i--){ %>
						<%if(i==year){ %><option value="<%=i%>" selected="selected"><%=i%></option>
						<%}else{ %><option value="<%=i%>"><%=i%></option>
						<%}} %></select> <input type="submit" name="submit" value="Go" class="button" />

				</form>
			</td>

			<td align="right"><a valign="Top" href="downloadExcelFormat.jsp"><font
					size="3">Download Excel Format</font></a></td>
			<% Statement st = conn.createStatement(); 
 String qry = "select count(*) from t_payable where Status='Active'";
 System.out.println(qry);
 ResultSet rs = st.executeQuery(qry); 
 int cnt=0;
 if(rs.next())
 {cnt=rs.getInt(1);
 }%>
		</tr>

		<tr>
			<td align="left" colspan="2"><a href="PayableEntry.jsp"><b>Add</b></a>
				&nbsp ALL : <input type="checkbox" id="checkAll"
				onclick="allcheck(<%=cnt%>);" /></td>

			<td align="right" colspan="2"><a href="#"
				title="Export to Excel"
				onclick="javascript:try{gotoExcel('pay','tableHTML');}catch(e){alert(e);}"><img
					src="images/excel.jpg" width="15px" height="15px"></img></a></td>
		</tr>
	</table>
	<div align="center">
		<form action="" method="post" name="payableReport">
			<%
String exportFileName="payableReport.xls";   // GIVE YOUR REPORT NAME
%>
			<div id='pay' align="center" style="height: 400px; overflow: scroll;">

				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> <input
					type="hidden" id="fileName" name="fileName"
					value="<%= exportFileName%>" />

				<table align="center" border="1" class="sortable"
					style="color: black; border-collapse: collapse;">

					<tr>

						<th>Edit</th>
						<th>Pdf</th>
						<th>Pay OrderNO</th>
						<th>Contractor</br> Id
						</th>
						<th>Contractor Name</th>
						<th>Month</th>
						<th>Year</th>
						<th>Date</th>
						<th>Payable Days</th>
						<th>Basic</th>
						<th>Per.<br>Index %</th>
						<th>Allowance</th>
						<th>Allowance1</th>
						<th>Allowance2</th>
						<th>Allowance3</th>
						<th>Allowance4</th>
						<th>Deduction</th>
						<th>Deduction1</th>
						<th>Deduction2</th>
						<th>Deduction3</th>
						<th>Deduction4</th>
						<th>Previous Pay</th>
						<th>Tds</th>
						<th>Gross Pay</th>
						<th>Net Pay</th>
						<th>Status</th>
					</tr>


					<%   
 String date ="";
 
 qry = "select * from t_payable where Status='Active' and month='"+m1+"' and year='"+year+"'";
 System.out.println(qry);
 rs = st.executeQuery(qry);


 int i=0;
  
  while(rs.next())
  { ++i;
	  int month=rs.getInt("month");
	  String month1="";
	  switch(month)
	  {
	  case 1:month1="Jan";
	          break;
	  case 2:month1="Feb";
      break;
	  case 3:month1="Mar";
      break;
	  case 4:month1="Apr";
      break;
	  case 5:month1="May";
      break;
	  case 6:month1="June";
      break;
	  case 7:month1="July";
      break;
	  case 8:month1="Aug";
      break;
	  case 9:month1="Sep";
      break;
	  case 10:month1="Oct";
      break;
	  case 11:month1="Nov";
      break; 
	  case 12:month1="Dec";
      break;
      
     // default : month1="Invalid month";
       
	    }
	  
	  try
	  {
    date = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("updatedate")));  
	  }
	  
    catch(Exception e) {System.out.println("Date Format Exception"+e);}
    %>
					<tr>
						<td width="1%" align="right"><a
							href="payableEdit.jsp?payno=<%=rs.getString("PayNo")%>"><img
								src="images/edit1.jpeg" width="18px" height="18px"></img></a></td>
						<%--      <td style="width: 1%"><a href="#" style="font-weight: bold; color: black; " onclick="Pdfredirect('pdf_payable.jsp','<%=rs.getString("PayNo") %>');"><img src="images/pdf.jpeg" width="20px" height="18px" style="border-style: none" ></img></a></td> --%>
						<td width="0%"><div align="center">
								<input type="checkbox" id=check <%=i%> />
							</div></td>
						<td width="0%"><div align="right" id=<%=i%>><%=rs.getString("PayNo") %></div></td>
						<td width="0%"><div align="right"><%=rs.getString("EmpId") %></div></td>
						<td width="15%"><div align="left"><%=rs.getString("contractorName") %></div></td>
						<td><div align="left"><%=month1 %></div></td>
						<td><div align="left"><%=rs.getString("year") %></div></td>
						<td><div align="right"><%=date %></div></td>
						<td width="3%"><div align="right"><%=rs.getString("payableDays") %></div></td>
						<td width="3%"><div align="right"><%=rs.getString("basic") %></div></td>
						<td width="3%"><div align="right"><%=rs.getString("perIndex") %></div></td>
						<td><div align="right"><%=rs.getString("allowance") %></div></td>
						<td><div align="right"><%=rs.getString("allowance1") %></div></td>
						<td><div align="right"><%=rs.getString("allowance2") %></div></td>
						<td><div align="right"><%=rs.getString("allowance3") %></div></td>
						<td><div align="right"><%=rs.getString("allowance4") %></div></td>
						<td><div align="right"><%=rs.getString("deduction") %></div></td>
						<td><div align="right"><%=rs.getString("deduction1") %></div></td>
						<td><div align="right"><%=rs.getString("deduction2") %></div></td>
						<td><div align="right"><%=rs.getString("deduction3") %></div></td>
						<td><div align="right"><%=rs.getString("deduction4") %></div></td>
						<td><div align="right"><%=rs.getString("PreviousPay") %></div></td>
						<td><div align="right"><%=rs.getString("tds") %></div></td>
						<td><div align="right"><%=rs.getString("grosspay") %></div></td>
						<td width="5%"><div align="right"><%=rs.getString("Netpay") %></div></td>
						<td width="5%"><div align="left"><%=rs.getString("Status") %></div></td>

					</tr>

					<% }
  
  String sendMsg=request.getParameter("sendMsg");
  %>
					<input type="hidden" name="sendMsg" id="sendMsg"
						value="<%=sendMsg %>"></input>
					<%
  if(!(sendMsg==null))
  {
  	System.out.println("======="+sendMsg+"=======");
  	%>
					<script LANGUAGE="JavaScript" type="text/javascript">
  	
  	//alert("company created");
  	var sendMsg=document.getElementById("sendMsg").value;
  	alert(sendMsg+"\n");
  	</script>
					<%
  }
  
  conn.close(); %>
				</table>
				<br>
					<div align="right">
						<input type="button" name="AllPdfCreate" value="Generate payslip"
							class="button" onclick="Pdfredirect('pdf_payable.jsp','<%=i%>');" />

					</div>
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