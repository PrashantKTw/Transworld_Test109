<%@ page language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
System.out.println("====================");

String incidentDate=request.getParameter("incidentDate");
String complaintid=request.getParameter("complaintid");
String location=request.getParameter("location");
String relatedTo=request.getParameter("relatedTo");
String type=request.getParameter("type");
String category=request.getParameter("category");
String description=request.getParameter("description");

String buffer="#";
%>
