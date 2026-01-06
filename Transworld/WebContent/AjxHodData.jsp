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
	String DeptCode="",CompCode="";
	String deptCode=request.getParameter("deptCode");
	System.out.println("deptCode====================>>>>>"+deptCode);
	
	int ct=0;
	String delims12 = "[,]";
	String[] tokensEmail = deptCode.split(delims12);
	for(String t : tokensEmail)
	{
		if(ct==0)
		{
			DeptCode=t;
		}
		else
		{
			CompCode=t;
		}
		ct++;
		
	}
	try
	{
		String sqlHOD1="select EmpID, EmpName from t_employee "+
					 "where `EmpID`=(select `HODId` from t_department where `ComapanyCode`="+CompCode+" and `DeptCode`="+DeptCode+")";
		String sqlHOD="select * from t_employee a "+
			"inner join( "+
					"select ComapanyCode, DeptCode from t_department "+ 
					"where DeptCode="+DeptCode+" and ComapanyCode="+CompCode+") b "+
					"ON (a.CompanyCode=b.ComapanyCode) "+
					"where a.designation='hod' ";
		ResultSet rsHOD=st1.executeQuery(sqlHOD1);
		
		while(rsHOD.next())
		{
			%>
	<option value="<%=rsHOD.getInt("EmpID") %>">
		<%=rsHOD.getString("EmpName") %>
	</option>
	<%
		}
	}
	catch(Exception e1)
	{
		System.out.println("Exception------------->>"+e1);
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

