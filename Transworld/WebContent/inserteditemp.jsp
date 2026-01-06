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
String confirm=request.getParameter("confirm");
out.println("confirm"+confirm);

String name=request.getParameter("name");
out.println("name"+name);
String username=request.getParameter("username");
out.println("username"+username);
String pass=request.getParameter("pass");
out.println("pass"+pass);
String reason=request.getParameter("reason");
out.println("reason"+reason);
String reason11=request.getParameter("reason11");
String empid=request.getParameter("empid");
out.println("reason11"+reason11);
String typeofleave="";
System.out.println("=="+name+"=="+username+"=="+pass+"=="+reason+"=="+reason11+"==="+empid+"====");


//out.println("typevalue-->"+typevalue);
Boolean innerflag=false;
//Class.forName(MM_dbConn_DRIVER);
//Connection conn,conn1;
Statement st=null,st1=null,st2=null,st3=null;
//conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
java.util.Date d= new java.util.Date();
out.println(d);
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
out.println(datetoday);
Boolean flag=false;
String sql1="select * from db_leaveapplication.t_leaveadmin where UName='"+username+"'";
System.out.println(sql1);
ResultSet rs=st1.executeQuery(sql1);
if(rs.next()){
	String emid=rs.getString("EmpID");
	if(emid.equalsIgnoreCase("emid")){
		String sql="update t_leaveadmin set empid='"+empid+"',Name='"+name+"',URole='"+reason+"',TypeValue='"+reason11+"' where UName='"+username+"' ";
		System.out.println("sql--->"+sql);
		int i=0;
		i=st.executeUpdate(sql);
		if(i>0){
			out.println("leave added");
			response.sendRedirect("editEmployee.jsp?inserted=yes");
		}else{
			response.sendRedirect("editEmployee.jsp?inserted=no");
		}
	}else{
		String sql11="select * from t_leaveadmin where EmpID='"+empid+"' ";
		ResultSet rs1=st2.executeQuery(sql11);
		if(rs1.next()){
			response.sendRedirect("editEmployee.jsp?already=yes");
		}else{
			String sql="update t_leaveadmin set empid='"+empid+"',Name='"+name+"',URole='"+reason+"',TypeValue='"+reason11+"' where UName='"+username+"' ";
			System.out.println("sql--->"+sql);
			int i=0;
			i=st.executeUpdate(sql);
			if(i>0){
				out.println("leave added");
				response.sendRedirect("editEmployee.jsp?inserted=yes");
			}else{
				response.sendRedirect("editEmployee.jsp?inserted=no");
			}
		}
		
	}
}else{
	response.sendRedirect("editEmployee.jsp");
}
%>
</body>
</html>