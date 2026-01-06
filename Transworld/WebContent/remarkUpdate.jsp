<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
</head>

<body
	onload="window.opener.location.reload();setTimeout('self.close()',5);">
	<%

try
{
	String rmrk=request.getParameter("rcvrRemark").replace("'"," ");
	String refno=request.getParameter("refno");
	Statement st=conn.createStatement();	
	
	System.out.println("==============?????"+rmrk);
	
	String sql="update t_inwardfollowup set recvrRemark='"+rmrk+"' where iwrefno='"+refno+"' and docReceiver='"+session.getAttribute("empname")+"'";
	System.out.println("@@@@@@@@@@@@"+sql);
	st.executeUpdate(sql);
	
	
	
}
catch(Exception e)
{
	System.out.println("Exception Incident DAta Insert=====>>"+e);
}
%>
</body>

</html>