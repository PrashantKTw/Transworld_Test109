<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<%@ include file="headConn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

Statement st=conn.createStatement();
Statement st1=conn.createStatement();
String username=request.getParameter("username");
String pass=request.getParameter("pass");
String IsWorkFromHome="";
try
{
session.setAttribute("empPswd",pass);
PreparedStatement psql=conn.prepareStatement("select * from t_leaveadmin where UName=? and binary pass=? and Status=?");
/* PreparedStatement psql=conn.prepareStatement("select * from t_leaveadmin where UName=? and binary pass=? "); */
psql.setString(1, username);
psql.setString(2, pass);
psql.setString(3, "Yes");

/* 
String sql="select * from t_leaveadmin where UName='"+username+"' and pass='"+pass+"' and Status='Yes'";
System.out.println(sql); */
ResultSet rst = psql.executeQuery();
if(rst.next())
{
	
	session.setAttribute("username",username);
	session.setAttribute("pass",pass);
	session.setAttribute("empname",rst.getString("Name"));
	session.setAttribute("email",rst.getString("Email"));
	session.setAttribute("emprole",rst.getString("URole"));
	session.setAttribute("empdept",rst.getString("TypeValue"));
	session.setAttribute("empID",rst.getString("EmpID"));
	session.setAttribute("ReportingtoHod",rst.getString("ReportingtoHod"));
	session.setAttribute("IsWorkFromHome",rst.getString("IsWorkFromHome"));
	response.sendRedirect("commonLogin.jsp");
	return;
}
else
{
	response.sendRedirect("index.jsp?err=err1");
	return;
}
}catch(Exception e)
{
	out.print("Exception--->"+e);
	System.out.print("Validation Exception--->"+e);
}
finally{
	conn.close();
}
%>
