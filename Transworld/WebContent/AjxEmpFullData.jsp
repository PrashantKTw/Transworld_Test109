<%@ page language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="headConn.jsp"%>

<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
%>
<%
try
{
	System.out.println("In AjxEMpData");
	String buffer="";
	String EmpName=request.getParameter("EmpName");
	String SqlEmp="";
	SqlEmp="select * from t_leaveadmin as a inner join t_employee as b on a.EmpID=b.EmpID where Name='"+EmpName+"' and a.Status='Yes' limit 1";
	ResultSet rsEmp=st1.executeQuery(SqlEmp);
	System.out.println(SqlEmp);
	while(rsEmp.next())
	{
		buffer+="##"+rsEmp.getString("a.EmpID");
		buffer+="##"+rsEmp.getString("b.FirstName");
		buffer+="##"+rsEmp.getString("b.MiddleName");
		buffer+="##"+rsEmp.getString("b.LastName");
		buffer+="##"+rsEmp.getString("a.Email");
	}
	out.println(buffer);
	System.out.println(buffer);
	
}
catch(Exception e)
{
	out.print("##noting");
	System.out.println("Exception------------->>"+e);
}
finally
{
	conn.close();
}
%>




