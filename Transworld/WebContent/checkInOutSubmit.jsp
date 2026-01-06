<%@ page language="java"%>
<%@ include file="headConn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
</head>

<body
	onload="window.opener.location.reload();setTimeout('self.close()',5);">
	<%
System.out.println("______________________________SBMT PAGE_________________________________________________");
String message="";
try
{
Statement st=conn.createStatement();

//String reqStat=request.getParameter("reqStat");
String chkBox=request.getParameter("chkBoxSelected");
String inTime=request.getParameter("inTime");
String outTime=request.getParameter("outTime");
String aprrejCmt=request.getParameter("aprrejCmt");
String rd=request.getParameter("rd");
String blkApprv=request.getParameter("blkApprv");

System.out.println("___________________________________________________"+rd+"___________"+inTime+"________"+outTime+"_________"+aprrejCmt+"__________"+rd);

String entBy=session.getAttribute("empname").toString();

if( (chkBox==null && blkApprv==null) || (chkBox=="" && blkApprv==""))
{
	System.out.println(chkBox+"______________IF____________________"+blkApprv);
	System.out.println("@@@@@@@@@@@@@@@@@@@@@@");
	try
	{
		if( !(inTime.equals("-")) )
		{
			String s1="update t_checkinout set Status='"+rd+"', ApprovedBy='"+entBy+"', ApprovalComments='"+aprrejCmt+"' where CheckinDateTime='"+inTime+"'";
			st.executeUpdate(s1);
			System.out.println(s1);
		}
	}
	catch(Exception e)
	{
		System.out.println("UPDT1_________>>"+e);
	}
	
	try
	{
		if( !(outTime.equals("-")) )
		{
			String s2="update t_checkinout set Status='"+rd+"', ApprovedBy='"+entBy+"', ApprovalComments='"+aprrejCmt+"' where CheckinDateTime='"+outTime+"'";
			st.executeUpdate(s2);
			System.out.println(s2);
		}
	}
	catch(Exception e)
	{
		System.out.println("UPDT2_________>>"+e);
	}
	message="Records Updated Successfully!";
}
else
{
	System.out.println("____________ELSE______________");
	if(blkApprv=="Approve" || blkApprv.equals("Approve") )
	{
		blkApprv="Approved";
	}
	else
	{
		blkApprv="Rejected";
	}
	String str="";
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");
	String delims12 = "[,]";
    String[] tokens12 = chkBox.split(delims12);
	for (String t : tokens12)
	{
		if(!(t.equals("")) && null!=t && !(t.equals(null)) && ""!=t)
		{
			if(str=="" || str==null)
			{
				str=t;
			}
			else
			{
				str=str+","+t;
			}
		}
	}
	String s2="update t_checkinout set Status='"+blkApprv+"', ApprovedBy='"+entBy+"' where Srno in("+str+")";
	st.executeUpdate(s2);
	System.out.println(s2);
	message="Records Updated Successfully!";
}




}
catch(Exception e)
{
	System.out.println("Exception----->>>"+e);
	message="Unable To Update Records!";
}
finally
{
	conn.close();
	response.sendRedirect("alertGoTo.jsp?msg="+message+"&goto=checkInOutReport.jsp");
}
%>
</body>

</html>