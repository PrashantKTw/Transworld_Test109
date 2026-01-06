<%@ include file="headConn.jsp"%>
<% 
System.out.println("======Inside the select order=========");
try
{
	int size = Integer.parseInt(request.getParameter("size"));
	String select_val = request.getParameter("select_val");
	int rwCnt = Integer.parseInt(request.getParameter("rwCnt"));
	rwCnt = rwCnt + 1;
	String buf = "";
	 buf = buf + "<b>Select Order :</b><select id = sl"+rwCnt+" name = sl"+rwCnt+" style='width:50px;' onchange = 'func_option("+size+","+rwCnt+");' >";
	 for(int i = 1; i <= size; i++)
	 {
		 if(select_val.contains(Integer.toString(i)))
		 {
			 continue;
		 }else{
			 buf = buf + "<option id = "+i+"  value="+i+" >"+i+"</option>";
		 }
	 }
	  buf = buf + "</select>";
	

	System.out.println(buf);
	out.print(buf);
	
}
catch(Exception e)
{
	System.out.print("^^^^^^^^^^^"+e);
}
%>
