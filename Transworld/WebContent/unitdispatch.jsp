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
	String usernameunitdispatch=rst.getString("UDUser");
	String passunitdispatch="";
	System.out.println("\n unitdispatch user-->>"+usernameunitdispatch);
	System.out.println(" unitdispatch pass-->>"+passunitdispatch);

	String query="select * from t_admin where UName='"+usernameunitdispatch+"' and Active='Yes' ";
	//String query="select * from db_gps.t_security where Username='"+usernameunitdispatch+"'";
	ResultSet rs=st1.executeQuery(query);
	if(rs.next())
	{
		passunitdispatch=rs.getString("pass");
		System.out.println("\n unitdispatch user-->>"+usernameunitdispatch);
		System.out.println(" unitdispatch pass-->>"+passunitdispatch);
	
	String url="http://www.myfleetview.com//UnitDispatch/usrvalidtn.jsp?uname="+usernameunitdispatch+"&adpass="+passunitdispatch+"";
	System.out.println("url--->>>"+url);
	response.sendRedirect("http://www.myfleetview.com//UnitDispatch/usrvalidtn.jsp?uname="+usernameunitdispatch+"&adpass="+passunitdispatch+"");
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
</form></body></head></html>