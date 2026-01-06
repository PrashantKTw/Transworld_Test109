<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<%@ include file="header.jsp"%>



<%
try {
//	Connection conn,conn1;
	Statement st,st1,st2,st3;
	
//	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
String sql1="";
String user="", pass="";
int i=0;

user=session.getAttribute("email").toString();

pass=request.getParameter("newpass");
out.print(pass);

sql1="update t_leaveadmin set pass='"+pass+"' where UName='"+user+"' ";

st.executeUpdate(sql1);


response.sendRedirect("newpassword.jsp?changed=yes");
return;

 } catch(Exception e) { out.println("Exception----->" +e); }

finally
{

}
%>
