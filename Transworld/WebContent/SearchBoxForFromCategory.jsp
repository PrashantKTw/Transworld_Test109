<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>

<%
Connection conn=null;
try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307:3306/db_GlobalERP","erp","1@erp");
//     conn = DriverManager.getConnection("jdbc:mysql://172.16.8.17:3306/twsql_twalldata","erp","1@erp");
Statement stmt=conn.createStatement();
String sql=""; 
String emp=request.getParameter("emp");
String crg=request.getParameter("crg");
String s1="";
String buffer="";
	//	 sql="SELECT DISTINCT(CompanyName ),UName FROM t_leaveadmin  WHERE Name LIKE('%"+emp+"%') and Status='Yes' ORDER BY Name LIMIT 20 ";
	//	sql="SELECT DISTINCT(CompanyName ) from TWSQL_TWALLDATA.t_customerdet WHERE CompanyName LIKE('%"+emp+"%') and ShippingCity='"+crg+"' ORDER BY CompanyName LIMIT 20 ";
		 if(crg.equals("customer"))
		 {
			 sql="SELECT DISTINCT(CompanyName ) from db_GlobalERP.100000customerdet WHERE CompanyName LIKE('%"+emp+"%') ORDER BY CompanyName asc LIMIT 20 ";
			 ResultSet rs=stmt.executeQuery(sql);
			 buffer="<div style='height:120px;width:350px;overflow:auto; '><table style='background-color:#C2DFFF; width:350px; display: block';>";
			 int i=1;
			   while(rs.next())
			   {
			     buffer+="<tr><td><a href='#' onClick='showVisitingCardDetails(\""+rs.getString("CompanyName")+"\");'  style='color: black;'>"+rs.getString("CompanyName").replaceAll("(?i)"+emp,"<font color=blue><u>"+emp.toUpperCase()+"</u></font>")+".</a></tr></td>";
			        i++;
			   }
		 }
		 else if(crg.equals("Bills"))
		 {
			 sql="select distinct(SupplierName) from db_GlobalERP.100000supplierdet WHERE SupplierName LIKE('%"+emp+"%') ORDER BY SupplierName asc LIMIT 20 ";
			 ResultSet rs=stmt.executeQuery(sql);
			 buffer="<div style='height:120px;width:350px;overflow:auto; '><table style='background-color:#C2DFFF; width:350px; display: block';>";
			 int i=1;
			   while(rs.next())
			   {
			     buffer+="<tr><td><a href='#' onClick='showVisitingCardDetails(\""+rs.getString("SupplierName")+"\");'  style='color: black;'>"+rs.getString("SupplierName").replaceAll("(?i)"+emp,"<font color=blue><u>"+emp.toUpperCase()+"</u></font>")+".</a></tr></td>";
			        i++;
			   }
		 }
		 else if(crg.equals("VisingCard"))
		 {
			 sql="select distinct(CompanyName) from db_GlobalERP.100000prospectivecustmaster WHERE CompanyName LIKE('%"+emp+"%') ORDER BY CompanyName asc LIMIT 20 ";
			 ResultSet rs=stmt.executeQuery(sql);
			 buffer="<div style='height:120px;width:350px;overflow:auto; '><table style='background-color:#C2DFFF; width:350px; display: block';>";
			 int i=1;
			   while(rs.next())
			   {
			     buffer+="<tr><td><a href='#' onClick='showVisitingCardDetails(\""+rs.getString("CompanyName")+"\");'  style='color: black;'>"+rs.getString("CompanyName").replaceAll("(?i)"+emp,"<font color=blue><u>"+emp.toUpperCase()+"</u></font>")+".</a></tr></td>";
			        i++;
			   }
		 }
		 else{}
		  
		   
		   stmt.close();
		   conn.close();
		   
		   buffer+="</table></div>";
		out.println(buffer);
} 
catch(Exception e) 
{  
	System.out.println("!!!ERROR!!!  GenericAjaxSearch  ::  "+e);
}
finally
{
	conn.close();
}
%>
