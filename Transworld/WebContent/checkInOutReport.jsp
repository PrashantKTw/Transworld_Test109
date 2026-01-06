<%@ page language="java"%>

<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Transworld In-Out Report</title>
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
var thumbnail=new Array();
function addComment(inTime, outTime) 
{
	window.open('checkInOutWindow.jsp?inTime='+inTime+'&outTime='+outTime,'mywindow','width=400, height=300, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=no');
}
function getChkBoxValue(chkBox,i)
{
	var thumbnailn=new Array();
	try
	{
		if((document.getElementById("cb"+i).checked)==true)
		{
			thumbnail.push(chkBox);
		}
		if((document.getElementById("cb"+i).checked)==false)
		{
			thumbnailn.push(chkBox);
			var lookup = {};
			
			for (var j in thumbnailn) 
			{
			   lookup[thumbnailn[j]] = thumbnailn[j];
			}
			
			 for (var i in thumbnail) 
			  {
			      if (typeof lookup[thumbnail[i]] != 'undefined') 
				  {
			          delete thumbnail[i];
				  } 
			  }
		}
	}
	catch(e)
	{
		alert(e);
	}
	document.getElementById("chkBoxSelected").value=thumbnail;
	//alert(thumbnail);
}
function getVal()
{
	document.getElementById("dpt1").style.display="";
	document.getElementById("dpt2").style.display="";
	document.getElementById("dpt3").style.display="";
	document.getElementById("dpt4").style.display="";
	document.getElementById("dpt5").style.display="";
	document.getElementById("dpt6").style.display="";
	document.getElementById("dpt7").style.display="";
	document.getElementById("dpt8").style.display="";
	document.getElementById("dpt9").style.display="";
	document.getElementById("dpt10").style.display="";
	document.getElementById("dpt11").style.display="";
	document.getElementById("dpt12").style.display="";
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
		  //	alert(xmlhttp.responseText);
			l1=xmlhttp.responseText;
			var mySplitResult = l1.split("#");
			document.getElementById("dpt1").innerHTML=mySplitResult[1];
			document.getElementById("dpt2").innerHTML=mySplitResult[2];
			document.getElementById("dpt3").innerHTML=mySplitResult[3];
			document.getElementById("dpt4").innerHTML=mySplitResult[4];
			document.getElementById("dpt5").innerHTML=mySplitResult[5];
			document.getElementById("dpt6").innerHTML=mySplitResult[6];
			document.getElementById("dpt7").innerHTML=mySplitResult[7];
			document.getElementById("dpt8").innerHTML=mySplitResult[8];
			document.getElementById("dpt9").innerHTML=mySplitResult[9];
			document.getElementById("dpt10").innerHTML=mySplitResult[10];
			document.getElementById("dpt11").innerHTML=mySplitResult[11];
			document.getElementById("dpt12").innerHTML=mySplitResult[12];
		  
		  }
		}
		xmlhttp.open("GET","AjxChkInOutDept.jsp",true);
		xmlhttp.send(null);
}
function gotoExcel(elemId, frmFldId)
{  
       // alert(elemId+"========"+frmFldId);
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId);  
          oFld.value = obj.innerHTML;
        
         

          try{
             // document.leave.action ="excel.jsp";
  			document.checkoutHOD.action ="excel.jsp";
  			 document.forms["checkoutHOD"].submit();
            //alert("222222");
           //document.forms["leave"].submit();
          // alert("33333");


            }catch(e){alert("exception>>>"+e);}
 }  
function getValHOD()
{
	document.getElementById("dpt1").style.display='none';
	document.getElementById("dpt2").style.display='none';
	document.getElementById("dpt3").style.display='none';
	document.getElementById("dpt4").style.display='none';
	document.getElementById("dpt5").style.display='none';
	document.getElementById("dpt6").style.display='none';
	document.getElementById("dpt7").style.display='none';
	document.getElementById("dpt8").style.display='none';
	document.getElementById("dpt9").style.display='none';
	document.getElementById("dpt10").style.display='none';
	document.getElementById("dpt11").style.display='none';
	document.getElementById("dpt12").style.display='none';
}
function validate()
{
	var total=0;
	  var cnt=document.getElementById("chbxCnt").value;
	  //alert(cnt);
	  for(var i=0; i <= cnt; i++)
	  {
		 try
		 {
		    if((document.getElementById("cb"+i).checked)==true) 
			{
		      total++;
		    }
		 }
		 catch(e)
		 {
		 }
	  }
	  if( total == 0 ) 
	  {
		alert("Please Select Record For Update");
	    return false;
	  } 
	  return true;
}
</script>
</head>
<body>
	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st10=conn.createStatement();

