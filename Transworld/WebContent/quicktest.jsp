<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<%@ include file="headConn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><body><form method="post">
<%!
Connection myconn=null;

%>
<%

String DB_Driver="com.mysql.cj.jdbc.Driver";
String DB_NAME="jdbc:mysql://62.72.42.109:3307/db_CustomerComplaints";
String DB_USERNAME="erp";
String DB_PASSWORD="1@erp";

Class.forName(DB_Driver);
myconn=DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);



Statement st=conn.createStatement();
Statement st1=myconn.createStatement();
String username=session.getAttribute("username").toString();
String pass=session.getAttribute("pass").toString();
try
{
session.setAttribute("empPswd",pass);
String sql="select * from t_leaveadmin where UName='"+username+"' and pass='"+pass+"' and Status='Yes'";
System.out.println("\n\n qqqqqqq--->>"+sql);
ResultSet rst = st.executeQuery(sql);
if(rst.next())
{
	String usernamequicktest=rst.getString("QTUser");
	String passquicktest="";
	System.out.println("\n quicktest user-->>"+usernamequicktest);
	System.out.println(" quicktest pass-->>"+passquicktest);

	String query="select * from t_admin where UName='"+usernamequicktest+"' and Active='Yes' ";
	ResultSet rs=st1.executeQuery(query);
	if(rs.next())
	{
		passquicktest=rs.getString("pass");
		System.out.println("\n unitdispatch user-->>"+usernamequicktest);
		System.out.println(" unitdispatch pass-->>"+passquicktest);
	
	String url="http://www.myfleetview.com//QuickTest/usrvalidtn.jsp?uname="+usernamequicktest+"&adpass="+passquicktest+"";
	System.out.println("url--->>>"+url);
	response.sendRedirect("http://www.myfleetview.com//QuickTest/usrvalidtn.jsp?uname="+usernamequicktest+"&adpass="+passquicktest+"");
	return;}
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
</form></body></head></html>
