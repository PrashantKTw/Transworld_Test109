<%@page
	import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.LocatorEx.Snapshot"%>
<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp"%>

<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/sorttable.js" type="text/javascript"></script>
<!--<link href="css/cpanel_002.css" rel="stylesheet" type="text/css"  />
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>
-->
<!--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

          document.attendance.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["attendance"].submit();       // CHANGE FORM NAME HERE

} 
</script>
</head>
<body>
	<% %>
	<form>
		<table style="width: 100%; height: 70px;" border="0">
			<%Date curdate=new Date();
String date1=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(curdate);
int yyyy = Calendar.getInstance().get(Calendar.YEAR); 
String m1="";
String mmm="";
String heading="",heading1="";
int year=0;
try{ m1=request.getParameter("month");System.out.println(",,,,,,,,,,,,,,"+m1);
    year=Integer.parseInt(request.getParameter("year"));
    
    switch(Integer.parseInt(m1))
    {
    case 1:
    	mmm="January";
           break;  
    case 2:
    	mmm="February";
           break;  
    case 3:
    	mmm="March";
           break;  
    case 4:
    	mmm="April";
           break;  
    case 5:
    	mmm="May";
           break;  
    case 6:
    	mmm="June";
           break;  
    case 7:
    	mmm="July";
           break;  
    case 8:
    	mmm="August";
           break;  
    case 9:
    	mmm="September";
           break;  
    case 10:
    	mmm="October";
           break;  
    case 11:
    	mmm="November";
           break;  
    case 12:
    	mmm="December";
           break;  

           
    }
    System.out.print(m1==null);
    

}catch(Exception e){System.out.println(",,,,,,,,,,,,,,"+e);}
if(m1==null)
{heading="Attendance Summary Report";}
else{heading="Attendance Summary Report For "+mmm+" "+year+"";
     heading1="AttendanceReportFor_"+mmm+"-"+year+"";}
