<jsp:useBean id="mergedocs" class="inward.DocumentMerging" scope="page">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>
	<%@include file="headConn.jsp"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Document Merging</title>
</head>
<body>

	<%
//Download the files from ftp and merge them
String data1 = request.getParameter("data1");
String data2 = request.getParameter("data2");
String empname = session.getAttribute("empname").toString();
String file_order = request.getParameter("file_order");

//System.out.println("data1 "+data1+" data2 "+data2);
//get the document here and merge 

	try
	{
		String fileIwrd = "";
		Statement stmt = null;
		Statement stftp = null;
		String finalListStr = "";
		
		finalListStr = request.getParameter("serialSelected");
		
		mergedocs.downloadFtpFile(finalListStr,empname,file_order);       		

	}catch(Exception e)
	{
		e.printStackTrace();
	
	}
response.sendRedirect("MergeDocuments.jsp?data="+data1+"&data1="+data2+"&submit=Go");
%>
</body>
	</html>
</jsp:useBean>