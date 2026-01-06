<%@ include file="headConn.jsp"%>
<% 
try
{
	Statement stmt1=conn.createStatement();
	Statement stmt2=conn.createStatement();
	ResultSet rs1=null;
	ResultSet rsftp=null;
	String mhelp_id="0";
	String serverid="",usernm="",passwd="";
	
	String sql="select * from t_ftpconnection";
	rsftp=stmt2.executeQuery(sql);
	rsftp.next();
	serverid=rsftp.getString("ServerID");
	usernm=rsftp.getString("Username");
	passwd=rsftp.getString("password");
	
	
	if (request.getParameter("help_id") != null)
	{
		mhelp_id=request.getParameter("help_id");
	}
	String sql1="select * from t_uploadedFiles where FileStatus='uploaded'";
    rs1=stmt1.executeQuery(sql1);
	String buffer=""; 
	while(rs1.next())
   	{
		buffer=  "";
    	if (mhelp_id.contains(rs1.getString("FileName")))
        {
        	buffer="<div><table ><tr><td><div><object data='ftp://"+usernm+":"+passwd+"@"+serverid+"/test/"+rs1.getString("FileName")+"'> <embed src='ftp://sumedh:789&*(medh@202.38.172.58/test/"+rs1.getString("FileName")+"'> </embed></object>"+
        	"</div></td></tr></table></div>";
        	out.println(buffer);
        //	System.out.println("\n"+buffer);
        }
	}
	stmt1.close();
}
catch(Exception e)
{
	System.out.print(e);
}
finally
{
	conn.close();
}
%>
