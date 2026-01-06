<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%Statement st1=conn.createStatement();%>
<%
try
{
	String dt1=request.getParameter("deptEmp");
	
	String dept="",cmp="";
	int ct=0;
	String delims12 = "[,]";
	String[] tokensEmail = dt1.split(delims12);
	for(String t : tokensEmail)
	{
		if(ct==0)
		{
			dept=t;
		}
		else
		{
			cmp=t;
		}
		ct++;
		
	}
	
	String sql1="select * from t_employee where CompanyCode="+cmp+" and DeptID="+dept+"";
	ResultSet rs1=st1.executeQuery(sql1);
	while(rs1.next())
	{
		%>
<option
	value="<%=rs1.getInt("CompanyCode")+","+rs1.getInt("DeptID")+","+rs1.getInt("EmpID")%>">
	<%=rs1.getString("EmpName") %>
</option>
<%
	}
}
catch(Exception e)
{
	System.out.println("Exception------------>>"+e);
}
%>