String token_int[]=null,token_int1[]=null,token_int2[]=null,token_int3[]=null;
double hrs_cal=0.0,min_cal=0.0,tot_sec=0.0,hrs_cal1=0.0,min_cal1=0.0,tot_sec1=0.0,hrs_cal2=0.0,min_cal2=0.0,tot_sec2=0.0;

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
%>
	<div
		style="text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
		<!-- 	<a><font  size="3"> Attendance Report </font> </a></div><br> -->

		<form name="customdetail" method="get" action="">

			<table align="center">
				<tr>
					<td>
						<div align="center">
							<font size="3">Attendance Report from <%=datenew1 %> to <%= datenew2%></font>
						</div>

					</td>

				</tr>


			</table>

			<br></br>


			<table align="center">

				<tr>
					<td align="left"><b>From&nbsp;&nbsp;</b> <input type="text"
						id="data" name="data" size="12" value="<%=datenew1%>"
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
						readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script></td>

					<td align="left"><b>To&nbsp;&nbsp;</b> <input type="text"
						id="data1" name="data1" size="12" value="<%=datenew2%>"
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
						readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script></td>
					<td bgcolor="#C6DEFF;">
						<%//******************************************************************** %>
						<%if( (session.getAttribute("empdept").toString()).equals("All") ) {%>
						<select name="type"
						style="width: 87px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="hod" onclick="getValHOD();">HOD</option>
							<option value="dept" onclick="getVal();">Dept</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp; <%}//******************************************************************** %>
						<input type="submit" name="submit" id="search-submit" value="Go">
					</td>
				</tr>
			</table>


			<table align="center">
				<tr>
					<td><div id="dpt1"></div></td>
					<td><div id="dpt2"></div></td>
					<td><div id="dpt3"></div></td>
					<td><div id="dpt4"></div></td>
					<td><div id="dpt5"></div></td>
					<td><div id="dpt6"></div></td>
					<td><div id="dpt7"></div></td>
					<td><div id="dpt8"></div></td>
					<td><div id="dpt9"></div></td>
					<td><div id="dpt10"></div></td>
					<td><div id="dpt11"></div></td>
					<td><div id="dpt12"></div></td>
				</tr>

			</table>

		</form>

		<%String exportFileName="Attendance_Report.xls"; %>


		<%
		
		String currentdate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		
		System.out.println("====currentdate==============>>"+currentdate);
		try 
		{
			
			String type=request.getParameter("type");
			String rd=request.getParameter("rd");
			if(type=="" || type==null || type.equals("dept"))
			{
				type=rd;
			}
			
			System.out.println("==================>>"+type);
			
			
			int i=0;
			
			String empid=session.getAttribute("empID").toString();
			String emp="",status="", cmpDate="",empName="",reason="";
			String sqlData="";
			if((session.getAttribute("emprole").toString()).equals("hod") &&  (!( (session.getAttribute("empdept").toString()).equals("All")) ))
			{
				System.out.println("IF LOOP==@@@@1111 >");
				
				%><form name="checkoutHOD" id="checkoutHOD" method="post"
			action="checkInOutSubmit.jsp">
			<table width=80%>
				<tr>
					<td align="right"><input type="hidden" id="tableHTML"
						name="tableHTML" value="" /> <input type="hidden" id="fileName"
						name="fileName" value="<%= exportFileName%>" /> <a href="#"
						style="font-weight: bold; color: black;"
						onclick="gotoExcel('mytable', 'tableHTML');"> <img
							src="images/excel.jpg" width="15px" height="15px"
							style="border-style: none"></img>
					</a><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
					</td>
				</tr>
			</table>
			<% 
				
				%>
			<div id="mytable">
				<table width="70%" bgcolor="white" align="center" class="sortable"
					style="width: 800px;">
					<tr>
						<!-- 				<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"></font></td> -->
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Sr.</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>EmpID</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Emp.Name</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Date</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Check In</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Check Out</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Reason</b></font></td>

						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Hours Worked</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Status</b></font></td>




					</tr>
					<%	
					sqlData="select a.Srno,a.EmpID,a.EmpName,a.CheckinDateTime,a.checkDate,a.checkTime,a.CheckinType,a.Office,a.Status,a.EntryComments,b.TypeValue,b.Name "+
					"from t_checkinout a "+
					"inner join( "+
					"select * from "+ 
					"t_leaveadmin where "+ 
					"TypeValue='"+session.getAttribute("empdept").toString()+"') b "+
					"on(b.EmpID = a.EmpID) "+
					"where checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' "+
					"group by checkDate, EmpID";
					System.out.println("**************"+sqlData);
					//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					ResultSet rs1=st1.executeQuery(sqlData);
					System.out.println("====sqlData=="+sqlData);
					while(rs1.next())
					{
							String inTime="-", outTime="-";
							i++;
							System.out.println("======="+i+"========");
							emp=rs1.getString("EmpID");
							empName=rs1.getString("Name");
							status=rs1.getString("Status");
							cmpDate=rs1.getString("checkDate");
							reason=rs1.getString("EntryComments");
							try
							{
								//if((reason==null) || (reason=="") || reason.equals("") || reason.equals(null))
								if(reason=="" || reason==null)
								{
									reason="-";
								}
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							String t="",chkin="-",chkout="-",chkin1="-",chkout1="-";
							String sql1="SELECT min(CheckinDateTime) as chkInDateTime FROM t_checkinout WHERE  checkDate='"+cmpDate+"' and EmpId='"+emp+"' group by checkDate";
						//	System.out.println(sql1);
							ResultSet rs2=st2.executeQuery(sql1);
							System.out.println("====sql1==>"+sql1);
							if(rs2.next())
							{
								inTime=rs2.getString("chkInDateTime");
								chkin=inTime.substring(11,inTime.length()-2);
								t=inTime.substring(0,10);
								t=df123.format(df1234.parse(t));
							}
							
							String sql2="SELECT max(CheckinDateTime) as chkOutDateTime FROM t_checkinout WHERE  checkDate='"+cmpDate+"' and EmpId='"+emp+"' group by checkDate";
							
							ResultSet rs3=st2.executeQuery(sql2);
							System.out.println("sql2==>"+sql2);
							if(rs3.next())
							{
								outTime=rs3.getString("chkOutDateTime");
								chkout=outTime.substring(11,outTime.length()-2);	
								
								t=outTime.substring(0,10);
								t=df123.format(df1234.parse(t));
							}
							
							
							try
							{
								chkin1=chkin.substring(0,5);
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							try
							{
								chkout1=chkout.substring(0,5);
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							
							
							 token_int1=chkin.split(":");
								
								
								System.out.println(">>>>token_int=11111=>"+token_int1[0]);
								System.out.println(">>>>token=>"+token_int1[1]);
								
								
								
								hrs_cal1=Double.parseDouble(token_int1[0]);
								min_cal1=Double.parseDouble(token_int1[1]);
								
								hrs_cal1=hrs_cal1 * 60 *60;
								min_cal1=min_cal1 * 60;
								
								System.out.println(">>>>hrs_cal1=  afetr conversion >"+hrs_cal1);
								System.out.println(">>>>min_cal1= afetr conversion >"+min_cal1);
								
								
								
								tot_sec1=hrs_cal1+min_cal1;
								System.out.println(">>>>Toatal sec1  >"+tot_sec1);
								
								if(tot_sec1<32400)
								{
									
									chkin1="09:00";
									chkin="09:00";
									
								}
								
								
								
								
	                            token_int2=chkout.split(":");
								
								
								System.out.println(">>>>token_int222=11111=>"+token_int2[0]);
								System.out.println(">>>>token222=>"+token_int2[1]);
								
								
								
								hrs_cal2=Double.parseDouble(token_int2[0]);
								min_cal2=Double.parseDouble(token_int2[1]);
								
								hrs_cal2=hrs_cal2 * 60 *60;
								min_cal2=min_cal2  * 60;
								
								System.out.println(">>>>hrs_cal2=  afetr conversion >"+hrs_cal2);
								System.out.println(">>>>min_cal2= afetr conversion >"+min_cal2);
								
								tot_sec2=hrs_cal2+min_cal2;
								System.out.println(">>>>Toatal sec2  >"+tot_sec2);
								
								if(tot_sec2 >68400)
								{
									
									chkout1="19:00";
									chkout="19:00:00";
									
								}
								String diff="",diff1="";
								
								
								
								if(tot_sec1<32400 && tot_sec2<32400)
								{
									
									chkin1="09:00";
									chkin="09:00";
									chkout="09:00";
									//chkin1=chkout1;
									chkout1="09:00";
								}
								
								
								System.out.println(">>>>chkout=  >"+chkout);
								System.out.println(">>>>chkin=   >"+chkin);
								
								try{
								String sql="select timeDiff('"+chkout+"','"+chkin+"')";
								ResultSet rs=st2.executeQuery(sql);
								System.out.println("======>"+sql);
								rs.next();
								
								 diff=rs.getString(1);
								
								}catch(Exception e33)
								{
									System.out.println("===e33=====>>>"+e33);
									
									diff="00:00";
									
								}
							
								System.out.println("======timediff==>>>"+diff);
								String algn="right";
								
								if(diff!=null)
								{
								//diff=diff.substring(0, 5);
								
								}
								if(diff==null || diff.equals("null"))
									diff="NA";
								if(diff.equalsIgnoreCase("NA"))
								{
									
									algn="left";
									
								}else{
									
									algn="right";
									
								}
								
	                           token_int=diff.split(":");
								
								
								System.out.println(">>>>token_int=11111=>"+token_int[0]);
								System.out.println(">>>>token=>"+token_int[1]);
								
								
								
								hrs_cal=Double.parseDouble(token_int[0]);
								min_cal=Double.parseDouble(token_int[1]);
								
								hrs_cal=hrs_cal * 60 *60;
								min_cal=min_cal * 60;
								
								System.out.println(">>>>hrs_cal=  afetr conversion >"+hrs_cal);
								System.out.println(">>>>min_cal= afetr conversion >"+min_cal);
								
								
								try{
								tot_sec=hrs_cal+min_cal+Double.parseDouble(token_int[2]);
								System.out.println(">>>>Toatal sec**********  >"+tot_sec);
								if(tot_sec>=30570)
								{
									status="Present";
									
								}else if(tot_sec>=29700 && tot_sec<30570)
								{
									status="Late";
									
								}else if(tot_sec>=28800 && tot_sec<29700)
								{
									status="Half Day";
									
								}else if(tot_sec< 28800)
								{
									status="Absent";
									
								}else{
									
									
								}
							
								
								if(tot_sec>=30570 && tot_sec<=30600)
								{
									diff="08:30";
									
								}
								
								
								}catch(Exception e33)
								{
									
									System.out.println(">>>>exception n timt  11111>"+e33);	
									
								}
								
								System.out.println(">>>>inTime!!!!!!!!!!  11111>"+inTime);
								System.out.println(">>>outTime!!  11111>"+outTime);
								
								
								System.out.println(">>>>diff!!!!!!!!!!  11111>"+diff);
								
								
								if(inTime.equalsIgnoreCase(outTime))
								{
									
									
									System.out.println(">Inside if LOLOPOP>");
									chkin1=chkout1;
									status="Absent";
									
									
								}
								
								
								if(diff.equalsIgnoreCase("00:00:00"))
								{
									
									
									if(cmpDate.equalsIgnoreCase(currentdate))
									{
									status="-";
									}
									
									
								}
							%>
					<tr>
						<%-- 							<td  align="" ><input type="checkbox" name="cb<%=i%>" id="cb<%=i%>" value="<%=rs1.getInt("Srno")%>" onclick="getChkBoxValue('<%=rs1.getInt("Srno")%>','<%=i%>');"></input></td> --%>
						<td align="right"><div align="right">
								<font size="2" color="black"><%= i%></font>
							</div></td>
						<td align="right" width="5"><div align="right">
								<font size="2" color="black"><%=emp%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=empName%></font>
							</div></td>
						<td align="right" width="10" sorttable_customkey="20080211131900"><div
								align="right">
								<font size="2" color="black"><%=t%></font>
							</div></td>
						<td align="right" width="10"><div align="right">
								<font size="2" color="black"><%=chkin1%></font>
							</div></td>
						<td align="right" width="10"><div align="right">
								<font size="2" color="black"><%=chkout1%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=reason%></font>
							</div></td>


						<%
						if(diff.equalsIgnoreCase("00:00"))
						{%>

						<td align="<%=algn %>"><div align="<%=algn %>">
								<font size="2" color="black"><%= diff%> </font>
							</div></td>

						<%}else{
							%>
						<td align="<%=algn %>"><div align="<%=algn %>">
								<font size="2" color="black"><%=diff.substring(0, 5)%></font>
							</div></td>

						<%}
						%>



						<%//##############################################################################################%>
						<%
							if( (session.getAttribute("emprole").toString()).equals("hod") && (!(session.getAttribute("empID").toString()).equals(emp))  && (status.equals("NotApproved")))
							{
							%>
						<td align="left"><div align="left">
								<a href="" onclick="addComment('<%=inTime%>','<%=outTime%>');"><font
									size="2">Approve/Reject</font></a>
							</div></td>
						<%	
							} 
							else
							{
							%>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=status%></font>
							</div></td>
						<%}//############################################################################################## %>


					</tr>
					<%
						}
					%>
					<input type="hidden" name="chbxCnt" id="chbxCnt" value="<%=i%>"></input>
					<input type="hidden" name="chkBoxSelected" id="chkBoxSelected"
						value=""></input>

				</table>
				<%
					//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					%>
				<table align="center">
					<tr>
						<!-- 					<td><input type="submit" value="Approve" id="blkApprv" name="blkApprv" onclick="return validate();"></td> -->
						<!-- 					<td><input type="submit" value="Reject"  id="blkApprv" name="blkApprv" onclick="return validate();"></td> -->
					</tr>
				</table>
			</div>
		</form>
		<%
			}
			else if((session.getAttribute("emprole").toString()).equals("hod") &&  (( (session.getAttribute("empdept").toString()).equals("All")) ))
			{
				System.out.println("ELSE IF  LOOP=HOD= @@@@>");
				%>
		<form name="checkoutHOD" id="checkoutHOD" method="post"
			action="checkInOutSubmit.jsp">
			<table width=80%>
				<tr>
					<td align="right"><input type="hidden" id="tableHTML"
						name="tableHTML" value="" /> <input type="hidden" id="fileName"
						name="fileName" value="<%= exportFileName%>" /> <a href="#"
						style="font-weight: bold; color: black;"
						onclick="gotoExcel('mytable', 'tableHTML');"> <img
							src="images/excel.jpg" width="15px" height="15px"
							style="border-style: none"></img>
					</a><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
					</td>
				</tr>
			</table>
			<div id="mytable">
				<table width="70%" bgcolor="white" align="center" class="sortable"
					style="width: 800px;">
					<tr>
						<!-- 				<td style="background-color: #C6DEFF;" align="center"><font size="2" color="black"></font></td> -->
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Sr</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>EmpID</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>EmpName</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Date</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Check In</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Check Out</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Reason</b></font></td>

						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Hours Worked</b></font></td>

						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Status</b></font></td>



					</tr>
					<%
				//sqlData="select * from t_checkinout where checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' and Status='NotApproved' group by checkDate";
				if(type.equalsIgnoreCase("HOD"))//type.equals("HOD")
				{
					sqlData="select a.Srno,a.EmpID,a.EmpName,a.CheckinDateTime,a.checkDate,a.checkTime,a.CheckinType,a.EntryComments,a.Office,a.Status,b.TypeValue,b.Name "+
					"from t_checkinout a "+
					"inner join( "+
					"select * from "+ 
					"t_leaveadmin "+ 
					"where URole='"+type+"') b "+
					"on(b.EmpID = a.EmpID) "+
					"where checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' "+
					"group by checkDate, EmpID";
					System.out.println("sqlData else loop=-1111=>"+ sqlData);
				}
				else if(( (!(type.equals(""))) || (!(type.equals(null))) ))
				{
					sqlData="select a.Srno,a.EmpID,a.EmpName,a.CheckinDateTime,a.checkDate,a.checkTime,a.CheckinType,a.Office,a.Status,a.EntryComments,b.TypeValue,b.Name "+
					"from t_checkinout a "+
					"inner join( "+
					"select * from "+ 
					"t_leaveadmin "+ 
					"where TypeValue='"+type+"') b "+
					"on(b.EmpID = a.EmpID) "+
					"where checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' "+
					"group by checkDate, EmpID";
					System.out.println("sqlData else loop==>"+sqlData);
				}
				else
				{
					sqlData="select a.Srno,a.EmpID,a.EmpName,a.CheckinDateTime,a.checkDate,a.checkTime,a.CheckinType,a.Office,a.Status,a.EntryComments,b.TypeValue,b.Name "+
					"from t_checkinout a "+
					"inner join( "+
					"select * from "+ 
					"t_leaveadmin "+ 
					") b "+
					"on(b.EmpID = a.EmpID) "+
					"where checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' "+
					"group by checkDate, EmpID";
					System.out.println("sqlData else loop=11111=>"+sqlData);	
				}
				
					//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					ResultSet rs1=st1.executeQuery(sqlData);
					while(rs1.next())
					{
						String inTime="-", outTime="-";
							i++;
							System.out.println("======="+i+"========");
							emp=rs1.getString("EmpID");
							empName=rs1.getString("Name");
							status=rs1.getString("Status");
							cmpDate=rs1.getString("checkDate");
							reason=rs1.getString("EntryComments");
							try
							{
								//if((reason==null) || (reason=="") || reason.equals("") || reason.equals(null))
								if(reason=="" || reason==null)
								{
									reason="-";
								}
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
						
							
							String t="",chkin="-",chkout="-",t1="",chkin1="-",chkout1="-";
							String sql1="SELECT min(CheckinDateTime) as chkInDateTime FROM t_checkinout WHERE  checkDate='"+cmpDate+"' and EmpId='"+emp+"' group by checkDate ";
							System.out.println("else loop sql1==>"+sql1);
							ResultSet rs2=st2.executeQuery(sql1);
							if(rs2.next())
							{
								inTime=rs2.getString("chkInDateTime");
								chkin=inTime.substring(11,inTime.length()-2);
								t=inTime.substring(0,10);
								t=df123.format(df1234.parse(t));
							}
							
							String sql2="SELECT max(CheckinDateTime) as chkOutDateTime FROM t_checkinout WHERE  checkDate='"+cmpDate+"' and EmpId='"+emp+"' group by checkDate";
							System.out.println("else loop sql2==>"+sql2);
							ResultSet rs3=st2.executeQuery(sql2);
							if(rs3.next())
							{
								outTime=rs3.getString("chkOutDateTime");
								t1=outTime.substring(0,10);
								t1=df123.format(df1234.parse(t1));
								chkout=outTime.substring(11,outTime.length()-2);						
							}
							if((t=="") || (t==null))
							{
								t=t1;
							}
							
							try
							{
								chkin1=chkin.substring(0,5);
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							try
							{
								chkout1=chkout.substring(0,5);
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							
							
							
                             token_int1=chkin.split(":");
							
							
							System.out.println(">>>>token_int=11111=>"+token_int1[0]);
							System.out.println(">>>>token=>"+token_int1[1]);
							
							
							
							hrs_cal1=Double.parseDouble(token_int1[0]);
							min_cal1=Double.parseDouble(token_int1[1]);
							
							hrs_cal1=hrs_cal1 * 60 *60;
							min_cal1=min_cal1 * 60;
							
							System.out.println(">>>>hrs_cal1=  afetr conversion >"+hrs_cal1);
							System.out.println(">>>>min_cal1= afetr conversion >"+min_cal1);
							
							tot_sec1=hrs_cal1+min_cal1;
							System.out.println(">>>>Toatal sec1  >"+tot_sec1);
							
							if(tot_sec1<32400)
							{
								
								chkin1="09:00";
								chkin="09:00";
								
								
							}
							
							
							
							
                            token_int2=chkout.split(":");
							
							
							System.out.println(">>>>token_int222=11111=>"+token_int2[0]);
							System.out.println(">>>>token222=>"+token_int2[1]);
							
							
							
							hrs_cal2=Double.parseDouble(token_int2[0]);
							min_cal2=Double.parseDouble(token_int2[1]);
							
							hrs_cal2=hrs_cal2 * 60 *60;
							min_cal2=min_cal2  * 60;
							
							System.out.println(">>>>hrs_cal2=  afetr conversion >"+hrs_cal2);
							System.out.println(">>>>min_cal2= afetr conversion >"+min_cal2);
							
							tot_sec2=hrs_cal2+min_cal2;
							System.out.println(">>>>Toatal sec2  >"+tot_sec2);
							
							if(tot_sec2 >68400)
							{
								
								chkout1="19:00";
								chkout="19:00:00";
								
							}
							
							
							if(tot_sec1<32400 && tot_sec2<32400)
							{
								
								chkin1="09:00";
								chkin="09:00";
								chkout="09:00";
								//chkin1=chkout1;
								chkout1="09:00";
							}
							
							
							
							
							
							
String diff="";
							
							try{
							String sql="select timeDiff('"+chkout+"','"+chkin+"')";
							ResultSet rs=st2.executeQuery(sql);
							System.out.println(sql);
							rs.next();
							
							 diff=rs.getString(1);
							
							}catch(Exception e33)
							{
								System.out.println("===e33=====>>>"+e33);
								
								diff="00:00";
								
							}
						
							System.out.println("======timediff==>>>"+diff);
							
							
							
							
							String algn="right";
							
							if(diff!=null)
							{
							//diff=diff.substring(0, 5);
							
							}
							if(diff==null || diff.equals("null"))
								diff="NA";
							if(diff.equalsIgnoreCase("NA"))
							{
								
								algn="left";
								
							}else{
								
								algn="right";
								
							}
							
token_int=diff.split(":");
							
							
							System.out.println(">>>>token_int=11111=>"+token_int[0]);
							System.out.println(">>>>token=>"+token_int[1]);
							
							
							
							hrs_cal=Double.parseDouble(token_int[0]);
							min_cal=Double.parseDouble(token_int[1]);
							
							hrs_cal=hrs_cal * 60 *60;
							min_cal=min_cal * 60;
							
							System.out.println(">>>>hrs_cal=  afetr conversion >"+hrs_cal);
							System.out.println(">>>>min_cal= afetr conversion >"+min_cal);
							
							tot_sec=hrs_cal+min_cal+Double.parseDouble(token_int[2]);
							System.out.println(">>>>Toatal sec  >"+tot_sec);
							if(tot_sec>=30570)
							{
								status="Present";
								
							}else if(tot_sec>=29700 && tot_sec<30570)
							{
								status="Late";
								
							}else if(tot_sec>=28800 && tot_sec<29700)
							{
								status="Half Day";
								
							}else if(tot_sec< 28800)
							{
								status="Absent";
								
							}else{
								
								
							}
							
							if(tot_sec>=30570 && tot_sec<=30600 )
							{
								diff="08:30";
								
							}
							
							
							
							if(diff.equalsIgnoreCase("00:00:00"))
							{
								
								
								if(cmpDate.equalsIgnoreCase(currentdate))
								{
								status="-";
								}
								
								
							}
							
							
							%>
					<tr>
						<%-- 							<td><input type="checkbox" name="cb<%=i%>" id="cb<%=i%>" value="<%=rs1.getInt("Srno")%>" onclick="getChkBoxValue('<%=rs1.getInt("Srno")%>','<%=i%>');"></input></td> --%>
						<td align="right"><div align="right">
								<font size="2" color="black"><%= i%></font>
							</div></td>
						<td align="right" width="5"><div align="right">
								<font size="2" color="black"><%=emp%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=empName%></font>
							</div></td>
						<td align="right" width="10" sorttable_customkey="20080211131900"><div
								align="right">
								<font size="2" color="black"><%=t%></font>
							</div></td>
						<td align="right" width="10"><div align="right">
								<font size="2" color="black"><%=chkin1%></font>
							</div></td>
						<td align="right" width="10"><div align="right">
								<font size="2" color="black"><%=chkout1%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=reason%></font>
							</div></td>
						<td align="<%=algn %>"><div align="<%=algn %>">
								<font size="2" color="black"><%=diff.substring(0, 5)%></font>
							</div></td>


						<%//##############################################################################################%>
						<%
							if( status.equals("NotApproved"))
							{
							%>
						<td align="left"><div align="left">
								<a href="" onclick="addComment('<%=inTime%>','<%=outTime%>');"><font
									size="2">Approve/Reject</font></a>
							</div></td>
						<%	
							} 
							else
							{
							%>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=status%></font>
							</div></td>
						<%}//############################################################################################## %>

					</tr>
					<%
						}
					
					%>
					<input type="hidden" name="chbxCnt" id="chbxCnt" value="<%=i%>"></input>
					<input type="hidden" name="chkBoxSelected" id="chkBoxSelected"
						value=""></input>
				</table>
				<table align="center">
					<tr>
						<!-- 					<td><input type="submit" value="Approve" id="blkApprv" name="blkApprv" onclick="return validate();"></td> -->
						<!-- 					<td><input type="submit" value="Reject"  id="blkApprv" name="blkApprv" onclick="return validate();"></td> -->
					</tr>
				</table>
			</div>
		</form>
		<%
				//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
					
			
			}
			else if((session.getAttribute("emprole").toString()).equals("HR"))
			{
				System.out.println("^^^^^^^^^^^HR LOOP^^^$$$$$$$^^^^^^^^^^");
				%>
		<form name="checkoutHOD" id="checkoutHOD" method="post" action="">
			<table width=80%>
				<tr>
					<td align="right"><input type="hidden" id="tableHTML"
						name="tableHTML" value="" /> <input type="hidden" id="fileName"
						name="fileName" value="<%= exportFileName%>" /> <a href="#"
						style="font-weight: bold; color: black;"
						onclick="gotoExcel('mytable', 'tableHTML');"> <img
							src="images/excel.jpg" width="15px" height="15px"
							style="border-style: none"></img>
					</a><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
					</td>
				</tr>
			</table>
			<div id="mytable">
				<table width="70%" bgcolor="white" align="center" class="sortable"
					style="width: 800px;">
					<tr>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Sr</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>EmpID</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Emp.Name</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Date</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Check In</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Check Out</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Reason</b></font></td>

						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Hours Worked</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Status</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Actual Check In</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Actual Check Out</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Actual Hours Worked</b></font></td>

					</tr>
					<%
				System.out.println("department------------------For User------------------------------------------------>"+rd);
					//sqlData="select * from t_checkinout  where  checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' group by checkDate, EmpID";
					if(rd==null)
					{
					sqlData="select a.EmpID,a.EmpName,a.CheckinDateTime,a.checkDate,a.checkTime,a.CheckinType,a.Office,a.Status,a.EntryComments,b.TypeValue,b.Name "+
					"from t_checkinout a "+
					"inner join( "+
					"select * from "+ 
					"t_leaveadmin "+ 
					") b "+
					"on(b.EmpID = a.EmpID) "+
					"where checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' "+
					"group by checkDate, EmpID";
					System.out.println(" HR loop if sqldata==>"+sqlData);
					}
					else
					{
					
					
					sqlData="	select a.EmpID,a.EmpName,a.CheckinDateTime,a.checkDate,a.checkTime,a.CheckinType,a.Office,a.Status,a.EntryComments,b.TypeValue,b.Name from t_checkinout a inner join( select * from t_leaveadmin ) b on(b.EmpID = a.EmpID) where checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' and TypeValue='"+rd+"' group by checkDate, EmpID";
					System.out.println(" HR loop else query sqldata==>"+sqlData);
					}
				
				
				
				//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				ResultSet rs1=st1.executeQuery(sqlData);
				while(rs1.next())
				{
						String inTime="-", outTime="-";
						i++;
						System.out.println("======="+i+"========");
						emp=rs1.getString("EmpID");
						empName=rs1.getString("Name");
						status=rs1.getString("Status");
						cmpDate=rs1.getString("checkDate");
						reason=rs1.getString("EntryComments");
						try
						{
							//if((reason==null) || (reason=="") || reason.equals("") || reason.equals(null))
							if(reason=="" || reason==null)
							{
								reason="-";
							}
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
						
						String t="",chkin="-",chkout="-",chkin1="-",chkout1="-";
						String sql1="SELECT min(CheckinDateTime) as chkInDateTime FROM t_checkinout WHERE  checkDate='"+cmpDate+"' and EmpId='"+emp+"' group by checkDate";
						System.out.println("hr loop==sql1 >"+sql1);
						ResultSet rs2=st2.executeQuery(sql1);
						if(rs2.next())
						{
							inTime=rs2.getString("chkInDateTime");
							chkin=inTime.substring(11,inTime.length()-2);
							t=inTime.substring(0,10);
							t=df123.format(df1234.parse(t));
						}
						String sql2="SELECT max(CheckinDateTime) as chkOutDateTime FROM t_checkinout WHERE  checkDate='"+cmpDate+"' and EmpId='"+emp+"' group by checkDate";
						System.out.println("hr loop==sql2 >"+sql2);
						
						ResultSet rs3=st2.executeQuery(sql2);
						if(rs3.next())
						{
							outTime=rs3.getString("chkOutDateTime");
							chkout=outTime.substring(11,outTime.length()-2);	
							
							t=outTime.substring(0,10);
							t=df123.format(df1234.parse(t));
						}
						System.out.println("IN------------------>"+chkin+"Out------------------>"+chkout);
						String ActChkIn=chkin;
						String ActChkOut=chkout;
						String Actual_diff="";
						
						try{
						String sqlfordiff="select timeDiff('"+chkout+"','"+chkin+"')";
						ResultSet rs10=st10.executeQuery(sqlfordiff);
						System.out.println("----------"+sqlfordiff);
						rs10.next();
						
						Actual_diff=rs10.getString(1);
						
						}catch(Exception e33)
						{
							System.out.println("===e33=====>>>"+e33);
							
							Actual_diff="00:00";
							
						}

						try
						{
							chkin1=chkin.substring(0,5);
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
						try
						{
							chkout1=chkout.substring(0,5);
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
						
						 token_int1=chkin.split(":");
							
							
							System.out.println(">>>>token_int=11111=>"+token_int1[0]);
							System.out.println(">>>>token=>"+token_int1[1]);
							
							
							
							System.out.println(">>>>inTime----------=>"+inTime);
							
							
							hrs_cal1=Double.parseDouble(token_int1[0]);
							min_cal1=Double.parseDouble(token_int1[1]);
							
							hrs_cal1=hrs_cal1 * 60 *60;
							min_cal1=min_cal1 * 60;
							
							System.out.println(">>>>hrs_cal1=  afetr conversion >"+hrs_cal1);
							System.out.println(">>>>min_cal1= afetr conversion >"+min_cal1);
							
							tot_sec1=hrs_cal1+min_cal1;
							System.out.println(">>>>Toatal sec1  >"+tot_sec1);
							
							if(tot_sec1<32400)
							{
								
								chkin1="09:00";
								chkin="09:00";
							}
							
							
							if(inTime.equalsIgnoreCase(outTime))
							{
								
								chkin1=chkout;
								
								
							}
							
                            token_int2=chkout.split(":");
							
							
							System.out.println(">>>>token_int222=11111=>"+token_int2[0]);
							System.out.println(">>>>token222=>"+token_int2[1]);
							
							
							
							hrs_cal2=Double.parseDouble(token_int2[0]);
							min_cal2=Double.parseDouble(token_int2[1]);
							
							hrs_cal2=hrs_cal2 * 60 *60;
							min_cal2=min_cal2  * 60;
							
							System.out.println(">>>>hrs_cal2=  afetr conversion >"+hrs_cal2);
							System.out.println(">>>>min_cal2= afetr conversion >"+min_cal2);
							
							tot_sec2=hrs_cal2+min_cal2;
							System.out.println(">>>>Toatal sec2  >"+tot_sec2);
							
							if(tot_sec2 >68400)
							{
								
								chkout1="19:00";
								chkout="19:00:00";
								
							}
						
							
							if(tot_sec1<32400 && tot_sec2<32400)
							{
								
								chkin1="09:00";
								chkin="09:00";
								chkout="09:00";
								//chkin1=chkout1;
								chkout1="09:00";
							}
							
							
							System.out.println(">>>>inTime----------=>"+inTime);
							System.out.println(">>>>outTime----------=>"+outTime);
							
							System.out.println(">>>>chkout sec2  >"+chkout);
							System.out.println(">>>>chkin sec2  >"+chkin);
						
String diff="";
							
							try{
							String sql="select timeDiff('"+chkout+"','"+chkin+"')";
							ResultSet rs=st2.executeQuery(sql);
							System.out.println("----------"+sql);
							rs.next();
							
							 diff=rs.getString(1);
							
							}catch(Exception e33)
							{
								System.out.println("===e33=====>>>"+e33);
								
								diff="00:00";
								
							}
							String Actualdiff=diff;
							System.out.println("===diff=====>>>"+diff);
						
						String algn="right";
						
						if(diff!=null)
						{
						//diff=diff.substring(0, 5);
						
						}
					
						
						
						if(diff==null || diff.equals("null"))
							diff="NA";
						if(diff.equalsIgnoreCase("NA"))
						{
							
							algn="left";
							
						}else{
							
							algn="right";
							
						}
						
						 token_int=diff.split(":");
							
							
							System.out.println(">>>>token_int=11111=>"+token_int[0]);
							System.out.println(">>>>token=>"+token_int[1]);
							
							
							
							hrs_cal=Double.parseDouble(token_int[0]);
							min_cal=Double.parseDouble(token_int[1]);
							
							hrs_cal=hrs_cal * 60 *60;
							min_cal=min_cal * 60;
							
							System.out.println(">>>>hrs_cal=  afetr conversion >"+hrs_cal);
							System.out.println(">>>>min_cal= @@@@@@2afetr conversion >"+min_cal);
							
							
							try{
							tot_sec=hrs_cal+min_cal+Double.parseDouble(token_int[2]);
							
							
							System.out.println(">>>>Toatal sec%%%%%%%%%%%%%  >"+tot_sec);
							if(tot_sec>=30570)
							{
								status="Present";
								
							}else if(tot_sec>=29700 && tot_sec<30570)
							{
								status="Late";
								
							}else if(tot_sec>=28800 && tot_sec<29700)
							{
								status="Half Day";
								
							}else if(tot_sec< 28800)
							{
								status="Absent";
								
							}else{
								
								
							}
							
							
							if(tot_sec>=30570 && tot_sec<=30600)
							{
								diff="08:30";
								
							}
							
							
							
							}catch(Exception e)
							{
								System.out.println("=========Exception in total seconds ===>>"+e);	
								
							}
							
						
							if(diff.equalsIgnoreCase("00:00"))
							{
								
								diff="00:00";
								
							}
							if(inTime.equalsIgnoreCase(outTime))
							{
								
								chkin1=chkout1;
								status="Absent";
								
								
							}
							
							
							if(diff.equalsIgnoreCase("00:00:00"))
							{
								
								
								if(cmpDate.equalsIgnoreCase(currentdate))
								{
								status="-";
								}
								
								
							}
							
						System.out.println("================diff====================>>"+diff);
						%>
					<tr>
						<td align="right"><div align="right">
								<font size="2" color="black"><%= i%></font>
							</div></td>
						<td align="right" width="5"><div align="right">
								<font size="2" color="black"><%=emp%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=empName%></font>
							</div></td>
						<td align="right" width="10" sorttable_customkey="20080211131900"><div
								align="right">
								<font size="2" color="black"><%=t%></font>
							</div></td>
						<td align="right" width="10"><div align="right">
								<font size="2" color="black"><%=chkin1%></font>
							</div></td>
						<td align="right" width="10"><div align="right">
								<font size="2" color="black"><%=chkout1%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=reason%></font>
							</div></td>

						<%//############################################################################################## %>

						<%//############################################################################################## %>


						<%
						if(diff.equalsIgnoreCase("00:00"))
						{%>

						<td align="<%=algn %>"><div align="<%=algn %>">
								<font size="2" color="black"><%= diff%> </font>
							</div></td>

						<%}else{
							%>
						<td align="<%=algn %>"><div align="<%=algn %>">
								<font size="2" color="black"><%=diff.substring(0, 5)%></font>
							</div></td>

						<%}
						%>




						<td align="left"><div align="left">
								<font size="2" color="black"><%=status%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=ActChkIn%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=ActChkOut%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=Actual_diff%></font>
							</div></td>

					</tr>
					<%
					}
				%>
				</table>
			</div>
		</form>
		<%
				//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			}
			else
			{
			
				System.out.println("ELSE LOOP==&&&&&&&& >");
				%>
		<form name="checkoutHOD" id="checkoutHOD" method="post" action="">
			<table width=80%>
				<tr>
					<td align="right"><input type="hidden" id="tableHTML"
						name="tableHTML" value="" /> <input type="hidden" id="fileName"
						name="fileName" value="<%= exportFileName%>" /> <a href="#"
						style="font-weight: bold; color: black;"
						onclick="gotoExcel('mytable', 'tableHTML');"> <img
							src="images/excel.jpg" width="15px" height="15px"
							style="border-style: none"></img>
					</a><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
					</td>
				</tr>
			</table>
			<div id="mytable">
				<table width="70%" bgcolor="white" align="center" class="sortable"
					style="width: 800px;">
					<tr>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Sr</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>EmpID</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Emp Name</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Date</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Check In</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Check Out</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Reason</b></font></td>


						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Hours Worked</b></font></td>
						<td style="background-color: #C6DEFF;" align="center"><font
							size="2" color="black"><b>Status</b></font></td>



					</tr>
					<%
					System.out.println("=======Emp=======");
					//sqlData="select * from t_checkinout  where  EmpID='"+empid+"' and checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' group by checkDate,EmpID";
					sqlData="select a.EmpID,a.EmpName,a.CheckinDateTime,a.checkDate,a.checkTime,a.CheckinType,a.Office,a.Status,a.EntryComments,b.TypeValue,b.Name "+
					"from t_checkinout a "+
					"inner join( "+
					"select * from "+ 
					"t_leaveadmin "+ 
					"where EmpID='"+empid+"') b "+
					"on(b.EmpID = a.EmpID) "+
					"where checkDate>='"+dataDate1+"' and checkDate<='"+dataDate2+"' "+
					"group by checkDate, EmpID";
					
					System.out.println("last else  loop==sqldata >"+sqlData);
					ResultSet rs1=st1.executeQuery(sqlData);
					while(rs1.next())
					{
							String inTime="-", outTime="-";
							i++;
							System.out.println("======="+i+"========");
							emp=rs1.getString("EmpID");
							empName=rs1.getString("Name");
							status=rs1.getString("Status");
							cmpDate=rs1.getString("checkDate");
							reason=rs1.getString("EntryComments");
							try
							{
								//if((reason==null) || (reason=="") || reason.equals("") || reason.equals(null))
								if(reason=="" || reason==null)
								{
									reason="-";
								}
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							String t="",chkin="-",chkout="-",chkin1="-",chkout1="-";
							String sql1="SELECT min(CheckinDateTime) as chkInDateTime FROM t_checkinout WHERE  checkDate='"+cmpDate+"' and EmpId='"+empid+"' group by checkDate";
							System.out.println("last loop==sql1 >"+sql1);
							ResultSet rs2=st2.executeQuery(sql1);
							if(rs2.next())
							{
								inTime=rs2.getString("chkInDateTime");
								
								
								chkin=inTime.substring(11,inTime.length()-2);
								t=inTime.substring(0,10);
								t=df123.format(df1234.parse(t));
							}
							String sql2="SELECT max(CheckinDateTime) as chkOutDateTime FROM t_checkinout WHERE  checkDate='"+cmpDate+"' and EmpId='"+empid+"' group by checkDate";
							System.out.println("last loop==sql2 >"+sql2);
							ResultSet rs3=st2.executeQuery(sql2);
							if(rs3.next())
							{
								outTime=rs3.getString("chkOutDateTime");
								chkout=outTime.substring(11,outTime.length()-2);	
								
								t=outTime.substring(0,10);
								t=df123.format(df1234.parse(t));
							}
							try
							{
								chkin1=chkin.substring(0,5);
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							try
							{
								chkout1=chkout.substring(0,5);
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							
						
							System.out.println("intime ========@@@@== >"+inTime.substring(11,19));
							
							System.out.println("chkin #######==sql1 >"+chkin);
							System.out.println("outTime.length()>"+outTime.length());
							
							System.out.println("====================================>>"+t);
							
							System.out.println("=======chkin>>"+chkin);
							
							
							System.out.println("====t=>>"+t);
							System.out.println("===chkout=>>"+chkout);
							
                              token_int1=chkin.split(":");
							
							
							System.out.println(">>>>token_int=11111=>"+token_int1[0]);
							System.out.println(">>>>token=>"+token_int1[1]);
							//System.out.println(">>>>token[2]=>"+token_int1[2]);
							
							
							hrs_cal1=Double.parseDouble(token_int1[0]);
							min_cal1=Double.parseDouble(token_int1[1]);
							
							hrs_cal1=hrs_cal1 * 60 *60;
							min_cal1=min_cal1 * 60;
							
							System.out.println(">>>>hrs_cal1=  afetr conversion >"+hrs_cal1);
							System.out.println(">>>>min_cal1= afetr conversion >"+min_cal1);
							
							tot_sec1=hrs_cal1+min_cal1;
							System.out.println(">>>>Toatal sec1  >"+tot_sec1);
							
							if(tot_sec1<32400)
							{
								
								chkin1="09:00";
								chkin="09:00";
							}
							
							
							
							
                               token_int2=chkout.split(":");
							
							
							System.out.println(">>>>token_int222=11111=>"+token_int2[0]);
							System.out.println(">>>>token222=>"+token_int2[1]);
							//System.out.println(">>>>token222token[2]=>"+token_int2[2]);
							
							
							hrs_cal2=Double.parseDouble(token_int2[0]);
							min_cal2=Double.parseDouble(token_int2[1]);
							
							hrs_cal2=hrs_cal2 * 60 *60;
							min_cal2=min_cal2  * 60;
							
							System.out.println(">>>>hrs_cal2=  afetr conversion >"+hrs_cal2);
							System.out.println(">>>>min_cal2= afetr conversion >"+min_cal2);
							
							tot_sec2=hrs_cal2+min_cal2;
							System.out.println(">>>>Toatal sec2  >"+tot_sec2);
							
							if(tot_sec2 >68400)
							{
								
								chkout1="19:00";
								chkout="19:00:00";
								
							}
							if(tot_sec1<32400 && tot_sec2<32400)
							{
								
								chkin1="09:00";
								chkin="09:00";
								chkout="09:00";
								//chkin1=chkout1;
								chkout1="09:00";
							}
							//System.out.println("====t=>>"+t);
							%>
					<tr>
						<td align="right"><div align="right">
								<font size="2" color="black"><%= i%></font>
							</div></td>
						<td align="right" width="5"><div align="right">
								<font size="2" color="black"><%=emp%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=empName%></font>
							</div></td>
						<td align="right" width="10" sorttable_customkey="20080211131900"><div
								align="right">
								<font size="2" color="black"><%=t%></font>
							</div></td>
						<td align="right" width="10"><div align="right">
								<font size="2" color="black"><%=chkin1%></font>
							</div></td>
						<td align="right" width="10"><div align="right">
								<font size="2" color="black"><%=chkout1%></font>
							</div></td>
						<td align="left"><div align="left">
								<font size="2" color="black"><%=reason%></font>
							</div></td>
						<%//############################################################################################## %>

						<%//############################################################################################## %>
						<%
							String diff="",diff1="";
							
							try{
							String sql="select timeDiff('"+chkout+"','"+chkin+"')";
							ResultSet rs=st2.executeQuery(sql);
							System.out.println("^^^^^^"+sql);
							rs.next();
							
							 diff=rs.getString(1);
							
							}catch(Exception e33)
							{
								System.out.println("===e33=====>>>"+e33);
								
								diff="00:00";
								
							}
							
							
							System.out.println("======timediff==>>>"+diff);
							
							String algn="right";
							
							if(diff!=null)
							{
							//diff=diff.substring(0, 5);
							diff1=diff.substring(0, 5);
							}
							if(diff==null || diff.equals("null"))
								diff="NA";
							if(diff.equalsIgnoreCase("NA"))
							{
								
								algn="left";
								
							}else{
								
								algn="right";
								
							}
                            token_int=diff.split(":");
							
							
							System.out.println(">>>>token_int=11111=>"+token_int[0]);
							System.out.println(">>>>token=>"+token_int[1]);
							System.out.println(">>>>token=222>"+token_int[2]);
							
							
							hrs_cal=Double.parseDouble(token_int[0]);
							min_cal=Double.parseDouble(token_int[1]);
							
							hrs_cal=hrs_cal * 60 *60;
							min_cal=min_cal * 60;
							
							System.out.println(">>>>hrs_cal=  afetr conversion >"+hrs_cal);
							System.out.println(">>>>min_cal= afetr conversion >"+min_cal);
							
							try{
							tot_sec=hrs_cal+min_cal+Double.parseDouble(token_int[2]);
							System.out.println(">>>>Toatal sec  >"+tot_sec);
							if(tot_sec>=30570)
							{
								status="Present";
								
							}else if(tot_sec>=29700 && tot_sec<30570)
							{
								status="Late";
								
							}else if(tot_sec>=28800 && tot_sec<29700)
							{
								status="Half Day";
								
							}else if(tot_sec< 28800)
							{
								status="Absent";
								
							}else{
								
								
							}
							
							if(tot_sec>=30570 && tot_sec<=30600)
							{
								diff="08:30";
								
							}
							
							
							
							}catch(Exception e43)	
							{
								System.out.println(">>>>Toatal sec  >"+e43);	
								
								
							}
							
							
							
							
							
							if(inTime.equalsIgnoreCase(outTime))
							{
								
								
								System.out.println(">Inside if LOLOPOP>");
								chkin1=chkout1;
								status="Absent";
								
								
							}
							
							
							if(diff.equalsIgnoreCase("00:00:00"))
							{
								
								
								if(cmpDate.equalsIgnoreCase(currentdate))
								{
								status="-";
								}
								
								
							}
							
							%>

						<%
						if(diff.equalsIgnoreCase("00:00"))
						{%>

						<td align="<%=algn %>"><div align="<%=algn %>">
								<font size="2" color="black"><%= diff%> </font>
							</div></td>

						<%}else{
							%>
						<td align="<%=algn %>"><div align="<%=algn %>">
								<font size="2" color="black"><%=diff.substring(0, 5)%></font>
							</div></td>

						<%}
						%>



						<td align="left"><div align="left">
								<font size="2" color="black"><%=status%></font>
							</div></td>


					</tr>
					<%
						}
					%>
				</table>
			</div>
		</form>
		<%
			}
		}
		catch(Exception e)
		{
			
			System.out.println("Exception--------->>"+e);												
		}
		finally
		{
			conn.close();
		}
			%>

		<!-- <table border="1" width="750px" align="center"> 
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>-->

		<br></br> <br></br> <br></br> <br></br> <br></br>
</body>
<%@ include file="footer.jsp"%>

</html>