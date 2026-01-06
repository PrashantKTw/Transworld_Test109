<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
     
      <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>

<script LANGUAGE="JavaScript" type="text/javascript">
//function getIncidentUpdate(incidentDate, complaintid, location, relatedTo, type, category, description, spEsc, assetId,status)
function getIncidentUpdate(incidentDate, complaintid, location, relatedTo, type, category,description,spEsc, assetId,status)
{
	try
	{
		window.open('incidentUpdateWindow.jsp?incidentDate='+incidentDate+'&complaintid='+complaintid+'&location='+location+'&relatedTo='+relatedTo+'&type='+type+'&category='+category+'&description='+description+'&spEsc='+spEsc+'&assetId='+assetId+'&status='+status,'mywindow','width=500, height=700, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=no');
	}
	catch(e)
	{
		alert(e);
	}
} 
function allSelected(allVal)
{
	if(document.customdetail.extAll.checked) 
	{
		document.getElementById("frmDT").style.display='none';
    	document.getElementById("toDT").style.display='none';
    }
	else 
	{
		document.getElementById("frmDT").style.display="";
    	document.getElementById("toDT").style.display="";
	}
}
</script>
</head>
<body>
		<%
		Statement stmt=null,st1=null;
		String sql=null;
		ResultSet rst=null;
		stmt=conn.createStatement();
		st1=conn.createStatement();
		%>
		
<%
String datenew1="";
String datenew2="";
if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
}
else
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
%>

<% 
		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
//		dataDate1="2011-12-31";
//		dataDate2="2011-12-31";
		%>
<div style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
	<a>Incident Report</a></div>
<form name="customdetail" method="get">
<%System.out.println("\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");%>
		<table align="center">
			<tr>
				<td align="left"><font color="#F75D59" size="2">Pending</font>&nbsp;&nbsp;&nbsp;<font color="#2554C7" size="2">Attended</font>&nbsp;&nbsp;&nbsp;<font color="#4CC417" size="2">Resolved</font></td>
				<td></td><td></td><td></td>
				<td align="left"><b>Incident&nbsp;&nbsp;</b>
				<select name="incidentDrp" id="incidentDrp" 
				style="width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
			 		<option value="Pending">Pending</option>
			 		<option value="Attended">Attended</option>
			 		<option value="Resolved">Resolved</option>
			 		<option value="all">All</option>
			    </select>
				</td>
				<td></td>
				<td>
				All <input type="checkbox" name="extAll" id="extAll" value="yes"  onclick="allSelected(this.value);"></input>
				</td>
				<td></td>
				<td id="frmDT" align="left" style="display:''"><b>From&nbsp;&nbsp;</b>
					<input type="text" id="data" name="data" size="12" value="<%=datenew1%>" 
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly />
					<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script>
				</td>
				
				<td id="toDT" align="left" style="display:''"><b>To&nbsp;&nbsp;</b>
					<input type="text" id="data1" name="data1" size="12" value="<%=datenew2%>" 
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly />
					<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script>&nbsp;&nbsp;&nbsp;
			 	 
				</td>
				<td><input type="submit" name="button" value="Go"></td>
			</tr>
		</table>

