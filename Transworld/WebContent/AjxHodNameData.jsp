
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
String buffer="",hodname="";
String empName=request.getParameter("hodname");

	sql1="SELECT *  from t_leaveadmin where  Status='Yes' and Name like ('%"+empName+"%') order by Name limit 20 ";

  System.out.println("Emp name **********  ******       "+sql1);
  rs1=st.executeQuery(sql1);
   buffer="<div style='height:120px;width:275px;overflow:auto; '><table style='background-color:#C6DEFF; width:400px; display: block';>";
 int i=1;
	 while(rs1.next())
	   {
		 hodname=  (rs1.getString("Name") == null || rs1.getString("Name").equalsIgnoreCase("") ) ? "-" : rs1.getString("Name") ;
		   out.print("<input type='hidden' name='hodname"+i+"' id='hodname"+i+"' value='"+hodname+"'>");
		   buffer+="<tr><td><a href='#' onClick='getsupplierDetails("+i+");'  style='color: black;'>"+rs1.getString("Name").replaceAll("(?i)","<font color=blue><u>"+"</u></font>")+"</a></tr></td>";
		   i++;
	   } 
   buffer+="</table></div>";
   System.out.print("buffer"+buffer);

out.print(buffer);

} catch(Exception e) 
{
	e.printStackTrace();
}

%>
