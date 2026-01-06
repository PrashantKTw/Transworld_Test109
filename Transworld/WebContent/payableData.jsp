<%@page import="com.sun.org.apache.bcel.internal.generic.GOTO"%>
<%@page import="org.apache.catalina.ha.tcp.SendMessageData"%>
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
Statement st5=conn.createStatement();
%>

	<%
System.out.println("PayableData.jsp");
String action=request.getParameter("action");
System.out.println("action ="+action);
String  basic="";
double allow=0.0,allow1=0.0,allow2=0.0,allow3=0.0,allow4=0.0,pIndex=0,Incentive=0,Variable=0;
int deduct=0,deduct1=0,deduct2=0,deduct3=0,deduct4=0,Monthdays=0,paydays=0,prePay=0;
String netpay="",tds="",gross="",cId="",PreviousPay="";
int year=0,month=0;
String empName="",empId="";
empId=request.getParameter("empId");
cId=request.getParameter("cId");
try{
 year=Integer.parseInt(request.getParameter("year"));
 month=Integer.parseInt(request.getParameter("month"));
paydays=Integer.parseInt(request.getParameter("paydays"));
}
catch(Exception e){}
empName=request.getParameter("empName");
basic=request.getParameter("basic");
System.out.println("empid======= =>"+empId);
DecimalFormat df=new DecimalFormat("#.00");

boolean isLeapYear = ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0));
switch(month)
{
case 1: case 3: case 5:case 7:case 8: case 10: case 12: 
	   Monthdays=31;
       break;  
case 2:
		if (isLeapYear)
		{
	    	Monthdays=29;
		} else{
	    Monthdays=28;}
       break;
case 4: case 6: case 9: case 11: Monthdays=30; 
       break;
}
System.out.println("Monthdays===="+Monthdays);

try{pIndex=Double.parseDouble(request.getParameter("pIndex"));}catch(Exception e){}
try{allow=Double.parseDouble(request.getParameter("allow"));}catch(Exception e){}
try{allow1=Double.parseDouble(request.getParameter("allow1"));}catch(Exception e){}
try{allow2=Double.parseDouble(request.getParameter("allow2"));}catch(Exception e){}
try{allow3=Double.parseDouble(request.getParameter("allow3"));}catch(Exception e){}
try{allow4=Double.parseDouble(request.getParameter("allow4"));}catch(Exception e){}
try{deduct=Integer.parseInt(request.getParameter("deduct"));}catch(Exception e){}
try{deduct1=Integer.parseInt(request.getParameter("deduct1"));}catch(Exception e){}
try{deduct2=Integer.parseInt(request.getParameter("deduct2"));}catch(Exception e){}
try{deduct3=Integer.parseInt(request.getParameter("deduct3"));}catch(Exception e){}
try{deduct4=Integer.parseInt(request.getParameter("deduct4"));}catch(Exception e){}
try{prePay=Integer.parseInt(request.getParameter("prePay"));}catch(Exception e){}
try{Incentive=Double.parseDouble(request.getParameter("Incentive"));}catch(Exception e){}
try{Variable=Double.parseDouble(request.getParameter("Variable"));}catch(Exception e){}
netpay=request.getParameter("netpay");
tds=request.getParameter("tds");
gross=request.getParameter("gross");
System.out.println("allow" +allow);

try
{   
	if(action.contains("addfeedet"))
	{
		String sqlupdatefee="update t_employee set BasicSalarary='"+basic+"',Allowance='"+allow+"',Allowance1='"+allow1+"',Allowance2='"+allow2+"',Allowance3='"+allow3+"',Allowance4='"+allow4+"',deduction='"+deduct+"',deduction1='"+deduct1+"',deduction2='"+deduct2+"',deduction3='"+deduct3+"',deduction4='"+deduct4+"',TDS='"+tds+"' where EmpID="+cId+"";
		st5.executeUpdate(sqlupdatefee);
		response.sendRedirect("alertGoTo.jsp?msg=Contractor Fee Details Save successfully&goto=SalaryDetForm.jsp");
	}
	else{
		
		allow=Double.parseDouble(df.format((Double.parseDouble(df.format(allow/Monthdays)))*paydays));
		allow1=Double.parseDouble(df.format((Double.parseDouble(df.format(allow1/Monthdays)))*paydays));
		allow2=Double.parseDouble(df.format((Double.parseDouble(df.format(allow2/Monthdays)))*paydays));
		if(paydays>=24)
		{allow3=allow3;
		}else
		 allow3=0;
	if(action.contains("addpay"))
	{
	
		String sqlinsert="insert into t_payable (contractorName,month,year,payableDays,PreviousPay,perIndex,variable,incentive,basic,allowance,allowance1,allowance2,allowance3,allowance4,deduction,deduction1,deduction2,deduction3,deduction4,Netpay,grosspay,tds,EmpId) values('"+empName+"','"+month+"','"+year+"','"+paydays+"','"+prePay+"','"+pIndex+"','"+Variable+"','"+Incentive+"','"+basic+"','"+allow+"','"+allow1+"','"+allow2+"','"+allow3+"','"+allow4+"','"+deduct+"','"+deduct1+"','"+deduct2+"','"+deduct3+"','"+deduct4+"','"+netpay+"','"+gross+"','"+tds+"','"+empId+"')";
		System.out.println("sqlinsert"+sqlinsert);
		st1.executeUpdate(sqlinsert);
		System.out.println("record Inserted");
		response.sendRedirect("alertGoTo.jsp?msg=Payable Records Save successfully&goto=payableReport.jsp");
	}
	
	if(action.contains("editpay"))
	{Statement st4=conn.createStatement();
	
	 String PayNo=request.getParameter("PayNo");
	 System.out.println("PayNo"+PayNo);
		
	 try
		{
		String	sqledit="update t_payable set contractorName='"+empName+"',month='"+month+"',payableDays='"+paydays+"',PreviousPay='"+prePay+"',perIndex='"+pIndex+"',variable='"+Variable+"',incentive='"+Incentive+"',year='"+year+"',basic='"+basic+"',allowance='"+allow+"',allowance1='"+allow1+"',allowance2='"+allow2+"',allowance3='"+allow3+"',allowance4='"+allow4+"',deduction='"+deduct+"',deduction1='"+deduct1+"',deduction2='"+deduct2+"',deduction3='"+deduct3+"',deduction4='"+deduct4+"',Netpay='"+netpay+"',tds='"+tds+"',grosspay='"+gross+"' where PayNo="+PayNo+"";
			System.out.println("sqledit======"+sqledit);
			st4.executeUpdate(sqledit);
		}
		catch(Exception e)
		{	e.printStackTrace();
			System.out.println("Exception-------->>"+e);
			//sendMsg="Please Try Again";
		}
		finally
		{
			conn.close();
			response.sendRedirect("alertGoTo.jsp?msg=Payroll successfully updated&goto=payableReport.jsp");
		}

	 
	}
	}
}
catch(Exception e)
{System.out.println("Exception in payable data"+e);
}
finally
{conn.close();

}
%>