%>
			<tr>
				<td colspan="2" align="center"><a style="font-size: 1.60em"><%=heading %></a>
				</td>
			</tr>
			<tr align="left">
				<td align="center"><b>Month :</b> <select name="month"
					id="month" style="width: 100px" class="select">
						<%if(m1==null)
 		        	{%>
						<option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
						<option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
						<%}
 		          else{%>
						<%if(m1.equals("01")){ %><option value="01" selected="selected">January</option>
						<%}else{%><option value="01">January</option>
						<%} 
 		         
 		         if(m1.equals("02")){ %><option value="02"
							selected="selected">February</option>
						<%}else{%><option value="02">February</option>
						<%} 
 		         
			     if(m1.equals("03")){ %><option value="03" selected="selected">March</option>
						<%}else{%><option value="03">March</option>
						<%} 
 		         
			     if(m1.equals("04")){ %><option value="04" selected="selected">April</option>
						<%}else{%><option value="04">April</option>
						<%}
 		         
			     if(m1.equals("05")){ %><option value="05" selected="selected">May</option>
						<%}else{%><option value="05">May</option>
						<%} 
			     
			     if(m1.equals("06")){ %><option value="06" selected="selected">June</option>
						<%}else{%>
						<option value="06">June</option>
						<%}
 		         
			     if(m1.equals("07")){ %><option value="07" selected="selected">July</option>
						<%}else{%><option value="07">July</option>
						<%} 
 		         
			     if(m1.equals("08")){ %><option value="08" selected="selected">August</option>
						<%}else{%><option value="08">August</option>
						<%}
 		         
			   if(m1.equals("09")){ %><option value="09" selected="selected">September</option>
						<%}else{%><option value="09">September</option>
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

				</td>
				<td align="right" style="width: 20px;"><a href="#"
					title="Export to Excel" onclick="gotoExcel('attend','tableHTML');"><img
						src="images/excel.jpg" width="15px" height="15px"></a></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><font size="1"><%=date1%></font></td>
			</tr>
		</table>
	</form>
	<form action="" method="post" name="attendance">
		<%
String exportFileName=""+heading1+".xls";   // GIVE YOUR REPORT NAME
%>
		<div id='attend' align="center"
			style="height: 400px; overflow: scroll;">

			<input type="hidden" id="tableHTML" name="tableHTML" value="" /> <input
				type="hidden" id="fileName" name="fileName"
				value="<%= exportFileName%>" />
			<table align="center"
				style="width: 80%; color: black; border-collapse: collapse; border-top: thick;"
				border="1" class="sortable">
				<tr>
					<th>Sr No.</th>
					<th>EmpID</th>
					<th>Emp Name</th>
					<th>Month Days</th>
					<th>HoliDays</th>
					<th>Present<br>Days</th>
					<th>Present Days<br>+Holiday</th>
					<th>Days with<br>8.5 Hrs</th>
					<th>Days without<br>8.5 Hrs</th>
					<th>Leaves<br>Applied</th>
					<th>Leaves <br>Sanctioned</th>
					<th>Sandwich <br>Holiday</th>
				</tr>


				<%
	try{

//+++++++++++++++++++++get month days ++++++++++++++++++

String mon=request.getParameter("month");
int month=Integer.parseInt(request.getParameter("month")); 
int monthdays=0;
DecimalFormat df= new DecimalFormat("#.00");
DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
System.out.println("month"+mon);
switch(month)
{
case 1: case 3: case 5:case 7:case 8: case 10: case 12: 
	monthdays=31;
       break;  
case 2:
	monthdays=28;
       break;
case 4: case 6: case 9: case 11: monthdays=30; 
       break;
}
System.out.println("Monthdays===="+monthdays);
//+++++++++++++++++++++++++++++++++++++++++++++
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
Statement st4=conn.createStatement();
Statement st5=conn.createStatement();
Statement st6=conn.createStatement();
Statement st7=conn.createStatement();
String sunDate="";

int i=1;String sqlcountsun="";
int counthoilday=0,prestday=0;
String empid="",Name="";
String	sqlData="";
String leaveApply="",leaveApprove="";

String cmpDate="",empName="",inTime="",outTime="",uname="";
String diff="";
String sql="select DISTINCT(EmpID) as EmpID,Name,UName FROM t_leaveadmin where  Status='Yes' order by EmpID";
ResultSet rs=st.executeQuery(sql);
//System.out.println("SQL all $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\n"+sql);


while(rs.next())
{ int countw85=0;
  int countwout85=0,countswhoilday=0;;
  int count=0 ;int j=0 ,days=monthdays;
 double daysapplied=0,daysapprove=0;
  System.out.println("days===========================>"+days);
  String startdate=""+year+"-"+mon+"-01";
  String enddate=""+year+"-"+mon+"-"+monthdays+"";
 
	empid=rs.getString("EmpID");
	uname=rs.getString("UName");
	Name=rs.getString("Name");
	System.out.println("======="+i+"========");
	
	//====================== get first checkin date ================
	try{
	    String firstchkin="select checkDate from db_leaveapplication.t_checkinout where EmpID='"+empid+"' and (CheckinType = 'In' or CheckinType = 'OUT') and checkDate between '"+startdate+"' and '"+enddate+"' order by checkDate limit 1 ";
	    ResultSet rsfchkin=st5.executeQuery(firstchkin);
	    System.out.println("firstchkin query  "+firstchkin);
		if(rsfchkin.next())
		{
			startdate=rsfchkin.getString("checkDate");
			days=Integer.parseInt(startdate.substring(startdate.indexOf("-")+4,startdate.lastIndexOf("")));
			//System.out.println("days ----------->"+days);	
		}
		else
		{startdate=enddate;}
	    }catch(Exception e){System.out.println("not get first chechin date"+e);}
	     //System.out.println("Startdate========>"+startdate);
	    
	//=========================================================================
	    
	    
	String sqlpday="SELECT count(DISTINCT(checkDate)) as count,checkDate FROM t_checkinout WHERE `EmpID` ='"+empid+"' AND (CheckinType = 'In' or CheckinType = 'OUT')  and checkDate between '"+startdate+"' and '"+enddate+"'";
	ResultSet rspday=st1.executeQuery(sqlpday);
	while(rspday.next())
	{prestday=rspday.getInt("count");
	 //cmpDate=rspday.getString("checkDate");
	}
	
	//********************* count sunday & hoildays ************
	 	
	for(j=days;j<=monthdays;j++)
	{
	  sqlcountsun="select dayofweek('"+year+"-"+mon+"-"+j+"'),'"+year+"-"+mon+"-"+j+"' as date";
	  ResultSet rs1=st6.executeQuery(sqlcountsun);
	  while(rs1.next())
	  {
		  if(rs1.getInt(1)==1)
		  {count++;
		 // sunDate=rs1.getString("date");
		 // System.out.println("date -->"+sunDate);
		  }
	     
	}
	}
	//  System.out.println("count "+count);
	
	
	String sqlhoilday="select count(*) from t_hoildays where hoildayDate between '"+startdate+"' and '"+enddate+"'";
		//System.out.println("sqlhoilday-------------"+sqlhoilday);
		ResultSet rshday=st2.executeQuery(sqlhoilday);
		if(rshday.next())
		{counthoilday=rshday.getInt(1);
		}
		//System.out.println("counthoilday----------"+counthoilday);
		//*************** hoilday + sundays *****************
		counthoilday=counthoilday+count;
  
	//***********************************************
	
	//*************** get the  working hours***************
		
	    
	   sqlData="select a.EmpID,a.EmpName,a.CheckinDateTime,a.checkDate,a.checkTime,a.CheckinType,a.Office,a.Status,a.EntryComments,b.TypeValue,b.Name "+
		"from t_checkinout a "+
		"inner join( "+
		"select * from "+ 
		"t_leaveadmin "+ 
		"where EmpID='"+empid+"') b "+
		"on(b.EmpID = a.EmpID) "+
		"where checkDate>='"+startdate+"' and checkDate<='"+enddate+"' "+
		"group by checkDate, EmpID";
		
		//System.out.println(sqlData);
		ResultSet rs1=st1.executeQuery(sqlData);
		 String t="",chkin="-",chkout="-";
		while(rs1.next())
		{
				
				
				empName=rs1.getString("Name");
				cmpDate=rs1.getString("checkDate");
		try{		
	            String sql1="SELECT min(CheckinDateTime) as chkInDateTime FROM t_checkinout WHERE CheckinType='IN' and checkDate='"+cmpDate+"' and EmpId='"+empid+"' group by checkDate";
		//System.out.println(sql1);
		ResultSet rs2=st2.executeQuery(sql1);
		if(rs2.next())
		{
	inTime=rs2.getString("chkInDateTime");
	chkin=inTime.substring(11,inTime.length());
	t=inTime.substring(0,10);
	//t=df123.format(df1234.parse(t));
		}
		String sql2="SELECT max(CheckinDateTime) as chkOutDateTime FROM t_checkinout WHERE CheckinType='OUT' and checkDate='"+cmpDate+"' and EmpId='"+empid+"' group by checkDate";
		System.out.println(sql2);
		ResultSet rs3=st2.executeQuery(sql2);
		if(rs3.next())
		{
	outTime=rs3.getString("chkOutDateTime");
	System.out.println("checkouttime "+outTime);
	chkout=outTime.substring(11,outTime.length());	
	
	t=outTime.substring(0,10);
	//t=df123.format(df1234.parse(t));
		}
		
		try
		{
	chkin=chkin.substring(0,5);
		}
		catch(Exception e)
		{
	System.out.println(e);
		}
		try
		{
	chkout=chkout.substring(0,5);
		}
		catch(Exception e)
		{
	System.out.println(e);
		}
		System.out.println("====================================>>"+t+" chackout"+chkout+" and chkin"+chkin);
		
		String sqltdiff="select timeDiff('"+chkout+"','"+chkin+"')";
		//System.out.println(sqltdiff);
		ResultSet rstdiff=st2.executeQuery(sqltdiff);
		while(rstdiff.next())
		{	
		diff=rstdiff.getString(1);
		}
		if(diff==null || diff.equals("null"))
			diff="NA";
		System.out.println("=============Time diff=======================>>"+diff);
		int hrs=0;
		int min=0;
		try{
		hrs=Integer.parseInt(diff.substring(0,diff.indexOf(":")));
		min=Integer.parseInt(diff.substring(diff.indexOf(":")+1,diff.lastIndexOf(":")));
		min=(hrs*60)+min;
		//System.out.println("=============Time diff=======================>>"+hrs+ " "+min);
		}catch(Exception e){System.out.println("");}
		if(min<510 || diff.contains("NA") || diff.equals("null"))
		{ countwout85++;
		}
		else
		{
	      countw85++;
		}
		//if(diff==null || diff.equals("null"))
	//diff="NA";
		chkout="-";
		chkin="-";
		}catch(Exception e){System.out.println("exception in time"+e);}
		
		}		
		
	//*****************************************************
	//@@@@@@@@@@@@@@@@@ get leave applied or approves @@@@@@@@@@@@@@@
	String dateofreporting="",firstdayofleave="";
	try{int mon1=0;
		startdate=""+year+"-"+mon+"-01";
	String sqlleave="select firstdayofleave,dateofreporting,daysapplied from t_leaverequest where emailid='"+uname+"' and "+
					"(status='Pending' or status='Accepted') and `inserteddatetime` between '"+startdate+"' and '"+enddate+"' order by firstdayofleave desc";
	ResultSet rslev=st3.executeQuery(sqlleave);
	//System.out.println("sqlleave "+sqlleave);
	while(rslev.next())
	{   
		leaveApply=df.format(Double.parseDouble(rslev.getString("daysapplied")));
		//System.out.println("leaveApply----------------->"+leaveApply);
		daysapplied=daysapplied + Double.parseDouble(leaveApply);
		
	}
	//System.out.println("daysapplied----------------->"+daysapplied);
	
	String sqllevApp="select firstdayofleave,dateofreporting,daysapplied from t_leaverequest where emailid='"+uname+"' and status='Accepted' order by firstdayofleave desc";
	ResultSet rslevApp=st4.executeQuery(sqllevApp);
	while(rslevApp.next())
	{
		leaveApprove=df.format(Double.parseDouble(rslevApp.getString("daysapplied")));
		daysapprove=daysapprove+ Double.parseDouble(leaveApply);
	}
	int sandwitchsun=0;	
	String sqlleavepen="select firstdayofleave,dateofreporting,daysapplied from t_leaverequest where emailid='"+uname+"' and "+
			"status='Pending' and `inserteddatetime` between '"+startdate+"' and '"+enddate+"' order by firstdayofleave desc";
	ResultSet rslevPan=st3.executeQuery(sqlleavepen);
		System.out.println("sqlleave "+sqlleavepen);
		while(rslevPan.next())
		{   
		
		firstdayofleave=rslevPan.getString("firstdayofleave");
		dateofreporting=rslevPan.getString("dateofreporting");
		
		System.out.println(firstdayofleave+"========="+dateofreporting);
		int year1=0,month1=0,day1=0;
		int year2=0,month2=0,day2=0;
		
		year1=Integer.parseInt(firstdayofleave.substring(0,4));
		month1=Integer.parseInt(firstdayofleave.substring(5,7));
		day1=Integer.parseInt(firstdayofleave.substring(8,10));
		
		year2=Integer.parseInt(dateofreporting.substring(0,4));
		month2=Integer.parseInt(dateofreporting.substring(5,7));
		day2=Integer.parseInt(dateofreporting.substring(8,10));
		//System.out.println(year1+"========="+month1+"======"+day1);
		if(month1==month2)
		{
			days=day1;
			mon1=day2-1;
		}
		
		for(j=days;j<=mon1;j++)
		{
		  sqlcountsun="select dayofweek('"+year+"-"+mon+"-"+j+"'),'"+year+"-"+mon+"-"+j+"' as date";
		  ResultSet rs2=st6.executeQuery(sqlcountsun);
		  while(rs2.next())
		  {
			  if(rs2.getInt(1)==1)
			  {sandwitchsun++;
			   sunDate=rs2.getString("date");
			   System.out.println("date -->"+sunDate);
			  }
		  }
		}
		Calendar cal=Calendar.getInstance();
		DateFormat df1=new SimpleDateFormat("yyyy-MM-dd");
		cal.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(dateofreporting));
		cal.add(Calendar.DATE,-1);
		//System.out.println("@@@@@@@@@@@@@@@@@@@@@@2 dateofreporting@@@@@@@@@@@@@@@222"+cal.getTime());
		dateofreporting=df1.format(cal.getTime());
		String sqlhoilday1="select count(*) from t_hoildays where hoildayDate between '"+firstdayofleave+"' and '"+dateofreporting+"'";
		//System.out.println("sqlhoilday-------------"+sqlhoilday1);
		ResultSet rshday1=st2.executeQuery(sqlhoilday1);
		if(rshday1.next())
		{countswhoilday=rshday1.getInt(1);
		}
	//	System.out.println("counthoilday----------"+countswhoilday);
		//*************** hoilday + sundays *****************
		countswhoilday=countswhoilday+sandwitchsun;
	//	System.out.println("sandwitchsun==========>"+sandwitchsun);
		}
		counthoilday=counthoilday-countswhoilday;
		
	}
	catch(Exception e)
	{
		System.out.println("exception in  leave result"+e);
	}
	
	
%>

				<tr>
					<td align="right"><div align="right"><%=i++%></div></td>
					<td align="right"><div align="right"><%=empid%></div></td>
					<td sorttable_customkey="20080211131900" align="left"><div
							align="left"><%=Name%></div></td>
					<td align="right"><div align="right"><%=monthdays%></div></td>
					<td align="right"><div align="right"><%=counthoilday%></div></td>
					<td align="right"><div align="right"><%=prestday%></div></td>
					<td align="right"><div align="right"><%=counthoilday+prestday%></div></td>
					<td align="right"><div align="right"><%=countw85%></div></td>
					<td align="right"><div align="right"><%=countwout85%></div></td>
					<td align="right"><div align="right"><%=daysapplied%></div></td>
					<td align="right"><div align="right"><%=daysapprove%></div></td>
					<td align="right"><div align="right"><%=countswhoilday%></div></td>


				</tr>
				<%
}


}
catch(Exception e)
{System.out.println("error "+e);
}
%>
				<tr></tr>

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
