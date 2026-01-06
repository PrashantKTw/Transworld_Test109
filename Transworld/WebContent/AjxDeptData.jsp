<%@ page language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="headConn.jsp"%>
<html>
<head>
</head>
<body>
	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
%>
	<%
try
{
	String cmpCode=request.getParameter("cmpCode");
	//String deptname=request.getParameter("deptname");
	long cmpCd=Long.parseLong(cmpCode);
	String sqlDept="select * from t_department where ComapanyCode="+cmpCd+" and DeptName not in('MD', 'Devlopment') ORDER BY `DeptName` ASC";
	ResultSet rsDept=st1.executeQuery(sqlDept);
	%><option value="select">Select</option>
	<%
	while(rsDept.next())
	{ 
		%>
	<option value="<%=rsDept.getInt("DeptCode")+","+cmpCd %>">
		<%=rsDept.getString("DeptName") %>
	</option>
	<%
	}
	
	conn.close();
}
catch(Exception e)
{
	System.out.println("Exception------------->>"+e);
}
%>



</body>
</html>