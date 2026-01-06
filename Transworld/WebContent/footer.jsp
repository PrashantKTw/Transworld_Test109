<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

 <style>
 #footer {
    height: 30px;
    background: #1582AB;
    border-top: 1px solid #1885B0;
    font-family: Arial, Helvetica, sans-serif;
    width: 100%;
    color: white; /* Text color for the footer */
    text-align: center; /* Center align text */
}
 </style>
</head>
<%
Date dft=new Date();
int year=dft.getYear()+1900;

%>
<body>
<div id="footer">
	<p>
		<a href="http://www.myfleetview.com"> Copyright &copy; 2009-<%=year%> by
			Transworld Compressor Technologies Ltd. All Rights Reserved.</a>
	</p>
</div>
</body>
</html>