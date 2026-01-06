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
%>
	<%
String dcode=request.getParameter("deptcode");
String cmpCode=request.getParameter("cmpName");
String undDeptCode=request.getParameter("undDept");
String hodCode=request.getParameter("h1");
String status=request.getParameter("status");
String action=request.getParameter("action");
String sqlUpdate="";
//*String sendMsg1="";
if(action.contains("Companyedit"))
{  
	String sendMsg="";
	System.out.print("under edit company");
	
	String CompanyCode=request.getParameter("cmpCode");
	String compName=request.getParameter("compName");
	String empName=session.getAttribute("empname").toString();
	String compGdAdd=request.getParameter("compGdAdd");
	String compAdd=request.getParameter("compAdd");
	String compBstno=request.getParameter("compBstno");
	String compCstno=request.getParameter("compCstno");
	String phNo=request.getParameter("phNo");
	String faxNo=request.getParameter("faxNo");
	String email=request.getParameter("email");
	String website=request.getParameter("website");
	String pNo=request.getParameter("pNo");
	String Sysdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	//String  date=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(Sysdate));
	
	
	sqlUpdate="update t_ourcompanydet set OurCompanyName='"+compName+"', TWEmpName='"+empName+"',OurCompanyGodownAddress ='"+compGdAdd+"',OurCompanyAddress='"+compAdd+"',OurCompanyBSTNo='"+compBstno+"',OurCompanyCSTNo='"+compCstno+"',PhoneNo='"+phNo+"',FaxNo='"+faxNo+"',Email='"+email+"',Website='"+website+"',PanNo='"+pNo+"',UpdateDatetime='"+Sysdate+"' where CompanyCode="+CompanyCode+"";
    System.out.println("QueryUpdated"+sqlUpdate);
	st3.executeUpdate(sqlUpdate);
	
	String sqlInserthistory="INSERT INTO t_companyhistory (CompanyCode ,OurCompanyDet,OurCompanyName,TWEmpName,OurCompanyCode,OurCompanyGodownAddress,OurCompanyAddress,OurCompanyBSTNo,OurCompanyCSTNo,PhoneNo,FaxNo,Email,Puremail,Website,PanNo) VALUES ('"+CompanyCode+"', '"+compName+"', '"+compName+"', '"+empName+"', '"+CompanyCode+"', '"+compGdAdd+"', '"+compAdd+"', '"+compBstno+"', '"+compCstno+"', '"+phNo+"', '"+faxNo+"', '"+email+"', '"+email+"', '"+website+"', '"+pNo+"')";
	 System.out.println("\nsqlInserthistory" +sqlInserthistory);
	 st1.executeUpdate(sqlInserthistory);
	response.sendRedirect("alertGoTo.jsp?msg=Company Record Updated successfully&goto=companyReport.jsp");
	
   }

//*********************** code for edit *************************
if(action.contains("editDept"))
{
	System.out.print("under edit department");
System.out.println("deptcode======"+dcode+"==== cmpCode-------"+cmpCode+"===undDeptCode==="+undDeptCode+"====hodCode===="+hodCode+"====status====="+status+"======");

int deptCode=0;
String sendMsg="";
String cCode="",dCode="";
int twEmp1=0,CompCode1=0,HOD1=0,underDeptCode1=0;
try
{
	 twEmp1=Integer.parseInt(session.getAttribute("empID").toString());
	CompCode1=Integer.parseInt(cmpCode);
	deptCode=Integer.parseInt(dcode);
	 HOD1=Integer.parseInt(hodCode);
	underDeptCode1=Integer.parseInt(undDeptCode);	
}catch(Exception e)
{
	System.out.println("Exception 123-------->>"+e);
	
}
try
{ System.out.print("111");
	
	System.out.print("222");
	String sqlInsert="update t_department set UnderDeptCode="+underDeptCode1+", HODId="+HOD1+", Status='"+status+"', TWEmpID="+twEmp1+" where  ComapanyCode="+CompCode1+" and DeptCode="+deptCode+"";
	System.out.println(sqlInsert);
	String sqlInsertHistory="insert into t_departmenthistory (CompanyCode ,DeptCode, UnderDeptCode, Status, Activity, TWEmpID) values("+CompCode1+", "+deptCode+", "+underDeptCode1+", '"+status+"', 'updated',"+twEmp1+")";
	st1.executeUpdate(sqlInsert);
	st2.executeUpdate(sqlInsertHistory);
	System.out.println(sqlInsertHistory);
	
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

}
%>
</body>
</html>