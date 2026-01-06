
<%
/****************************************************
Programmer Name: Vikram Abhang
Date- 21st-july-2012
Purpose:This page is change as per puri sir requirement to maintain record of paid bill
        in database t_billpayment & t_billpaymenthistory & Color code to Paid ,Unpaid,BillDueDate.
*****************************************************/
%>

<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>

<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<script type="text/javascript" language="JavaScript1.2">
function showbillreport(inwrdref)
{
	//alert("In fun");
	window.open('BillEntry.jsp?refno='+inwrdref,'mywindow1','width=500, height=300, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
}
function editInward(reference)
{
	testwindow=window.open('editInwardedEntry.jsp?refno='+reference,'mywindow3','width=400, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
}
function display(inwrdref)
{
	window.open('DisplayBillDetails.jsp?refno='+inwrdref,'mywindow2','width=800,height=250,top=200,left=280,resizable=no');
	
}
function showalertbillreport(inwrdref)
{
	    var agree=confirm("Bill Details Alredy Entered Do you Want to See Please Click Ok?");
	    if(agree)
	    {
	    	display(inwrdref)
	        //return true;
	    }
	    else
	    {
		    //return false;
	    }
}
function allSelected(allVal)
{
	if(document.customdetail.extAll.checked) 
	{
		document.getElementById("frmDT").style.display='none';
    	document.getElementById("toDT").style.display='none';
    	document.getElementById("first1").style.display='none';
    //	document.getElementById("second1").style.display="";
    }
	else 
	{
		document.getElementById("frmDT").style.display="";
    	document.getElementById("toDT").style.display="";
    	document.getElementById("second1").style.display="";
    	//document.getElementById("first1").style.display='none';
	}
}

function validate()
{
	var s1=document.getElementById("searchTxt").value;
	if(s1=="")
	{
		alert("Please Enter Search Element");
		return false;
	}

	return true;
}
function gotoExcel(elemId, frmFldId)
{  
       // alert(elemId+"========"+frmFldId);
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId);  
          oFld.value = obj.innerHTML;
          document.bill.action ="excel.jsp";
          document.forms["bill"].submit();
}
function getFTPImage(t1,refNo,empname1)
{
	try
	{
	//	alert(escape(ftpFile));
	//	alert(ftpFile);
		window.open('inwardLinkTrack.jsp?filename='+t1+'&iwno='+refNo+'&empName='+empname1+'','mywindow','width=700, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
	}
	catch(e)
	{
		alert(e);
	}
} 
</script>


</head>
<body>
	<%
		Statement stmt=null,st1=null,st=null,st2=null,st3=null;
		String sql=null;
		ResultSet rst=null;
		stmt=conn.createStatement();
		st1=conn.createStatement();
		st=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		%>

	<%

String statusname="all";
if(request.getParameter("rd")!=null)
{
	statusname=request.getParameter("rd");
}

String datenew1="";
String datenew2="";
if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
}
else
{
	datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

Calendar cal1 = Calendar.getInstance();
cal1.setTime(new Date());
cal1.add(Calendar.MONTH, -1);

Date yesterday = cal1.getTime();
datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(yesterday);
}
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>

	<% 
		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
		%>


	<form name="customdetail" method="get" action="">
		<table align="center">
			<tr>
				<td>All <input type="checkbox" name="extAll" id="extAll"
					value="yes" onclick="allSelected(this.value);"></input>
				</td>

				<td id="frmDT" align="left" style="display: ''"><b>From&nbsp;&nbsp;</b>
					<input type="text" id="data" name="data" size="12"
					value="<%=datenew1%>"
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

				<td id="toDT" align="left" style="display: ''"><b>To&nbsp;&nbsp;</b>
					<input type="text" id="data1" name="data1" size="12"
					value="<%=datenew2%>"
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"
					readonly /> <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script>&nbsp;&nbsp;&nbsp;</td>


			</tr>
		</table>
		<table align="center">
			<tr>
				<td align="center"><input type="text" name="searchTxt"
					id="searchTxt"
					style="width: 400px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif;" /></td>
				<td><input type="submit" name="submit" id="search-submit"
					value="Submit"></td>
			</tr>
		</table>
		<%
		String chbxAll1=request.getParameter("extAll");
		if(chbxAll1!=null && chbxAll1!="")
		{
		%>
		<div id="second1"
			style="font-size: 1.4em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
			<a>Bill Report For All Records</a>
		</div>
		<%}
		else
		{%>
		<div id="first1"
			style="font-size: 1.4em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
			<a>Bill Report From <%=datenew1%> To <%=datenew2%></a>
		</div>

		<%} %>



	</form>
	<%String exportFileName="Bill_Report.xls"; %>
	<% 
		try 
		{
			
			if(!(null==datenew1)&&!(null==datenew2))
			{
			
			System.out.println(request.getParameter("searchTxt")+"********************"+request.getParameter("rd"));
		
			String radio=request.getParameter("rd");
			
			String chbxAll=request.getParameter("extAll");
			System.out.println("chbxAll-->>"+chbxAll);
			
			System.out.println("radio-->>"+radio);
			
			String Color="";
			%>
	<form name="bill" id="bill" method="post">
		<table width=50%>
			<tr>
				<td bgcolor="#FAAFBE">Color Code Indication: UnPaid</td>
				<td bgcolor="#AEF8B1">Paid</td>
				<td bgcolor="#FFFF00">BillDueDate within 7 days</td>
				<td bgcolor="#00FFFF">BillDueDate After 7 days</td>
				<td align="right"><input type="hidden" id="tableHTML"
					name="tableHTML" value="" /> <input type="hidden" id="fileName"
					name="fileName" value="<%= exportFileName%>" /> <a href="#"
					style="font-weight: bold; color: black;"
					onclick="gotoExcel('mytable', 'tableHTML');"> <img
						src="images/excel.jpg" width="15px" height="15px"
						style="border-style: none"></img>
				</a></td>
			</tr>
		</table>
		<div id="mytable">
			<table width="70%" align="center">
				<tr>
					<td>&nbsp;</td>
					<td>
						<table bgcolor="white" align="center" class="sortable">
							<tr>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Sn.</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Date</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Inward No.</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Manual Reference</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Category</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>From</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Address</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Subject</b></font></td>

								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>BillNo</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>BillAmt</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>BillDate</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>BillDueDate</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Inward</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Outward</b></font></td>


								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Inwared By</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>To</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>UpdatedDateTime</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Files</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Status</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Bill Status</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Edit</b></font></td>

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
			int i=0;
			String sqlData="";
			String searchKey=request.getParameter("searchTxt");
			System.out.println("searchKey-->>"+searchKey);
			String empNameString="",enteredby="";
			String entBy =session.getAttribute("empname").toString();	
			String cmpString =session.getAttribute("email").toString();
			
			if(searchKey==null)
			{
				if(chbxAll!=null && chbxAll!="")
				{
					System.out.println("\n\n in yes............");
			
					//sqlData="select * from db_leaveapplication.t_inwarddetails where FromParty like '%"+searchKey+"%' order by InwardDate asc";
					 sqlData="SELECT * FROM db_leaveapplication.t_inwarddetails WHERE BillNo IS NOT NULL	AND BillNo NOT IN (' ', '-', '') ";
					
				}
				else
				{			
						sqlData="SELECT * FROM db_leaveapplication.t_inwarddetails WHERE BillNo IS NOT NULL	AND BillNo NOT IN (' ', '-', '') AND   InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' order by InwardDate asc";
				
				}
			
			}
			else
			{
				if(chbxAll!=null && chbxAll!="")
				{
					System.out.println("\n\n in yes............");
			
					//sqlData="select * from db_leaveapplication.t_inwarddetails where FromParty like '%"+searchKey+"%' order by InwardDate asc";
					 sqlData="SELECT * FROM db_leaveapplication.t_inwarddetails WHERE BillNo IS NOT NULL	AND BillNo NOT IN (' ', '-', '') and BillNo like '%"+searchKey+"%'";
					
				}
				else
				{			
						sqlData="SELECT * FROM db_leaveapplication.t_inwarddetails WHERE BillNo IS NOT NULL	AND BillNo NOT IN (' ', '-', '') AND  BillNo like '%"+searchKey+"%' AND  InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' order by InwardDate asc";
				
				}
				
			}
			
			System.out.println(sqlData);
			rst=stmt.executeQuery(sqlData);
			while(rst.next())
			{
				String stat=rst.getString("BillStatus");
				try
				{
					if(stat=="UnPaid" || stat.contains("UnPaid"))
					{
						
						try
						{
							if(rst.getString("Category").equals("Bills"))
							{
								Date bduedate1=(Date)df1234.parse(rst.getString("BillDueDate"));
								Date todays=new java.util.Date(); 
								
								//System.out.println("@@@@@@@@@@@@@@@@@@::"+bduedate1.compareTo(todays));
								if(bduedate1.before(todays))
								{
									//Color="bgcolor='#FF0000'";
									Color="bgcolor='#EEC5C8'";
								}
								/*else if(bduedate1.compareTo(todays) <= 1 ||bduedate1.compareTo(todays) <= 2||bduedate1.compareTo(todays) <= 3|| bduedate1.compareTo(todays) <= 4||bduedate1.compareTo(todays) <= 5||bduedate1.compareTo(todays) <= 6)
								{
									Color="bgcolor='#FFFF00'";
								}*/
								else
								{
									//System.out.println("###########################else lesds###########");
									try
									{
										String Sql="Select DATEDIFF('"+rst.getString("BillDueDate")+"','"+today+"')";
										//System.out.println("^^^^^^^^^^^^^^^^^^^^Sql:"+Sql);
										ResultSet rsd=st3.executeQuery(Sql);
										if(rsd.next())
										{
											int cnt=0;
											cnt=rsd.getInt(1);
											System.out.println(">>>>>>>>>>>>>>CNT:"+cnt);
											if(cnt==1 ||cnt==2||cnt==3||cnt==4||cnt==5||cnt==6)
											{
												Color="bgcolor='#FFFF00'";
												//System.out.println("+++++++++++++++++++++++++++++++++");
											}
											else
											{
												Color="bgcolor='#00FFFF'";
												//System.out.println("******************************************");
											}
										}
									}
									catch(Exception e)
									{
										System.out.println(">>>>>>>>>>>>>>>Exception:"+e);
									}
									
								}
							}
							else
							{
								Color="bgcolor='#FAAFBE'";
							}
						}
						catch(Exception e)
						{
							
						}
						System.out.println(">>>>>>>>>>>>>>>>>>>>In If<<<<<<<<<<<<<<<<<");
						//Color="bgcolor='#FF0000'";
					}
					else 
					{
						System.out.println(">>>>>>>>>>>>>>>>>>>>In else<<<<<<<<<<<<<<<<<");
						
						
						Color="bgcolor='#AEF8B1'";
					}
					
				}
				catch(Exception e)
				{
					
				}
				
				i++;
				boolean f1=false;
				boolean f2=false;
			
				String bno="-", bamt="-", bdate="-", bduedate="-";
				String adr=rst.getString("Address");
				String manRef=rst.getString("ManualRef");
				
				
				empNameString=rst.getString("ToEmailID");
				enteredby=rst.getString("Enteredby");
				
				//ToEmailID
				System.out.println(enteredby+"=========="+empNameString);
				//================================================
					String delims12 = "[,]";
    				String[] tokens1 = empNameString.split(delims12);
    				
				for (String t : tokens1)
				{
					System.out.println("=======================>>"+t);
						if(t.equals(cmpString))
						{
							f1=true;
						}
				}
				System.out.println(enteredby+"###################"+entBy);
				if(enteredby.equals(entBy))
				{
					System.out.println("###################");
					f2=true;
				}
				
				
				try
				{	
					if( manRef=="" || manRef==null)
					{
						manRef="-";
					}
				
					if(adr=="" || adr==null)
					{
						adr="-";
					}
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				
				if(rst.getString("Category").equals("Bills") || rst.getString("Category").equals("Claim"))
				{
					bno=rst.getString("BillNo");
					bamt=rst.getString("BillAmt");
					bdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("BillDate")));
					bduedate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("BillDueDate")));
				}
				%>
							<tr <%=Color %>>
								<td align="center"><div align="right">
										<font size="2" color="black"><%= i%></font>
									</div></td>
								<td align="right" sorttable_customkey="20080211131900"><div
										align="right">
										<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm")
									.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
										.parse( rst.getString("InwardDate")+" "+rst.getString("InwardTime")))%></font>
									</div></td>
								<td align="center"><div align="right">
										<font size="2" color="black"> <%
				String Sqlcheck="Select * from t_billpayment where InwardNo='"+rst.getString("InwardRefNo")+"'";
				ResultSet rscheckinward=st2.executeQuery(Sqlcheck);
				System.out.println("Sqlcheck:>>>>>>>>>>>"+Sqlcheck);
				if(rscheckinward.next())
				{
					%> <a href=""
											onclick="showalertbillreport('<%= rst.getString("InwardRefNo")%>');"><%= rst.getString("InwardRefNo")%></a>
											<%
				}
				else
				{
					%> <a href=""
											onclick="showbillreport('<%= rst.getString("InwardRefNo")%>');"><%= rst.getString("InwardRefNo")%></a>
											<%
				}
				%>
										</font>
									</div></td>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= manRef%></font>
									</div></td>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= rst.getString("Category")%></font>
									</div></td>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= rst.getString("FromParty")%></font>
									</div></td>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= adr%></font>
									</div></td>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= rst.getString("Subject")%></font>
									</div></td>

								<td align="center"><div align="right">
										<font size="2" color="black"><%= bno%></font>
									</div></td>
								<td align="center"><div align="right">
										<font size="2" color="black"><%= bamt%></font>
									</div></td>
								<td align="center"><div align="right">
										<font size="2" color="black"><%= bdate%></font>
									</div></td>
								<td align="center"><div align="right">
										<font size="2" color="black"><%= bduedate%></font>
									</div></td>
								<%
				if(f1==true && f2==false)
				{
					System.out.println("===1==");
				%>
								<td align="left"><div align="left">
										<font size="2" color="black">Inward</font>
									</div></td>
								<td align="left"><div align="left">
										<font size="2" color="black">-</font>
									</div></td>
								<%}
				else if(f1==false && f2==true)
				{
					System.out.println("===2==");
				%>
								<td align="left"><div align="left">
										<font size="2" color="black">-</font>
									</div></td>
								<td align="left"><div align="left">
										<font size="2" color="black">Outward</font>
									</div></td>
								<%
				}
				else if(f1==true && f2==true)
				{
					System.out.println("===3==");
				%>
								<td align="left"><div align="left">
										<font size="2" color="black">Inward</font>
									</div></td>
								<td align="left"><div align="left">
										<font size="2" color="black">Outward</font>
									</div></td>
								<%} else
				{%>
								<td align="left"><div align="left">
										<font size="2" color="black">-</font>
									</div></td>
								<td align="left"><div align="left">
										<font size="2" color="black">-</font>
									</div></td>
								<%}%>

								<td align="center"><div align="left">
										<font size="2" color="black"><%= rst.getString("Enteredby")%></font>
									</div></td>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= rst.getString("ToEmploy")%></font>
									</div></td>
								<%
				String delims123= "[,]";
				String[] tok = rst.getString("FileName").split(delims123);
				 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>File:"+tok[0]);
				String Checkfile="Select * from t_uploadedFiles where FileName='"+tok[0]+"'";
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>Checkfile:"+Checkfile);
				ResultSet rscheck=st.executeQuery(Checkfile);
				%>
								<%
				if(rscheck.next())
				{
					%>
								<td align="right"><div align="right">
										<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rscheck.getString("UpdatedDateTime"))) %></font>
									</div></td>
								<%
				}
				else
				{
					try
					{
					%>
								<td align="right"><div align="right">
										<font size="2" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("UpdatedDateTime"))) %>
										</font>
									</div></td>

								<% }catch(Exception e){
					System.out.println(">>>>>>>>>>>>>>Exception:"+e);
					%>
								<%}} %>
								<td align="center"><div align="left">
										<font size="2" color="black"> <% 
				
				for (String t1 : tok)
				{
					%> <a href='#'
											onclick="getFTPImage('<%=t1%>','<%=rst.getString("InwardRefNo")%>','<%=rst.getString("ToEmploy")%>');"><%=t1%></a><br></br>

											<%	
					
				}
				%>
										</font>
									</div></td>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= rst.getString("CheckStatus")%></font>
									</div></td>
								<%
				if(rst.getString("BillStatus")=="UnPaid" || rst.getString("BillStatus").toString().contains("UnPaid"))
				{
					%>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= rst.getString("BillStatus")%></font>
									</div></td>
								<%
				}
				else
				{
					%>
								<td align="center"><div align="left">
										<font size="2" color="black"><a href='#'
											onclick="display('<%= rst.getString("InwardRefNo")%>')""><%= rst.getString("BillStatus")%></a></font>
									</div></td>
								<%
				}
				%>

								<td align="right"><div align="left">
										<font size="2" color="black"><a href='#'
											onclick="editInward('<%= rst.getString("InwardRefNo")%>')"">Edit</a></font>
									</div></td>



							</tr>
							<%  
			}
			%>
						</table>
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
	</form>
	<%
		} 
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Exception=======>>"+e);
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
	 
%>