<%@ include file="headConn.jsp"%>
<%@page import="java.sql.ResultSet"%><%@ page language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Statement st1=conn.createStatement();

String allData=request.getParameter("allData");
try{
/*
int ud1=0;
int ct=0;
String CompCode="",DeptCode="",EmpCode="";
String delims12 = "[,]";
String[] tokensEmail = allData.split(delims12);
for(String t : tokensEmail)
{
	if(ct==0)
	{
		CompCode=t;
	}
	else if(ct==1)
	{
		DeptCode=t;
	}
	else
	{
		EmpCode=t;
	}
	ct++;
}
	String sql1="select * from t_employee where CompanyCode="+CompCode+" and DeptID="+DeptCode+" and EmpID="+EmpCode+"";
	ResultSet rs1=st1.executeQuery(sql1);
	while(rs1.next())
	{
		
	}*/
}
catch(Exception e)
{
	e.printStackTrace();
}
%>