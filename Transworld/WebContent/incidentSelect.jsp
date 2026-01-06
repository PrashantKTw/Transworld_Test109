
<%@ include file="headConn.jsp"%>
<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Transworld</title>
</head>
<body>
	<%
		String ltype=request.getParameter("linkType");
String linkQuery="select * from t_incidentdata  where Status='"+ltype+"' order by TheDate,TheTime asc";
out.print("==============>>"+linkQuery);
response.sendRedirect("incidentDataReport.jsp?linkQuery="+linkQuery);
%>
</body>
</html>