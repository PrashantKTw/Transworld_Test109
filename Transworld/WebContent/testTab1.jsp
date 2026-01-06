<%@ include file="headConn.jsp"%>
<script type="text/javascript">

</script>
<% 
try
{
	
	Statement stmt1=conn.createStatement();
	Statement stmt2=conn.createStatement();
	ResultSet rs1=null;
	String list="",thumbnailn="";
	
	String serverid="",usernm="",passwd="";	
	
	
	
	
	String sqlftp="select * from t_ftpconnection";
	ResultSet rsftp=stmt2.executeQuery(sqlftp);
	rsftp.next();
	serverid=rsftp.getString("ServerID");
	usernm=rsftp.getString("Username");
	passwd=rsftp.getString("Password");
	
	
	
	if (request.getParameter("list") != null)
	{
		list=request.getParameter("list");
	}
	if (request.getParameter("thumbnailn") != null)
	{
		thumbnailn=request.getParameter("thumbnailn");
	}
	
	System.out.println(list+"**********"+thumbnailn);
	//***Convert String 1 to ArrayList*********************************************
	ArrayList a2=new ArrayList();
	String delims1 = "[,]";
    String[] token1 = thumbnailn.split(delims1);
	for (String t : token1)
	{
		a2.add(t);
	}
	System.out.println("a2====="+a2);
	//***Convert String 2 to ArrayList*********************************************
	ArrayList a1=new ArrayList();
	String delims12 = "[,]";
    String[] token = list.split(delims12);
	for (String t : token)
	{
		if( !(t.equals("undefined")) )
		{
			a1.add(t);	
		}
		
	}
	System.out.println("a1====="+a1);
	a1.removeAll(a2);
	System.out.println(a1.size()+"a1>>>>>>>>>>>>>>>"+a1);
	//********************************************************************************
	String l1="";
	try
	{
		if(a1.size() != 0)
		{
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			for(int j=0; j<=a1.size()-1; j++)
			{
				if(l1.equals("") || l1=="")
				{
					l1=a1.get(j).toString();
				}
				else
				{
					l1=l1+","+a1.get(j).toString();
				}
			}
		}
	}
	catch(Exception e)
	{
		System.out.println("Exception -------->>"+e);
		
	}
	System.out.println("l1====="+l1);
	//************************************************
	String sql1="select * from t_uploadedFiles where SrNo in ("+l1+") ORDER BY FIELD(SrNo,"+l1+")";
	System.out.println(sql1);
    rs1=stmt1.executeQuery(sql1);
	String buffer="<table><input type =hidden id = siz name = siz value = "+a1.size()+" />"; 
	int rwCnt=0;
	while(rs1.next())
   	{
			rwCnt++;
			
       // 	buffer=buffer+"<td><a href='#' onclick=getFTPImage('"+rs1.getString("FileName")+"');>"+
       String w=rs1.getString("FileName").replace(" ","%");
       buffer=buffer+"<tr><td><input type =hidden id = index"+rwCnt+" name =index"+rwCnt+" value = "+rs1.getString("SrNo")+" /><a href='#' onclick=getFTPImage('"+w+"');>"+
		//	"<img src='ftp://sumedh:789&*(medh@202.38.172.58/test/"+rs1.getString("FileName")+"' height='200' width='200'></img></a><br>"+rs1.getString("FileName")+"</td>";
		  "<object data='ftp://"+usernm+":"+passwd+"@"+serverid+"/test/"+rs1.getString("FileName")+"' height='200' width='200'><embed src='ftp://"+usernm+":"+passwd+"@"+serverid+"/test/"+rs1.getString("FileName")+"'></embed></object></a><br>"+rs1.getString("FileName")+"</td>";
		  buffer=buffer + "<td align = 'left'><div id = inner_div"+rwCnt+"><b>Select Order :</b><select id = sl"+rwCnt+" name = sl"+rwCnt+" style='width:50px;' onchange = 'func_option("+a1.size()+","+rwCnt+");' >";
		  for(int i = 1; i <= a1.size(); i++)
		 {
			  buffer=buffer + "<option  value="+i+" >"+i+"</option>";
		 }
		  buffer=buffer + "</select></div></td></tr>";
		//  buffer=buffer + "</div></td></tr>";
	}
	buffer=buffer+"</table>$"+l1;
	System.out.println(buffer);
	out.print(buffer);
	
	  
	stmt1.close();
	conn.close();
}
catch(Exception e)
{
	System.out.print("^^^^^^^^^^^"+e);
}
finally
{
	conn.close();
}
%>
