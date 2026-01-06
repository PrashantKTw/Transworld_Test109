<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Statement st=conn.createStatement();
try
{
	String buffer="#";
	String dt="";
	int a=0;
	//String s="select distinct(TypeValue) as Dept from t_leaveadmin order by Dept asc";
	String s="select distinct(TypeValue) as Dept from t_leaveadmin where status='yes' order by Dept asc";
	ResultSet rs=st.executeQuery(s);
	while(rs.next())
	{
		a++;
		dt=rs.getString("Dept");
		if(a==1)
		{
			buffer=buffer+"<input TYPE='radio' id='rd' name='rd' VALUE='"+dt+"' size='2' checked='checked'/>"+dt+"#";
		}
		else
		{
			buffer=buffer+"<input TYPE='radio' id='rd' name='rd' VALUE='"+dt+"' size='2'/>"+dt+"#";	
		}
		
		
	}
	
	out.print(buffer);
	System.out.println("--------->>"+buffer);
	
	conn.close();
}
catch(Exception e)
{
	System.out.println("Excepton---AjxChkInOutDept--->>"+e);
}


%>