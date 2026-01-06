<%@ page
	import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@ include file="header.jsp"%>

<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%

String reason=request.getParameter("reason");
System.out.println("reason"+reason);
String type=request.getParameter("type");
System.out.println("type"+type);
String ip=request.getParameter("ip");
System.out.println("ip"+ip);

//Class.forName(MM_dbConn_DRIVER);
//Connection conn,conn1;
Statement st,st1,st2,st3;
//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
java.util.Date d= new java.util.Date();

DateFormat df1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String s1=df1.format(d);
String tdate=s1.substring(0,10);
String ttime=s1.substring(11,s1.length());


String username=session.getAttribute("email").toString();
String empid=session.getAttribute("empID").toString();

out.println(d);
reason=reason.replace("\'","\\'");
String sql="insert into t_checkinout(EmpID,EmpName,CheckinType,CheckinDateTime,checkDate,checkTime,Office,Status,EntryComments) values ('"+empid+"','"+username+"','"+type+"','"+s1+"','"+tdate+"','"+ttime+"','"+ip+"','NotApproved','"+reason+"')";
out.println("sql--->"+sql);
int i=st.executeUpdate(sql);
if(i>0){
	out.println("leave added");
	response.sendRedirect("alert.jsp?IP=CKECk "+type+" successfully from other ip");
}

%>
</body>
</html>