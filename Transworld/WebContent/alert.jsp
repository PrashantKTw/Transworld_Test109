<%@ include file="header.jsp"%>
<%@page import="java.util.Date"%>

<html>
<head>
<script language="JavaScript">
function loadalert (i) 
{
        alert(i);
       // window.location = 'leave application.jsp';
        window.location = 'commonLogin.jsp';
}
if (document.all || document.getElementById)
        document.body.style.background = "url('images/bg.jpg')  white top no-repeat "
</script>
</head>
<body onLoad="loadalert('<%=request.getParameter("IP")%>')">
	<table>
		<tr>
			<td>.</td>
		</tr>
	</table>
	<% 
String msg="";
%>
	<%
msg=request.getParameter("IP");
%>
</body>
</html>