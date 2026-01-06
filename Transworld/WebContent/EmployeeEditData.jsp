<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.ResultSet"%><html>
<head>
</head>
<body>
	<%
String sendMsg="";
try
{
Statement st1=conn.createStatement();

String cmpCode=request.getParameter("cmpName");
String deptName=request.getParameter("deptName");
String empName=request.getParameter("empName");
String empDesg=request.getParameter("empDesg");
String fName=request.getParameter("fName");
String mName=request.getParameter("mName");
String lName=request.getParameter("lName");
String email=request.getParameter("email");
int twEmp=Integer.parseInt(session.getAttribute("empID").toString());
System.out.println("==="+cmpCode+"===="+deptName+"====="+empName+"====="+empDesg+"======"+fName+"==="+mName+"==="+lName+"=="+email);//+underDept+"====="+hod+"===");

int ct=0;
String CompCode="",DeptCode="",EmpCode="";
String delims12 = "[,]";
String[] tokensEmail = empName.split(delims12);
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

String sql123="update t_employee set Empemail='"+email+"', designation='"+empDesg+"', FirstName='"+fName+"', MiddleName='"+mName+"', LastName='"+lName+"', TWEmpID="+twEmp+" where CompanyCode="+CompCode+" and DeptID="+DeptCode+" and EmpID="+EmpCode+"";
st1.executeUpdate(sql123);

sendMsg="Employee Edited Successfully";
}
catch(Exception e)
{
	e.printStackTrace();
	sendMsg="Please Try Again";
}
finally
{
	conn.close();
	response.sendRedirect("EmployeeEditForm.jsp?sendMsg="+sendMsg);
}
%>
</body>
</html>