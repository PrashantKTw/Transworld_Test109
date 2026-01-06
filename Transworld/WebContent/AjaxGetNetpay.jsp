<%@ include file="headConn.jsp"%>

<%
System.out.println("In Ajax page");
Statement st1=conn.createStatement();
String empName="";
double basic=0.0,allow=0,allow1=0,allow2=0,allow3=0,allow4=0,deduct=0,deduct1=0,deduct2=0,deduct3=0,deduct4=0,tds=0,pIndex=0,prePay=0;
int year=0,month=0,paydays=0,Variable=0,Incentive=0;
String action=request.getParameter("action");
//String allData=request.getParameter("allData");
year=Integer.parseInt(request.getParameter("year"));
month=Integer.parseInt(request.getParameter("month"));
empName=request.getParameter("empName");
DecimalFormat df=new DecimalFormat("#.00");
try{
paydays=Integer.parseInt(request.getParameter("paydays"));
basic=Double.parseDouble(request.getParameter("basic"));}catch(Exception e){System.out.println("error in");}
try{tds=Integer.parseInt(request.getParameter("tds"));
System.out.println("tds ======="+tds);
}catch(Exception e){System.out.println("error in tds"+e);}

try{pIndex=Integer.parseInt(request.getParameter("pIndex"));}catch(Exception e){}
try{Incentive=Integer.parseInt(request.getParameter("Incentive"));}catch(Exception e){}
try{Variable=Integer.parseInt(request.getParameter("Variable"));}catch(Exception e){}
try{prePay=Integer.parseInt(request.getParameter("prePay"));}catch(Exception e){}
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

System.out.println("month"+month+"    pindex"+pIndex);


double Monthdays=0.0;
System.out.println("allow"+tds+ ""+allow+"" +allow1+ "" +allow2+"");

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


try{
String perdaypay=df.format(basic/Monthdays);
System.out.println("perdaypay =="+perdaypay+ "<<<<<<<<"+df.format(allow/Monthdays));
if(action.contains("Add"))
{
allow=Double.parseDouble(df.format((Double.parseDouble(df.format(allow/Monthdays)))*paydays));
allow1=Double.parseDouble(df.format((Double.parseDouble(df.format(allow1/Monthdays)))*paydays));
allow2=Double.parseDouble(df.format((Double.parseDouble(df.format(allow2/Monthdays)))*paydays));
if(paydays>=24)
{allow3=allow3;
}else
 allow3=0;
}
System.out.println("allow =="+allow+" allow1 =="+allow1+ " allow2 =="+allow2+" allow3 =="+allow3);
double grosspay= Double.parseDouble(df.format(Double.parseDouble(perdaypay)*paydays));

if(pIndex>=90 || pIndex<=110)
{grosspay=grosspay;
}
if(pIndex < 90 || pIndex >110)
{ System.out.println((pIndex/100));
    grosspay=grosspay*(pIndex/100);
}
grosspay=Math.round(grosspay);
System.out.println("grosspay =="+grosspay);

String grosspay1=df.format((grosspay+allow+allow1+allow2+allow3+allow4+Incentive+Variable+prePay)-(deduct+deduct1+deduct2+deduct3+deduct4));
Long grosspay2=Math.round(Double.parseDouble(grosspay1));

System.out.println("grosspay2 =="+grosspay2);
Double tds1=(grosspay2)*(tds/100);
System.out.println("tds"+tds1);
Double netpay1=grosspay2-tds1;
System.out.println("netpay =="+netpay1);
String buffer=""+grosspay2+","+netpay1+"";
out.print(buffer);
}
catch(Exception e)
{
	e.printStackTrace();
}
%>