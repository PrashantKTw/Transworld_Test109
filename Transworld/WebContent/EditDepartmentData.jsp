<%@page import="com.sun.org.apache.bcel.internal.generic.GOTO"%>

<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<%
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
Statement st9=conn.createStatement();
Statement st10=conn.createStatement();
Statement st11=conn.createStatement();
Statement st12=conn.createStatement();
Statement st13=conn.createStatement();
Statement st14=conn.createStatement();
Statement st15=conn.createStatement();
Statement st16=conn.createStatement();
%>
	<%
//String dcode=request.getParameter("deptcode");
String department=request.getParameter("dept");
String dcode=request.getParameter("deptcode");
String cmpName=request.getParameter("cmpName");
String cmpCode=request.getParameter("cmpcode");
String undDeptCode=request.getParameter("underDept");
String hodCode=request.getParameter("hod");
String status=request.getParameter("status");
//String action=request.getParameter("action");
String sqlUpdate="",currentHodEmailId="",previousHodEmailId="";
int currentHodId=0,underdepthodid=0;
//*String sendMsg1="";
//*********************** code for edit *************************

	System.out.print("under edit department");
System.out.println("deptcode======"+department+"==== cmpCode-------"+cmpCode+"===undDeptCode==="+undDeptCode+"====hodCode===="+hodCode+"====status====="+status+"======");

int deptCode=0,ud1=0;
String sendMsg="";
String cCode="",dCode="";
int twEmp1=0,CompCode1=0,HOD1=0,underDeptCode1=0,hodid=0;
try
{
	int ct=0;
	String delims12 = "[,]";
	String uD="";
	String[] tokensEmail = undDeptCode.split(delims12);
	for(String t : tokensEmail)
	{
		if(ct==0)
		{
			uD=t;
		}
		else
		{
			//CompCode=t;
		}
		ct++;
		
	}
	ud1=Integer.parseInt(uD);
	System.out.println("underdepartment code:-------------->"+ud1);
	//
	 twEmp1=Integer.parseInt(session.getAttribute("empID").toString());
	CompCode1=Integer.parseInt(cmpCode);
	deptCode=Integer.parseInt(dcode);
	// HOD1=Integer.parseInt(hodCode);
	//underDeptCode1=Integer.parseInt(undDeptCode);
	String sqlGetempid="select empid  from t_leaveadmin where name='"+hodCode+"'";
	ResultSet rsGetempid=st3.executeQuery(sqlGetempid);
	System.out.println("empid queryy---->>>>"+sqlGetempid);
	while(rsGetempid.next())
	{
		hodid=rsGetempid.getInt("empid");
	}
	System.out.println("hod emp iddd---->"+hodid);
	
	
}catch(Exception e)
{
	System.out.println("Exception 123-------->>"+e);
	
}
try
{ System.out.print("111");
	


////////////////
//updating hod  for department and leaverequest



String getdepthodsql="SELECT HODId from t_department where DeptCode='"+deptCode+"'";
ResultSet rs9=st9.executeQuery(getdepthodsql);
System.out.println("current hod id query-->"+getdepthodsql);
if(rs9.next())
{
	currentHodId=rs9.getInt("HODId");
}
System.out.println(" current Hod Id -->"+currentHodId);



//
String getprevhodemailsql="SELECT email from t_leaveadmin where empid='"+currentHodId+"'";
ResultSet rs10=st10.executeQuery(getprevhodemailsql);
System.out.println("current hod id query-->"+getprevhodemailsql);
if(rs10.next())
{
	previousHodEmailId=rs10.getString("email");
}
System.out.println(" prev  Hod email Id -->"+previousHodEmailId);


String getdepthodemailsql="SELECT email from t_leaveadmin where name='"+hodCode+"'  and status='Yes'";
ResultSet rs11=st11.executeQuery(getdepthodemailsql);
System.out.println("current hod email id query-->"+getdepthodemailsql);
if(rs11.next())
{
	currentHodEmailId=rs11.getString("email");
}
String updateleavereqhodemailsql="update t_leaverequest set hod='"+currentHodEmailId+"' where hod='"+previousHodEmailId+"'";
int suc=st12.executeUpdate(updateleavereqhodemailsql);
System.out.println("leave request update query ---->"+updateleavereqhodemailsql+"---flag--"+suc);

/*	String updateDepthodemailsql="update t_department set hodid='"+EmpID+"' where DeptCode='"+deptCode+"'";
int suc1=st11.executeUpdate(updateDepthodemailsql);
System.out.println("leave request update query ---->"+updateDepthodemailsql+"---flag--"+suc1);
*/



/////////////////


	System.out.print("222");
	String sqlInsert="update t_department set DeptName='"+department+"',UnderDeptCode='"+ud1+"', HODId='"+hodid+"', Status='"+status+"', TWEmpID='"+twEmp1+"' where  ComapanyCode='"+CompCode1+"' and DeptCode='"+deptCode+"'";
	System.out.println("department updation query-->"+sqlInsert);
	String sqlInsertHistory="insert into t_departmenthistory (CompanyCode ,DeptCode, UnderDeptCode, Status, Activity, TWEmpID) values("+CompCode1+", "+deptCode+", "+ud1+", '"+status+"', 'updated',"+twEmp1+")";
	st1.executeUpdate(sqlInsert);
	st2.executeUpdate(sqlInsertHistory);
	System.out.println("department history insert qry-->"+sqlInsertHistory);
	String getundepthodidsql="SELECT HODId from t_department where DeptCode='"+ud1+"'";
	ResultSet rs14=st14.executeQuery(getundepthodidsql);
	System.out.println("under dept hod id id query-->"+getundepthodidsql);
	if(rs14.next())
	{
		underdepthodid=rs14.getInt("HODId");
	}
	System.out.println(" underdept hod id -->"+underdepthodid);
	
	String sqlupdateuser="update t_leaveadmin set urole='hod', ReportingtoHod='"+underdepthodid+"' where  empid='"+hodid+"'";
	System.out.println("Hod updation query------>"+sqlupdateuser);
	int flghod=st13.executeUpdate(sqlupdateuser);
	System.out.println("Hod updation query--- Count--->"+flghod);
	/*  Assigining previous Hod as contractor  */
	String updateleaveadminHodsql="update t_leaveadmin set urole=' contractor' where email='"+previousHodEmailId+"'";
	int suc2=st16.executeUpdate(updateleaveadminHodsql);
	System.out.println("previous Hod updation update query ---->"+updateleaveadminHodsql+"---flag--"+suc2);
	
	/*  code for updating reporting to hod for all User in that Department */
	
	String sqlupdateReportingtoHoduser="update t_leaveadmin set  ReportingtoHod='"+hodid+"' where  typevalue='"+department+"' and urole!='hod'";
	System.out.println("Reporting to hod  updation query------>"+sqlupdateReportingtoHoduser);
	int flgforreport=st15.executeUpdate(sqlupdateReportingtoHoduser);
	System.out.println("updated reporting to hod query--->"+sqlupdateReportingtoHoduser);
	System.out.println("updated reporting to hod count"+flgforreport);
	
	//
	sendMsg="Department Edited Successfully";
	response.sendRedirect("alertGoTo.jsp?msg=Department Report Updated Successfully&goto=departmentReport.jsp");
	
}
catch(Exception e)
{
	System.out.println("Exception-------->>"+e);
	sendMsg="Please Try Again";
}
finally
{
	conn.close();
	
	
}


%>
</body>
</html>