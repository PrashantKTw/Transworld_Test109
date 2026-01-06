<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<body>
	<form method="post">
		<%!
Connection myconn=null;

%>
		<%

String DB_Driver="com.mysql.cj.jdbc.Driver";
String DB_NAME="jdbc:mysql://62.72.42.109:3307/twsql_twalldata";
String DB_USERNAME="erp";
String DB_PASSWORD="1@erp";
try
{
Class.forName(DB_Driver);
myconn=DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
}
catch(Exception e)
{
	System.out.println("Exception ERp Connection:"+e);
}
Statement st=null,st1=null;
String username="",pass="";
try
{
	st=conn.createStatement();
	st1=myconn.createStatement();
	 username=session.getAttribute("username").toString();
	 pass=session.getAttribute("pass").toString();	
}
catch(Exception e)
{
	System.out.println("Exception Session parameter:"+e);
}

try
{

session.setAttribute("empPswd",pass);
String sql="select * from t_leaveadmin where UName='"+username+"' and pass='"+pass+"' and Status='Yes'";
System.out.println("\n\n qqqqqqq--->>"+sql);
ResultSet rst = st.executeQuery(sql);
if(rst.next())
{
	String usernameERP=rst.getString("ERPUser");
	String passERP="";
	System.out.println("\n ERP user-->>"+usernameERP);
	System.out.println(" ERP pass-->>"+passERP);

	String query="select * from twsql_twalldata.t_security where Username='"+usernameERP+"'";
	System.out.println("\n\n check query--->>"+query);
	ResultSet rs=st1.executeQuery(query);
	if(rs.next())
	{
		passERP=rs.getString("Password");
		System.out.println("\n ERP user-->>"+usernameERP);
		System.out.println(" ERP pass-->>"+passERP);
	
	String url="http://www.myfleetview.com/ERP/login.jsp?username="+usernameERP+"&pass="+passERP+"";
	System.out.println("url--->>>"+url);
	response.sendRedirect("http://www.myfleetview.com/ERP/login.jsp?username="+usernameERP+"&pass="+passERP+"");
	return;
	}
	else
	{
		response.sendRedirect("alertGoTo.jsp?msg=You Dont have Access to this System  &goto=commonLogin.jsp");
		return;
	}
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
	</form>
</body>
</head>
</html>