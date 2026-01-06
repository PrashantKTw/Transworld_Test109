<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" errorPage=""%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<body>
	<form method="post">
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
	String usernameDiary=rst.getString("DSUser");
	String passDiary="";
	System.out.println("\n Diary user-->>"+usernameDiary);
	System.out.println(" Diary pass-->>"+passDiary);

	String query="select * from db_CustomerComplaints.t_admin where UName='"+usernameDiary+"' and Active='Yes'";
	System.out.println("\n\n check query--->>"+query);
	ResultSet rs=st1.executeQuery(query);
	if(rs.next())
	{
		passDiary=rs.getString("pass");
		System.out.println("\n diary system user-->>"+usernameDiary);
		System.out.println(" diary system pass-->>"+passDiary);
	
	String url="http://www.myfleetview.com/DiarySystem/login.jsp?loginid="+usernameDiary+"&pass="+passDiary+"";
	System.out.println("url--->>>"+url);
	response.sendRedirect("http://www.myfleetview.com/DiarySystem/login.jsp?loginid="+usernameDiary+"&pass="+passDiary+"");
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