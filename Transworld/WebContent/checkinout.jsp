<%@ include file="header.jsp"%>
<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>


	<p></p>
	<p></p>
	<%
String clientip="";
clientip=request.getRemoteAddr();
//clientip="121.247.3.130"; 



System.out.println(clientip);
//out.println(clientip);
//Class.forName(MM_dbConn_DRIVER);
//Connection conn,conn1;
Statement st,st1,st2,st3,st4;
//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
st4=conn.createStatement();
java.util.Date d= new java.util.Date();

String username=session.getAttribute("email").toString();
String empid=session.getAttribute("empID").toString();

String type=request.getParameter("type");
System.out.println(type);
//out.println(d);
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
//out.println(datetoday);

DateFormat df1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String s1=df1.format(d);
String tdate=s1.substring(0,10);
String ttime=s1.substring(11,s1.length());

//*****get default in time*************************************************************
	boolean lateMark=false;
	String defTime=""; 
	String sqlDef="select ReportTime from t_leaveadmin where EmpID='"+empid+"'";
	ResultSet rsDef=st4.executeQuery(sqlDef);
	if(rsDef.next())
	{
		defTime=rsDef.getString("ReportTime");
	}
	
	java.util.Date fdd=new SimpleDateFormat("HH:mm:ss").parse(defTime);
 //   long miliseconds1=fdd.getTime()+900000;
 	long miliseconds1=fdd.getTime();
	
    String sdf1=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
    java.util.Date fdd1=new SimpleDateFormat("HH:mm:ss").parse(sdf1);
    long miliseconds2=fdd1.getTime();
    if(miliseconds2>miliseconds1)
    {
    	lateMark=true;
    }
    
    System.out.println("++++++++++++++++++++++++"+lateMark);
//*************************************************************************************

String sql1="select * from t_serverip where IP='"+clientip+"'";
ResultSet rs=st1.executeQuery(sql1);
if(rs.next())
{
	String office="";
	office=rs.getString("Office");
	System.out.println(office);
	if("IN".equalsIgnoreCase(type) && lateMark==false)
	{
		String sql="insert into t_checkinout(EmpID,EmpName,CheckinType,CheckinDateTime,checkDate,checkTime,Office) values ('"+empid+"','"+username+"','IN','"+s1+"','"+tdate+"','"+ttime+"','"+office+"')";
		int i=0;
		i=st.executeUpdate(sql);
		if(i>0)
		{
				response.sendRedirect("alert.jsp?IP=Checked IN successfully..");
		}
		else
		{
			response.sendRedirect("alert.jsp?IP=Oopss! Error occured..Please try again..");
		}
	}
	else if("OUT".equalsIgnoreCase(type))
	{
		String sql="insert into t_checkinout(EmpID,EmpName,CheckinType,CheckinDateTime,checkDate,checkTime,Office) values ('"+empid+"','"+username+"','OUT','"+s1+"','"+tdate+"','"+ttime+"','"+office+"')";
		int i=0;
		i=st.executeUpdate(sql);
		if(i>0)
		{
			response.sendRedirect("alert.jsp?IP=Checked OUT successfully..");
		}
		else
		{
			response.sendRedirect("alert.jsp?IP=Oopss! Error occured..Please try again..");
		}
	}
	else if("PASS".equalsIgnoreCase(type))
	{
		String sql="insert into t_checkinout(EmpID,EmpName,CheckinType,CheckinDateTime,checkDate,checkTime,Office) values ('"+empid+"','"+username+"','PASS','"+s1+"','"+tdate+"','"+ttime+"','"+office+"')";
		int i=0;
		i=st.executeUpdate(sql);
		if(i>0)
		{
			response.sendRedirect("alert.jsp?IP=PASS successfully..");
		}
		else
		{
			response.sendRedirect("alert.jsp?IP=Oopss! Error occured..Please try again..");
		}
	}
	else if("IN".equalsIgnoreCase(type) && lateMark==true)
	{
		%>
	<form method="post" action="reasonForLate.jsp" name="reasonLate">
		<table bgcolor="#E0DDFE" border="0" height="200" width="500"
			align="center">
			<tr>
				<td><font color="#990000">Please enter reason for not
						CHECK <%=type%> in Time
				</font></td>
			</tr>
			<tr>
				<td>
					<table bgcolor="white" border="0" height="100" width="450"
						align="center">
						<tr>
							<td><b>Reason</b></td>
							<td><input type="text" name="reason" id="reason"> <input
								type="hidden" name="type" id="type" value="<%=type%>"> <input
								type="hidden" name="ip" id="ip" value="<%=clientip%>"></td>
						</tr>
						<tr>
							<td align="center"><input type="submit" value="Submit" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%
	}
	else
	{
	}
}
else
{
	%>
	<form method="post" action="insertreason.jsp" name="reason">
		<table bgcolor="#E0DDFE" border="0" height="200" width="500"
			align="center">
			<tr>
				<td><font color="#990000">Please enter reason for not
						CHECK <%=type%> from office
				</font></td>
			</tr>
			<tr>
				<td>
					<table bgcolor="white" border="0" height="100" width="450"
						align="center">
						<tr>
							<td><b>Reason</b></td>
							<td><input type="text" name="reason" id="reason"> <input
								type="hidden" name="type" id="type" value="<%=type%>"> <input
								type="hidden" name="ip" id="ip" value="<%=clientip%>"></td>
						</tr>
						<tr>
							<td align="center"><input type="submit" value="Submit" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%
	
	//response.sendRedirect("alert.jsp?IP=You are log in on "+clientip+" address.Entry cannot be possible, You are Our off Office");
}

%>
</body>
</html>