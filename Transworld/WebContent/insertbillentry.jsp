
<%
/****************************************************
Programmer Name: Vikram Abhang
Date- 21st-july-2012
Purpose:This page is create as per puri sir requirement to maintain record of paid bill
        in database t_billpayment & t_billpaymenthistory
*****************************************************/
%>

<%@page import="java.util.Date"%>
<%@ include file="headConn.jsp"%>
<%
 Connection conn1=null;
 try
 {
 Class.forName("com.mysql.cj.jdbc.Driver");
 conn1=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/twsql_twalldata","erp","1@erp");
 //conn1=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307/twsql_twalldata","fleetview","F@5a<I86");
 }
 catch(Exception e)
 {
 	System.out.println("Exception=========>>"+e);
 } 
 
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
Statement st4=conn.createStatement();

Statement sterp=conn1.createStatement();

%>
<%
 String refno="",amount="",checkno="",paidby="",dop="",SqlInsert="",SqlInsert1="",SqlUpdate="",SqlUpdate1="",SqlUpdate2="";
 
refno=request.getParameter("refno");
amount=request.getParameter("amount");
checkno=request.getParameter("checkno");
paidby=request.getParameter("paidby");
dop=request.getParameter("dop");
System.out.println("refno===============> :"+refno);
try
{
	dop=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(dop));
}
catch(Exception e)
{
	System.out.println(">>>>>>>>>>>>>>>>>>Exception in date conversion:"+e);
}

try
{
	SqlInsert="Insert into db_leaveapplication.t_billpayment(InwardNo,PaidAmount,PaidBy,CheckNo,DateOfPayment,BillStatus,EnterBy)values('"+refno+"','"+amount+"','"+paidby+"','"+checkno+"','"+dop+"','Paid','"+session.getAttribute("empname").toString()+"')";
	st1.executeUpdate(SqlInsert);
	System.out.println(">>>>>>>>>>>>>>>>>>SqlInsert:"+SqlInsert);
	SqlInsert1="Insert into db_leaveapplication.t_billpaymenthistory(InwardNo,PaidAmount,PaidBy,CheckNo,DateOfPayment,BillStatus,EnterBy)values('"+refno+"','"+amount+"','"+paidby+"','"+checkno+"','"+dop+"','Paid','"+session.getAttribute("empname").toString()+"')";
	st2.executeUpdate(SqlInsert1);
	System.out.println(">>>>>>>>>>>>>>>>>>SqlInsert1:"+SqlInsert1);
	
	SqlUpdate="Update db_leaveapplication.t_inwarddetails Set BillStatus='Paid' where InwardRefNo='"+refno+"'";
	System.out.println(">>>>>>>>>>>>>>>>>>SqlUpdate:"+SqlUpdate);
	st3.executeUpdate(SqlUpdate);
	SqlUpdate1="Update db_leaveapplication.t_inwarddetailshistory Set BillStatus='Paid' where InwardRefNo='"+refno+"'";
	System.out.println(">>>>>>>>>>>>>>>>>>SqlUpdate1:"+SqlUpdate1);
	st4.executeUpdate(SqlUpdate1);
	
	//*************** change the status of t_claim_master of claim module **************
	
	SqlUpdate2="Update twsql_twalldata.t_claim_master Set status='Paid' where CLMRefNumber='"+refno+"'";
	System.out.println(">>>>>>>>>>>>>>>>>>SqlUpdate for claim status :"+SqlUpdate2);
	sterp.executeUpdate(SqlUpdate2);
	
	out.println("Yes");
	//response.sendRedirect("billreport.jsp");
}
catch(Exception e)
{
	System.out.println(">>>>>>>>>>>>>>>>>>Exception Insertion :"+e);
	//response.sendRedirect("billreport.jsp");
	out.println("No");
}
 
%>