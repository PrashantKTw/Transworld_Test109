<%@ page language="java"%>
<%@ include file="headConn.jsp"%>

<%


System.out.println("CONTROL INSIDE AJAX OF HODID--------->>");

Statement st=conn.createStatement();
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
try
{
	
	String deptid="-",hodid="-",unamemailid="";
	String empid=request.getParameter("empid");
	
	
	
	System.out.println("-------empid-->>"+empid);
	
	String buffer="#";
	String dt="";
	int a=0;
	String s="select ReportingtoHod   from  t_leaveadmin  where empid='"+empid+"'  and status='Yes'  ";
	ResultSet rs=st.executeQuery(s);
	System.out.println("-------s->>"+s);
	if(rs.next())
	{
		deptid=rs.getString("ReportingtoHod");
		
		
	}
	
	System.out.println("-------deptid->>"+deptid);
	
	
	/*
	
	String s1="select DeptCode   from  t_department  where DeptCode='"+deptid+"' ";
	ResultSet rs1=st1.executeQuery(s1);
	System.out.println("-------s1->>"+s1);
	if(rs1.next())
	{
		hodid=rs1.getString("DeptCode");
		
		
	}
	
	*/
	System.out.println("-------hodid->>"+hodid);
	
	String s2="select UName   from  t_leaveadmin  where EmpID='"+deptid+"' ";
	ResultSet rs2=st2.executeQuery(s2);
	System.out.println("-------s2->>"+s2);
	if(rs2.next())
	{
		unamemailid=rs2.getString("UName");
		
		
	}
	
	System.out.println("-------unamemailid->>"+unamemailid);
	
	
	
	
	out.print(unamemailid+"#");
	System.out.println("--------->>"+buffer);
	
	conn.close();
}
catch(Exception e)
{
	System.out.println("Excepton---AjxChkInOutDept--->>"+e);
}


%>