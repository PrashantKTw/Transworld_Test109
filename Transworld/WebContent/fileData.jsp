<%@ include file="headConn.jsp"%>
<%
String tr="",sql="",fileList="";
Statement st,st1,st2;
%>

<%
try
	{ 
	tr=request.getParameter("fName");
	if(fileList==null || fileList=="")
	{
		fileList=tr;
	}
	else
	{
		fileList=fileList+","+tr;	
	}
	
	
	System.out.println("ajax Add***********************"+fileList+"******************************");
	out.println("ajax Add***********************"+fileList+"******************************");
%>
<input type="hidden" name="fileName" id="fileName" value="<%=fileList%>"></input>
<%
	}catch(Exception e)
{
	out.print("Exception--->"+e);
}

%>
