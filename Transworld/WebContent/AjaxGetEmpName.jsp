
<%@ include file="headConn.jsp"%>

<%!

%>

<%


try {

Statement st=conn.createStatement();
Statement st1=conn.createStatement();

ResultSet rs1=null,rs=null;
String sql1="",sql="";
boolean flag=false;
String buffer="";
String empName=request.getParameter("empname");
String action=request.getParameter("action");
String contId=request.getParameter("cid");
System.out.println("Action "+action);
if(action.contains("action"))
{
try{
	sql="SELECT EmpName from t_employee where EmpID='"+contId+"'  ";
	rs=st.executeQuery(sql);
	if(rs.next())
	{buffer=rs.getString("EmpName");}
}
catch(Exception e)
{ e.printStackTrace();}
}

if(action.contains("saldet"))
{ String basic="",TDS="",Allowance="",Allowance1="",Allowance2="",Allowance3="",Allowance4="",deduction="",deduction1="",deduction2="",deduction3="",deduction4="";
try{
	sql="SELECT * from t_employee where EmpID='"+contId+"'  ";
	rs=st.executeQuery(sql);
	if(rs.next())
	{basic=rs.getString("BasicSalarary");
	 TDS=rs.getString("TDS");
	 Allowance=rs.getString("Allowance");
	 Allowance1=rs.getString("Allowance1");
	 Allowance2=rs.getString("Allowance2");
	 Allowance3=rs.getString("Allowance3");
	 Allowance4=rs.getString("Allowance4");
	 deduction=rs.getString("deduction");
	 deduction1=rs.getString("deduction1");
	 deduction2=rs.getString("deduction2");
	 deduction3=rs.getString("deduction3");
	 deduction4=rs.getString("deduction4");
	}
	buffer=buffer+basic+","+TDS+","+Allowance+","+Allowance1+","+Allowance2+","+Allowance3+","+Allowance4+","+deduction+","+deduction1+","+deduction2+","+deduction3+","+deduction4+"";
}
catch(Exception e)
{ e.printStackTrace();}
}
if(action.contains("action1"))
{
	sql1="SELECT *  from t_employee where  Status='Active' and EmpName like ('%"+empName+"%') order by EmpName limit 20 ";

  System.out.println("Emp name **********  ******       "+sql1);
  rs1=st.executeQuery(sql1);
  buffer="<div style='height:120px;width:200px;overflow:auto;'><table style='background-color:white; width:400px; display: block';>";
 int i=1;
	 while(rs1.next())
	   {
	      flag=true;
	      
	     buffer+="<tr><td><a href='#' onClick='showSelectedSuppliers(\""+rs1.getString("EmpName")+"\",\""+rs1.getString("EmpID")+"\");'  style='color: black;'>"+rs1.getString("EmpName").replaceAll("(?i)"+empName,"<font color=blue><u>"+empName.toUpperCase()+"</u></font>")+".("+rs1.getString("EmpID")+")</a></td></tr>";
	     i++;
	   } 
   buffer+="</table></div>";
   System.out.print("buffer"+buffer);
}

out.print(buffer);

} catch(Exception e) 
{
	e.printStackTrace();
}

%>
