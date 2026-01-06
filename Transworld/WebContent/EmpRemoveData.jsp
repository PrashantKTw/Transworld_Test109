<%@ page language="java"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>

	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
%>
	<%
String empId=request.getParameter("empId");
String empName=request.getParameter("empName");
String cmpCode=request.getParameter("cmpName");
String deptId=request.getParameter("deptName");
String email=request.getParameter("email");
String desg=request.getParameter("empDesg");
String fName=request.getParameter("fName");
String mName=request.getParameter("mName");
String lName=request.getParameter("lName");
String sendMsg="";
try
{
	
	System.out.println(empId+"==="+empName+"===="+cmpCode+"==="+deptId+"==="+email+"====="+desg+"====="+fName+"====="+mName+"====="+lName+"====");
    String SqlUpdate="UPDATE t_leaveadmin SET Status ='No' WHERE EmpID='"+empId+"' limit 1 ";
    System.out.println(SqlUpdate);
	st1.executeUpdate(SqlUpdate);
	//sendMsg="Employee Deactivated Successfully";
}
catch(Exception e)
{
	System.out.println("----->>"+e);
	e.printStackTrace();
	//sendMsg="Please try again";
	response.sendRedirect("alertGoTo.jsp?msg=Please try again?  &goto=LeftEmployeeRemoval.jsp");
}
finally
{
	conn.close();
	//response.sendRedirect("LeftEmployeeRemoval.jsp?sendMsg="+sendMsg);
	response.sendRedirect("alertGoTo.jsp?msg=Employee Deactivated Successfully!! &goto=LeftEmployeeRemoval.jsp");
}
%>
</body>
</html>