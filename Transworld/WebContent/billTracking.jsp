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

<script type="text/javascript">

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

function gotoExcel(elemId, frmFldId)
{  
       // alert(elemId+"========"+frmFldId);
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId);  
          oFld.value = obj.innerHTML;
          document.bill.action ="excel.jsp";
          document.forms["bill"].submit();
}
</script>


</head>
<body>
	<%
		Statement stmt=null,st1=null,st=null;
		String sql=null;
		ResultSet rst=null;
		stmt=conn.createStatement();
		st1=conn.createStatement();
		st=conn.createStatement();
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
%>

	<% 
		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
		%>
	<div
		style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
		<a>Document Tracking Report</a>
	</div>

	<form name="customdetail" method="get" action="">
		<table align="center">
			<tr>

				<td align="left"><b>Tracking&nbsp;&nbsp;</b> <select name="rd"
					id="rd"
					style="width: 87px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
						<option value="all" <% if(statusname.equals("all")){ %> Selected
							<% } %>>All</option>
						<option value="bill" <% if(statusname.equals("bill")){ %> Selected
							<% } %>>Bill Number</option>
						<option value="doc" <% if(statusname.equals("doc")){ %> Selected
							<% } %>>Document Number</option>
						<option value="sub" <% if(statusname.equals("sub")){ %> Selected
							<% } %>>Subject</option>
						<option value="party" <% if(statusname.equals("party")){ %>
							Selected <% } %>>Party Name</option>
						<option value="manRef" <% if(statusname.equals("manRef")){ %>
							Selected <% } %>>Manual Reference</option>

				</select></td>



				<td>All <input type="checkbox" name="extAll" id="extAll"
					value="yes" onclick="allSelected(this.value);"></input>
				</td>
				<td></td>
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

			</tr>
			<tr>
				<td><input type="text" name="searchTxt" id="searchTxt"
					style="width: 400px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif;" /></td>
				<td><input type="submit" name="submit" id="search-submit"
					onclick="return validate();" value="Go"></td>
			</tr>

		</table>


	</form>
	<%String exportFileName="BillTracking_Report.xls"; %>
	<% 
		try 
		{
			System.out.println("22222222222222222222222222");	
		//	if(request.getQueryString()!=null)
		//	{
				
			System.out.println("********************");
		
			String radio=request.getParameter("rd");
		;
			String chbxAll=request.getParameter("extAll");
			System.out.println("chbxAll-->>"+chbxAll);
			
			System.out.println("radio-->>"+radio);
		//	System.out.println("searchKey-->>"+searchKey);
			System.out.println("23333333333333333333333333333333333");
			%>
	<form name="bill" id="bill" method="post">
		<table width=50% align="right">
			<tr>

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
		<br> <br>
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
									size="2" color="black"><b>UpdatedDateTime</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Inwared By</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>To</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Files</b></font></td>
								<td style="background-color: #C6DEFF;" align="center"><font
									size="2" color="black"><b>Status</b></font></td>
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
			String searchKey=request.getParameter("searchTxt");
			String sqlData="";
			System.out.println("444444444444444444444");
			try{
			if(chbxAll!=null && chbxAll!="")
			{
					System.out.println("\n\n in yes............");
				if(radio.equals("all") )
				{
					System.out.println("\n\n in all.....");
					sqlData="(select * from db_leaveapplication.t_inwarddetails where BillNo='"+searchKey+"') union"
					        +"(select * from db_leaveapplication.t_inwarddetails where InwardRefNo='"+searchKey+"') union"
					        +"(select * from db_leaveapplication.t_inwarddetails where Subject like '%"+searchKey+"%') union"
					        +"(select * from db_leaveapplication.t_inwarddetails where ManualRef like '%"+searchKey+"%') union"
					        +"(select * from db_leaveapplication.t_inwarddetails where FromParty like '%"+searchKey+"%')  order by InwardDate asc";
					
					System.out.println("\n\n isqlData--->>"+sqlData);
					
				}else if(radio.equals("bill"))
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where BillNo='"+searchKey+"' order by InwardDate asc";
				}
				else if(radio.equals("doc"))
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where InwardRefNo='"+searchKey+"' order by InwardDate asc";
				}
				else if(radio.equals("sub"))
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where Subject like '%"+searchKey+"%' order by InwardDate asc";
				}
				else if(radio.equals("manRef"))
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where ManualRef like '%"+searchKey+"%' order by InwardDate asc";
				}
				else
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where FromParty like '%"+searchKey+"%' order by InwardDate asc";
				}
			}
			else
			{
				System.out.println("Sachin kapre  ");
				if(radio.equals("all") )
				{
					System.out.println("\n\n in all.....");
					sqlData="(select * from db_leaveapplication.t_inwarddetails where InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') union"
					        +"(select * from db_leaveapplication.t_inwarddetails where InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') union"
					        +"(select * from db_leaveapplication.t_inwarddetails where  InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') union"
					        +"(select * from db_leaveapplication.t_inwarddetails where  InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"') union"
					        +"(select * from db_leaveapplication.t_inwarddetails where  InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' )  order by InwardDate asc";
					
					System.out.println("\n\n isqlData--->>"+sqlData);
					
				}else if(radio.equals("bill"))
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where BillNo='"+searchKey+"' AND  InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' order by InwardDate asc";
				}
				else if(radio.equals("doc"))
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where InwardRefNo='"+searchKey+"' AND InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' order by InwardDate asc";
				}
				else if(radio.equals("sub"))
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where Subject like '%"+searchKey+"%' AND InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' order by InwardDate asc";
				}
				else if(radio.equals("manRef"))
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where ManualRef like '%"+searchKey+"%' AND InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' order by InwardDate asc";
				}
				else
				{
					sqlData="select * from db_leaveapplication.t_inwarddetails where InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' order by InwardDate asc";
				}
				
				
				
			}
			}catch(Exception e)
			{
				System.out.println("IN CATCH   ");
				sqlData="select * from db_leaveapplication.t_inwarddetails where InwardDate>='"+dataDate1+"' and InwardDate<='"+dataDate2+"' order by InwardDate asc";
			}
			System.out.println(sqlData);
			rst=stmt.executeQuery(sqlData);
			while(rst.next())
			{
				i++;
				String bno="-", bamt="-", bdate="-", bduedate="-";
				String adr=rst.getString("Address");
				String manRef=rst.getString("ManualRef");
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
				
				if(rst.getString("Category").equals("Bills"))
				{
					bno=rst.getString("BillNo");
					bamt=rst.getString("BillAmt");
					bdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("BillDate")));
					bduedate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("BillDueDate")));
				}
				%>
							<tr>
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
										<font size="2" color="black"><%= rst.getString("InwardRefNo")%></font>
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
				String delims12= "[,]";
				String[] tok = rst.getString("FileName").split(delims12);
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
										<font size="2" color="black"><%= rst.getString("Enteredby")%></font>
									</div></td>
								<td align="center"><div align="left">
										<font size="2" color="black"><%= rst.getString("ToEmploy")%></font>
									</div></td>
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
	//	} 
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