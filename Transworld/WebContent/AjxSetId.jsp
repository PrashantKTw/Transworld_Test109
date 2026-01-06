<%@ page language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String g=request.getParameter("g");
String tabId=request.getParameter("tabID");
String buffer="#"+tabId;
System.out.println("======"+g+"========="+tabId+"=======");
if(tabId.equals("edu"))
{
	buffer=buffer+  "#<input type='text' name='sn"+g+"' id='sn"+g+"' size='1'/>"+
	"#<input type='text' name='degree"+g+"' id='degree"+g+"'/>"+
	"#<input type='text' name='bu"+g+"' id='bu"+g+"'/>"+
	"#<input type='text' name='year"+g+"' id='year"+g+"'/>"+
	"#<input type='text' name='sp"+g+"' id='sp"+g+"'/>"+
	"#<input type='text' name='mp"+g+"' id='mp"+g+"'/>"+
	"#<input type='file' name='upDoc1"+g+"' id='upDoc1"+g+"'/>";
}
else if(tabId.equals("aq1"))
{
	buffer=buffer+  "#<input type='text' name='Asn"+g+"' id='Asn"+g+"' size='1'/>"+
	"#<input type='text' name='Ainst"+g+"' id='Ainst"+g+"'/>"+
	"#<input type='text' name='Ayear"+g+"' id='Ayear"+g+"'/>"+
	"#<input type='text' name='Asp"+g+"' id='Asp"+g+"'/>"+
	"#<input type='text' name='Amp"+g+"' id='Amp"+g+"'/>"+	
	"#<input type='file' name='upDoc2"+g+"' id='upDoc2"+g+"'/>";
}
else
{
	buffer=buffer+  "#<input type='text' name='Wsn"+g+"' id='Wsn"+g+"' size='1'/>"+
	"#<input type='text' name='Wcomp"+g+"' id='Wcomp"+g+"'/>"+
	"#<input type='text' name='Wpos"+g+"' id='Wpos"+g+"'/>"+
	"#<input type='text' name='WfDate"+g+"' id='WfDate"+g+"'/>"+
	"#<input type='text' name='WtDate"+g+"' id='WtDate"+g+"'/>"+
	"#<input type='text' name='Wsal"+g+"' id='Wsal"+g+"'/>"+	
	"#<input type='text' name='Wreason"+g+"' id='Wreason"+g+"'/>"+
	"#<input type='file' name='upDoc3"+g+"' id='upDoc3"+g+"'/>";
}


out.print(buffer);
%>