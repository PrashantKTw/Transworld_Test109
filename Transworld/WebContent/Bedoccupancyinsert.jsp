<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
    <%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%!Connection conn=null; %>
<%

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
//conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","fleetview","F@5a<I86");
conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/db_leaveapplication","erp","1@erp");
}
catch(Exception e)
{
	System.out.println("Exception=========>>"+e);
}
%>
<%


Boolean innerflag=false;
// Class.forName(MM_dbConn_DRIVER);
//Connection conn,conn1;
Statement st,st1,st2,st3;

//conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
String date=request.getParameter("data2");
System.out.println("date---->"+date);
String ward=request.getParameter("ward");
System.out.println("ward---->"+ward);
String avail=request.getParameter("avail");
System.out.println("avail----->"+avail);
String occupy=request.getParameter("occupy");
System.out.println("occupy------>"+occupy);
String id1=request.getParameter("id");
System.out.println("id------>"+id1);

//java.util.Date d= new java.util.Date();
//out.println(d);
//String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
///out.println(datetoday);
String anotherdate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date));
try
{
	String olddate="",oldWard="",oldavail="",oldOccupancy="";
String sqlchk="select * from db_twetl.t_bedoccupancy where WardType='"+ward+"' and TheDate='"+anotherdate+"'";
ResultSet rs=st3.executeQuery(sqlchk);
System.out.println("sql--->"+sqlchk);
if(rs.next())
{
	olddate=rs.getString("TheDate");
	oldWard=rs.getString("WardType");
	oldavail=rs.getString("Availabilty");
	oldOccupancy=rs.getString("Occupancy");
	
	String upadte="update db_twetl.t_bedoccupancy set TheDate='"+anotherdate+"',WardType='"+ward+"',Availabilty='"+avail+"',Occupancy='"+occupy+"' where TheDate='"+olddate+"' and WardType='"+oldWard+"' and Availabilty='"+oldavail+"' and  Occupancy='"+oldOccupancy+"'";
	st2.executeUpdate(upadte);
	System.out.println("sql--->"+upadte);
}

else
{
String sql="insert into db_twetl.t_bedoccupancy(TheDate,WardType,Availabilty,Occupancy) values ('"+anotherdate+"','"+ward+"','"+avail+"','"+occupy+"')";
//System.out.println("sql--->"+sql);
st1.executeUpdate(sql);
System.out.println("sql--->"+sql);
}

response.sendRedirect("Bedoccupancy.jsp?message=Record saved successfully");
}
catch(Exception e)
{
	e.printStackTrace();
}
		
		       



%>
</body>
</html>