<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String state=request.getParameter("state");
String employee=request.getParameter("emp");
String sqlhomework="";

Statement sthomework=null;

sthomework=conn.createStatement();
ResultSet rshomework=null;
if(state.equalsIgnoreCase("true")){
sqlhomework="update t_leaveadmin set IsWorkFromHome='Yes' where Name='"+employee+"'";
}else
{
	sqlhomework="update t_leaveadmin set IsWorkFromHome='No' where Name='"+employee+"'";
}
System.out.println("sqlhomework ======="+sqlhomework);
sthomework.execute(sqlhomework);
%>
</body>
</html>