</form>
<br></br>
<form name="incidentForm" action="" method="get">
		<% 
		
		try 
		{
			
			%><table width="70%" align="center"><tr><td>&nbsp; </td><td>
			<table bgcolor="white"  align="center" class="sortable">
			<tr>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Sr. No.</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Incident Date</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Complaint ID</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Location</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Related To</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Type</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Category</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Desc.</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Entered By</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Entered On.</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Status</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Attended By</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Comment</b></font></td>
			<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"><b>Solution</b></font></td>
			</tr>
			<%
			//====1st day of month==========================
			Calendar cal = Calendar.getInstance();
			cal.clear(Calendar.HOUR_OF_DAY);
			cal.clear(Calendar.MINUTE);
			cal.clear(Calendar.SECOND);
			cal.clear(Calendar.MILLISECOND);
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			cal.set(Calendar.DAY_OF_MONTH, 1);
			//===============================================
				
			//====current day================================
				java.util.Date dt=new Date();
			//===============================================
			int i=0;
			String sqlData="";
			
			String statVal=request.getParameter("incidentDrp");
			String chbxAll=request.getParameter("extAll");
			System.out.println(statVal+"**************************>>"+chbxAll);
			//========================================================================
		//	if(chbxAll=="yes" || chbxAll.equals("yes"))
			if(chbxAll!=null && chbxAll!="")
			{
			//	sqlData="select * from t_incidentdata order by TheDate,TheTime asc";
				sqlData="select Description,TheDate,TheTime,concat(TheDate,' ',TheTime) as ctm, Type, Category, complaintid, spEscalation, location, relatedTo, assetId, EnteredBy, EnteredDateTime, updateComment, permntSolution, Status, AttendedBy from t_incidentdata order by concat(TheDate,TheTime) asc";
			}
			else if(statVal!=null && statVal!="")
			{
				System.out.println("**************************>>"+statVal);
				if(statVal=="all" || statVal.equals("all"))
				{
					sqlData="select Description,TheDate,TheTime,concat(TheDate,' ',TheTime) as ctm, Type, Category, complaintid, spEscalation, location, relatedTo, assetId, EnteredBy, EnteredDateTime, updateComment, permntSolution, Status, AttendedBy from t_incidentdata where   TheDate>='"+dataDate1+"' and TheDate<='"+dataDate2+"' order by concat(TheDate,TheTime) asc";
				}
				else
				{
					sqlData="select Description,TheDate,TheTime,concat(TheDate,' ',TheTime) as ctm, Type, Category, complaintid, spEscalation, location, relatedTo, assetId, EnteredBy, EnteredDateTime, updateComment, permntSolution, Status, AttendedBy from t_incidentdata  where   TheDate>='"+dataDate1+"' and TheDate<='"+dataDate2+"' and Status='"+statVal+"' order by concat(TheDate,TheTime) asc";	
				}
			}
			else
			{
				sqlData="select Description,TheDate,TheTime,concat(TheDate,' ',TheTime) as ctm, Type, Category, complaintid, spEscalation, location, relatedTo, assetId, EnteredBy, EnteredDateTime, updateComment, permntSolution, Status, AttendedBy from t_incidentdata where   TheDate>='"+df.format(cal.getTime())+"' and TheDate<='"+df.format(dt)+"' order by concat(TheDate,TheTime) asc";
			}
			//========================================================================
			System.out.print("------------"+sqlData+"------------");
			String descr="";
			rst=stmt.executeQuery(sqlData);
			while(rst.next())
			{
				i++;
				if(rst.getString("Status").equals("Resolved"))
				{
						%>
						<tr bgcolor="#AEF8B1"><%					
				}
				else if(rst.getString("Status").equals("Attended"))
				{
					%><tr bgcolor="#82CAFF"><%
				}
				else
				{
					%><tr bgcolor="#F9966B"><%	
				}
				descr=(rst.getString("Description").replace(">"," ")).replace("\""," ");
				descr=(descr.replaceAll("\\s+", " ")).trim();
				System.out.println("\n!!!!!!!!!!!!---->>"+descr);
				%>
				<td align="center"><div align="right"><font size="2" color="black"><%= i%></font></div></td>
				<td align="left" sorttable_customkey="20080211131900"><div align="left"><font size="2" color="black"><%=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss")
									.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
										.parse(rst.getString("ctm")))%></font></div></td>
				<td align="center"><div align="right"><font size="2" color="black"><%= rst.getString("complaintid")%></font></div></td>
				<td align="center"><div align="left"><font size="2" color="black"><%= rst.getString("location")%></font></div></td>
				<td align="center"><div align="left"><font size="2" color="black"><%= rst.getString("relatedTo")%></font></div></td>
				<td align="center"><div align="left"><font size="2" color="black"><%= rst.getString("Type")%></font></div></td>
				<td align="center"><div align="left"><font size="2" color="black"><%= rst.getString("Category")%></font></div></td>
				<td align="center"><div align="left"><font size="2" color="black"><%=descr %></font></div></td>
				<td align="center"><div align="left"><font size="2" color="black"><%= rst.getString("EnteredBy")%></font></div></td>
				<td align="center" sorttable_customkey="20080211131900"><div align="left"><font size="2" color="black"><%= new SimpleDateFormat("dd-MM-yyyy HH:mm:ss")
				.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.parse(rst.getString("EnteredDateTime")))%></font></div></td>
				
				<%
				if((rst.getString("Status")).equals("Resolved"))
				{
					%>
					<td align="center"><div align="left"><font size="2" color="black"><%=rst.getString("Status")%></font></div></td>
					<%	
				}
				else
				{
					boolean flgAdmin=false;
					//===chk for syst admin======================================
						String sql123="select EscSysAdmin from t_incidentescalation where EscSysAdmin like '"+session.getAttribute("empID").toString()+"'";
						ResultSet rs123=st1.executeQuery(sql123);
						if(rs123.next())
						{
							flgAdmin=true;
						}
					//===========================================================
						
					String desgStat=session.getAttribute("emprole").toString();
					System.out.println("###########################>>>>>"+desgStat);
						System.out.println("###########################>>>>>IF");
						flgAdmin=false;
					%>
					<td align="center"><div align="center" style="color: blue;"><font size="2" color="black"><a href="" style="color: blue;"
					onclick="getIncidentUpdate('<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
					.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.parse( rst.getString("TheDate")+" "+rst.getString("TheTime")))%>',
						'<%= rst.getString("complaintid").trim()%>',
						'<%=rst.getString("location").trim() %>',
						'<%=rst.getString("relatedTo").trim()%>',
						'<%= rst.getString("Type").trim()%>',
						'<%= rst.getString("Category").trim()%>',
						'<%= (descr.replaceAll("\\n","")).trim()%>',
						'<%= rst.getString("spEscalation").trim()%>',
					'<%= rst.getString("assetId").trim()%>',
					'<%= rst.getString("Status").trim()%>',
						);">
					<%= rst.getString("Status")%></a></font></div></td>
					<%
										
						System.out.println("###########################>>>>>else"+rst.getString("Status"));
						%>
						<td align="center"><div align="left"><font size="2" color="black"><%=rst.getString("Status")%></font></div></td>
						<%
					
				}
				String attndby="",updtcmnt="",pmntsol="";
				if(rst.getString("AttendedBy")==null || rst.getString("AttendedBy")=="")
				{
					attndby="-";
				}
				else
				{
					attndby=rst.getString("AttendedBy");
				}
				if(rst.getString("updateComment")==null || rst.getString("updateComment")=="")
				{
					updtcmnt="-";
				}
				else
				{
					updtcmnt=rst.getString("updateComment");
				}
				if(rst.getString("permntSolution")==null || rst.getString("permntSolution")=="")
				{
					pmntsol="-";
				}
				else
				{
					pmntsol=rst.getString("permntSolution");
				}
				%>
				<td align="center"><div align="left"><font size="2" color="black"><%= attndby%></font></div></td>
				<td align="center">
				<div align="left" style="overflow: auto; width: 180px;">
				<font size="2" color="black"><%=updtcmnt %></font>
				</div>
				</td>
				<%
				if(rst.getString("Status").equals("Resolved"))
				{
						%>
						<td align="center"><div align="left" style="overflow: auto; width: 180px;"><font size="2" color="black"><%= pmntsol%></font></div></td>
											
				<%} %>
			
<%-- 				<td align="center"><div align="left" style="overflow: auto; width: 180px;"><font size="2" color="black"><%= pmntsol%></font></div></td>
 --%>				
 </tr>
				<%  
			}
			%>
			</table></td><td>&nbsp;
			  </td></tr></table>
			<%
			
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			System.out.println(e);
			e.printStackTrace();
		} 
		finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	 
%></form>
  </body>
  </html>