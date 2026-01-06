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

String name=request.getParameter("name");
out.println("name"+name);
System.out.println("EmpName==========>>"+name);
String srno=request.getParameter("srno");
out.println("srno"+srno);
String typeofleave="";

//String typevalue=session.getAttribute("typeval").toString();
String typevalue=session.getAttribute("empdept").toString();
//out.println("typevalue-->"+typevalue);
Boolean innerflag=false;
//Class.forName(MM_dbConn_DRIVER);
//Connection conn,conn1;
Statement st,st1,st2,st3;

//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD); 
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
java.util.Date d= new java.util.Date();
out.println(d);
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
out.println(datetoday);
Boolean flag=false;
String sql="update t_leaveadmin set Status='No' where Name='"+name+"'";
out.println("sql rmv updt=======>"+sql);

int i=st.executeUpdate(sql);
if(i>0){
	out.println("leave added");
	response.sendRedirect("removeEmployee.jsp?inserted=yes");
}

%>
</body>
</html>