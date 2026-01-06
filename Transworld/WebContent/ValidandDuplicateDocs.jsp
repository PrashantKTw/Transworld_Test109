<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Statement st=conn.createStatement();
String buffer="";
try
{
	String filename=request.getParameter("fname");
	System.out.println("File name "+filename);
	String id=request.getParameter("id");
	System.out.println("id is  "+id);
	
	if(id.equals("1"))
	{
		//code for invalid
		String sql="Update t_uploadedFiles set FileStatus='Invalid' where FileName='"+filename+"'";
		System.out.println(sql);
		st.executeUpdate(sql);
		
	}
	else if(id.equals("2")) 
	{
		//code for duplicate
		String sql="Update t_uploadedFiles set FileStatus='Duplicate' where FileName='"+filename+"'";
		System.out.println(sql);
		st.executeUpdate(sql);
		
	}
	else if(id.equals("3"))
	{
		String sql="Update t_uploadedFiles set FileStatus='Upload' where FileName='"+filename+"'";
		System.out.println(sql);
		st.executeUpdate(sql);
		
	}
	else if(id.equals("4"))
	{
		String sql="Update t_uploadedFiles set FileStatus='Upload' where FileName='"+filename+"'";
		System.out.println(sql);
		st.executeUpdate(sql);
		
	}
	
	buffer="#Yes";

	out.print(buffer);
	
	conn.close();
}
catch(Exception e)
{
	buffer="#No";
	out.print(buffer);
	System.out.println("Excepton---AjxChkInOutDept--->>"+e);
}


%>