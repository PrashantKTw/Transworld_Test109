<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

Statement st=conn.createStatement();
Statement st1=conn.createStatement();
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
	String usernamesiteadmin=rst.getString("SAUser");
	String passsiteadmin="";
	System.out.println("\n siteadmin user-->>"+usernamesiteadmin);
	System.out.println(" siteadmin pass-->>"+passsiteadmin);

	String query="select * from db_gps.t_security where Username='"+usernamesiteadmin+"'";
	ResultSet rs=st1.executeQuery(query);
	if(rs.next())
	{
		passsiteadmin=rs.getString("Password");
		System.out.println("\n site admin user-->>"+usernamesiteadmin);
		System.out.println(" site pass-->>"+passsiteadmin);
	
		String url="http://www.myfleetview.com/siteadmin/login.jsp?username="+usernamesiteadmin+"&pass="+passsiteadmin+"";
		System.out.println("url--->>>"+url);
		response.sendRedirect("http://www.myfleetview.com/siteadmin/login.jsp?username="+usernamesiteadmin+"&pass="+passsiteadmin+"");
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
