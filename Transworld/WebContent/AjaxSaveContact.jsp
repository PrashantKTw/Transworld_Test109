
<%@page import="java.io.*" import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>

<%@page import="java.util.Date"%>

<%!
Connection con1;
%>
<% 
String msg="";
try
{
	String comName = request.getParameter("from1");
	//System.out.println("The company name ==>"+comName);
		Class.forName("com.mysql.cj.jdbc.Driver");
		con1 = DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307:3306/twsql_twalldata","erp","1@erp");
	//	con1 = DriverManager.getConnection("jdbc:mysql://62.72.42.109:3307:3306/twsql_twalldata","erp","1@erp");
		Statement stmt1=con1.createStatement();
		ResultSet rs1=null;
		String sql1="";
		//String received_data[]  =request.getParameter("mydata").split("zz",22);
		String mcontactperson=request.getParameter("salutation")+" "+request.getParameter("firstname")+" "+request.getParameter("middlename")+" "+request.getParameter("lastname");
	    try
		    {
					sql1="INSERT into t_contactdet (customercode,salesCustomerCode,contactperson,salutation,"+
					"firstname,middlename,lastname,mobileno,email,phone,fax,zipcode"+
					",address,city,state,country,companyname,designation) VALUES ('"+request.getParameter("customercode")+"','"+request.getParameter("salescustomercode")+"','"+mcontactperson+"','"+request.getParameter("salutation")+"','"+request.getParameter("firstname")+"','"+request.getParameter("middlename")+"','"+request.getParameter("lastname")+"','"+request.getParameter("mobileno")+"','"+request.getParameter("emailids")+"','"+request.getParameter("phoneno")+"','"+request.getParameter("faxno")+"','"+request.getParameter("zipcode")+"','"+request.getParameter("address")+"','"+request.getParameter("city")+"','"+request.getParameter("state")+"','"+request.getParameter("country")+"','"+comName+"','"+request.getParameter("designation")+"')";
                
				System.out.println("insert query---->>"+sql1);
				stmt1.executeUpdate(sql1);
				msg="Contact Added";
      		}
		    catch(Exception e)
            {
		    	e.printStackTrace();
            }
}
catch(Exception e)
{
	System.out.println("Exception !!! contactdetails AJX--->"+e);
	msg="Please Try Again";
}
finally
{
	con1.close();
	response.sendRedirect("alertGoTo.jsp?msg="+msg+"&goto=contactdetails.jsp");
}

	
%>

