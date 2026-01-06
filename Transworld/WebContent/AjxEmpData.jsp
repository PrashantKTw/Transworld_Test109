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
	System.out.println("In Emp Ajax");
	String EmpDept=request.getParameter("EmpDept");
	String desg=request.getParameter("desg");
	System.out.println(">>>>>desg:"+desg);
	String dept="";
	System.out.println(">>Dept"+EmpDept);
	//*********************************************************
	ArrayList s1=new ArrayList();
	String delims12 = "[,]";
			    String[] tokens12 = EmpDept.split(delims12);
				for (String t : tokens12)
				{
					System.out.println(t);
					s1.add(t);
				}
	//*********************************************************
	String sqlDpt="select DeptName from t_department where DeptCode='"+s1.get(0)+"' and ComapanyCode='"+s1.get(1)+"' ";
	ResultSet rsDpt=st2.executeQuery(sqlDpt);
	System.out.println(">>>>>>>>>sqlDpt:"+sqlDpt);
	while(rsDpt.next())
	{
		dept=rsDpt.getString("DeptName");
	}
	//*********************************************************
	String sqlEmp="select distinct(Name) from t_leaveadmin where TypeValue='"+dept+"' and Status='Yes' and URole='"+desg+"' ";
	ResultSet rsEmp=st1.executeQuery(sqlEmp);
	System.out.println(sqlEmp);
	%>
	<option value="Select">Select</option>
	<%
	while(rsEmp.next())
	{
		%>
	<option value="<%=rsEmp.getString("Name") %>">
		<%=rsEmp.getString("Name") %>
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