<%@ include file="headConn.jsp"%>
<%!
//Connection con1=null;
ResultSet rs1=null;

%>

<% 
try
{
System.out.println("Inside duplicate");

System.out.println("Inside duplicate12-->"+conn);
Statement stmt1=conn.createStatement();

String sql1="";
boolean flag=false;
String deptName=request.getParameter("deptName");
String cmpName=request.getParameter("cmpName");



	System.out.println("IN cmpName"+cmpName+"connection"+conn+"deptname"+deptName);
	sql1="SELECT * from t_department where ComapanyCode  ='"+cmpName+"' and  DeptName='"+deptName+"' ";
	rs1=stmt1.executeQuery(sql1);
	System.out.println(" select queryy--->"+sql1);
	String buffer="no";
	//int i=1;
	while(rs1.next())
	{
		buffer="yes";
	}
	out.print(buffer);



}
catch(Exception e) 
{
	System.out.println("AjaxDuplicatedeptname.jsp error  table > "+e);
	out.println("no");
}
finally
{
conn.close();
}
%>