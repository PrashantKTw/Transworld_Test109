
<%@ include file="headConn.jsp"%>
<%
 try
 {
	 String dept=request.getParameter("deptName");
	 Statement stmt=conn.createStatement();
	 String deptEmp="";
	 String sqlQry="select distinct(Name) as EmpName from t_leaveadmin where TypeValue='"+dept+"' order by EmpName asc";
	 ResultSet rs=stmt.executeQuery(sqlQry);
	 while(rs.next())
	 {
		 deptEmp=rs.getString("");
	 }
 }
 catch(Exception e)
 {
	 System.out.println("Exception Ajaxinward========>>"+e);
 }
 %>