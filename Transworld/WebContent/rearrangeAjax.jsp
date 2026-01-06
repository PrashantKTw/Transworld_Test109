
<%@page import="java.io.*" import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>

<%@page import="java.util.Date"%>


<% 
String id=request.getParameter("srNo");
String idlist=request.getParameter("SerialList");
String mov=request.getParameter("movement");
System.out.println(id+"----------"+idlist+"----------"+mov);

List<String> idlst = new ArrayList<String>();

StringTokenizer str=new StringTokenizer(idlist,",");
while(str.hasMoreTokens())
{
	String fn="";
	String i=str.nextToken().trim();
	idlst.add(i);
	System.out.println(i+"================="+idlst.indexOf(i));
}
//idlst.add("dum");
String msg="";
try
{
	int index = idlst.indexOf(id);
	System.out.println(idlst.size()+"======INDEX======="+index);
	System.out.println("Before Swap!!! ===>"+idlst);
	if(mov.equals("up") && index>0)
	//if(mov.equals("up"))
	{	
		System.out.println("------------------UP-----------------------");
		//*****************************************************
		Collections.swap(idlst,index,index-1);
		//*****************************************************
	}
	else if(mov.equals("down") && index<(idlst.size() - 1))
	//else if(mov.equals("down"))
	{
		//*****************************************************
		System.out.println("------------------DOWN-----------------------");
		Collections.swap(idlst,index,index+1);
		//*****************************************************
	}
	System.out.println("Aftr Swap!!! ===>"+idlst);
//	idlst.remove("dum");
//	System.out.println("Aftr Rmv Dum!!! ===>"+idlst);
	out.print(idlst);
}
catch(Exception e)
{
	System.out.println("Exception !!! rearrange AJX--->"+e);
	//idlst.remove("dum");
	out.print(idlst);//here bcoz there should be no erroe if move out of array index
}
%>

